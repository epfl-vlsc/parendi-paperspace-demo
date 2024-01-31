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

module SimTLMemGen_1(
  input         clock,
                reset,
                io_tl_0_a_valid,
  input  [2:0]  io_tl_0_a_bits_opcode,
                io_tl_0_a_bits_param,
  input  [3:0]  io_tl_0_a_bits_size,
                io_tl_0_a_bits_source,
  input  [30:0] io_tl_0_a_bits_address,
  input  [7:0]  io_tl_0_a_bits_mask,
  input  [63:0] io_tl_0_a_bits_data,
  input         io_tl_0_a_bits_corrupt,
                io_tl_0_d_ready,
  output        io_tl_0_a_ready,
                io_tl_0_d_valid,
  output [2:0]  io_tl_0_d_bits_opcode,
  output [1:0]  io_tl_0_d_bits_param,
  output [3:0]  io_tl_0_d_bits_size,
                io_tl_0_d_bits_source,
  output        io_tl_0_d_bits_sink,
                io_tl_0_d_bits_denied,
  output [63:0] io_tl_0_d_bits_data,
  output        io_tl_0_d_bits_corrupt
);

  wire        _buffer_auto_out_a_valid;	// @[Buffer.scala:69:28]
  wire [2:0]  _buffer_auto_out_a_bits_opcode;	// @[Buffer.scala:69:28]
  wire [2:0]  _buffer_auto_out_a_bits_param;	// @[Buffer.scala:69:28]
  wire [3:0]  _buffer_auto_out_a_bits_size;	// @[Buffer.scala:69:28]
  wire [3:0]  _buffer_auto_out_a_bits_source;	// @[Buffer.scala:69:28]
  wire [30:0] _buffer_auto_out_a_bits_address;	// @[Buffer.scala:69:28]
  wire [7:0]  _buffer_auto_out_a_bits_mask;	// @[Buffer.scala:69:28]
  wire [63:0] _buffer_auto_out_a_bits_data;	// @[Buffer.scala:69:28]
  wire        _buffer_auto_out_d_ready;	// @[Buffer.scala:69:28]
  wire        _fragmenter_auto_in_a_ready;	// @[Fragmenter.scala:335:34]
  wire        _fragmenter_auto_in_d_valid;	// @[Fragmenter.scala:335:34]
  wire [2:0]  _fragmenter_auto_in_d_bits_opcode;	// @[Fragmenter.scala:335:34]
  wire [3:0]  _fragmenter_auto_in_d_bits_size;	// @[Fragmenter.scala:335:34]
  wire [3:0]  _fragmenter_auto_in_d_bits_source;	// @[Fragmenter.scala:335:34]
  wire [63:0] _fragmenter_auto_in_d_bits_data;	// @[Fragmenter.scala:335:34]
  wire        _fragmenter_auto_out_a_valid;	// @[Fragmenter.scala:335:34]
  wire [2:0]  _fragmenter_auto_out_a_bits_opcode;	// @[Fragmenter.scala:335:34]
  wire [2:0]  _fragmenter_auto_out_a_bits_param;	// @[Fragmenter.scala:335:34]
  wire [1:0]  _fragmenter_auto_out_a_bits_size;	// @[Fragmenter.scala:335:34]
  wire [9:0]  _fragmenter_auto_out_a_bits_source;	// @[Fragmenter.scala:335:34]
  wire [30:0] _fragmenter_auto_out_a_bits_address;	// @[Fragmenter.scala:335:34]
  wire [7:0]  _fragmenter_auto_out_a_bits_mask;	// @[Fragmenter.scala:335:34]
  wire [63:0] _fragmenter_auto_out_a_bits_data;	// @[Fragmenter.scala:335:34]
  wire        _fragmenter_auto_out_d_ready;	// @[Fragmenter.scala:335:34]
  wire        _srams_auto_in_a_ready;	// @[HarnessExtMem.scala:186:15]
  wire        _srams_auto_in_d_valid;	// @[HarnessExtMem.scala:186:15]
  wire [2:0]  _srams_auto_in_d_bits_opcode;	// @[HarnessExtMem.scala:186:15]
  wire [1:0]  _srams_auto_in_d_bits_size;	// @[HarnessExtMem.scala:186:15]
  wire [9:0]  _srams_auto_in_d_bits_source;	// @[HarnessExtMem.scala:186:15]
  wire [63:0] _srams_auto_in_d_bits_data;	// @[HarnessExtMem.scala:186:15]
  SimTLRAM_1 srams (	// @[HarnessExtMem.scala:186:15]
    .clock                  (clock),
    .reset                  (reset),
    .auto_in_a_valid        (_fragmenter_auto_out_a_valid),	// @[Fragmenter.scala:335:34]
    .auto_in_a_bits_opcode  (_fragmenter_auto_out_a_bits_opcode),	// @[Fragmenter.scala:335:34]
    .auto_in_a_bits_param   (_fragmenter_auto_out_a_bits_param),	// @[Fragmenter.scala:335:34]
    .auto_in_a_bits_size    (_fragmenter_auto_out_a_bits_size),	// @[Fragmenter.scala:335:34]
    .auto_in_a_bits_source  (_fragmenter_auto_out_a_bits_source),	// @[Fragmenter.scala:335:34]
    .auto_in_a_bits_address (_fragmenter_auto_out_a_bits_address),	// @[Fragmenter.scala:335:34]
    .auto_in_a_bits_mask    (_fragmenter_auto_out_a_bits_mask),	// @[Fragmenter.scala:335:34]
    .auto_in_a_bits_data    (_fragmenter_auto_out_a_bits_data),	// @[Fragmenter.scala:335:34]
    .auto_in_d_ready        (_fragmenter_auto_out_d_ready),	// @[Fragmenter.scala:335:34]
    .auto_in_a_ready        (_srams_auto_in_a_ready),
    .auto_in_d_valid        (_srams_auto_in_d_valid),
    .auto_in_d_bits_opcode  (_srams_auto_in_d_bits_opcode),
    .auto_in_d_bits_size    (_srams_auto_in_d_bits_size),
    .auto_in_d_bits_source  (_srams_auto_in_d_bits_source),
    .auto_in_d_bits_data    (_srams_auto_in_d_bits_data)
  );
  TLFragmenter_37 fragmenter (	// @[Fragmenter.scala:335:34]
    .clock                   (clock),
    .reset                   (reset),
    .auto_in_a_valid         (_buffer_auto_out_a_valid),	// @[Buffer.scala:69:28]
    .auto_in_a_bits_opcode   (_buffer_auto_out_a_bits_opcode),	// @[Buffer.scala:69:28]
    .auto_in_a_bits_param    (_buffer_auto_out_a_bits_param),	// @[Buffer.scala:69:28]
    .auto_in_a_bits_size     (_buffer_auto_out_a_bits_size),	// @[Buffer.scala:69:28]
    .auto_in_a_bits_source   (_buffer_auto_out_a_bits_source),	// @[Buffer.scala:69:28]
    .auto_in_a_bits_address  (_buffer_auto_out_a_bits_address),	// @[Buffer.scala:69:28]
    .auto_in_a_bits_mask     (_buffer_auto_out_a_bits_mask),	// @[Buffer.scala:69:28]
    .auto_in_a_bits_data     (_buffer_auto_out_a_bits_data),	// @[Buffer.scala:69:28]
    .auto_in_d_ready         (_buffer_auto_out_d_ready),	// @[Buffer.scala:69:28]
    .auto_out_a_ready        (_srams_auto_in_a_ready),	// @[HarnessExtMem.scala:186:15]
    .auto_out_d_valid        (_srams_auto_in_d_valid),	// @[HarnessExtMem.scala:186:15]
    .auto_out_d_bits_opcode  (_srams_auto_in_d_bits_opcode),	// @[HarnessExtMem.scala:186:15]
    .auto_out_d_bits_size    (_srams_auto_in_d_bits_size),	// @[HarnessExtMem.scala:186:15]
    .auto_out_d_bits_source  (_srams_auto_in_d_bits_source),	// @[HarnessExtMem.scala:186:15]
    .auto_out_d_bits_data    (_srams_auto_in_d_bits_data),	// @[HarnessExtMem.scala:186:15]
    .auto_in_a_ready         (_fragmenter_auto_in_a_ready),
    .auto_in_d_valid         (_fragmenter_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_fragmenter_auto_in_d_bits_opcode),
    .auto_in_d_bits_size     (_fragmenter_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_fragmenter_auto_in_d_bits_source),
    .auto_in_d_bits_data     (_fragmenter_auto_in_d_bits_data),
    .auto_out_a_valid        (_fragmenter_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_fragmenter_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_fragmenter_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_fragmenter_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_fragmenter_auto_out_a_bits_source),
    .auto_out_a_bits_address (_fragmenter_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_fragmenter_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_fragmenter_auto_out_a_bits_data),
    .auto_out_d_ready        (_fragmenter_auto_out_d_ready)
  );
  TLBuffer_145 buffer (	// @[Buffer.scala:69:28]
    .clock                   (clock),
    .reset                   (reset),
    .auto_in_a_valid         (io_tl_0_a_valid),
    .auto_in_a_bits_opcode   (io_tl_0_a_bits_opcode),
    .auto_in_a_bits_param    (io_tl_0_a_bits_param),
    .auto_in_a_bits_size     (io_tl_0_a_bits_size),
    .auto_in_a_bits_source   (io_tl_0_a_bits_source),
    .auto_in_a_bits_address  (io_tl_0_a_bits_address),
    .auto_in_a_bits_mask     (io_tl_0_a_bits_mask),
    .auto_in_a_bits_data     (io_tl_0_a_bits_data),
    .auto_in_a_bits_corrupt  (io_tl_0_a_bits_corrupt),
    .auto_in_d_ready         (io_tl_0_d_ready),
    .auto_out_a_ready        (_fragmenter_auto_in_a_ready),	// @[Fragmenter.scala:335:34]
    .auto_out_d_valid        (_fragmenter_auto_in_d_valid),	// @[Fragmenter.scala:335:34]
    .auto_out_d_bits_opcode  (_fragmenter_auto_in_d_bits_opcode),	// @[Fragmenter.scala:335:34]
    .auto_out_d_bits_size    (_fragmenter_auto_in_d_bits_size),	// @[Fragmenter.scala:335:34]
    .auto_out_d_bits_source  (_fragmenter_auto_in_d_bits_source),	// @[Fragmenter.scala:335:34]
    .auto_out_d_bits_data    (_fragmenter_auto_in_d_bits_data),	// @[Fragmenter.scala:335:34]
    .auto_in_a_ready         (io_tl_0_a_ready),
    .auto_in_d_valid         (io_tl_0_d_valid),
    .auto_in_d_bits_opcode   (io_tl_0_d_bits_opcode),
    .auto_in_d_bits_param    (io_tl_0_d_bits_param),
    .auto_in_d_bits_size     (io_tl_0_d_bits_size),
    .auto_in_d_bits_source   (io_tl_0_d_bits_source),
    .auto_in_d_bits_sink     (io_tl_0_d_bits_sink),
    .auto_in_d_bits_denied   (io_tl_0_d_bits_denied),
    .auto_in_d_bits_data     (io_tl_0_d_bits_data),
    .auto_in_d_bits_corrupt  (io_tl_0_d_bits_corrupt),
    .auto_out_a_valid        (_buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address (_buffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_buffer_auto_out_a_bits_data),
    .auto_out_d_ready        (_buffer_auto_out_d_ready)
  );
endmodule

