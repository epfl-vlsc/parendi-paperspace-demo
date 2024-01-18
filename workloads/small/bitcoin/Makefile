
EVAL_DIR := ../../../
BENCH := bitcoin

VERILOG_SOURCES := $(wildcard $(EVAL_DIR)/workloads/src/bitcoin/*.v)

PLUS_ARGS := +nocheck +max-cycles=100000000

# LOOP_LOG2=0 is the largest config
COMMON_FLAGS := -Wno-WIDTH -GLOOP_LOG2=0 -GDIFFICULTY=22
include ../../common/rules.mk
