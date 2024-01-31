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

module TLInterconnectCoupler_102(
  input         clock,
                reset,
                auto_buffer_out_a_ready,
                auto_buffer_out_d_valid,
  input  [2:0]  auto_buffer_out_d_bits_opcode,
  input  [1:0]  auto_buffer_out_d_bits_size,
  input  [12:0] auto_buffer_out_d_bits_source,
  input  [63:0] auto_buffer_out_d_bits_data,
  input         auto_tl_in_a_valid,
  input  [2:0]  auto_tl_in_a_bits_opcode,
                auto_tl_in_a_bits_param,
                auto_tl_in_a_bits_size,
  input  [8:0]  auto_tl_in_a_bits_source,
  input  [25:0] auto_tl_in_a_bits_address,
  input  [7:0]  auto_tl_in_a_bits_mask,
  input  [63:0] auto_tl_in_a_bits_data,
  input         auto_tl_in_a_bits_corrupt,
                auto_tl_in_d_ready,
  output        auto_buffer_out_a_valid,
  output [2:0]  auto_buffer_out_a_bits_opcode,
  output [1:0]  auto_buffer_out_a_bits_size,
  output [12:0] auto_buffer_out_a_bits_source,
  output [25:0] auto_buffer_out_a_bits_address,
  output [7:0]  auto_buffer_out_a_bits_mask,
  output [63:0] auto_buffer_out_a_bits_data,
  output        auto_buffer_out_d_ready,
                auto_tl_in_a_ready,
                auto_tl_in_d_valid,
  output [2:0]  auto_tl_in_d_bits_opcode,
  output [1:0]  auto_tl_in_d_bits_param,
  output [2:0]  auto_tl_in_d_bits_size,
  output [8:0]  auto_tl_in_d_bits_source,
  output        auto_tl_in_d_bits_sink,
                auto_tl_in_d_bits_denied,
  output [63:0] auto_tl_in_d_bits_data,
  output        auto_tl_in_d_bits_corrupt
);

  wire        _fragmenter_auto_out_a_valid;	// Fragmenter.scala:335:34
  wire [2:0]  _fragmenter_auto_out_a_bits_opcode;	// Fragmenter.scala:335:34
  wire [2:0]  _fragmenter_auto_out_a_bits_param;	// Fragmenter.scala:335:34
  wire [1:0]  _fragmenter_auto_out_a_bits_size;	// Fragmenter.scala:335:34
  wire [12:0] _fragmenter_auto_out_a_bits_source;	// Fragmenter.scala:335:34
  wire [25:0] _fragmenter_auto_out_a_bits_address;	// Fragmenter.scala:335:34
  wire [7:0]  _fragmenter_auto_out_a_bits_mask;	// Fragmenter.scala:335:34
  wire [63:0] _fragmenter_auto_out_a_bits_data;	// Fragmenter.scala:335:34
  wire        _fragmenter_auto_out_a_bits_corrupt;	// Fragmenter.scala:335:34
  wire        _fragmenter_auto_out_d_ready;	// Fragmenter.scala:335:34
  wire        _buffer_auto_in_a_ready;	// Buffer.scala:69:28
  wire        _buffer_auto_in_d_valid;	// Buffer.scala:69:28
  wire [2:0]  _buffer_auto_in_d_bits_opcode;	// Buffer.scala:69:28
  wire [1:0]  _buffer_auto_in_d_bits_param;	// Buffer.scala:69:28
  wire [1:0]  _buffer_auto_in_d_bits_size;	// Buffer.scala:69:28
  wire [12:0] _buffer_auto_in_d_bits_source;	// Buffer.scala:69:28
  wire        _buffer_auto_in_d_bits_sink;	// Buffer.scala:69:28
  wire        _buffer_auto_in_d_bits_denied;	// Buffer.scala:69:28
  wire [63:0] _buffer_auto_in_d_bits_data;	// Buffer.scala:69:28
  wire        _buffer_auto_in_d_bits_corrupt;	// Buffer.scala:69:28
  TLBuffer_6 buffer (	// Buffer.scala:69:28
    .clock                   (clock),
    .reset                   (reset),
    .auto_in_a_valid         (_fragmenter_auto_out_a_valid),	// Fragmenter.scala:335:34
    .auto_in_a_bits_opcode   (_fragmenter_auto_out_a_bits_opcode),	// Fragmenter.scala:335:34
    .auto_in_a_bits_param    (_fragmenter_auto_out_a_bits_param),	// Fragmenter.scala:335:34
    .auto_in_a_bits_size     (_fragmenter_auto_out_a_bits_size),	// Fragmenter.scala:335:34
    .auto_in_a_bits_source   (_fragmenter_auto_out_a_bits_source),	// Fragmenter.scala:335:34
    .auto_in_a_bits_address  (_fragmenter_auto_out_a_bits_address),	// Fragmenter.scala:335:34
    .auto_in_a_bits_mask     (_fragmenter_auto_out_a_bits_mask),	// Fragmenter.scala:335:34
    .auto_in_a_bits_data     (_fragmenter_auto_out_a_bits_data),	// Fragmenter.scala:335:34
    .auto_in_a_bits_corrupt  (_fragmenter_auto_out_a_bits_corrupt),	// Fragmenter.scala:335:34
    .auto_in_d_ready         (_fragmenter_auto_out_d_ready),	// Fragmenter.scala:335:34
    .auto_out_a_ready        (auto_buffer_out_a_ready),
    .auto_out_d_valid        (auto_buffer_out_d_valid),
    .auto_out_d_bits_opcode  (auto_buffer_out_d_bits_opcode),
    .auto_out_d_bits_size    (auto_buffer_out_d_bits_size),
    .auto_out_d_bits_source  (auto_buffer_out_d_bits_source),
    .auto_out_d_bits_data    (auto_buffer_out_d_bits_data),
    .auto_in_a_ready         (_buffer_auto_in_a_ready),
    .auto_in_d_valid         (_buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param    (_buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink     (_buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied   (_buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_buffer_auto_in_d_bits_corrupt),
    .auto_out_a_valid        (auto_buffer_out_a_valid),
    .auto_out_a_bits_opcode  (auto_buffer_out_a_bits_opcode),
    .auto_out_a_bits_size    (auto_buffer_out_a_bits_size),
    .auto_out_a_bits_source  (auto_buffer_out_a_bits_source),
    .auto_out_a_bits_address (auto_buffer_out_a_bits_address),
    .auto_out_a_bits_mask    (auto_buffer_out_a_bits_mask),
    .auto_out_a_bits_data    (auto_buffer_out_a_bits_data),
    .auto_out_d_ready        (auto_buffer_out_d_ready)
  );
  TLFragmenter_1 fragmenter (	// Fragmenter.scala:335:34
    .clock                   (clock),
    .reset                   (reset),
    .auto_in_a_valid         (auto_tl_in_a_valid),
    .auto_in_a_bits_opcode   (auto_tl_in_a_bits_opcode),
    .auto_in_a_bits_param    (auto_tl_in_a_bits_param),
    .auto_in_a_bits_size     (auto_tl_in_a_bits_size),
    .auto_in_a_bits_source   (auto_tl_in_a_bits_source),
    .auto_in_a_bits_address  (auto_tl_in_a_bits_address),
    .auto_in_a_bits_mask     (auto_tl_in_a_bits_mask),
    .auto_in_a_bits_data     (auto_tl_in_a_bits_data),
    .auto_in_a_bits_corrupt  (auto_tl_in_a_bits_corrupt),
    .auto_in_d_ready         (auto_tl_in_d_ready),
    .auto_out_a_ready        (_buffer_auto_in_a_ready),	// Buffer.scala:69:28
    .auto_out_d_valid        (_buffer_auto_in_d_valid),	// Buffer.scala:69:28
    .auto_out_d_bits_opcode  (_buffer_auto_in_d_bits_opcode),	// Buffer.scala:69:28
    .auto_out_d_bits_param   (_buffer_auto_in_d_bits_param),	// Buffer.scala:69:28
    .auto_out_d_bits_size    (_buffer_auto_in_d_bits_size),	// Buffer.scala:69:28
    .auto_out_d_bits_source  (_buffer_auto_in_d_bits_source),	// Buffer.scala:69:28
    .auto_out_d_bits_sink    (_buffer_auto_in_d_bits_sink),	// Buffer.scala:69:28
    .auto_out_d_bits_denied  (_buffer_auto_in_d_bits_denied),	// Buffer.scala:69:28
    .auto_out_d_bits_data    (_buffer_auto_in_d_bits_data),	// Buffer.scala:69:28
    .auto_out_d_bits_corrupt (_buffer_auto_in_d_bits_corrupt),	// Buffer.scala:69:28
    .auto_in_a_ready         (auto_tl_in_a_ready),
    .auto_in_d_valid         (auto_tl_in_d_valid),
    .auto_in_d_bits_opcode   (auto_tl_in_d_bits_opcode),
    .auto_in_d_bits_param    (auto_tl_in_d_bits_param),
    .auto_in_d_bits_size     (auto_tl_in_d_bits_size),
    .auto_in_d_bits_source   (auto_tl_in_d_bits_source),
    .auto_in_d_bits_sink     (auto_tl_in_d_bits_sink),
    .auto_in_d_bits_denied   (auto_tl_in_d_bits_denied),
    .auto_in_d_bits_data     (auto_tl_in_d_bits_data),
    .auto_in_d_bits_corrupt  (auto_tl_in_d_bits_corrupt),
    .auto_out_a_valid        (_fragmenter_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_fragmenter_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_fragmenter_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_fragmenter_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_fragmenter_auto_out_a_bits_source),
    .auto_out_a_bits_address (_fragmenter_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_fragmenter_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_fragmenter_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_fragmenter_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_fragmenter_auto_out_d_ready)
  );
endmodule

