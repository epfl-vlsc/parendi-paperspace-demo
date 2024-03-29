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

module FPUDecoder(
  input  [31:0] io_inst,
  output        io_sigs_wen,
                io_sigs_ren1,
                io_sigs_ren2,
                io_sigs_ren3,
                io_sigs_swap12,
                io_sigs_swap23,
  output [1:0]  io_sigs_typeTagIn,
                io_sigs_typeTagOut,
  output        io_sigs_fromint,
                io_sigs_toint,
                io_sigs_fastpipe,
                io_sigs_fma,
                io_sigs_div,
                io_sigs_sqrt,
                io_sigs_wflags
);

  wire [29:0] _GEN = ~(io_inst[31:2]);	// @[pla.scala:78:21]
  wire [4:0]  _decoder_decoded_T = {io_inst[0], io_inst[1], _GEN[2], _GEN[3], io_inst[6]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [10:0] _decoder_decoded_T_2 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[24], _GEN[27], _GEN[28], _GEN[29]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [11:0] _decoder_decoded_T_6 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[24], _GEN[26], _GEN[27], _GEN[28], _GEN[29]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [8:0]  _decoder_decoded_T_12 = {io_inst[0], io_inst[1], io_inst[2], _GEN[1], _GEN[2], io_inst[5], _GEN[4], io_inst[13], _GEN[12]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [6:0]  _decoder_decoded_T_16 = {io_inst[0], io_inst[1], _GEN[2], _GEN[3], io_inst[6], io_inst[25], _GEN[24]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [11:0] _decoder_decoded_T_18 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], io_inst[25], _GEN[24], _GEN[27], _GEN[28], _GEN[29]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [13:0] _decoder_decoded_T_22 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[10], _GEN[12], _GEN[24], _GEN[25], _GEN[26], io_inst[29], _GEN[28]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [13:0] _decoder_decoded_T_24 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[11], _GEN[12], _GEN[24], _GEN[25], _GEN[26], io_inst[29], _GEN[28]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [13:0] _decoder_decoded_T_26 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[11], _GEN[12], _GEN[24], _GEN[26], io_inst[29], _GEN[28], _GEN[29]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [14:0] _decoder_decoded_T_28 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[10], _GEN[12], _GEN[24], _GEN[25], _GEN[26], io_inst[29], _GEN[28], _GEN[29]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [14:0] _decoder_decoded_T_30 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[10], _GEN[12], io_inst[25], _GEN[24], _GEN[25], _GEN[26], io_inst[29], _GEN[28]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [14:0] _decoder_decoded_T_32 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[11], _GEN[12], io_inst[25], _GEN[24], _GEN[25], _GEN[26], io_inst[29], _GEN[28]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [14:0] _decoder_decoded_T_34 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[11], _GEN[12], io_inst[25], _GEN[24], _GEN[26], io_inst[29], _GEN[28], _GEN[29]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [17:0] _decoder_decoded_T_38 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], io_inst[20], _GEN[19], _GEN[20], _GEN[21], _GEN[22], _GEN[23], _GEN[24], _GEN[25], _GEN[26], _GEN[27], io_inst[30]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [18:0] _decoder_decoded_T_40 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], io_inst[20], _GEN[19], _GEN[20], _GEN[21], _GEN[22], _GEN[23], _GEN[24], _GEN[25], _GEN[26], _GEN[27], io_inst[30], _GEN[29]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [17:0] _decoder_decoded_T_42 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[18], _GEN[19], _GEN[20], _GEN[21], _GEN[22], io_inst[25], _GEN[24], _GEN[25], _GEN[26], _GEN[27], io_inst[30]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [18:0] _decoder_decoded_T_44 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[18], _GEN[19], _GEN[20], _GEN[21], _GEN[22], io_inst[25], _GEN[24], _GEN[25], _GEN[26], _GEN[27], io_inst[30], _GEN[29]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [17:0] _decoder_decoded_T_46 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[18], _GEN[19], _GEN[20], _GEN[21], _GEN[22], _GEN[24], io_inst[27], io_inst[28], _GEN[27], io_inst[30], _GEN[29]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [18:0] _decoder_decoded_T_48 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[18], _GEN[19], _GEN[20], _GEN[21], _GEN[22], io_inst[25], _GEN[24], io_inst[27], io_inst[28], _GEN[27], io_inst[30], _GEN[29]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [14:0] _decoder_decoded_T_50 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[10], _GEN[12], _GEN[24], _GEN[25], _GEN[26], io_inst[29], _GEN[28], io_inst[31]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [14:0] _decoder_decoded_T_52 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[11], _GEN[12], _GEN[24], _GEN[25], _GEN[26], io_inst[29], _GEN[28], io_inst[31]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [15:0] _decoder_decoded_T_56 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[20], _GEN[21], _GEN[22], _GEN[24], _GEN[25], _GEN[26], _GEN[27], io_inst[30], io_inst[31]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [15:0] _decoder_decoded_T_60 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[20], _GEN[21], _GEN[22], _GEN[24], _GEN[25], io_inst[28], _GEN[27], io_inst[30], io_inst[31]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [19:0] _decoder_decoded_T_64 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[11], _GEN[12], _GEN[18], _GEN[19], _GEN[20], _GEN[21], _GEN[22], _GEN[24], _GEN[25], _GEN[26], io_inst[29], io_inst[30], io_inst[31]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [20:0] _decoder_decoded_T_70 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[11], _GEN[12], _GEN[18], _GEN[19], _GEN[20], _GEN[21], _GEN[22], io_inst[25], _GEN[24], _GEN[25], _GEN[26], io_inst[29], io_inst[30], io_inst[31]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [20:0] _decoder_decoded_T_72 = {io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[10], _GEN[11], _GEN[12], _GEN[18], _GEN[19], _GEN[20], _GEN[21], _GEN[22], _GEN[24], _GEN[25], io_inst[28], io_inst[29], io_inst[30], io_inst[31]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  assign io_sigs_wen = |{&_decoder_decoded_T, &_decoder_decoded_T_2, &{io_inst[0], io_inst[1], io_inst[2], _GEN[1], _GEN[2], _GEN[3], _GEN[4], io_inst[13], _GEN[12]}, &_decoder_decoded_T_26, &_decoder_decoded_T_28, &_decoder_decoded_T_40, &_decoder_decoded_T_44, &_decoder_decoded_T_46, &_decoder_decoded_T_60, &_decoder_decoded_T_72};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29, :98:74, :114:39]
  assign io_sigs_ren1 = |{&_decoder_decoded_T, &_decoder_decoded_T_2, &_decoder_decoded_T_22, &_decoder_decoded_T_24, &_decoder_decoded_T_26, &_decoder_decoded_T_38, &_decoder_decoded_T_42, &_decoder_decoded_T_46, &_decoder_decoded_T_56, &_decoder_decoded_T_64};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_sigs_ren2 = |{&_decoder_decoded_T, &_decoder_decoded_T_2, &_decoder_decoded_T_12, &_decoder_decoded_T_22, &_decoder_decoded_T_24, &_decoder_decoded_T_26};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_sigs_ren3 = &_decoder_decoded_T;	// @[Cat.scala:33:92, pla.scala:98:74]
  assign io_sigs_swap12 = &_decoder_decoded_T_12;	// @[Cat.scala:33:92, pla.scala:98:74]
  assign io_sigs_swap23 = &_decoder_decoded_T_6;	// @[Cat.scala:33:92, pla.scala:98:74]
  assign io_sigs_typeTagIn = {1'h0, |{&_decoder_decoded_T_12, &_decoder_decoded_T_16, &_decoder_decoded_T_18, &_decoder_decoded_T_30, &_decoder_decoded_T_32, &_decoder_decoded_T_34, &_decoder_decoded_T_40, &_decoder_decoded_T_48, &{io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[20], _GEN[21], _GEN[22], io_inst[25], _GEN[24], _GEN[25], _GEN[27], io_inst[30], io_inst[31]}, &{io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[10], _GEN[11], _GEN[12], _GEN[18], _GEN[19], _GEN[20], _GEN[21], _GEN[22], _GEN[24], _GEN[25], _GEN[26], io_inst[29], io_inst[30], io_inst[31]}, &{io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[10], _GEN[11], _GEN[12], _GEN[18], _GEN[19], _GEN[20], _GEN[21], _GEN[22], io_inst[25], _GEN[24], _GEN[25], io_inst[29], io_inst[30], io_inst[31]}, &_decoder_decoded_T_70}};	// @[Cat.scala:33:92, Decode.scala:50:77, pla.scala:78:21, :90:45, :91:29, :98:74, :114:39]
  assign io_sigs_typeTagOut = {1'h0, |{&{io_inst[0], io_inst[1], io_inst[2], _GEN[1], _GEN[2], io_inst[5], _GEN[4], io_inst[12], io_inst[13], _GEN[12]}, &_decoder_decoded_T_16, &_decoder_decoded_T_18, &_decoder_decoded_T_30, &_decoder_decoded_T_32, &_decoder_decoded_T_34, &_decoder_decoded_T_44, &_decoder_decoded_T_48, &{io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[20], _GEN[21], _GEN[22], io_inst[25], _GEN[24], _GEN[25], io_inst[28], _GEN[27], io_inst[30], io_inst[31]}, &_decoder_decoded_T_70, &_decoder_decoded_T_72}};	// @[Cat.scala:33:92, Decode.scala:50:77, pla.scala:78:21, :90:45, :91:29, :98:74, :114:39]
  assign io_sigs_fromint = |{&_decoder_decoded_T_60, &_decoder_decoded_T_72};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_sigs_toint = |{&_decoder_decoded_T_12, &_decoder_decoded_T_50, &_decoder_decoded_T_52, &_decoder_decoded_T_56, &_decoder_decoded_T_64};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_sigs_fastpipe = |{&_decoder_decoded_T_26, &_decoder_decoded_T_28, &_decoder_decoded_T_40, &_decoder_decoded_T_44};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_sigs_fma = |{&_decoder_decoded_T, &{io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[24], _GEN[25], _GEN[27], _GEN[28], _GEN[29]}, &_decoder_decoded_T_6};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29, :98:74, :114:39]
  assign io_sigs_div = &{io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[24], io_inst[27], io_inst[28], _GEN[27], _GEN[28], _GEN[29]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29, :98:74]
  assign io_sigs_sqrt = &_decoder_decoded_T_46;	// @[Cat.scala:33:92, pla.scala:98:74]
  assign io_sigs_wflags = |{&_decoder_decoded_T, &_decoder_decoded_T_2, &{io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[11], _GEN[12], _GEN[24], io_inst[27], _GEN[26], io_inst[29], _GEN[28], _GEN[29]}, &_decoder_decoded_T_38, &_decoder_decoded_T_42, &_decoder_decoded_T_46, &_decoder_decoded_T_50, &_decoder_decoded_T_52, &{io_inst[0], io_inst[1], _GEN[0], _GEN[1], io_inst[4], _GEN[3], io_inst[6], _GEN[20], _GEN[21], _GEN[22], _GEN[24], _GEN[25], _GEN[27], io_inst[30], io_inst[31]}};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29, :98:74, :114:39]
endmodule

