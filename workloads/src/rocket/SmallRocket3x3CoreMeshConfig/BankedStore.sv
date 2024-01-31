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

module BankedStore(
  input         clock,
                io_sinkC_adr_valid,
                io_sinkC_adr_bits_noop,
  input  [2:0]  io_sinkC_adr_bits_way,
  input  [6:0]  io_sinkC_adr_bits_set,
  input  [2:0]  io_sinkC_adr_bits_beat,
  input         io_sinkC_adr_bits_mask,
  input  [63:0] io_sinkC_dat_data,
  input         io_sinkD_adr_valid,
                io_sinkD_adr_bits_noop,
  input  [2:0]  io_sinkD_adr_bits_way,
  input  [6:0]  io_sinkD_adr_bits_set,
  input  [2:0]  io_sinkD_adr_bits_beat,
  input  [63:0] io_sinkD_dat_data,
  input         io_sourceC_adr_valid,
  input  [2:0]  io_sourceC_adr_bits_way,
  input  [6:0]  io_sourceC_adr_bits_set,
  input  [2:0]  io_sourceC_adr_bits_beat,
  input         io_sourceD_radr_valid,
  input  [2:0]  io_sourceD_radr_bits_way,
  input  [6:0]  io_sourceD_radr_bits_set,
  input  [2:0]  io_sourceD_radr_bits_beat,
  input         io_sourceD_radr_bits_mask,
                io_sourceD_wadr_valid,
  input  [2:0]  io_sourceD_wadr_bits_way,
  input  [6:0]  io_sourceD_wadr_bits_set,
  input  [2:0]  io_sourceD_wadr_bits_beat,
  input         io_sourceD_wadr_bits_mask,
  input  [63:0] io_sourceD_wdat_data,
  output        io_sinkC_adr_ready,
                io_sinkD_adr_ready,
                io_sourceC_adr_ready,
  output [63:0] io_sourceC_dat_data,
  output        io_sourceD_radr_ready,
  output [63:0] io_sourceD_rdat_data,
  output        io_sourceD_wadr_ready
);

  wire        readEnable;	// BankedStore.scala:172:32
  wire        writeEnable;	// BankedStore.scala:171:15
  wire        readEnable_0;	// BankedStore.scala:172:32
  wire        writeEnable_0;	// BankedStore.scala:171:15
  wire        readEnable_1;	// BankedStore.scala:172:32
  wire        writeEnable_1;	// BankedStore.scala:171:15
  wire        readEnable_2;	// BankedStore.scala:172:32
  wire        writeEnable_2;	// BankedStore.scala:171:15
  wire [3:0]  reqs_4_bankSum;	// BankedStore.scala:161:17
  wire [3:0]  reqs_3_bankSum;	// BankedStore.scala:161:17
  wire [3:0]  reqs_2_bankSum;	// BankedStore.scala:161:17
  wire [63:0] _cc_banks_3_RW0_rdata;	// DescribedSRAM.scala:17:26
  wire [63:0] _cc_banks_2_RW0_rdata;	// DescribedSRAM.scala:17:26
  wire [63:0] _cc_banks_1_RW0_rdata;	// DescribedSRAM.scala:17:26
  wire [63:0] _cc_banks_0_RW0_rdata;	// DescribedSRAM.scala:17:26
  wire [3:0]  _GEN = {2'h0, io_sinkC_adr_bits_beat[1:0]};	// BankedStore.scala:130:28, OneHot.scala:64:12
  wire [3:0]  _sinkC_req_io_sinkC_adr_ready_T_1 = 4'hF >> _GEN;	// BankedStore.scala:132:21, Bitwise.scala:77:12, OneHot.scala:64:12
  wire [10:0] reqs_0_index =
    {io_sinkC_adr_bits_way, io_sinkC_adr_bits_set, io_sinkC_adr_bits_beat[2]};	// BankedStore.scala:135:23
  wire [3:0]  _sinkC_req_out_bankSel_T_7 = 4'h1 << _GEN & {4{io_sinkC_adr_bits_mask}};	// BankedStore.scala:136:65, Bitwise.scala:77:12, OneHot.scala:64:12
  wire [3:0]  reqs_1_bankSum = io_sinkC_adr_valid ? _sinkC_req_out_bankSel_T_7 : 4'h0;	// BankedStore.scala:136:{24,65}, Bitwise.scala:77:12
  wire [3:0]  reqs_0_bankEn =
    io_sinkC_adr_bits_noop | ~io_sinkC_adr_valid ? 4'h0 : _sinkC_req_out_bankSel_T_7;	// BankedStore.scala:136:65, :137:24, Bitwise.scala:77:12
  wire [3:0]  _GEN_0 = {2'h0, io_sinkD_adr_bits_beat[1:0]};	// BankedStore.scala:130:28, OneHot.scala:64:12
  wire [3:0]  sinkD_req_ready =
    {~(reqs_2_bankSum[3]),
     ~(reqs_2_bankSum[2]),
     ~(reqs_2_bankSum[1]),
     ~(reqs_2_bankSum[0])};	// BankedStore.scala:131:{58,71}, :161:17, Cat.scala:33:92
  wire [3:0]  _sinkD_req_io_sinkD_adr_ready_T_1 = sinkD_req_ready >> _GEN_0;	// BankedStore.scala:132:21, Cat.scala:33:92, OneHot.scala:64:12
  wire [10:0] reqs_2_index =
    {io_sinkD_adr_bits_way, io_sinkD_adr_bits_set, io_sinkD_adr_bits_beat[2]};	// BankedStore.scala:135:23
  wire [3:0]  reqs_2_bankSel = io_sinkD_adr_valid ? 4'h1 << _GEN_0 : 4'h0;	// BankedStore.scala:136:24, Bitwise.scala:77:12, OneHot.scala:64:12
  wire [3:0]  reqs_2_bankEn =
    io_sinkD_adr_bits_noop ? 4'h0 : reqs_2_bankSel & sinkD_req_ready;	// BankedStore.scala:136:24, :137:{24,55}, Bitwise.scala:77:12, Cat.scala:33:92
  wire [3:0]  _GEN_1 = {2'h0, io_sourceC_adr_bits_beat[1:0]};	// BankedStore.scala:130:28, OneHot.scala:64:12
  wire [3:0]  sourceC_req_ready =
    {~(reqs_1_bankSum[3]),
     ~(reqs_1_bankSum[2]),
     ~(reqs_1_bankSum[1]),
     ~(reqs_1_bankSum[0])};	// BankedStore.scala:131:{58,71}, :136:24, Cat.scala:33:92
  wire [3:0]  _sourceC_req_io_sourceC_adr_ready_T_1 = sourceC_req_ready >> _GEN_1;	// BankedStore.scala:132:21, Cat.scala:33:92, OneHot.scala:64:12
  wire [10:0] reqs_1_index =
    {io_sourceC_adr_bits_way, io_sourceC_adr_bits_set, io_sourceC_adr_bits_beat[2]};	// BankedStore.scala:135:23
  wire [3:0]  reqs_1_bankSel = io_sourceC_adr_valid ? 4'h1 << _GEN_1 : 4'h0;	// BankedStore.scala:136:24, Bitwise.scala:77:12, OneHot.scala:64:12
  wire [3:0]  reqs_1_bankEn = reqs_1_bankSel & sourceC_req_ready;	// BankedStore.scala:136:24, :137:55, Cat.scala:33:92
  wire [3:0]  _GEN_2 = {2'h0, io_sourceD_radr_bits_beat[1:0]};	// BankedStore.scala:130:28, OneHot.scala:64:12
  wire [3:0]  sourceD_rreq_ready =
    {~(reqs_4_bankSum[3] & io_sourceD_radr_bits_mask),
     ~(reqs_4_bankSum[2] & io_sourceD_radr_bits_mask),
     ~(reqs_4_bankSum[1] & io_sourceD_radr_bits_mask),
     ~(reqs_4_bankSum[0] & io_sourceD_radr_bits_mask)};	// BankedStore.scala:131:{58,71,96}, :161:17, Cat.scala:33:92
  wire [3:0]  _sourceD_rreq_io_sourceD_radr_ready_T_1 = sourceD_rreq_ready >> _GEN_2;	// BankedStore.scala:132:21, Cat.scala:33:92, OneHot.scala:64:12
  wire [10:0] reqs_4_index =
    {io_sourceD_radr_bits_way, io_sourceD_radr_bits_set, io_sourceD_radr_bits_beat[2]};	// BankedStore.scala:135:23
  wire [3:0]  reqs_4_bankEn =
    (io_sourceD_radr_valid ? 4'h1 << _GEN_2 & {4{io_sourceD_radr_bits_mask}} : 4'h0)
    & sourceD_rreq_ready;	// BankedStore.scala:136:{24,65}, :137:55, Bitwise.scala:77:12, Cat.scala:33:92, OneHot.scala:64:12
  wire [3:0]  _GEN_3 = {2'h0, io_sourceD_wadr_bits_beat[1:0]};	// BankedStore.scala:130:28, OneHot.scala:64:12
  wire [3:0]  sourceD_wreq_ready =
    {~(reqs_3_bankSum[3] & io_sourceD_wadr_bits_mask),
     ~(reqs_3_bankSum[2] & io_sourceD_wadr_bits_mask),
     ~(reqs_3_bankSum[1] & io_sourceD_wadr_bits_mask),
     ~(reqs_3_bankSum[0] & io_sourceD_wadr_bits_mask)};	// BankedStore.scala:131:{58,71,96}, :161:17, Cat.scala:33:92
  wire [3:0]  _sourceD_wreq_io_sourceD_wadr_ready_T_1 = sourceD_wreq_ready >> _GEN_3;	// BankedStore.scala:132:21, Cat.scala:33:92, OneHot.scala:64:12
  wire [10:0] reqs_3_index =
    {io_sourceD_wadr_bits_way, io_sourceD_wadr_bits_set, io_sourceD_wadr_bits_beat[2]};	// BankedStore.scala:135:23
  wire [3:0]  reqs_3_bankSel =
    io_sourceD_wadr_valid ? 4'h1 << _GEN_3 & {4{io_sourceD_wadr_bits_mask}} : 4'h0;	// BankedStore.scala:136:{24,65}, Bitwise.scala:77:12, OneHot.scala:64:12
  wire [3:0]  reqs_3_bankEn = reqs_3_bankSel & sourceD_wreq_ready;	// BankedStore.scala:136:24, :137:55, Cat.scala:33:92
  assign reqs_2_bankSum = reqs_1_bankSel | reqs_1_bankSum;	// BankedStore.scala:136:24, :161:17
  assign reqs_3_bankSum = reqs_2_bankSel | reqs_2_bankSum;	// BankedStore.scala:136:24, :161:17
  assign reqs_4_bankSum = reqs_3_bankSel | reqs_3_bankSum;	// BankedStore.scala:136:24, :161:17
  wire        regout_en =
    reqs_0_bankEn[0] | reqs_1_bankEn[0] | reqs_2_bankEn[0] | reqs_3_bankEn[0]
    | reqs_4_bankEn[0];	// BankedStore.scala:137:{24,55}, :165:{32,45}
  wire        regout_wen =
    reqs_1_bankSum[0] | ~(reqs_1_bankSel[0]) & (reqs_2_bankSel[0] | reqs_3_bankSel[0]);	// BankedStore.scala:136:24, :166:33, Mux.scala:47:70
  assign writeEnable_2 = regout_wen & regout_en;	// BankedStore.scala:165:45, :171:15, Mux.scala:47:70
  assign readEnable_2 = ~regout_wen & regout_en;	// BankedStore.scala:165:45, :172:{27,32}, Mux.scala:47:70
  reg         regout_REG;	// BankedStore.scala:172:47
  reg  [63:0] regout_r;	// Reg.scala:19:16
  wire        regout_en_1 =
    reqs_0_bankEn[1] | reqs_1_bankEn[1] | reqs_2_bankEn[1] | reqs_3_bankEn[1]
    | reqs_4_bankEn[1];	// BankedStore.scala:137:{24,55}, :165:{32,45}
  wire        regout_wen_1 =
    reqs_1_bankSum[1] | ~(reqs_1_bankSel[1]) & (reqs_2_bankSel[1] | reqs_3_bankSel[1]);	// BankedStore.scala:136:24, :166:33, Mux.scala:47:70
  assign writeEnable_1 = regout_wen_1 & regout_en_1;	// BankedStore.scala:165:45, :171:15, Mux.scala:47:70
  assign readEnable_1 = ~regout_wen_1 & regout_en_1;	// BankedStore.scala:165:45, :172:{27,32}, Mux.scala:47:70
  reg         regout_REG_1;	// BankedStore.scala:172:47
  reg  [63:0] regout_r_1;	// Reg.scala:19:16
  wire        regout_en_2 =
    reqs_0_bankEn[2] | reqs_1_bankEn[2] | reqs_2_bankEn[2] | reqs_3_bankEn[2]
    | reqs_4_bankEn[2];	// BankedStore.scala:137:{24,55}, :165:{32,45}
  wire        regout_wen_2 =
    reqs_1_bankSum[2] | ~(reqs_1_bankSel[2]) & (reqs_2_bankSel[2] | reqs_3_bankSel[2]);	// BankedStore.scala:136:24, :166:33, Mux.scala:47:70
  assign writeEnable_0 = regout_wen_2 & regout_en_2;	// BankedStore.scala:165:45, :171:15, Mux.scala:47:70
  assign readEnable_0 = ~regout_wen_2 & regout_en_2;	// BankedStore.scala:165:45, :172:{27,32}, Mux.scala:47:70
  reg         regout_REG_2;	// BankedStore.scala:172:47
  reg  [63:0] regout_r_2;	// Reg.scala:19:16
  wire        regout_en_3 =
    reqs_0_bankEn[3] | reqs_1_bankEn[3] | reqs_2_bankEn[3] | reqs_3_bankEn[3]
    | reqs_4_bankEn[3];	// BankedStore.scala:137:{24,55}, :165:{32,45}
  wire        regout_wen_3 =
    reqs_1_bankSum[3] | ~(reqs_1_bankSel[3]) & (reqs_2_bankSel[3] | reqs_3_bankSel[3]);	// BankedStore.scala:136:24, :166:33, Mux.scala:47:70
  assign writeEnable = regout_wen_3 & regout_en_3;	// BankedStore.scala:165:45, :171:15, Mux.scala:47:70
  assign readEnable = ~regout_wen_3 & regout_en_3;	// BankedStore.scala:165:45, :172:{27,32}, Mux.scala:47:70
  reg         regout_REG_3;	// BankedStore.scala:172:47
  reg  [63:0] regout_r_3;	// Reg.scala:19:16
  reg  [3:0]  regsel_sourceC_REG;	// BankedStore.scala:175:39
  reg  [3:0]  regsel_sourceC;	// BankedStore.scala:175:31
  reg  [3:0]  regsel_sourceD_REG;	// BankedStore.scala:176:39
  reg  [3:0]  regsel_sourceD;	// BankedStore.scala:176:31
  always @(posedge clock) begin
    regout_REG <= ~regout_wen & regout_en;	// BankedStore.scala:165:45, :172:{27,47,53}, Mux.scala:47:70
    if (regout_REG)	// BankedStore.scala:172:47
      regout_r <= _cc_banks_0_RW0_rdata;	// DescribedSRAM.scala:17:26, Reg.scala:19:16
    regout_REG_1 <= ~regout_wen_1 & regout_en_1;	// BankedStore.scala:165:45, :172:{27,47,53}, Mux.scala:47:70
    if (regout_REG_1)	// BankedStore.scala:172:47
      regout_r_1 <= _cc_banks_1_RW0_rdata;	// DescribedSRAM.scala:17:26, Reg.scala:19:16
    regout_REG_2 <= ~regout_wen_2 & regout_en_2;	// BankedStore.scala:165:45, :172:{27,47,53}, Mux.scala:47:70
    if (regout_REG_2)	// BankedStore.scala:172:47
      regout_r_2 <= _cc_banks_2_RW0_rdata;	// DescribedSRAM.scala:17:26, Reg.scala:19:16
    regout_REG_3 <= ~regout_wen_3 & regout_en_3;	// BankedStore.scala:165:45, :172:{27,47,53}, Mux.scala:47:70
    if (regout_REG_3)	// BankedStore.scala:172:47
      regout_r_3 <= _cc_banks_3_RW0_rdata;	// DescribedSRAM.scala:17:26, Reg.scala:19:16
    regsel_sourceC_REG <= reqs_1_bankEn;	// BankedStore.scala:137:55, :175:39
    regsel_sourceC <= regsel_sourceC_REG;	// BankedStore.scala:175:{31,39}
    regsel_sourceD_REG <= reqs_4_bankEn;	// BankedStore.scala:137:55, :176:39
    regsel_sourceD <= regsel_sourceD_REG;	// BankedStore.scala:176:{31,39}
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    logic [31:0] _RANDOM_1;
    logic [31:0] _RANDOM_2;
    logic [31:0] _RANDOM_3;
    logic [31:0] _RANDOM_4;
    logic [31:0] _RANDOM_5;
    logic [31:0] _RANDOM_6;
    logic [31:0] _RANDOM_7;
    logic [31:0] _RANDOM_8;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        _RANDOM_1 = `RANDOM;
        _RANDOM_2 = `RANDOM;
        _RANDOM_3 = `RANDOM;
        _RANDOM_4 = `RANDOM;
        _RANDOM_5 = `RANDOM;
        _RANDOM_6 = `RANDOM;
        _RANDOM_7 = `RANDOM;
        _RANDOM_8 = `RANDOM;
        regout_REG = _RANDOM_0[0];	// BankedStore.scala:172:47
        regout_r = {_RANDOM_0[31:1], _RANDOM_1, _RANDOM_2[0]};	// BankedStore.scala:172:47, Reg.scala:19:16
        regout_REG_1 = _RANDOM_2[1];	// BankedStore.scala:172:47, Reg.scala:19:16
        regout_r_1 = {_RANDOM_2[31:2], _RANDOM_3, _RANDOM_4[1:0]};	// Reg.scala:19:16
        regout_REG_2 = _RANDOM_4[2];	// BankedStore.scala:172:47, Reg.scala:19:16
        regout_r_2 = {_RANDOM_4[31:3], _RANDOM_5, _RANDOM_6[2:0]};	// Reg.scala:19:16
        regout_REG_3 = _RANDOM_6[3];	// BankedStore.scala:172:47, Reg.scala:19:16
        regout_r_3 = {_RANDOM_6[31:4], _RANDOM_7, _RANDOM_8[3:0]};	// Reg.scala:19:16
        regsel_sourceC_REG = _RANDOM_8[7:4];	// BankedStore.scala:175:39, Reg.scala:19:16
        regsel_sourceC = _RANDOM_8[11:8];	// BankedStore.scala:175:31, Reg.scala:19:16
        regsel_sourceD_REG = _RANDOM_8[15:12];	// BankedStore.scala:176:39, Reg.scala:19:16
        regsel_sourceD = _RANDOM_8[19:16];	// BankedStore.scala:176:31, Reg.scala:19:16
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  cc_banks_0 cc_banks_0 (	// DescribedSRAM.scala:17:26
    .RW0_addr
      (reqs_1_bankSum[0]
         ? reqs_0_index
         : reqs_1_bankSel[0]
             ? reqs_1_index
             : reqs_2_bankSel[0]
                 ? reqs_2_index
                 : reqs_3_bankSel[0] ? reqs_3_index : reqs_4_index),	// BankedStore.scala:135:23, :136:24, :166:33, Mux.scala:47:70
    .RW0_en    (readEnable_2 | writeEnable_2),	// BankedStore.scala:171:15, :172:32, DescribedSRAM.scala:17:26
    .RW0_clk   (clock),
    .RW0_wmode (regout_wen),	// Mux.scala:47:70
    .RW0_wdata
      (reqs_1_bankSum[0]
         ? io_sinkC_dat_data
         : reqs_1_bankSel[0]
             ? 64'h0
             : reqs_2_bankSel[0]
                 ? io_sinkD_dat_data
                 : reqs_3_bankSel[0] ? io_sourceD_wdat_data : 64'h0),	// BankedStore.scala:136:24, :138:18, :166:33, Mux.scala:47:70
    .RW0_rdata (_cc_banks_0_RW0_rdata)
  );
  cc_banks_1 cc_banks_1 (	// DescribedSRAM.scala:17:26
    .RW0_addr
      (reqs_1_bankSum[1]
         ? reqs_0_index
         : reqs_1_bankSel[1]
             ? reqs_1_index
             : reqs_2_bankSel[1]
                 ? reqs_2_index
                 : reqs_3_bankSel[1] ? reqs_3_index : reqs_4_index),	// BankedStore.scala:135:23, :136:24, :166:33, Mux.scala:47:70
    .RW0_en    (readEnable_1 | writeEnable_1),	// BankedStore.scala:171:15, :172:32, DescribedSRAM.scala:17:26
    .RW0_clk   (clock),
    .RW0_wmode (regout_wen_1),	// Mux.scala:47:70
    .RW0_wdata
      (reqs_1_bankSum[1]
         ? io_sinkC_dat_data
         : reqs_1_bankSel[1]
             ? 64'h0
             : reqs_2_bankSel[1]
                 ? io_sinkD_dat_data
                 : reqs_3_bankSel[1] ? io_sourceD_wdat_data : 64'h0),	// BankedStore.scala:136:24, :138:18, :166:33, Mux.scala:47:70
    .RW0_rdata (_cc_banks_1_RW0_rdata)
  );
  cc_banks_2 cc_banks_2 (	// DescribedSRAM.scala:17:26
    .RW0_addr
      (reqs_1_bankSum[2]
         ? reqs_0_index
         : reqs_1_bankSel[2]
             ? reqs_1_index
             : reqs_2_bankSel[2]
                 ? reqs_2_index
                 : reqs_3_bankSel[2] ? reqs_3_index : reqs_4_index),	// BankedStore.scala:135:23, :136:24, :166:33, Mux.scala:47:70
    .RW0_en    (readEnable_0 | writeEnable_0),	// BankedStore.scala:171:15, :172:32, DescribedSRAM.scala:17:26
    .RW0_clk   (clock),
    .RW0_wmode (regout_wen_2),	// Mux.scala:47:70
    .RW0_wdata
      (reqs_1_bankSum[2]
         ? io_sinkC_dat_data
         : reqs_1_bankSel[2]
             ? 64'h0
             : reqs_2_bankSel[2]
                 ? io_sinkD_dat_data
                 : reqs_3_bankSel[2] ? io_sourceD_wdat_data : 64'h0),	// BankedStore.scala:136:24, :138:18, :166:33, Mux.scala:47:70
    .RW0_rdata (_cc_banks_2_RW0_rdata)
  );
  cc_banks_3 cc_banks_3 (	// DescribedSRAM.scala:17:26
    .RW0_addr
      (reqs_1_bankSum[3]
         ? reqs_0_index
         : reqs_1_bankSel[3]
             ? reqs_1_index
             : reqs_2_bankSel[3]
                 ? reqs_2_index
                 : reqs_3_bankSel[3] ? reqs_3_index : reqs_4_index),	// BankedStore.scala:135:23, :136:24, :166:33, Mux.scala:47:70
    .RW0_en    (readEnable | writeEnable),	// BankedStore.scala:171:15, :172:32, DescribedSRAM.scala:17:26
    .RW0_clk   (clock),
    .RW0_wmode (regout_wen_3),	// Mux.scala:47:70
    .RW0_wdata
      (reqs_1_bankSum[3]
         ? io_sinkC_dat_data
         : reqs_1_bankSel[3]
             ? 64'h0
             : reqs_2_bankSel[3]
                 ? io_sinkD_dat_data
                 : reqs_3_bankSel[3] ? io_sourceD_wdat_data : 64'h0),	// BankedStore.scala:136:24, :138:18, :166:33, Mux.scala:47:70
    .RW0_rdata (_cc_banks_3_RW0_rdata)
  );
  assign io_sinkC_adr_ready = _sinkC_req_io_sinkC_adr_ready_T_1[0];	// BankedStore.scala:132:21
  assign io_sinkD_adr_ready = _sinkD_req_io_sinkD_adr_ready_T_1[0];	// BankedStore.scala:132:21
  assign io_sourceC_adr_ready = _sourceC_req_io_sourceC_adr_ready_T_1[0];	// BankedStore.scala:132:21
  assign io_sourceC_dat_data =
    (regsel_sourceC[0] ? regout_r : 64'h0) | (regsel_sourceC[1] ? regout_r_1 : 64'h0)
    | (regsel_sourceC[2] ? regout_r_2 : 64'h0) | (regsel_sourceC[3] ? regout_r_3 : 64'h0);	// BankedStore.scala:138:18, :175:31, :179:{23,38}, :180:85, Reg.scala:19:16
  assign io_sourceD_radr_ready = _sourceD_rreq_io_sourceD_radr_ready_T_1[0];	// BankedStore.scala:132:21
  assign io_sourceD_rdat_data =
    (regsel_sourceD[0] ? regout_r : 64'h0) | (regsel_sourceD[1] ? regout_r_1 : 64'h0)
    | (regsel_sourceD[2] ? regout_r_2 : 64'h0) | (regsel_sourceD[3] ? regout_r_3 : 64'h0);	// BankedStore.scala:138:18, :176:31, :186:{23,38}, :187:85, Reg.scala:19:16
  assign io_sourceD_wadr_ready = _sourceD_wreq_io_sourceD_wadr_ready_T_1[0];	// BankedStore.scala:132:21
endmodule

