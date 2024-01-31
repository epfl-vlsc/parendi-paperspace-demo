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

module TLFragmenter(
  input         clock,
                reset,
                auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_size,
  input  [7:0]  auto_in_a_bits_source,
  input  [14:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_d_ready,
                auto_out_a_ready,
                auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_size,
  input  [11:0] auto_out_d_bits_source,
  input  [63:0] auto_out_d_bits_data,
  output        auto_in_a_ready,
                auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
                auto_in_d_bits_size,
  output [7:0]  auto_in_d_bits_source,
  output [63:0] auto_in_d_bits_data,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [1:0]  auto_out_a_bits_size,
  output [11:0] auto_out_a_bits_source,
  output [14:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_d_ready
);

  wire        _repeater_io_full;	// @[Fragmenter.scala:264:30]
  wire        _repeater_io_deq_valid;	// @[Fragmenter.scala:264:30]
  wire [2:0]  _repeater_io_deq_bits_opcode;	// @[Fragmenter.scala:264:30]
  wire [2:0]  _repeater_io_deq_bits_size;	// @[Fragmenter.scala:264:30]
  wire [7:0]  _repeater_io_deq_bits_source;	// @[Fragmenter.scala:264:30]
  wire [14:0] _repeater_io_deq_bits_address;	// @[Fragmenter.scala:264:30]
  wire [7:0]  _repeater_io_deq_bits_mask;	// @[Fragmenter.scala:264:30]
  reg  [2:0]  acknum;	// @[Fragmenter.scala:191:29]
  reg  [2:0]  dOrig;	// @[Fragmenter.scala:192:24]
  reg         dToggle;	// @[Fragmenter.scala:193:30]
  wire        dFirst = acknum == 3'h0;	// @[Fragmenter.scala:191:29, :195:29]
  wire [5:0]  _dsizeOH1_T_1 = 6'h7 << auto_out_d_bits_size;	// @[Fragmenter.scala:306:111, package.scala:235:71]
  wire [5:0]  _GEN = {auto_out_d_bits_source[2:0], ~(_dsizeOH1_T_1[2:0])} & {1'h1, ~(auto_out_d_bits_source[2:0]), _dsizeOH1_T_1[2:1]};	// @[Cat.scala:33:92, Fragmenter.scala:194:41, OneHot.scala:64:12, package.scala:233:{35,47,49}, :235:{46,71,76}]
  wire [2:0]  _GEN_0 = {1'h0, _GEN[5:4]} | _GEN[2:0];	// @[OneHot.scala:31:18, :32:28, package.scala:233:47]
  wire [2:0]  dFirst_size = {|(_GEN[5:3]), |(_GEN_0[2:1]), _GEN_0[2] | _GEN_0[0]};	// @[Cat.scala:33:92, OneHot.scala:30:18, :31:18, :32:{14,28}, package.scala:233:47]
  wire        drop = ~(auto_out_d_bits_opcode[0]) & (|(auto_out_d_bits_source[2:0]));	// @[Edges.scala:106:36, Fragmenter.scala:194:41, :196:30, :224:{20,30}]
  wire        x1_d_ready = auto_in_d_ready | drop;	// @[Fragmenter.scala:224:30, :225:35]
  wire [2:0]  aFrag = _repeater_io_deq_bits_size[2] ? 3'h3 : _repeater_io_deq_bits_size;	// @[Fragmenter.scala:264:30, :287:{24,31}]
  wire [12:0] _aOrigOH1_T_1 = 13'h3F << _repeater_io_deq_bits_size;	// @[Fragmenter.scala:264:30, package.scala:235:71]
  wire [9:0]  _aFragOH1_T_1 = 10'h7 << aFrag;	// @[Fragmenter.scala:287:24, package.scala:235:71]
  reg  [2:0]  gennum;	// @[Fragmenter.scala:293:29]
  wire        aFirst = gennum == 3'h0;	// @[Fragmenter.scala:191:29, :293:29, :294:29]
  wire [2:0]  _old_gennum1_T_2 = gennum - 3'h1;	// @[Fragmenter.scala:293:29, :295:79]
  wire [2:0]  old_gennum1 = aFirst ? ~(_aOrigOH1_T_1[5:3]) : _old_gennum1_T_2;	// @[Fragmenter.scala:294:29, :295:{30,79}, package.scala:235:{46,71,76}]
  reg         aToggle_r;	// @[Reg.scala:19:16]
  wire        _T_7 = x1_d_ready & auto_out_d_valid;	// @[Decoupled.scala:51:35, Fragmenter.scala:225:35]
  wire        _GEN_1 = _T_7 & dFirst;	// @[Decoupled.scala:51:35, Fragmenter.scala:192:24, :195:29, :210:27, :212:25, :213:19]
  always @(posedge clock) begin
    if (reset) begin
      acknum <= 3'h0;	// @[Fragmenter.scala:191:29]
      dToggle <= 1'h0;	// @[Fragmenter.scala:193:30]
      gennum <= 3'h0;	// @[Fragmenter.scala:191:29, :293:29]
    end
    else begin
      if (_T_7) begin	// @[Decoupled.scala:51:35]
        if (dFirst)	// @[Fragmenter.scala:195:29]
          acknum <= auto_out_d_bits_source[2:0];	// @[Fragmenter.scala:191:29, :194:41]
        else	// @[Fragmenter.scala:195:29]
          acknum <= acknum - {2'h0, auto_out_d_bits_opcode[0] | (&auto_out_d_bits_size)};	// @[Edges.scala:106:36, Fragmenter.scala:191:29, :206:{32,56}, :211:55, OneHot.scala:64:12]
      end
      if (_GEN_1)	// @[Fragmenter.scala:192:24, :210:27, :212:25, :213:19]
        dToggle <= auto_out_d_bits_source[3];	// @[Fragmenter.scala:193:30, :214:41]
      if (auto_out_a_ready & _repeater_io_deq_valid) begin	// @[Decoupled.scala:51:35, Fragmenter.scala:264:30]
        if (aFirst)	// @[Fragmenter.scala:294:29]
          gennum <= ~(_aOrigOH1_T_1[5:3]);	// @[Fragmenter.scala:293:29, package.scala:235:{46,71,76}]
        else	// @[Fragmenter.scala:294:29]
          gennum <= _old_gennum1_T_2;	// @[Fragmenter.scala:293:29, :295:79]
      end
    end
    if (_GEN_1)	// @[Fragmenter.scala:192:24, :210:27, :212:25, :213:19]
      dOrig <= dFirst_size;	// @[Cat.scala:33:92, Fragmenter.scala:192:24]
    if (aFirst)	// @[Fragmenter.scala:294:29]
      aToggle_r <= dToggle;	// @[Fragmenter.scala:193:30, Reg.scala:19:16]
  end // always @(posedge)
  `ifndef SYNTHESIS
    always @(posedge clock) begin	// @[Fragmenter.scala:311:16]
      if (~reset & ~(~_repeater_io_full | _repeater_io_deq_bits_opcode[2])) begin	// @[Edges.scala:92:37, Fragmenter.scala:264:30, :311:{16,17,35}]
        if (`ASSERT_VERBOSE_COND_)	// @[Fragmenter.scala:311:16]
          $error("Assertion failed\n    at Fragmenter.scala:311 assert (!repeater.io.full || !aHasData)\n");	// @[Fragmenter.scala:311:16]
        if (`STOP_COND_)	// @[Fragmenter.scala:311:16]
          $fatal;	// @[Fragmenter.scala:311:16]
      end
      if (~reset & ~(~_repeater_io_full | (&_repeater_io_deq_bits_mask))) begin	// @[Fragmenter.scala:264:30, :311:17, :314:{16,35,53}]
        if (`ASSERT_VERBOSE_COND_)	// @[Fragmenter.scala:314:16]
          $error("Assertion failed\n    at Fragmenter.scala:314 assert (!repeater.io.full || in_a.bits.mask === fullMask)\n");	// @[Fragmenter.scala:314:16]
        if (`STOP_COND_)	// @[Fragmenter.scala:314:16]
          $fatal;	// @[Fragmenter.scala:314:16]
      end
    end // always @(posedge)
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
        acknum = _RANDOM_0[2:0];	// @[Fragmenter.scala:191:29]
        dOrig = _RANDOM_0[5:3];	// @[Fragmenter.scala:191:29, :192:24]
        dToggle = _RANDOM_0[6];	// @[Fragmenter.scala:191:29, :193:30]
        gennum = _RANDOM_0[9:7];	// @[Fragmenter.scala:191:29, :293:29]
        aToggle_r = _RANDOM_0[10];	// @[Fragmenter.scala:191:29, Reg.scala:19:16]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  Repeater repeater (	// @[Fragmenter.scala:264:30]
    .clock               (clock),
    .reset               (reset),
    .io_repeat           (_repeater_io_deq_bits_opcode[2] & (|old_gennum1)),	// @[Edges.scala:92:37, Fragmenter.scala:264:30, :295:30, :304:{41,53}]
    .io_enq_valid        (auto_in_a_valid),
    .io_enq_bits_opcode  (auto_in_a_bits_opcode),
    .io_enq_bits_size    (auto_in_a_bits_size),
    .io_enq_bits_source  (auto_in_a_bits_source),
    .io_enq_bits_address (auto_in_a_bits_address),
    .io_enq_bits_mask    (auto_in_a_bits_mask),
    .io_deq_ready        (auto_out_a_ready),
    .io_full             (_repeater_io_full),
    .io_enq_ready        (auto_in_a_ready),
    .io_deq_valid        (_repeater_io_deq_valid),
    .io_deq_bits_opcode  (_repeater_io_deq_bits_opcode),
    .io_deq_bits_size    (_repeater_io_deq_bits_size),
    .io_deq_bits_source  (_repeater_io_deq_bits_source),
    .io_deq_bits_address (_repeater_io_deq_bits_address),
    .io_deq_bits_mask    (_repeater_io_deq_bits_mask)
  );
  assign auto_in_d_valid = auto_out_d_valid & ~drop;	// @[Fragmenter.scala:224:30, :226:{36,39}]
  assign auto_in_d_bits_opcode = auto_out_d_bits_opcode;
  assign auto_in_d_bits_size = dFirst ? dFirst_size : dOrig;	// @[Cat.scala:33:92, Fragmenter.scala:192:24, :195:29, :229:32]
  assign auto_in_d_bits_source = auto_out_d_bits_source[11:4];	// @[Fragmenter.scala:228:47]
  assign auto_in_d_bits_data = auto_out_d_bits_data;
  assign auto_out_a_valid = _repeater_io_deq_valid;	// @[Fragmenter.scala:264:30]
  assign auto_out_a_bits_opcode = _repeater_io_deq_bits_opcode;	// @[Fragmenter.scala:264:30]
  assign auto_out_a_bits_size = aFrag[1:0];	// @[Fragmenter.scala:287:24, :308:25]
  assign auto_out_a_bits_source = {_repeater_io_deq_bits_source, ~(aFirst ? dToggle : aToggle_r), old_gennum1};	// @[Cat.scala:33:92, Fragmenter.scala:193:30, :264:30, :294:29, :295:30, :299:{23,27}, Reg.scala:19:16]
  assign auto_out_a_bits_address = _repeater_io_deq_bits_address | {9'h0, ~(_aOrigOH1_T_1[5:0] | {old_gennum1, ~(_aFragOH1_T_1[2:0])} | 6'h7)};	// @[Fragmenter.scala:264:30, :295:30, :306:{49,51,100,111}, package.scala:235:{46,71,76}]
  assign auto_out_a_bits_mask = _repeater_io_full ? 8'hFF : auto_in_a_bits_mask;	// @[Fragmenter.scala:264:30, :314:53, :315:31]
  assign auto_out_a_bits_data = auto_in_a_bits_data;
  assign auto_out_d_ready = x1_d_ready;	// @[Fragmenter.scala:225:35]
endmodule

