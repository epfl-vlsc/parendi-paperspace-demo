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

module ICache(
  input         clock,
                reset,
                auto_master_out_a_ready,
                auto_master_out_d_valid,
  input  [2:0]  auto_master_out_d_bits_opcode,
  input  [3:0]  auto_master_out_d_bits_size,
  input  [63:0] auto_master_out_d_bits_data,
  input         auto_master_out_d_bits_corrupt,
                io_req_valid,
  input  [32:0] io_req_bits_addr,
  input  [31:0] io_s1_paddr,
  input         io_s1_kill,
                io_s2_kill,
                io_invalidate,
  output        auto_master_out_a_valid,
  output [31:0] auto_master_out_a_bits_address,
  output        io_resp_valid,
  output [31:0] io_resp_bits_data,
  output        io_resp_bits_replay,
                io_resp_bits_ae
);

  wire         readEnable;	// @[ICache.scala:582:46]
  wire         writeEnable;	// @[ICache.scala:562:32]
  wire         readEnable_0;	// @[ICache.scala:582:46]
  wire         writeEnable_0;	// @[ICache.scala:562:32]
  wire         s1_tag_hit_0;	// @[ICache.scala:506:26]
  wire         readEnable_1;	// @[ICache.scala:418:83]
  wire [5:0]   _tag_rdata_T_4;	// @[ICache.scala:418:42]
  wire         _io_req_ready_T_2;	// @[ICache.scala:386:19]
  wire [31:0]  _data_arrays_1_0_RW0_rdata;	// @[DescribedSRAM.scala:17:26]
  wire [31:0]  _data_arrays_0_0_RW0_rdata;	// @[DescribedSRAM.scala:17:26]
  wire [20:0]  _tag_array_0_RW0_rdata;	// @[DescribedSRAM.scala:17:26]
  wire         s0_valid = _io_req_ready_T_2 & io_req_valid;	// @[Decoupled.scala:51:35, ICache.scala:386:19]
  reg          s1_valid;	// @[ICache.scala:333:25]
  wire         s1_hit;	// @[ICache.scala:353:40]
  assign s1_hit = s1_tag_hit_0;	// @[ICache.scala:353:40, :506:26]
  reg          s2_valid;	// @[ICache.scala:355:25]
  reg          s2_hit;	// @[ICache.scala:356:23]
  reg          invalidated;	// @[ICache.scala:359:24]
  reg          refill_valid;	// @[ICache.scala:360:29]
  wire         s2_miss = s2_valid & ~s2_hit & ~io_s2_kill;	// @[ICache.scala:355:25, :356:23, :370:{29,37,40}]
  reg          s2_request_refill_REG;	// @[ICache.scala:377:45]
  wire         tl_out_a_valid = s2_miss & s2_request_refill_REG;	// @[ICache.scala:370:37, :377:{35,45}]
  reg  [31:0]  refill_paddr;	// @[Reg.scala:19:16]
  wire         refill_one_beat = auto_master_out_d_valid & auto_master_out_d_bits_opcode[0];	// @[Edges.scala:106:36, ICache.scala:383:41]
  assign _io_req_ready_T_2 = ~refill_one_beat;	// @[ICache.scala:383:41, :386:19]
  wire [26:0]  _beats1_decode_T_1 = 27'hFFF << auto_master_out_d_bits_size;	// @[package.scala:235:71]
  wire [8:0]   beats1 = auto_master_out_d_bits_opcode[0] ? ~(_beats1_decode_T_1[11:3]) : 9'h0;	// @[Edges.scala:106:36, :221:14, :229:27, package.scala:235:{46,71,76}]
  reg  [8:0]   counter;	// @[Edges.scala:229:27]
  wire [8:0]   counter1 = counter - 9'h1;	// @[Edges.scala:229:27, :230:28]
  wire [8:0]   refill_cnt = beats1 & ~counter1;	// @[Edges.scala:221:14, :230:28, :234:{25,27}]
  wire         writeEnable_1 = refill_one_beat & (counter == 9'h1 | beats1 == 9'h0) & auto_master_out_d_valid;	// @[Edges.scala:221:14, :229:27, :232:{25,33,43}, ICache.scala:383:41, :391:37]
  assign _tag_rdata_T_4 = io_req_bits_addr[11:6];	// @[ICache.scala:418:42]
  assign readEnable_1 = ~writeEnable_1 & s0_valid;	// @[Decoupled.scala:51:35, ICache.scala:391:37, :418:{70,83}]
  reg          accruedRefillError;	// @[ICache.scala:420:31]
  wire         refillError = auto_master_out_d_bits_corrupt | (|refill_cnt) & accruedRefillError;	// @[Edges.scala:234:25, ICache.scala:420:31, :422:{43,58,64}]
  reg  [63:0]  vb_array;	// @[ICache.scala:440:25]
  wire [63:0]  _s1_vb_T_1 = vb_array >> io_s1_paddr[11:6];	// @[ICache.scala:440:25, :500:25, :850:21]
  assign s1_tag_hit_0 = _s1_vb_T_1[0] & _tag_array_0_RW0_rdata[19:0] == io_s1_paddr[31:12];	// @[DescribedSRAM.scala:17:26, ICache.scala:485:30, :500:25, :506:{26,33}, package.scala:155:13]
  assign writeEnable_0 = refill_one_beat & ~invalidated;	// @[ICache.scala:359:24, :383:41, :562:{32,35}]
  wire [8:0]   _mem_idx_T_6 = {refill_paddr[11:6], 3'h0};	// @[ICache.scala:566:40, :850:21, Reg.scala:19:16]
  assign readEnable_0 = ~writeEnable_0 & s0_valid & ~(io_req_bits_addr[2]);	// @[Decoupled.scala:51:35, ICache.scala:556:111, :562:32, :582:{41,46}, package.scala:155:13]
  assign writeEnable = refill_one_beat & ~invalidated;	// @[ICache.scala:359:24, :383:41, :562:{32,35}]
  assign readEnable = ~writeEnable_0 & s0_valid & io_req_bits_addr[2];	// @[Decoupled.scala:51:35, ICache.scala:562:32, :582:{41,46}, package.scala:155:13]
  reg  [31:0]  s2_dout_0;	// @[Reg.scala:19:16]
  reg          s2_tag_disparity_r_0;	// @[Reg.scala:19:16]
  reg          s2_tl_error;	// @[Reg.scala:19:16]
  wire         invalidate = s2_valid & s2_tag_disparity_r_0 | io_invalidate;	// @[ICache.scala:355:25, :448:31, :644:{22,39,52}, Reg.scala:19:16]
  wire [127:0] _vb_array_T_3 = 128'h1 << refill_paddr[11:6];	// @[ICache.scala:444:32, :850:21, Reg.scala:19:16]
  wire         _s1_can_request_refill_T = s2_miss | refill_valid;	// @[ICache.scala:360:29, :370:37, :372:41]
  always @(posedge clock) begin
    if (reset) begin
      s1_valid <= 1'h0;	// @[ICache.scala:333:25]
      s2_valid <= 1'h0;	// @[ICache.scala:355:25]
      refill_valid <= 1'h0;	// @[ICache.scala:360:29]
      counter <= 9'h0;	// @[Edges.scala:229:27]
      vb_array <= 64'h0;	// @[ICache.scala:440:25]
    end
    else begin
      s1_valid <= s0_valid;	// @[Decoupled.scala:51:35, ICache.scala:333:25]
      s2_valid <= s1_valid & ~io_s1_kill;	// @[ICache.scala:333:25, :355:{25,35,38}]
      refill_valid <= ~writeEnable_1 & (auto_master_out_a_ready & tl_out_a_valid | refill_valid);	// @[Decoupled.scala:51:35, ICache.scala:360:29, :377:35, :391:37, :821:{22,37}, :822:{22,37}]
      if (auto_master_out_d_valid) begin
        if (counter == 9'h0) begin	// @[Edges.scala:229:27, :231:25]
          if (auto_master_out_d_bits_opcode[0])	// @[Edges.scala:106:36]
            counter <= ~(_beats1_decode_T_1[11:3]);	// @[Edges.scala:229:27, package.scala:235:{46,71,76}]
          else	// @[Edges.scala:106:36]
            counter <= 9'h0;	// @[Edges.scala:229:27]
        end
        else	// @[Edges.scala:231:25]
          counter <= counter1;	// @[Edges.scala:229:27, :230:28]
      end
      if (invalidate)	// @[ICache.scala:448:31, :644:{39,52}]
        vb_array <= 64'h0;	// @[ICache.scala:440:25]
      else if (refill_one_beat)	// @[ICache.scala:383:41]
        vb_array <= writeEnable_1 & ~invalidated ? vb_array | _vb_array_T_3[63:0] : ~(~vb_array | _vb_array_T_3[63:0]);	// @[ICache.scala:359:24, :391:37, :440:25, :444:{32,72,75}]
    end
    s2_hit <= s1_hit;	// @[ICache.scala:353:40, :356:23]
    invalidated <= refill_valid & (invalidate | invalidated);	// @[ICache.scala:359:24, :360:29, :448:31, :449:21, :451:17, :644:{39,52}, :820:{24,38}]
    s2_request_refill_REG <= ~_s1_can_request_refill_T;	// @[ICache.scala:372:{31,41}, :377:45]
    if (s1_valid & ~_s1_can_request_refill_T)	// @[ICache.scala:333:25, :372:{31,41}, :378:54]
      refill_paddr <= io_s1_paddr;	// @[Reg.scala:19:16]
    if (refill_one_beat)	// @[ICache.scala:383:41]
      accruedRefillError <= refillError;	// @[ICache.scala:420:31, :422:43]
    if (s1_valid) begin	// @[ICache.scala:333:25]
      if (io_s1_paddr[2])	// @[package.scala:155:13]
        s2_dout_0 <= _data_arrays_1_0_RW0_rdata;	// @[DescribedSRAM.scala:17:26, Reg.scala:19:16]
      else	// @[package.scala:155:13]
        s2_dout_0 <= _data_arrays_0_0_RW0_rdata;	// @[DescribedSRAM.scala:17:26, Reg.scala:19:16]
      s2_tl_error <= s1_hit & _tag_array_0_RW0_rdata[20];	// @[DescribedSRAM.scala:17:26, ICache.scala:353:40, :510:32, Reg.scala:19:16, package.scala:155:13]
    end
    s2_tag_disparity_r_0 <= ~s1_valid & s2_tag_disparity_r_0;	// @[ICache.scala:333:25, Reg.scala:19:16, :20:{18,22}]
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
        s1_valid = _RANDOM_0[4];	// @[ICache.scala:333:25]
        s2_valid = _RANDOM_1[6];	// @[ICache.scala:355:25]
        s2_hit = _RANDOM_1[7];	// @[ICache.scala:355:25, :356:23]
        invalidated = _RANDOM_1[8];	// @[ICache.scala:355:25, :359:24]
        refill_valid = _RANDOM_1[9];	// @[ICache.scala:355:25, :360:29]
        s2_request_refill_REG = _RANDOM_1[12];	// @[ICache.scala:355:25, :377:45]
        refill_paddr = {_RANDOM_1[31:13], _RANDOM_2[12:0]};	// @[ICache.scala:355:25, Reg.scala:19:16]
        counter = _RANDOM_3[22:14];	// @[Edges.scala:229:27]
        accruedRefillError = _RANDOM_3[23];	// @[Edges.scala:229:27, ICache.scala:420:31]
        vb_array = {_RANDOM_3[31:24], _RANDOM_4, _RANDOM_5[23:0]};	// @[Edges.scala:229:27, ICache.scala:440:25]
        s2_dout_0 = {_RANDOM_7[31:5], _RANDOM_8[4:0]};	// @[Reg.scala:19:16]
        s2_tag_disparity_r_0 = _RANDOM_8[5];	// @[Reg.scala:19:16]
        s2_tl_error = _RANDOM_8[6];	// @[Reg.scala:19:16]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  tag_array_0_0 tag_array_0 (	// @[DescribedSRAM.scala:17:26]
    .RW0_addr  (writeEnable_1 ? refill_paddr[11:6] : _tag_rdata_T_4),	// @[DescribedSRAM.scala:17:26, ICache.scala:391:37, :418:42, :850:21, Reg.scala:19:16]
    .RW0_en    (readEnable_1 | writeEnable_1),	// @[DescribedSRAM.scala:17:26, ICache.scala:391:37, :418:83]
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_1),	// @[ICache.scala:391:37]
    .RW0_wdata ({refillError, refill_paddr[31:12]}),	// @[Cat.scala:33:92, ICache.scala:380:33, :422:43, Reg.scala:19:16]
    .RW0_rdata (_tag_array_0_RW0_rdata)
  );
  data_arrays_0_0 data_arrays_0_0 (	// @[DescribedSRAM.scala:17:26]
    .RW0_addr  (refill_one_beat ? _mem_idx_T_6 | refill_cnt : io_req_bits_addr[11:3]),	// @[Edges.scala:234:25, ICache.scala:383:41, :557:31, :566:{10,40,67}]
    .RW0_en    (readEnable_0 | writeEnable_0),	// @[DescribedSRAM.scala:17:26, ICache.scala:562:32, :582:46]
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_0),	// @[ICache.scala:562:32]
    .RW0_wdata (auto_master_out_d_bits_data[31:0]),	// @[ICache.scala:575:71]
    .RW0_rdata (_data_arrays_0_0_RW0_rdata)
  );
  data_arrays_1_0 data_arrays_1_0 (	// @[DescribedSRAM.scala:17:26]
    .RW0_addr  (refill_one_beat ? _mem_idx_T_6 | refill_cnt : io_req_bits_addr[11:3]),	// @[Edges.scala:234:25, ICache.scala:383:41, :557:31, :566:{10,40,67}]
    .RW0_en    (readEnable | writeEnable),	// @[DescribedSRAM.scala:17:26, ICache.scala:562:32, :582:46]
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_0),	// @[ICache.scala:562:32]
    .RW0_wdata (auto_master_out_d_bits_data[63:32]),	// @[ICache.scala:575:71]
    .RW0_rdata (_data_arrays_1_0_RW0_rdata)
  );
  assign auto_master_out_a_valid = tl_out_a_valid;	// @[ICache.scala:377:35]
  assign auto_master_out_a_bits_address = {refill_paddr[31:6], 6'h0};	// @[ICache.scala:434:40, :760:64, Reg.scala:19:16]
  assign io_resp_valid = s2_valid & s2_hit;	// @[ICache.scala:355:25, :356:23, :650:33]
  assign io_resp_bits_data = s2_dout_0;	// @[Reg.scala:19:16]
  assign io_resp_bits_replay = s2_tag_disparity_r_0;	// @[Reg.scala:19:16]
  assign io_resp_bits_ae = s2_tl_error;	// @[Reg.scala:19:16]
endmodule

