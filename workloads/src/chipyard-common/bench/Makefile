################################################################################
## Custom Makefile to work with the synthesizable simulation flow
################################################################################

XLEN ?= 64

src_dir := .


LINKER_SCRIPT = common/test.ld


RISCV_PREFIX ?= riscv$(XLEN)-unknown-elf-
RISCV_GCC ?= $(RISCV_PREFIX)gcc

RISCV_GCC_OPTS ?= -DPREALLOCATE=1 -mcmodel=medany -static -std=gnu99 -O2 -ffast-math -fno-common -fno-builtin-printf -fno-tree-loop-distribute-patterns
RISCV_LINK_OPTS ?= -static -nostdlib -nostartfiles -lm -lgcc -T $(LINKER_SCRIPT)

RISCV_OBJDUMP ?= $(RISCV_PREFIX)objdump \
					--disassemble-all \
					--disassemble-zeroes \
					--section=.text \
					--section=.text.startup \
					--section=.text.init \
					--section=.data
ELF2HEX ?= elf2hex

RISCV_SIM ?= spike

DRAM_BASE ?= $(shell printf "%d" 0x80000000)


INCLUDE_DIR = -I. -Icommon

MEMORY_WIDTH ?= 64
MEMORY_DEPTH ?= 8192

MEMORY_BYTES = $(shell echo $$(( $(MEMORY_WIDTH) / 8 )))

#-------------------------------------
# Build assembly

%.dump: %.riscv
	$(RISCV_OBJDUMP) $< > $@

%.hex: %.riscv
	$(ELF2HEX) $(MEMORY_BYTES) $(MEMORY_DEPTH) $< $(DRAM_BASE) > $@

# %.riscv: %.S
# 	$(RISCV_GCC) $< $(RISCV_GCC_TARGET_OPTS)	\
# 				    $(RISCV_GCC_COMMON_OPTS)	\
# 		    		-T$(LINKER_SCRIPT) 			\
# 					$(INCLUDE_DIR) 				\
# 					-o $@


COMMON_C = $(wildcard common/*.c)
COMMON_S = $(wildcard common/*.S)

# compile and link from a single C file
%.riscv: %.c $(COMMON_C) $(COMMON_S)
	$(RISCV_GCC) $< $(COMMON_C) $(COMMON_S)		\
					$(RISCV_GCC_OPTS)           \
					$(INCLUDE_DIR) 				\
					-o $@						\
					$(RISCV_LINK_OPTS)

MATRIX_DIMS ?= 2 4 8 16 24 32 40 48 56 64

mt-mm/dataset_%.h: mt-mm/matmul_gendata.pl
	./$< --size $* --seed 1 > $@

mt-mm/mt-mm_%.c: mt-mm/dataset_%.h mt-mm.c
	echo '#include "$<"' > $@
	cat mt-mm.c >> $@

MATRIX_CASES = $(addprefix mt-mm/mt-mm_,$(MATRIX_DIMS))

mt-mm_all: $(addsuffix .hex, $(MATRIX_CASES)) $(addsuffix .dump, $(MATRIX_CASES))



clean:
	rm -f *.hex *.dump *.riscv mt-mm/dataset*.h
