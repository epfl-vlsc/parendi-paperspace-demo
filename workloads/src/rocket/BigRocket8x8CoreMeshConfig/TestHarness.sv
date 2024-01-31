// Generated by CIRCT firtool-1.30.0
// Standard header to adapt well known macros to our needs.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

module TestHarness(
  input  clock,
         reset,
  output io_success
);

  wire        _harnessBinderReset_catcher_io_sync_reset;	// @[ResetCatchAndSync.scala:39:28]
  wire        _mmio_io_tl_0_a_ready;	// @[HarnessExtMem.scala:154:13]
  wire        _mmio_io_tl_0_d_valid;	// @[HarnessExtMem.scala:154:13]
  wire [2:0]  _mmio_io_tl_0_d_bits_opcode;	// @[HarnessExtMem.scala:154:13]
  wire [1:0]  _mmio_io_tl_0_d_bits_param;	// @[HarnessExtMem.scala:154:13]
  wire [3:0]  _mmio_io_tl_0_d_bits_size;	// @[HarnessExtMem.scala:154:13]
  wire [3:0]  _mmio_io_tl_0_d_bits_source;	// @[HarnessExtMem.scala:154:13]
  wire        _mmio_io_tl_0_d_bits_sink;	// @[HarnessExtMem.scala:154:13]
  wire        _mmio_io_tl_0_d_bits_denied;	// @[HarnessExtMem.scala:154:13]
  wire [63:0] _mmio_io_tl_0_d_bits_data;	// @[HarnessExtMem.scala:154:13]
  wire        _mmio_io_tl_0_d_bits_corrupt;	// @[HarnessExtMem.scala:154:13]
  wire        _plusarg_reader_out;	// @[PlusArg.scala:80:11]
  wire        _mem_io_tl_0_a_ready;	// @[HarnessExtMem.scala:134:13]
  wire        _mem_io_tl_0_d_valid;	// @[HarnessExtMem.scala:134:13]
  wire [2:0]  _mem_io_tl_0_d_bits_opcode;	// @[HarnessExtMem.scala:134:13]
  wire [1:0]  _mem_io_tl_0_d_bits_param;	// @[HarnessExtMem.scala:134:13]
  wire [3:0]  _mem_io_tl_0_d_bits_size;	// @[HarnessExtMem.scala:134:13]
  wire [3:0]  _mem_io_tl_0_d_bits_source;	// @[HarnessExtMem.scala:134:13]
  wire        _mem_io_tl_0_d_bits_sink;	// @[HarnessExtMem.scala:134:13]
  wire        _mem_io_tl_0_d_bits_denied;	// @[HarnessExtMem.scala:134:13]
  wire [63:0] _mem_io_tl_0_d_bits_data;	// @[HarnessExtMem.scala:134:13]
  wire        _mem_io_tl_0_d_bits_corrupt;	// @[HarnessExtMem.scala:134:13]
  wire        _chiptop0_tl_mem_0_clock;	// @[HasHarnessInstantiators.scala:82:40]
  wire        _chiptop0_tl_mem_0_reset;	// @[HasHarnessInstantiators.scala:82:40]
  wire        _chiptop0_tl_mem_0_bits_a_valid;	// @[HasHarnessInstantiators.scala:82:40]
  wire [2:0]  _chiptop0_tl_mem_0_bits_a_bits_opcode;	// @[HasHarnessInstantiators.scala:82:40]
  wire [2:0]  _chiptop0_tl_mem_0_bits_a_bits_param;	// @[HasHarnessInstantiators.scala:82:40]
  wire [2:0]  _chiptop0_tl_mem_0_bits_a_bits_size;	// @[HasHarnessInstantiators.scala:82:40]
  wire [3:0]  _chiptop0_tl_mem_0_bits_a_bits_source;	// @[HasHarnessInstantiators.scala:82:40]
  wire [31:0] _chiptop0_tl_mem_0_bits_a_bits_address;	// @[HasHarnessInstantiators.scala:82:40]
  wire [7:0]  _chiptop0_tl_mem_0_bits_a_bits_mask;	// @[HasHarnessInstantiators.scala:82:40]
  wire [63:0] _chiptop0_tl_mem_0_bits_a_bits_data;	// @[HasHarnessInstantiators.scala:82:40]
  wire        _chiptop0_tl_mem_0_bits_a_bits_corrupt;	// @[HasHarnessInstantiators.scala:82:40]
  wire        _chiptop0_tl_mem_0_bits_d_ready;	// @[HasHarnessInstantiators.scala:82:40]
  wire        _chiptop0_tl_mmio_0_clock;	// @[HasHarnessInstantiators.scala:82:40]
  wire        _chiptop0_tl_mmio_0_reset;	// @[HasHarnessInstantiators.scala:82:40]
  wire        _chiptop0_tl_mmio_0_bits_a_valid;	// @[HasHarnessInstantiators.scala:82:40]
  wire [2:0]  _chiptop0_tl_mmio_0_bits_a_bits_opcode;	// @[HasHarnessInstantiators.scala:82:40]
  wire [2:0]  _chiptop0_tl_mmio_0_bits_a_bits_param;	// @[HasHarnessInstantiators.scala:82:40]
  wire [2:0]  _chiptop0_tl_mmio_0_bits_a_bits_size;	// @[HasHarnessInstantiators.scala:82:40]
  wire [3:0]  _chiptop0_tl_mmio_0_bits_a_bits_source;	// @[HasHarnessInstantiators.scala:82:40]
  wire [30:0] _chiptop0_tl_mmio_0_bits_a_bits_address;	// @[HasHarnessInstantiators.scala:82:40]
  wire [7:0]  _chiptop0_tl_mmio_0_bits_a_bits_mask;	// @[HasHarnessInstantiators.scala:82:40]
  wire [63:0] _chiptop0_tl_mmio_0_bits_a_bits_data;	// @[HasHarnessInstantiators.scala:82:40]
  wire        _chiptop0_tl_mmio_0_bits_a_bits_corrupt;	// @[HasHarnessInstantiators.scala:82:40]
  wire        _chiptop0_tl_mmio_0_bits_d_ready;	// @[HasHarnessInstantiators.scala:82:40]
  ChipTop chiptop0 (	// @[HasHarnessInstantiators.scala:82:40]
    .tl_mem_0_bits_a_ready         (_mem_io_tl_0_a_ready),	// @[HarnessExtMem.scala:134:13]
    .tl_mem_0_bits_d_valid         (_mem_io_tl_0_d_valid),	// @[HarnessExtMem.scala:134:13]
    .tl_mem_0_bits_d_bits_opcode   (_mem_io_tl_0_d_bits_opcode),	// @[HarnessExtMem.scala:134:13]
    .tl_mem_0_bits_d_bits_param    (_mem_io_tl_0_d_bits_param),	// @[HarnessExtMem.scala:134:13]
    .tl_mem_0_bits_d_bits_size     (_mem_io_tl_0_d_bits_size[2:0]),	// @[HarnessExtMem.scala:134:13, :135:22]
    .tl_mem_0_bits_d_bits_source   (_mem_io_tl_0_d_bits_source),	// @[HarnessExtMem.scala:134:13]
    .tl_mem_0_bits_d_bits_sink     (_mem_io_tl_0_d_bits_sink),	// @[HarnessExtMem.scala:134:13]
    .tl_mem_0_bits_d_bits_denied   (_mem_io_tl_0_d_bits_denied),	// @[HarnessExtMem.scala:134:13]
    .tl_mem_0_bits_d_bits_data     (_mem_io_tl_0_d_bits_data),	// @[HarnessExtMem.scala:134:13]
    .tl_mem_0_bits_d_bits_corrupt  (_mem_io_tl_0_d_bits_corrupt),	// @[HarnessExtMem.scala:134:13]
    .tl_mmio_0_bits_a_ready        (_mmio_io_tl_0_a_ready),	// @[HarnessExtMem.scala:154:13]
    .tl_mmio_0_bits_d_valid        (_mmio_io_tl_0_d_valid),	// @[HarnessExtMem.scala:154:13]
    .tl_mmio_0_bits_d_bits_opcode  (_mmio_io_tl_0_d_bits_opcode),	// @[HarnessExtMem.scala:154:13]
    .tl_mmio_0_bits_d_bits_param   (_mmio_io_tl_0_d_bits_param),	// @[HarnessExtMem.scala:154:13]
    .tl_mmio_0_bits_d_bits_size    (_mmio_io_tl_0_d_bits_size[2:0]),	// @[HarnessExtMem.scala:154:13, :156:23]
    .tl_mmio_0_bits_d_bits_source  (_mmio_io_tl_0_d_bits_source),	// @[HarnessExtMem.scala:154:13]
    .tl_mmio_0_bits_d_bits_sink    (_mmio_io_tl_0_d_bits_sink),	// @[HarnessExtMem.scala:154:13]
    .tl_mmio_0_bits_d_bits_denied  (_mmio_io_tl_0_d_bits_denied),	// @[HarnessExtMem.scala:154:13]
    .tl_mmio_0_bits_d_bits_data    (_mmio_io_tl_0_d_bits_data),	// @[HarnessExtMem.scala:154:13]
    .tl_mmio_0_bits_d_bits_corrupt (_mmio_io_tl_0_d_bits_corrupt),	// @[HarnessExtMem.scala:154:13]
    .reset_io                      (_harnessBinderReset_catcher_io_sync_reset),	// @[ResetCatchAndSync.scala:39:28]
    .clock_uncore_clock            (clock),
    .tl_mem_0_clock                (_chiptop0_tl_mem_0_clock),
    .tl_mem_0_reset                (_chiptop0_tl_mem_0_reset),
    .tl_mem_0_bits_a_valid         (_chiptop0_tl_mem_0_bits_a_valid),
    .tl_mem_0_bits_a_bits_opcode   (_chiptop0_tl_mem_0_bits_a_bits_opcode),
    .tl_mem_0_bits_a_bits_param    (_chiptop0_tl_mem_0_bits_a_bits_param),
    .tl_mem_0_bits_a_bits_size     (_chiptop0_tl_mem_0_bits_a_bits_size),
    .tl_mem_0_bits_a_bits_source   (_chiptop0_tl_mem_0_bits_a_bits_source),
    .tl_mem_0_bits_a_bits_address  (_chiptop0_tl_mem_0_bits_a_bits_address),
    .tl_mem_0_bits_a_bits_mask     (_chiptop0_tl_mem_0_bits_a_bits_mask),
    .tl_mem_0_bits_a_bits_data     (_chiptop0_tl_mem_0_bits_a_bits_data),
    .tl_mem_0_bits_a_bits_corrupt  (_chiptop0_tl_mem_0_bits_a_bits_corrupt),
    .tl_mem_0_bits_d_ready         (_chiptop0_tl_mem_0_bits_d_ready),
    .tl_mmio_0_clock               (_chiptop0_tl_mmio_0_clock),
    .tl_mmio_0_reset               (_chiptop0_tl_mmio_0_reset),
    .tl_mmio_0_bits_a_valid        (_chiptop0_tl_mmio_0_bits_a_valid),
    .tl_mmio_0_bits_a_bits_opcode  (_chiptop0_tl_mmio_0_bits_a_bits_opcode),
    .tl_mmio_0_bits_a_bits_param   (_chiptop0_tl_mmio_0_bits_a_bits_param),
    .tl_mmio_0_bits_a_bits_size    (_chiptop0_tl_mmio_0_bits_a_bits_size),
    .tl_mmio_0_bits_a_bits_source  (_chiptop0_tl_mmio_0_bits_a_bits_source),
    .tl_mmio_0_bits_a_bits_address (_chiptop0_tl_mmio_0_bits_a_bits_address),
    .tl_mmio_0_bits_a_bits_mask    (_chiptop0_tl_mmio_0_bits_a_bits_mask),
    .tl_mmio_0_bits_a_bits_data    (_chiptop0_tl_mmio_0_bits_a_bits_data),
    .tl_mmio_0_bits_a_bits_corrupt (_chiptop0_tl_mmio_0_bits_a_bits_corrupt),
    .tl_mmio_0_bits_d_ready        (_chiptop0_tl_mmio_0_bits_d_ready)
  );
  SimTLMemGen mem (	// @[HarnessExtMem.scala:134:13]
    .clock                  (clock),
    .reset                  (_harnessBinderReset_catcher_io_sync_reset),	// @[ResetCatchAndSync.scala:39:28]
    .io_tl_0_a_valid        (_chiptop0_tl_mem_0_bits_a_valid),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_a_bits_opcode  (_chiptop0_tl_mem_0_bits_a_bits_opcode),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_a_bits_param   (_chiptop0_tl_mem_0_bits_a_bits_param),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_a_bits_size    ({1'h0, _chiptop0_tl_mem_0_bits_a_bits_size}),	// @[HarnessExtMem.scala:135:22, HasHarnessInstantiators.scala:82:40, TestHarness.scala:24:25]
    .io_tl_0_a_bits_source  (_chiptop0_tl_mem_0_bits_a_bits_source),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_a_bits_address (_chiptop0_tl_mem_0_bits_a_bits_address),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_a_bits_mask    (_chiptop0_tl_mem_0_bits_a_bits_mask),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_a_bits_data    (_chiptop0_tl_mem_0_bits_a_bits_data),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_a_bits_corrupt (_chiptop0_tl_mem_0_bits_a_bits_corrupt),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_d_ready        (_chiptop0_tl_mem_0_bits_d_ready),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_a_ready        (_mem_io_tl_0_a_ready),
    .io_tl_0_d_valid        (_mem_io_tl_0_d_valid),
    .io_tl_0_d_bits_opcode  (_mem_io_tl_0_d_bits_opcode),
    .io_tl_0_d_bits_param   (_mem_io_tl_0_d_bits_param),
    .io_tl_0_d_bits_size    (_mem_io_tl_0_d_bits_size),
    .io_tl_0_d_bits_source  (_mem_io_tl_0_d_bits_source),
    .io_tl_0_d_bits_sink    (_mem_io_tl_0_d_bits_sink),
    .io_tl_0_d_bits_denied  (_mem_io_tl_0_d_bits_denied),
    .io_tl_0_d_bits_data    (_mem_io_tl_0_d_bits_data),
    .io_tl_0_d_bits_corrupt (_mem_io_tl_0_d_bits_corrupt)
  );
  plusarg_reader_TestHarness_UNIQUIFIED #(
    .FORMAT("custom_boot_pin=%d"),
    .DEFAULT(0),
    .WIDTH(1)
  ) plusarg_reader_TestHarness_UNIQUIFIED (	// @[PlusArg.scala:80:11]
    .out (_plusarg_reader_out)
  );
  SimTLMemGen_1 mmio (	// @[HarnessExtMem.scala:154:13]
    .clock                  (clock),
    .reset                  (_harnessBinderReset_catcher_io_sync_reset),	// @[ResetCatchAndSync.scala:39:28]
    .io_tl_0_a_valid        (_chiptop0_tl_mmio_0_bits_a_valid),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_a_bits_opcode  (_chiptop0_tl_mmio_0_bits_a_bits_opcode),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_a_bits_param   (_chiptop0_tl_mmio_0_bits_a_bits_param),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_a_bits_size    ({1'h0, _chiptop0_tl_mmio_0_bits_a_bits_size}),	// @[HarnessExtMem.scala:156:23, HasHarnessInstantiators.scala:82:40, TestHarness.scala:24:25]
    .io_tl_0_a_bits_source  (_chiptop0_tl_mmio_0_bits_a_bits_source),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_a_bits_address (_chiptop0_tl_mmio_0_bits_a_bits_address),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_a_bits_mask    (_chiptop0_tl_mmio_0_bits_a_bits_mask),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_a_bits_data    (_chiptop0_tl_mmio_0_bits_a_bits_data),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_a_bits_corrupt (_chiptop0_tl_mmio_0_bits_a_bits_corrupt),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_d_ready        (_chiptop0_tl_mmio_0_bits_d_ready),	// @[HasHarnessInstantiators.scala:82:40]
    .io_tl_0_a_ready        (_mmio_io_tl_0_a_ready),
    .io_tl_0_d_valid        (_mmio_io_tl_0_d_valid),
    .io_tl_0_d_bits_opcode  (_mmio_io_tl_0_d_bits_opcode),
    .io_tl_0_d_bits_param   (_mmio_io_tl_0_d_bits_param),
    .io_tl_0_d_bits_size    (_mmio_io_tl_0_d_bits_size),
    .io_tl_0_d_bits_source  (_mmio_io_tl_0_d_bits_source),
    .io_tl_0_d_bits_sink    (_mmio_io_tl_0_d_bits_sink),
    .io_tl_0_d_bits_denied  (_mmio_io_tl_0_d_bits_denied),
    .io_tl_0_d_bits_data    (_mmio_io_tl_0_d_bits_data),
    .io_tl_0_d_bits_corrupt (_mmio_io_tl_0_d_bits_corrupt)
  );
  ResetCatchAndSync_d3_TestHarness_UNIQUIFIED harnessBinderReset_catcher (	// @[ResetCatchAndSync.scala:39:28]
    .clock         (clock),
    .reset         (reset),
    .io_sync_reset (_harnessBinderReset_catcher_io_sync_reset)
  );
  assign io_success = 1'h0;	// @[TestHarness.scala:24:25]
endmodule

