

MKFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SHELL := /bin/bash

ifeq ($(PARENDI_ROOT),)
  $(info PARENDI_ROOT is not set, setting it myself...)
  PARENDI_ROOT := ${MKFILE_DIR}/../../parendi
  export PARENDI_ROOT
endif

VERILATOR_EXEC ?= verilator
VERIPOPLAR_EXEC ?= ${PARENDI_ROOT}/bin/verilator_bin

# Instrument poplar code for view in PopVision
INSTRUMENT ?= 0
VL_INSTRUMENT ?= 0

# Number of parallel compilation jobs
JOBS ?= 30

# Number of tiles in the IPU
TILES ?= 1472
# Number of workers in the IPU
WORKERS ?= 1

# Number of threads for x86
THREADS ?= 1

NUMA_CORES := -C0-$(shell echo $$(($(THREADS) - 1)))

EXTRA_IPU_FLAGS ?=

EXTRA_X86_FLAGS ?=

__WHITESPACE := $(subst ,, )

CUSTOM_CONFIG_NAME ?= nocfg

ifndef EXTRA_IPU_FLAGS
OBJ_DIR_IPU_SUFFIX := noflag
else
# $(info extra ipu flags: $(EXTRA_IPU_FLAGS))
OBJ_DIR_IPU_SUFFIX := $(subst $(__WHITESPACE),___,$(EXTRA_IPU_FLAGS))
endif
ifndef EXTRA_X86_FLAGS
OBJ_DIR_VLT_SUFFIX := noflag
else
OBJ_DIR_VLT_SUFFIX := $(subst $(__WHITESPACE),___,$(EXTRA_X86_FLAGS))
endif
OBJ_DIR_BASE := obj_dir
OBJ_DIR_SUFFIX := $(OBJ_DIR_BASE)_$(subst $(__WHITESPACE), __,$(CUSTOM_CONFIG_NAME))


VHARNESS := $(MKFILE_DIR)/VHarness.cpp

OBJ_DIR_IPU := $(OBJ_DIR_SUFFIX)_ipu_$(TILES)_$(WORKERS)_$(OBJ_DIR_IPU_SUFFIX)
OBJ_DIR_VLT := $(OBJ_DIR_SUFFIX)_x86_$(THREADS)_$(OBJ_DIR_VLT_SUFFIX)

__COMMON_FLAGS := -O3 --x-assign 0 --top Main --debugi-V3EmitPoplarVertex 3

__IPU_FLAGS := --poplar $(__COMMON_FLAGS) --stats 	\
				--tiles $(TILES) --workers $(WORKERS)    \
				--Mdir $(OBJ_DIR_IPU) $(COMMON_FLAGS) $(EXTRA_IPU_FLAGS) \
				--verilate-jobs $(JOBS)

__VLT_FLAGS := --cc --exe $(__COMMON_FLAGS) --top Main --stats \
				--Mdir $(OBJ_DIR_VLT)   --threads $(THREADS)   \
				$(COMMON_FLAGS) $(EXTRA_X86_FLAGS)

FILELIST := filelist_$(subst $(__WHITESPACE),__, $(CUSTOM_CONFIG_NAME)).f

# $(info "first 3 $(wordlist 1,$(words $(VERILOG_SOURCES)),$(VERILOG_SOURCES))")

default: run_ipu

# break the list of files for `ls` otherwise bash will crash
set_files: $(VERILOG_SOURCES)
	@echo "Setting file list $(FILELIST)"
	@echo $(wordlist 1, 1000, $(VERILOG_SOURCES)) | tr "[:blank:]" "\n" > $(FILELIST)
	@echo $(wordlist 1001, 2000, $(VERILOG_SOURCES)) | tr "[:blank:]" "\n" >> $(FILELIST)
	@echo $(wordlist 2001,$(words $(VERILOG_SOURCES)),$(VERILOG_SOURCES)) | tr "[:blank:]" "\n" >> $(FILELIST)


$(OBJ_DIR_VLT)/VMain: set_files $(VHARNESS)
	@mkdir -p $(OBJ_DIR_VLT)
	@echo "Verilating $(BENCH)"
	(time $(VERILATOR_EXEC) $(__VLT_FLAGS) $(VHARNESS) -f $(FILELIST)) 2>&1 | tee $(OBJ_DIR_VLT)/x86_0.out
	@echo "Compiling verilated moduels"
	(time $(MAKE) -C $(OBJ_DIR_VLT) -f VMain.mk -j $(JOBS)) 2>&1 | tee $(OBJ_DIR_VLT)/x86_1.out


$(OBJ_DIR_IPU)/VMain.mk: set_files
	@mkdir -p $(OBJ_DIR_IPU)
	@echo "Verilpoplaring $(BENCH)"
	(time $(VERIPOPLAR_EXEC) $(__IPU_FLAGS) -f $(FILELIST)) 2>&1 | tee $(OBJ_DIR_IPU)/ipu_0.out

# compile and link
$(OBJ_DIR_IPU)/VMain: build_ipu_objects
	@echo "Compiling and linking poplar classes"
	(time $(MAKE) -C $(OBJ_DIR_IPU) -f VMain.mk -j $(JOBS) INSTRUMENT=$(INSTRUMENT) VL_INSTRUMENT=$(VL_INSTRUMENT)) 2>&1 | tee $(OBJ_DIR_IPU)/ipu_2.out

# compile only
build_ipu_objects: $(OBJ_DIR_IPU)/VMain.mk
	@echo "Compiling poplar classes"
	(time $(MAKE) -C $(OBJ_DIR_IPU) -f VMain.mk VMain_objects -j $(JOBS) INSTRUMENT=$(INSTRUMENT) VL_INSTRUMENT=$(VL_INSTRUMENT)) 2>&1 | tee $(OBJ_DIR_IPU)/ipu_1.out

build_ipu_binary:
	@echo "Linking poplar classes"
	(time $(MAKE) -C $(OBJ_DIR_IPU) -f VMain.mk -j $(JOBS) INSTRUMENT=$(INSTRUMENT) VL_INSTRUMENT=$(VL_INSTRUMENT)) 2>&1 | tee $(OBJ_DIR_IPU)/ipu_2.out


x86: $(OBJ_DIR_VLT)/VMain
ipu: $(OBJ_DIR_IPU)/VMain



$(OBJ_DIR_VLT)/x86.out: $(OBJ_DIR_VLT)/VMain
	(time numactl $(NUMA_CORES) ./$< $(PLUS_ARGS)) 2>&1 | tee $@

$(OBJ_DIR_IPU)/ipu.out: $(OBJ_DIR_IPU)/VMain
	(time ./$< $(PLUS_ARGS)) 2>&1 | tee $@



build_ipu: $(OBJ_DIR_IPU)/VMain
build_x86: $(OBJ_DIR_VLT)/VMain

run_ipu: $(OBJ_DIR_IPU)/ipu.out
run_x86: $(OBJ_DIR_VLT)/x86.out

all: run_ipu run_x86



clean:
	rm -rf $(OBJ_DIR_BASE)* *.out filelist_*.f $(FILELIST)
