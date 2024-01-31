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

module TLError(
  input         clock,
                reset,
                auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
  input  [3:0]  auto_in_a_bits_size,
  input  [6:0]  auto_in_a_bits_source,
  input  [13:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
                auto_in_d_ready,
  output        auto_in_a_ready,
                auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [3:0]  auto_in_d_bits_size,
  output [6:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_corrupt
);

  wire [2:0]      da_bits_opcode;	// @[Error.scala:35:21]
  wire            _a_io_deq_valid;	// @[Decoupled.scala:375:21]
  wire [2:0]      _a_io_deq_bits_opcode;	// @[Decoupled.scala:375:21]
  wire [3:0]      _a_io_deq_bits_size;	// @[Decoupled.scala:375:21]
  wire [7:0][2:0] _GEN = '{3'h4, 3'h4, 3'h2, 3'h1, 3'h1, 3'h1, 3'h0, 3'h0};	// @[Error.scala:35:21]
  wire [26:0]     _GEN_0 = {23'h0, _a_io_deq_bits_size};	// @[Decoupled.scala:375:21, package.scala:235:71]
  wire [26:0]     _a_last_beats1_decode_T_1 = 27'hFFF << _GEN_0;	// @[package.scala:235:71]
  reg  [8:0]      a_last_counter;	// @[Edges.scala:229:27]
  wire            a_last = a_last_counter == 9'h1 | (_a_io_deq_bits_opcode[2] ? 9'h0 : ~(_a_last_beats1_decode_T_1[11:3])) == 9'h0;	// @[Decoupled.scala:375:21, Edges.scala:92:37, :221:14, :229:27, :232:{25,33,43}, package.scala:235:{46,71,76}]
  wire [26:0]     _beats1_decode_T_1 = 27'hFFF << _GEN_0;	// @[package.scala:235:71]
  reg  [8:0]      counter;	// @[Edges.scala:229:27]
  wire            _a_io_deq_ready_T_3 = auto_in_d_ready & (counter == 9'h1 | (da_bits_opcode[0] ? ~(_beats1_decode_T_1[11:3]) : 9'h0) == 9'h0) | ~a_last;	// @[Edges.scala:106:36, :221:14, :229:27, :232:{25,33,43}, Error.scala:32:{26,46,49}, :35:21, package.scala:235:{46,71,76}]
  wire            da_valid = _a_io_deq_valid & a_last;	// @[Decoupled.scala:375:21, Edges.scala:232:33, Error.scala:33:25]
  assign da_bits_opcode = _GEN[_a_io_deq_bits_opcode];	// @[Decoupled.scala:375:21, Error.scala:35:21]
  always @(posedge clock) begin
    if (reset) begin
      a_last_counter <= 9'h0;	// @[Edges.scala:229:27]
      counter <= 9'h0;	// @[Edges.scala:229:27]
    end
    else begin
      if (_a_io_deq_ready_T_3 & _a_io_deq_valid) begin	// @[Decoupled.scala:51:35, :375:21, Error.scala:32:46]
        if (a_last_counter == 9'h0) begin	// @[Edges.scala:229:27, :231:25]
          if (_a_io_deq_bits_opcode[2])	// @[Decoupled.scala:375:21, Edges.scala:92:37]
            a_last_counter <= 9'h0;	// @[Edges.scala:229:27]
          else	// @[Edges.scala:92:37]
            a_last_counter <= ~(_a_last_beats1_decode_T_1[11:3]);	// @[Edges.scala:229:27, package.scala:235:{46,71,76}]
        end
        else	// @[Edges.scala:231:25]
          a_last_counter <= a_last_counter - 9'h1;	// @[Edges.scala:229:27, :230:28]
      end
      if (auto_in_d_ready & da_valid) begin	// @[Decoupled.scala:51:35, Error.scala:33:25]
        if (counter == 9'h0) begin	// @[Edges.scala:229:27, :231:25]
          if (da_bits_opcode[0])	// @[Edges.scala:106:36, Error.scala:35:21]
            counter <= ~(_beats1_decode_T_1[11:3]);	// @[Edges.scala:229:27, package.scala:235:{46,71,76}]
          else	// @[Edges.scala:106:36]
            counter <= 9'h0;	// @[Edges.scala:229:27]
        end
        else	// @[Edges.scala:231:25]
          counter <= counter - 9'h1;	// @[Edges.scala:229:27, :230:28]
      end
    end
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
        a_last_counter = _RANDOM_0[9:1];	// @[Edges.scala:229:27]
        counter = _RANDOM_0[18:10];	// @[Edges.scala:229:27]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  Queue_991 a (	// @[Decoupled.scala:375:21]
    .clock               (clock),
    .reset               (reset),
    .io_enq_valid        (auto_in_a_valid),
    .io_enq_bits_opcode  (auto_in_a_bits_opcode),
    .io_enq_bits_param   (auto_in_a_bits_param),
    .io_enq_bits_size    (auto_in_a_bits_size),
    .io_enq_bits_source  (auto_in_a_bits_source),
    .io_enq_bits_address (auto_in_a_bits_address),
    .io_enq_bits_mask    (auto_in_a_bits_mask),
    .io_enq_bits_data    (auto_in_a_bits_data),
    .io_enq_bits_corrupt (auto_in_a_bits_corrupt),
    .io_deq_ready        (_a_io_deq_ready_T_3),	// @[Error.scala:32:46]
    .io_enq_ready        (auto_in_a_ready),
    .io_deq_valid        (_a_io_deq_valid),
    .io_deq_bits_opcode  (_a_io_deq_bits_opcode),
    .io_deq_bits_size    (_a_io_deq_bits_size),
    .io_deq_bits_source  (auto_in_d_bits_source)
  );
  assign auto_in_d_valid = da_valid;	// @[Error.scala:33:25]
  assign auto_in_d_bits_opcode = da_bits_opcode;	// @[Error.scala:35:21]
  assign auto_in_d_bits_size = _a_io_deq_bits_size;	// @[Decoupled.scala:375:21]
  assign auto_in_d_bits_corrupt = da_bits_opcode[0];	// @[Edges.scala:106:36, Error.scala:35:21]
endmodule

