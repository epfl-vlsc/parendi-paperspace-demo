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

module TLBToNoC(
  input         clock,
                reset,
  output        io_flit_valid,
                io_flit_bits_head,
                io_flit_bits_tail,
  output [72:0] io_flit_bits_payload
);

  wire        _q_io_enq_ready;	// @[Tilelink.scala:45:17]
  wire [2:0]  _q_io_deq_bits_opcode;	// @[Tilelink.scala:45:17]
  wire [1:0]  _q_io_deq_bits_param;	// @[Tilelink.scala:45:17]
  wire [3:0]  _q_io_deq_bits_size;	// @[Tilelink.scala:45:17]
  wire [8:0]  _q_io_deq_bits_source;	// @[Tilelink.scala:45:17]
  wire [31:0] _q_io_deq_bits_address;	// @[Tilelink.scala:45:17]
  wire [7:0]  _q_io_deq_bits_mask;	// @[Tilelink.scala:45:17]
  wire [63:0] _q_io_deq_bits_data;	// @[Tilelink.scala:45:17]
  wire        _q_io_deq_bits_corrupt;	// @[Tilelink.scala:45:17]
  Queue_3129 q (	// @[Tilelink.scala:45:17]
    .clock               (clock),
    .reset               (reset),
    .io_enq_valid        (1'h0),
    .io_enq_bits_opcode  (3'h0),
    .io_enq_bits_param   (2'h0),
    .io_enq_bits_size    (4'h0),
    .io_enq_bits_source  (9'h0),
    .io_enq_bits_address (32'h0),
    .io_enq_bits_mask    (8'h0),
    .io_deq_ready        (1'h0),
    .io_enq_ready        (_q_io_enq_ready),
    .io_deq_valid        (io_flit_valid),
    .io_deq_bits_opcode  (_q_io_deq_bits_opcode),
    .io_deq_bits_param   (_q_io_deq_bits_param),
    .io_deq_bits_size    (_q_io_deq_bits_size),
    .io_deq_bits_source  (_q_io_deq_bits_source),
    .io_deq_bits_address (_q_io_deq_bits_address),
    .io_deq_bits_mask    (_q_io_deq_bits_mask),
    .io_deq_bits_data    (_q_io_deq_bits_data),
    .io_deq_bits_corrupt (_q_io_deq_bits_corrupt)
  );
  assign io_flit_bits_head = 1'h1;	// @[Tilelink.scala:61:50]
  assign io_flit_bits_tail = &_q_io_deq_bits_mask;	// @[Tilelink.scala:45:17, :152:70]
  assign io_flit_bits_payload = {23'h0, _q_io_deq_bits_opcode, _q_io_deq_bits_param, _q_io_deq_bits_size, _q_io_deq_bits_source, _q_io_deq_bits_address};	// @[Tilelink.scala:45:17, :68:33]
endmodule

