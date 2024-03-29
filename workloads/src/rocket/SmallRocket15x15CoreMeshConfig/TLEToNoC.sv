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

module TLEToNoC(
  input        clock,
               reset,
               io_protocol_valid,
  input  [2:0] io_protocol_bits_sink,
  input        io_flit_ready,
  output       io_protocol_ready,
               io_flit_valid,
               io_flit_bits_head,
  output [2:0] io_flit_bits_payload
);

  wire       _q_io_deq_valid;	// @[Tilelink.scala:45:17]
  wire [2:0] _q_io_deq_bits_sink;	// @[Tilelink.scala:45:17]
  reg        is_body;	// @[Tilelink.scala:59:24]
  wire       _T_2 = io_flit_ready & _q_io_deq_valid;	// @[Decoupled.scala:51:35, Tilelink.scala:45:17]
  always @(posedge clock) begin
    if (reset)
      is_body <= 1'h0;	// @[Edges.scala:231:25, Tilelink.scala:59:24]
    else
      is_body <= ~_T_2 & (_T_2 & ~is_body | is_body);	// @[Decoupled.scala:51:35, Tilelink.scala:59:24, :63:38, :70:{24,46,56}, :71:{46,56}]
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        is_body = _RANDOM_0[18];	// @[Tilelink.scala:59:24]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  Queue_7913 q (	// @[Tilelink.scala:45:17]
    .clock            (clock),
    .reset            (reset),
    .io_enq_valid     (io_protocol_valid),
    .io_enq_bits_sink (io_protocol_bits_sink),
    .io_deq_ready     (io_flit_ready),
    .io_enq_ready     (io_protocol_ready),
    .io_deq_valid     (_q_io_deq_valid),
    .io_deq_bits_sink (_q_io_deq_bits_sink)
  );
  assign io_flit_valid = _q_io_deq_valid;	// @[Tilelink.scala:45:17]
  assign io_flit_bits_head = ~is_body;	// @[Tilelink.scala:59:24, :63:38]
  assign io_flit_bits_payload = is_body ? 3'h0 : _q_io_deq_bits_sink;	// @[Tilelink.scala:45:17, :59:24, :68:33]
endmodule

