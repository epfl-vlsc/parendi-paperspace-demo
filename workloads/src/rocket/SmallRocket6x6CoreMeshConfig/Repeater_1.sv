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

module Repeater_1(
  input         clock,
                reset,
                io_repeat,
                io_enq_valid,
  input  [2:0]  io_enq_bits_opcode,
                io_enq_bits_param,
                io_enq_bits_size,
  input  [7:0]  io_enq_bits_source,
  input  [25:0] io_enq_bits_address,
  input  [7:0]  io_enq_bits_mask,
  input         io_enq_bits_corrupt,
                io_deq_ready,
  output        io_full,
                io_enq_ready,
                io_deq_valid,
  output [2:0]  io_deq_bits_opcode,
                io_deq_bits_param,
                io_deq_bits_size,
  output [7:0]  io_deq_bits_source,
  output [25:0] io_deq_bits_address,
  output [7:0]  io_deq_bits_mask,
  output        io_deq_bits_corrupt
);

  reg         full;	// Repeater.scala:19:21
  reg  [2:0]  saved_opcode;	// Repeater.scala:20:18
  reg  [2:0]  saved_param;	// Repeater.scala:20:18
  reg  [2:0]  saved_size;	// Repeater.scala:20:18
  reg  [7:0]  saved_source;	// Repeater.scala:20:18
  reg  [25:0] saved_address;	// Repeater.scala:20:18
  reg  [7:0]  saved_mask;	// Repeater.scala:20:18
  reg         saved_corrupt;	// Repeater.scala:20:18
  wire        _io_deq_valid_output = io_enq_valid | full;	// Repeater.scala:19:21, :23:32
  wire        _io_enq_ready_output = io_deq_ready & ~full;	// Repeater.scala:19:21, :24:{32,35}
  wire        _T_1 = _io_enq_ready_output & io_enq_valid & io_repeat;	// Repeater.scala:24:32, :28:23
  always @(posedge clock) begin
    if (reset)
      full <= 1'h0;	// Repeater.scala:19:21
    else
      full <= ~(io_deq_ready & _io_deq_valid_output & ~io_repeat) & (_T_1 | full);	// Repeater.scala:19:21, :23:32, :28:{23,38,45}, :29:{23,26,38,45}
    if (_T_1) begin	// Repeater.scala:28:23
      saved_opcode <= io_enq_bits_opcode;	// Repeater.scala:20:18
      saved_param <= io_enq_bits_param;	// Repeater.scala:20:18
      saved_size <= io_enq_bits_size;	// Repeater.scala:20:18
      saved_source <= io_enq_bits_source;	// Repeater.scala:20:18
      saved_address <= io_enq_bits_address;	// Repeater.scala:20:18
      saved_mask <= io_enq_bits_mask;	// Repeater.scala:20:18
      saved_corrupt <= io_enq_bits_corrupt;	// Repeater.scala:20:18
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    logic [31:0] _RANDOM_1;
    logic [31:0] _RANDOM_2;
    logic [31:0] _RANDOM_3;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        _RANDOM_1 = `RANDOM;
        _RANDOM_2 = `RANDOM;
        _RANDOM_3 = `RANDOM;
        full = _RANDOM_0[0];	// Repeater.scala:19:21
        saved_opcode = _RANDOM_0[3:1];	// Repeater.scala:19:21, :20:18
        saved_param = _RANDOM_0[6:4];	// Repeater.scala:19:21, :20:18
        saved_size = _RANDOM_0[9:7];	// Repeater.scala:19:21, :20:18
        saved_source = _RANDOM_0[17:10];	// Repeater.scala:19:21, :20:18
        saved_address = {_RANDOM_0[31:18], _RANDOM_1[11:0]};	// Repeater.scala:19:21, :20:18
        saved_mask = _RANDOM_1[19:12];	// Repeater.scala:20:18
        saved_corrupt = _RANDOM_3[20];	// Repeater.scala:20:18
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_full = full;	// Repeater.scala:19:21
  assign io_enq_ready = _io_enq_ready_output;	// Repeater.scala:24:32
  assign io_deq_valid = _io_deq_valid_output;	// Repeater.scala:23:32
  assign io_deq_bits_opcode = full ? saved_opcode : io_enq_bits_opcode;	// Repeater.scala:19:21, :20:18, :25:21
  assign io_deq_bits_param = full ? saved_param : io_enq_bits_param;	// Repeater.scala:19:21, :20:18, :25:21
  assign io_deq_bits_size = full ? saved_size : io_enq_bits_size;	// Repeater.scala:19:21, :20:18, :25:21
  assign io_deq_bits_source = full ? saved_source : io_enq_bits_source;	// Repeater.scala:19:21, :20:18, :25:21
  assign io_deq_bits_address = full ? saved_address : io_enq_bits_address;	// Repeater.scala:19:21, :20:18, :25:21
  assign io_deq_bits_mask = full ? saved_mask : io_enq_bits_mask;	// Repeater.scala:19:21, :20:18, :25:21
  assign io_deq_bits_corrupt = full ? saved_corrupt : io_enq_bits_corrupt;	// Repeater.scala:19:21, :20:18, :25:21
endmodule

