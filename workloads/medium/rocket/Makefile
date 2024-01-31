EVAL_DIR := ../../../

# DIMS ?= 1x1
DIMS ?= 1
ROCKET_SIZE ?= Small
INTERCONNECT ?= Bus
ROCC ?=

ROCKET_CONFIG ?= $(strip $(ROCKET_SIZE))Rocket$(strip $(ROCC))$(strip $(DIMS))Core$(strip $(INTERCONNECT))Config

CUSTOM_CONFIG_NAME := $(ROCKET_CONFIG)

$(info Rocket config: $(ROCKET_CONFIG))

ROCKET_SOURCE_DIR := $(EVAL_DIR)/workloads/src/rocket/$(ROCKET_CONFIG)

$(info looking for sources in $(ROCKET_SOURCE_DIR))


VERILOG_SOURCES := \
	$(EVAL_DIR)/workloads/src/chipyard-common/Main.sv \
    $(wildcard $(ROCKET_SOURCE_DIR)/*.sv) \
	$(wildcard $(ROCKET_SOURCE_DIR)/*.v)




BINARY_PATH ?= $(EVAL_DIR)/workloads/src/chipyard-common/bench/mt-mm/mt-mm_32.hex

# -DPRINTF_COND=Main.verbose

COMMON_FLAGS ?= -DPRINTF_COND=0 \
				-DSTOP_COND=0 \
				-DASSERT_VERBOSE_COND=0 \
				-URANDOMIZE_GARBAGE_ASSIGN -URANDOMIZE_MEM_INIT \
				-Wno-WIDTH


PLUS_ARGS := +binary=$(BINARY_PATH) +max-cycles=1000000

include ../../common/rules.mk

HELP_MESSAGE = \
"Overriable configs:	"\
"    DIMS                Mesh dimension or number of cores in bus config, e.g., 4x4 or 2 " \
"    ROCKET_SIZE         Big | Small, size of the Rocket core, Big is with FPU and MMU, Small is without" \
"    INTERCONNECT        Mesh | Bus, interconnect either a mesh or a bus "	\
"    ROCKET_CONFIG       Manaully override the config string, e.g., SmallRocket1CoreBusConfig or BigRocket10x10CoreMeshConfig" \
"example usage: "\
"    make build_ipu DIMS=2x2 INTERCONNECT=Mesh ROCKET_SIZE=Small"\
"    make build_ipu ROCKET_CONFIG=BigRocket2x2CoreMeshConfig"  \
"    make build_ipu ROCKET_CONFIG=BigRocket1CoreBusConfig "    \



help:
	@for line in ${HELP_MESSAGE}; do echo "$$line"; done

.phony: help