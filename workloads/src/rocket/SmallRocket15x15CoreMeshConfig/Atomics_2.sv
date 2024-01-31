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

module Atomics_2(
  input  [2:0]  io_a_opcode,
                io_a_param,
  input  [7:0]  io_a_mask,
  input  [63:0] io_a_data,
                io_data_in,
  output [63:0] io_data_out
);

  wire [3:0][3:0] _GEN = '{4'hC, 4'h8, 4'hE, 4'h6};	// @[Atomics.scala:43:8]
  wire [7:0]      signBit = io_a_mask & {1'h1, ~(io_a_mask[7:1])};	// @[Atomics.scala:24:{27,38}, Cat.scala:33:92]
  wire [63:0]     _GEN_0 = ({{8{io_a_mask[7]}}, {8{io_a_mask[6]}}, {8{io_a_mask[5]}}, {8{io_a_mask[4]}}, {8{io_a_mask[3]}}, {8{io_a_mask[2]}}, {8{io_a_mask[1]}}, {8{io_a_mask[0]}}} & io_a_data) + ({64{~(io_a_param[2])}} ^ io_data_in);	// @[Atomics.scala:20:28, :25:18, :26:{44,57}, Bitwise.scala:28:17, :77:12, Cat.scala:33:92]
  wire [7:0]      _sign_a_T_65 = {io_a_data[63], io_a_data[55], io_a_data[47], io_a_data[39], io_a_data[31], io_a_data[23], io_a_data[15], io_a_data[7]} & signBit;	// @[Atomics.scala:24:27, :27:{36,83}, Cat.scala:33:92]
  wire [3:0]      _GEN_1 = _GEN[io_a_param[1:0]];	// @[Atomics.scala:41:15, :43:8]
  wire [3:0]      _logical_T_129 = _GEN_1 >> {2'h0, io_a_data[0], io_data_in[0]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_132 = _GEN_1 >> {2'h0, io_a_data[1], io_data_in[1]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_135 = _GEN_1 >> {2'h0, io_a_data[2], io_data_in[2]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_138 = _GEN_1 >> {2'h0, io_a_data[3], io_data_in[3]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_141 = _GEN_1 >> {2'h0, io_a_data[4], io_data_in[4]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_144 = _GEN_1 >> {2'h0, io_a_data[5], io_data_in[5]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_147 = _GEN_1 >> {2'h0, io_a_data[6], io_data_in[6]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_150 = _GEN_1 >> {2'h0, io_a_data[7], io_data_in[7]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_153 = _GEN_1 >> {2'h0, io_a_data[8], io_data_in[8]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_156 = _GEN_1 >> {2'h0, io_a_data[9], io_data_in[9]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_159 = _GEN_1 >> {2'h0, io_a_data[10], io_data_in[10]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_162 = _GEN_1 >> {2'h0, io_a_data[11], io_data_in[11]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_165 = _GEN_1 >> {2'h0, io_a_data[12], io_data_in[12]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_168 = _GEN_1 >> {2'h0, io_a_data[13], io_data_in[13]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_171 = _GEN_1 >> {2'h0, io_a_data[14], io_data_in[14]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_174 = _GEN_1 >> {2'h0, io_a_data[15], io_data_in[15]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_177 = _GEN_1 >> {2'h0, io_a_data[16], io_data_in[16]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_180 = _GEN_1 >> {2'h0, io_a_data[17], io_data_in[17]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_183 = _GEN_1 >> {2'h0, io_a_data[18], io_data_in[18]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_186 = _GEN_1 >> {2'h0, io_a_data[19], io_data_in[19]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_189 = _GEN_1 >> {2'h0, io_a_data[20], io_data_in[20]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_192 = _GEN_1 >> {2'h0, io_a_data[21], io_data_in[21]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_195 = _GEN_1 >> {2'h0, io_a_data[22], io_data_in[22]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_198 = _GEN_1 >> {2'h0, io_a_data[23], io_data_in[23]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_201 = _GEN_1 >> {2'h0, io_a_data[24], io_data_in[24]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_204 = _GEN_1 >> {2'h0, io_a_data[25], io_data_in[25]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_207 = _GEN_1 >> {2'h0, io_a_data[26], io_data_in[26]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_210 = _GEN_1 >> {2'h0, io_a_data[27], io_data_in[27]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_213 = _GEN_1 >> {2'h0, io_a_data[28], io_data_in[28]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_216 = _GEN_1 >> {2'h0, io_a_data[29], io_data_in[29]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_219 = _GEN_1 >> {2'h0, io_a_data[30], io_data_in[30]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_222 = _GEN_1 >> {2'h0, io_a_data[31], io_data_in[31]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_225 = _GEN_1 >> {2'h0, io_a_data[32], io_data_in[32]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_228 = _GEN_1 >> {2'h0, io_a_data[33], io_data_in[33]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_231 = _GEN_1 >> {2'h0, io_a_data[34], io_data_in[34]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_234 = _GEN_1 >> {2'h0, io_a_data[35], io_data_in[35]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_237 = _GEN_1 >> {2'h0, io_a_data[36], io_data_in[36]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_240 = _GEN_1 >> {2'h0, io_a_data[37], io_data_in[37]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_243 = _GEN_1 >> {2'h0, io_a_data[38], io_data_in[38]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_246 = _GEN_1 >> {2'h0, io_a_data[39], io_data_in[39]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_249 = _GEN_1 >> {2'h0, io_a_data[40], io_data_in[40]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_252 = _GEN_1 >> {2'h0, io_a_data[41], io_data_in[41]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_255 = _GEN_1 >> {2'h0, io_a_data[42], io_data_in[42]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_258 = _GEN_1 >> {2'h0, io_a_data[43], io_data_in[43]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_261 = _GEN_1 >> {2'h0, io_a_data[44], io_data_in[44]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_264 = _GEN_1 >> {2'h0, io_a_data[45], io_data_in[45]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_267 = _GEN_1 >> {2'h0, io_a_data[46], io_data_in[46]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_270 = _GEN_1 >> {2'h0, io_a_data[47], io_data_in[47]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_273 = _GEN_1 >> {2'h0, io_a_data[48], io_data_in[48]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_276 = _GEN_1 >> {2'h0, io_a_data[49], io_data_in[49]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_279 = _GEN_1 >> {2'h0, io_a_data[50], io_data_in[50]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_282 = _GEN_1 >> {2'h0, io_a_data[51], io_data_in[51]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_285 = _GEN_1 >> {2'h0, io_a_data[52], io_data_in[52]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_288 = _GEN_1 >> {2'h0, io_a_data[53], io_data_in[53]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_291 = _GEN_1 >> {2'h0, io_a_data[54], io_data_in[54]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_294 = _GEN_1 >> {2'h0, io_a_data[55], io_data_in[55]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_297 = _GEN_1 >> {2'h0, io_a_data[56], io_data_in[56]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_300 = _GEN_1 >> {2'h0, io_a_data[57], io_data_in[57]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_303 = _GEN_1 >> {2'h0, io_a_data[58], io_data_in[58]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_306 = _GEN_1 >> {2'h0, io_a_data[59], io_data_in[59]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_309 = _GEN_1 >> {2'h0, io_a_data[60], io_data_in[60]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_312 = _GEN_1 >> {2'h0, io_a_data[61], io_data_in[61]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_315 = _GEN_1 >> {2'h0, io_a_data[62], io_data_in[62]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [3:0]      _logical_T_318 = _GEN_1 >> {2'h0, io_a_data[63], io_data_in[63]};	// @[Atomics.scala:27:36, :43:8, :47:42]
  wire [7:0][1:0] _GEN_2 = {{2'h0}, {2'h0}, {2'h0}, {2'h0}, {2'h3}, {io_a_param[2] ? 2'h2 : {1'h0, io_a_param[0] == ((|_sign_a_T_65) == (|({io_data_in[63], io_data_in[55], io_data_in[47], io_data_in[39], io_data_in[31], io_data_in[23], io_data_in[15], io_data_in[7]} & signBit)) ? ({_GEN_0[63], _GEN_0[55], _GEN_0[47], _GEN_0[39], _GEN_0[31], _GEN_0[23], _GEN_0[15], _GEN_0[7]} & signBit) == 8'h0 : io_a_param[1] == (|_sign_a_T_65))}}, {2'h1}, {2'h1}};	// @[Atomics.scala:20:28, :21:28, :22:28, :24:27, :26:57, :27:{36,83,94}, :31:32, :32:{21,29}, :33:25, :47:{19,42}, :50:8, Bitwise.scala:77:12, Cat.scala:33:92]
  wire [1:0]      _GEN_3 = _GEN_2[io_a_opcode];	// @[Atomics.scala:47:19]
  wire [3:0][7:0] _GEN_4 = {{{_logical_T_174[0], _logical_T_171[0], _logical_T_168[0], _logical_T_165[0], _logical_T_162[0], _logical_T_159[0], _logical_T_156[0], _logical_T_153[0]}}, {_GEN_0[15:8]}, {io_a_data[15:8]}, {io_data_in[15:8]}};	// @[Atomics.scala:26:57, :43:8, :61:59, Cat.scala:33:92]
  wire [3:0][7:0] _GEN_5 = {{{_logical_T_150[0], _logical_T_147[0], _logical_T_144[0], _logical_T_141[0], _logical_T_138[0], _logical_T_135[0], _logical_T_132[0], _logical_T_129[0]}}, {_GEN_0[7:0]}, {io_a_data[7:0]}, {io_data_in[7:0]}};	// @[Atomics.scala:26:57, :43:8, :61:59, Cat.scala:33:92]
  wire [3:0][7:0] _GEN_6 = {{{_logical_T_222[0], _logical_T_219[0], _logical_T_216[0], _logical_T_213[0], _logical_T_210[0], _logical_T_207[0], _logical_T_204[0], _logical_T_201[0]}}, {_GEN_0[31:24]}, {io_a_data[31:24]}, {io_data_in[31:24]}};	// @[Atomics.scala:26:57, :43:8, :61:59, Cat.scala:33:92]
  wire [3:0][7:0] _GEN_7 = {{{_logical_T_198[0], _logical_T_195[0], _logical_T_192[0], _logical_T_189[0], _logical_T_186[0], _logical_T_183[0], _logical_T_180[0], _logical_T_177[0]}}, {_GEN_0[23:16]}, {io_a_data[23:16]}, {io_data_in[23:16]}};	// @[Atomics.scala:26:57, :43:8, :61:59, Cat.scala:33:92]
  wire [3:0][7:0] _GEN_8 = {{{_logical_T_270[0], _logical_T_267[0], _logical_T_264[0], _logical_T_261[0], _logical_T_258[0], _logical_T_255[0], _logical_T_252[0], _logical_T_249[0]}}, {_GEN_0[47:40]}, {io_a_data[47:40]}, {io_data_in[47:40]}};	// @[Atomics.scala:26:57, :43:8, :61:59, Cat.scala:33:92]
  wire [3:0][7:0] _GEN_9 = {{{_logical_T_246[0], _logical_T_243[0], _logical_T_240[0], _logical_T_237[0], _logical_T_234[0], _logical_T_231[0], _logical_T_228[0], _logical_T_225[0]}}, {_GEN_0[39:32]}, {io_a_data[39:32]}, {io_data_in[39:32]}};	// @[Atomics.scala:26:57, :43:8, :61:59, Cat.scala:33:92]
  wire [3:0][7:0] _GEN_10 = {{{_logical_T_318[0], _logical_T_315[0], _logical_T_312[0], _logical_T_309[0], _logical_T_306[0], _logical_T_303[0], _logical_T_300[0], _logical_T_297[0]}}, {_GEN_0[63:56]}, {io_a_data[63:56]}, {io_data_in[63:56]}};	// @[Atomics.scala:26:57, :43:8, :61:59, Cat.scala:33:92]
  wire [3:0][7:0] _GEN_11 = {{{_logical_T_294[0], _logical_T_291[0], _logical_T_288[0], _logical_T_285[0], _logical_T_282[0], _logical_T_279[0], _logical_T_276[0], _logical_T_273[0]}}, {_GEN_0[55:48]}, {io_a_data[55:48]}, {io_data_in[55:48]}};	// @[Atomics.scala:26:57, :43:8, :61:59, Cat.scala:33:92]
  assign io_data_out = {_GEN_10[io_a_mask[7] ? _GEN_3 : 2'h0], _GEN_11[io_a_mask[6] ? _GEN_3 : 2'h0], _GEN_8[io_a_mask[5] ? _GEN_3 : 2'h0], _GEN_9[io_a_mask[4] ? _GEN_3 : 2'h0], _GEN_6[io_a_mask[3] ? _GEN_3 : 2'h0], _GEN_7[io_a_mask[2] ? _GEN_3 : 2'h0], _GEN_4[io_a_mask[1] ? _GEN_3 : 2'h0], _GEN_5[io_a_mask[0] ? _GEN_3 : 2'h0]};	// @[Atomics.scala:47:{19,42}, :59:47, Bitwise.scala:28:17, Cat.scala:33:92]
endmodule

