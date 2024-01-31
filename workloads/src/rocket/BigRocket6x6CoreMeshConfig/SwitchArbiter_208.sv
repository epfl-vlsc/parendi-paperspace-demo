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

module SwitchArbiter_208(
  input        clock,
               reset,
               io_in_0_valid,
               io_in_0_bits_vc_sel_4_4,
               io_in_0_bits_vc_sel_3_0,
               io_in_0_bits_vc_sel_3_1,
               io_in_0_bits_vc_sel_3_2,
               io_in_0_bits_vc_sel_3_3,
               io_in_0_bits_vc_sel_3_4,
               io_in_0_bits_vc_sel_2_4,
               io_in_0_bits_vc_sel_1_1,
               io_in_0_bits_vc_sel_1_2,
               io_in_0_bits_vc_sel_1_3,
               io_in_0_bits_vc_sel_1_4,
               io_in_0_bits_vc_sel_0_1,
               io_in_0_bits_vc_sel_0_2,
               io_in_0_bits_vc_sel_0_3,
               io_in_0_bits_vc_sel_0_4,
               io_in_0_bits_tail,
               io_in_1_valid,
               io_in_1_bits_vc_sel_4_4,
               io_in_1_bits_vc_sel_3_0,
               io_in_1_bits_vc_sel_3_1,
               io_in_1_bits_vc_sel_3_2,
               io_in_1_bits_vc_sel_3_3,
               io_in_1_bits_vc_sel_3_4,
               io_in_1_bits_vc_sel_2_4,
               io_in_1_bits_vc_sel_1_1,
               io_in_1_bits_vc_sel_1_2,
               io_in_1_bits_vc_sel_1_3,
               io_in_1_bits_vc_sel_1_4,
               io_in_1_bits_vc_sel_0_1,
               io_in_1_bits_vc_sel_0_2,
               io_in_1_bits_vc_sel_0_3,
               io_in_1_bits_vc_sel_0_4,
               io_in_1_bits_tail,
               io_in_2_valid,
               io_in_2_bits_vc_sel_4_4,
               io_in_2_bits_vc_sel_3_0,
               io_in_2_bits_vc_sel_3_1,
               io_in_2_bits_vc_sel_3_2,
               io_in_2_bits_vc_sel_3_3,
               io_in_2_bits_vc_sel_3_4,
               io_in_2_bits_vc_sel_2_4,
               io_in_2_bits_vc_sel_1_1,
               io_in_2_bits_vc_sel_1_2,
               io_in_2_bits_vc_sel_1_3,
               io_in_2_bits_vc_sel_1_4,
               io_in_2_bits_vc_sel_0_1,
               io_in_2_bits_vc_sel_0_2,
               io_in_2_bits_vc_sel_0_3,
               io_in_2_bits_vc_sel_0_4,
               io_in_2_bits_tail,
               io_in_3_valid,
               io_in_3_bits_vc_sel_4_4,
               io_in_3_bits_vc_sel_3_0,
               io_in_3_bits_vc_sel_3_1,
               io_in_3_bits_vc_sel_3_2,
               io_in_3_bits_vc_sel_3_3,
               io_in_3_bits_vc_sel_3_4,
               io_in_3_bits_vc_sel_2_4,
               io_in_3_bits_vc_sel_1_1,
               io_in_3_bits_vc_sel_1_2,
               io_in_3_bits_vc_sel_1_3,
               io_in_3_bits_vc_sel_1_4,
               io_in_3_bits_vc_sel_0_1,
               io_in_3_bits_vc_sel_0_2,
               io_in_3_bits_vc_sel_0_3,
               io_in_3_bits_vc_sel_0_4,
               io_in_3_bits_tail,
               io_in_4_valid,
               io_in_4_bits_vc_sel_4_4,
               io_in_4_bits_vc_sel_3_0,
               io_in_4_bits_vc_sel_3_1,
               io_in_4_bits_vc_sel_3_2,
               io_in_4_bits_vc_sel_3_3,
               io_in_4_bits_vc_sel_3_4,
               io_in_4_bits_vc_sel_2_4,
               io_in_4_bits_vc_sel_1_1,
               io_in_4_bits_vc_sel_1_2,
               io_in_4_bits_vc_sel_1_3,
               io_in_4_bits_vc_sel_1_4,
               io_in_4_bits_vc_sel_0_1,
               io_in_4_bits_vc_sel_0_2,
               io_in_4_bits_vc_sel_0_3,
               io_in_4_bits_vc_sel_0_4,
               io_in_4_bits_tail,
               io_out_0_ready,
  output       io_in_0_ready,
               io_in_1_ready,
               io_in_2_ready,
               io_in_3_ready,
               io_in_4_ready,
               io_out_0_valid,
               io_out_0_bits_vc_sel_4_4,
               io_out_0_bits_vc_sel_3_0,
               io_out_0_bits_vc_sel_3_1,
               io_out_0_bits_vc_sel_3_2,
               io_out_0_bits_vc_sel_3_3,
               io_out_0_bits_vc_sel_3_4,
               io_out_0_bits_vc_sel_2_4,
               io_out_0_bits_vc_sel_1_1,
               io_out_0_bits_vc_sel_1_2,
               io_out_0_bits_vc_sel_1_3,
               io_out_0_bits_vc_sel_1_4,
               io_out_0_bits_vc_sel_0_1,
               io_out_0_bits_vc_sel_0_2,
               io_out_0_bits_vc_sel_0_3,
               io_out_0_bits_vc_sel_0_4,
               io_out_0_bits_tail,
  output [4:0] io_chosen_oh_0
);

  reg  [4:0] lock_0;	// @[SwitchAllocator.scala:24:38]
  wire [4:0] unassigned = {io_in_4_valid, io_in_3_valid, io_in_2_valid, io_in_1_valid, io_in_0_valid} & ~lock_0;	// @[Cat.scala:33:92, SwitchAllocator.scala:24:38, :25:{52,54}]
  reg  [4:0] mask;	// @[SwitchAllocator.scala:27:21]
  wire [9:0] sel = unassigned[0] & mask == 5'h0 ? 10'h1 : unassigned[0] ? 10'h20 : unassigned[1] ? 10'h40 : unassigned[2] ? 10'h80 : unassigned[3] ? 10'h100 : {unassigned[4], 9'h0};	// @[Mux.scala:47:70, OneHot.scala:84:71, SwitchAllocator.scala:24:38, :25:52, :27:21, :30:{58,60}]
  wire [4:0] in_valids = {io_in_4_valid, io_in_3_valid, io_in_2_valid, io_in_1_valid, io_in_0_valid};	// @[Cat.scala:33:92]
  wire [4:0] _io_chosen_oh_0_output = (|(in_valids & lock_0)) ? lock_0 : sel[4:0] | sel[9:5];	// @[Cat.scala:33:92, Mux.scala:47:70, SwitchAllocator.scala:24:38, :32:{23,30}, :42:{21,33,55}]
  wire [4:0] _io_out_0_valid_T = in_valids & _io_chosen_oh_0_output;	// @[Cat.scala:33:92, SwitchAllocator.scala:42:21, :44:35]
  wire [2:0] _GEN = _io_chosen_oh_0_output[3:1] | _io_chosen_oh_0_output[4:2];	// @[SwitchAllocator.scala:42:21, :58:{55,71}]
  wire [1:0] _GEN_0 = _GEN[1:0] | _io_chosen_oh_0_output[4:3];	// @[SwitchAllocator.scala:42:21, :58:{55,71}]
  always @(posedge clock) begin
    if (reset) begin
      lock_0 <= 5'h0;	// @[SwitchAllocator.scala:24:38]
      mask <= 5'h0;	// @[SwitchAllocator.scala:24:38, :27:21]
    end
    else if (io_out_0_ready & (|_io_out_0_valid_T)) begin	// @[Decoupled.scala:51:35, SwitchAllocator.scala:44:{35,45}]
      lock_0 <= _io_chosen_oh_0_output & ~{io_in_4_bits_tail, io_in_3_bits_tail, io_in_2_bits_tail, io_in_1_bits_tail, io_in_0_bits_tail};	// @[Cat.scala:33:92, SwitchAllocator.scala:24:38, :42:21, :53:{25,27}]
      mask <= _io_chosen_oh_0_output | {1'h0, _io_chosen_oh_0_output[4], _GEN[2], _GEN_0[1], _GEN_0[0] | _io_chosen_oh_0_output[4]};	// @[SwitchAllocator.scala:27:21, :42:21, :58:{55,71}]
    end
    else	// @[Decoupled.scala:51:35]
      mask <= (&mask) ? 5'h0 : {mask[3:0], 1'h1};	// @[SwitchAllocator.scala:24:38, :27:21, :60:{16,23,43,49}]
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
        lock_0 = _RANDOM_0[4:0];	// @[SwitchAllocator.scala:24:38]
        mask = _RANDOM_0[9:5];	// @[SwitchAllocator.scala:24:38, :27:21]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_in_0_ready = _io_chosen_oh_0_output[0] & io_out_0_ready;	// @[Mux.scala:29:36, SwitchAllocator.scala:42:21, :47:23]
  assign io_in_1_ready = _io_chosen_oh_0_output[1] & io_out_0_ready;	// @[Mux.scala:29:36, SwitchAllocator.scala:42:21, :47:23]
  assign io_in_2_ready = _io_chosen_oh_0_output[2] & io_out_0_ready;	// @[Mux.scala:29:36, SwitchAllocator.scala:42:21, :47:23]
  assign io_in_3_ready = _io_chosen_oh_0_output[3] & io_out_0_ready;	// @[Mux.scala:29:36, SwitchAllocator.scala:42:21, :47:23]
  assign io_in_4_ready = _io_chosen_oh_0_output[4] & io_out_0_ready;	// @[Mux.scala:29:36, SwitchAllocator.scala:42:21, :47:23]
  assign io_out_0_valid = |_io_out_0_valid_T;	// @[SwitchAllocator.scala:44:{35,45}]
  assign io_out_0_bits_vc_sel_4_4 = _io_chosen_oh_0_output[0] & io_in_0_bits_vc_sel_4_4 | _io_chosen_oh_0_output[1] & io_in_1_bits_vc_sel_4_4 | _io_chosen_oh_0_output[2] & io_in_2_bits_vc_sel_4_4 | _io_chosen_oh_0_output[3] & io_in_3_bits_vc_sel_4_4 | _io_chosen_oh_0_output[4] & io_in_4_bits_vc_sel_4_4;	// @[Mux.scala:27:73, :29:36, SwitchAllocator.scala:42:21]
  assign io_out_0_bits_vc_sel_3_0 = _io_chosen_oh_0_output[0] & io_in_0_bits_vc_sel_3_0 | _io_chosen_oh_0_output[1] & io_in_1_bits_vc_sel_3_0 | _io_chosen_oh_0_output[2] & io_in_2_bits_vc_sel_3_0 | _io_chosen_oh_0_output[3] & io_in_3_bits_vc_sel_3_0 | _io_chosen_oh_0_output[4] & io_in_4_bits_vc_sel_3_0;	// @[Mux.scala:27:73, :29:36, SwitchAllocator.scala:42:21]
  assign io_out_0_bits_vc_sel_3_1 = _io_chosen_oh_0_output[0] & io_in_0_bits_vc_sel_3_1 | _io_chosen_oh_0_output[1] & io_in_1_bits_vc_sel_3_1 | _io_chosen_oh_0_output[2] & io_in_2_bits_vc_sel_3_1 | _io_chosen_oh_0_output[3] & io_in_3_bits_vc_sel_3_1 | _io_chosen_oh_0_output[4] & io_in_4_bits_vc_sel_3_1;	// @[Mux.scala:27:73, :29:36, SwitchAllocator.scala:42:21]
  assign io_out_0_bits_vc_sel_3_2 = _io_chosen_oh_0_output[0] & io_in_0_bits_vc_sel_3_2 | _io_chosen_oh_0_output[1] & io_in_1_bits_vc_sel_3_2 | _io_chosen_oh_0_output[2] & io_in_2_bits_vc_sel_3_2 | _io_chosen_oh_0_output[3] & io_in_3_bits_vc_sel_3_2 | _io_chosen_oh_0_output[4] & io_in_4_bits_vc_sel_3_2;	// @[Mux.scala:27:73, :29:36, SwitchAllocator.scala:42:21]
  assign io_out_0_bits_vc_sel_3_3 = _io_chosen_oh_0_output[0] & io_in_0_bits_vc_sel_3_3 | _io_chosen_oh_0_output[1] & io_in_1_bits_vc_sel_3_3 | _io_chosen_oh_0_output[2] & io_in_2_bits_vc_sel_3_3 | _io_chosen_oh_0_output[3] & io_in_3_bits_vc_sel_3_3 | _io_chosen_oh_0_output[4] & io_in_4_bits_vc_sel_3_3;	// @[Mux.scala:27:73, :29:36, SwitchAllocator.scala:42:21]
  assign io_out_0_bits_vc_sel_3_4 = _io_chosen_oh_0_output[0] & io_in_0_bits_vc_sel_3_4 | _io_chosen_oh_0_output[1] & io_in_1_bits_vc_sel_3_4 | _io_chosen_oh_0_output[2] & io_in_2_bits_vc_sel_3_4 | _io_chosen_oh_0_output[3] & io_in_3_bits_vc_sel_3_4 | _io_chosen_oh_0_output[4] & io_in_4_bits_vc_sel_3_4;	// @[Mux.scala:27:73, :29:36, SwitchAllocator.scala:42:21]
  assign io_out_0_bits_vc_sel_2_4 = _io_chosen_oh_0_output[0] & io_in_0_bits_vc_sel_2_4 | _io_chosen_oh_0_output[1] & io_in_1_bits_vc_sel_2_4 | _io_chosen_oh_0_output[2] & io_in_2_bits_vc_sel_2_4 | _io_chosen_oh_0_output[3] & io_in_3_bits_vc_sel_2_4 | _io_chosen_oh_0_output[4] & io_in_4_bits_vc_sel_2_4;	// @[Mux.scala:27:73, :29:36, SwitchAllocator.scala:42:21]
  assign io_out_0_bits_vc_sel_1_1 = _io_chosen_oh_0_output[0] & io_in_0_bits_vc_sel_1_1 | _io_chosen_oh_0_output[1] & io_in_1_bits_vc_sel_1_1 | _io_chosen_oh_0_output[2] & io_in_2_bits_vc_sel_1_1 | _io_chosen_oh_0_output[3] & io_in_3_bits_vc_sel_1_1 | _io_chosen_oh_0_output[4] & io_in_4_bits_vc_sel_1_1;	// @[Mux.scala:27:73, :29:36, SwitchAllocator.scala:42:21]
  assign io_out_0_bits_vc_sel_1_2 = _io_chosen_oh_0_output[0] & io_in_0_bits_vc_sel_1_2 | _io_chosen_oh_0_output[1] & io_in_1_bits_vc_sel_1_2 | _io_chosen_oh_0_output[2] & io_in_2_bits_vc_sel_1_2 | _io_chosen_oh_0_output[3] & io_in_3_bits_vc_sel_1_2 | _io_chosen_oh_0_output[4] & io_in_4_bits_vc_sel_1_2;	// @[Mux.scala:27:73, :29:36, SwitchAllocator.scala:42:21]
  assign io_out_0_bits_vc_sel_1_3 = _io_chosen_oh_0_output[0] & io_in_0_bits_vc_sel_1_3 | _io_chosen_oh_0_output[1] & io_in_1_bits_vc_sel_1_3 | _io_chosen_oh_0_output[2] & io_in_2_bits_vc_sel_1_3 | _io_chosen_oh_0_output[3] & io_in_3_bits_vc_sel_1_3 | _io_chosen_oh_0_output[4] & io_in_4_bits_vc_sel_1_3;	// @[Mux.scala:27:73, :29:36, SwitchAllocator.scala:42:21]
  assign io_out_0_bits_vc_sel_1_4 = _io_chosen_oh_0_output[0] & io_in_0_bits_vc_sel_1_4 | _io_chosen_oh_0_output[1] & io_in_1_bits_vc_sel_1_4 | _io_chosen_oh_0_output[2] & io_in_2_bits_vc_sel_1_4 | _io_chosen_oh_0_output[3] & io_in_3_bits_vc_sel_1_4 | _io_chosen_oh_0_output[4] & io_in_4_bits_vc_sel_1_4;	// @[Mux.scala:27:73, :29:36, SwitchAllocator.scala:42:21]
  assign io_out_0_bits_vc_sel_0_1 = _io_chosen_oh_0_output[0] & io_in_0_bits_vc_sel_0_1 | _io_chosen_oh_0_output[1] & io_in_1_bits_vc_sel_0_1 | _io_chosen_oh_0_output[2] & io_in_2_bits_vc_sel_0_1 | _io_chosen_oh_0_output[3] & io_in_3_bits_vc_sel_0_1 | _io_chosen_oh_0_output[4] & io_in_4_bits_vc_sel_0_1;	// @[Mux.scala:27:73, :29:36, SwitchAllocator.scala:42:21]
  assign io_out_0_bits_vc_sel_0_2 = _io_chosen_oh_0_output[0] & io_in_0_bits_vc_sel_0_2 | _io_chosen_oh_0_output[1] & io_in_1_bits_vc_sel_0_2 | _io_chosen_oh_0_output[2] & io_in_2_bits_vc_sel_0_2 | _io_chosen_oh_0_output[3] & io_in_3_bits_vc_sel_0_2 | _io_chosen_oh_0_output[4] & io_in_4_bits_vc_sel_0_2;	// @[Mux.scala:27:73, :29:36, SwitchAllocator.scala:42:21]
  assign io_out_0_bits_vc_sel_0_3 = _io_chosen_oh_0_output[0] & io_in_0_bits_vc_sel_0_3 | _io_chosen_oh_0_output[1] & io_in_1_bits_vc_sel_0_3 | _io_chosen_oh_0_output[2] & io_in_2_bits_vc_sel_0_3 | _io_chosen_oh_0_output[3] & io_in_3_bits_vc_sel_0_3 | _io_chosen_oh_0_output[4] & io_in_4_bits_vc_sel_0_3;	// @[Mux.scala:27:73, :29:36, SwitchAllocator.scala:42:21]
  assign io_out_0_bits_vc_sel_0_4 = _io_chosen_oh_0_output[0] & io_in_0_bits_vc_sel_0_4 | _io_chosen_oh_0_output[1] & io_in_1_bits_vc_sel_0_4 | _io_chosen_oh_0_output[2] & io_in_2_bits_vc_sel_0_4 | _io_chosen_oh_0_output[3] & io_in_3_bits_vc_sel_0_4 | _io_chosen_oh_0_output[4] & io_in_4_bits_vc_sel_0_4;	// @[Mux.scala:27:73, :29:36, SwitchAllocator.scala:42:21]
  assign io_out_0_bits_tail = _io_chosen_oh_0_output[0] & io_in_0_bits_tail | _io_chosen_oh_0_output[1] & io_in_1_bits_tail | _io_chosen_oh_0_output[2] & io_in_2_bits_tail | _io_chosen_oh_0_output[3] & io_in_3_bits_tail | _io_chosen_oh_0_output[4] & io_in_4_bits_tail;	// @[Mux.scala:27:73, :29:36, SwitchAllocator.scala:42:21]
  assign io_chosen_oh_0 = _io_chosen_oh_0_output;	// @[SwitchAllocator.scala:42:21]
endmodule

