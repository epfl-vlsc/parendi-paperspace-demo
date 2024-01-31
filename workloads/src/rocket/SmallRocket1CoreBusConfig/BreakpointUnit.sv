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

module BreakpointUnit(
  input         io_status_debug,
                io_bp_0_control_action,
                io_bp_0_control_chain,
  input  [1:0]  io_bp_0_control_tmatch,
  input         io_bp_0_control_x,
                io_bp_0_control_w,
                io_bp_0_control_r,
  input  [32:0] io_bp_0_address,
                io_pc,
                io_ea,
  output        io_xcpt_if,
                io_xcpt_ld,
                io_xcpt_st,
                io_debug_if,
                io_debug_ld,
                io_debug_st
);

  wire _w_T_2 = io_ea >= io_bp_0_address;	// @[Breakpoint.scala:65:8]
  wire _r_T_8 = io_bp_0_control_tmatch[0] & io_bp_0_address[0];	// @[Breakpoint.scala:59:{73,83}, :65:36]
  wire _r_T_10 = _r_T_8 & io_bp_0_address[1];	// @[Breakpoint.scala:59:{73,83}]
  wire _r_T_18 = io_bp_0_control_tmatch[0] & io_bp_0_address[0];	// @[Breakpoint.scala:59:{73,83}, :65:36]
  wire _r_T_20 = _r_T_18 & io_bp_0_address[1];	// @[Breakpoint.scala:59:{73,83}]
  wire _w_T_8 = io_bp_0_control_tmatch[0] & io_bp_0_address[0];	// @[Breakpoint.scala:59:{73,83}, :65:36]
  wire _w_T_10 = _w_T_8 & io_bp_0_address[1];	// @[Breakpoint.scala:59:{73,83}]
  wire _w_T_18 = io_bp_0_control_tmatch[0] & io_bp_0_address[0];	// @[Breakpoint.scala:59:{73,83}, :65:36]
  wire _w_T_20 = _w_T_18 & io_bp_0_address[1];	// @[Breakpoint.scala:59:{73,83}]
  wire _x_T_8 = io_bp_0_control_tmatch[0] & io_bp_0_address[0];	// @[Breakpoint.scala:59:{73,83}, :65:36]
  wire _x_T_10 = _x_T_8 & io_bp_0_address[1];	// @[Breakpoint.scala:59:{73,83}]
  wire _x_T_18 = io_bp_0_control_tmatch[0] & io_bp_0_address[0];	// @[Breakpoint.scala:59:{73,83}, :65:36]
  wire _x_T_20 = _x_T_18 & io_bp_0_address[1];	// @[Breakpoint.scala:59:{73,83}]
  wire _T_1 = ~io_bp_0_control_chain & ~io_status_debug & io_bp_0_control_r & (io_bp_0_control_tmatch[1] ? _w_T_2 ^ io_bp_0_control_tmatch[0] : (~io_ea | {29'h0, _r_T_10 & io_bp_0_address[2], _r_T_10, _r_T_8, io_bp_0_control_tmatch[0]}) == (~io_bp_0_address | {29'h0, _r_T_20 & io_bp_0_address[2], _r_T_20, _r_T_18, io_bp_0_control_tmatch[0]}));	// @[Breakpoint.scala:30:35, :59:{73,83}, :62:{6,9,19,24,33}, :65:{8,20,36}, :68:{8,23}, :109:15, :118:15]
  wire _T_3 = ~io_bp_0_control_chain & ~io_status_debug & io_bp_0_control_w & (io_bp_0_control_tmatch[1] ? _w_T_2 ^ io_bp_0_control_tmatch[0] : (~io_ea | {29'h0, _w_T_10 & io_bp_0_address[2], _w_T_10, _w_T_8, io_bp_0_control_tmatch[0]}) == (~io_bp_0_address | {29'h0, _w_T_20 & io_bp_0_address[2], _w_T_20, _w_T_18, io_bp_0_control_tmatch[0]}));	// @[Breakpoint.scala:30:35, :59:{73,83}, :62:{6,9,19,24,33}, :65:{8,20,36}, :68:{8,23}, :109:15, :119:15]
  wire _T_5 = ~io_bp_0_control_chain & ~io_status_debug & io_bp_0_control_x & (io_bp_0_control_tmatch[1] ? io_pc >= io_bp_0_address ^ io_bp_0_control_tmatch[0] : (~io_pc | {29'h0, _x_T_10 & io_bp_0_address[2], _x_T_10, _x_T_8, io_bp_0_control_tmatch[0]}) == (~io_bp_0_address | {29'h0, _x_T_20 & io_bp_0_address[2], _x_T_20, _x_T_18, io_bp_0_control_tmatch[0]}));	// @[Breakpoint.scala:30:35, :59:{73,83}, :62:{6,9,19,24,33}, :65:{8,20,36}, :68:{8,23}, :109:15, :120:15]
  assign io_xcpt_if = _T_5 & ~io_bp_0_control_action;	// @[Breakpoint.scala:96:14, :120:{15,27,40,51}]
  assign io_xcpt_ld = _T_1 & ~io_bp_0_control_action;	// @[Breakpoint.scala:97:14, :118:{15,27,40,51}]
  assign io_xcpt_st = _T_3 & ~io_bp_0_control_action;	// @[Breakpoint.scala:98:14, :119:{15,27,40,51}]
  assign io_debug_if = _T_5 & io_bp_0_control_action;	// @[Breakpoint.scala:99:15, :120:{15,27,73}]
  assign io_debug_ld = _T_1 & io_bp_0_control_action;	// @[Breakpoint.scala:100:15, :118:{15,27,73}]
  assign io_debug_st = _T_3 & io_bp_0_control_action;	// @[Breakpoint.scala:101:15, :119:{15,27,73}]
endmodule

