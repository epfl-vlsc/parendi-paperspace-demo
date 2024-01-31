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

module SourceB(
  input          clock,
                 reset,
                 io_req_valid,
  input  [2:0]   io_req_bits_param,
  input  [3:0]   io_req_bits_tag,
  input  [6:0]   io_req_bits_set,
  input  [140:0] io_req_bits_clients,
  input          io_b_ready,
  output         io_req_ready,
                 io_b_valid,
  output [1:0]   io_b_bits_param,
  output [9:0]   io_b_bits_source,
  output [31:0]  io_b_bits_address
);

  reg  [140:0] remain;	// SourceB.scala:46:25
  wire [140:0] todo = (|remain) ? remain : io_req_bits_clients;	// SourceB.scala:46:25, :51:23, :52:19
  wire [139:0] _GEN = todo[139:0] | {todo[138:0], 1'h0};	// SourceB.scala:52:19, :59:13, package.scala:245:{43,53}
  wire [139:0] _GEN_0 = _GEN | {_GEN[137:0], 2'h0};	// Cat.scala:33:92, package.scala:245:{43,53}
  wire [139:0] _GEN_1 = _GEN_0 | {_GEN_0[135:0], 4'h0};	// Parameters.scala:220:15, package.scala:245:{43,53}
  wire [139:0] _GEN_2 = _GEN_1 | {_GEN_1[131:0], 8'h0};	// SourceB.scala:81:23, package.scala:245:{43,53}
  wire [139:0] _GEN_3 = _GEN_2 | {_GEN_2[123:0], 16'h0};	// package.scala:245:{43,48,53}
  wire [139:0] _GEN_4 = _GEN_3 | {_GEN_3[107:0], 32'h0};	// package.scala:245:{43,48,53}
  wire [139:0] _GEN_5 = _GEN_4 | {_GEN_4[75:0], 64'h0};	// package.scala:245:{43,48,53}
  wire [140:0] _GEN_6 = {~(_GEN_5 | {_GEN_5[11:0], 128'h0}), 1'h1} & todo;	// SourceB.scala:52:19, :53:{16,31,37}, :59:13, package.scala:245:{43,48,53}
  wire         _param_T_1 = ~(|remain) & io_req_valid;	// Decoupled.scala:51:35, SourceB.scala:46:25, :51:23, :61:21
  wire         b_valid = (|remain) | io_req_valid;	// SourceB.scala:46:25, :51:23, :68:21
  reg  [3:0]   tag_r;	// Reg.scala:19:16
  reg  [6:0]   set_r;	// Reg.scala:19:16
  reg  [2:0]   param_r;	// Reg.scala:19:16
  wire [8:0]   _GEN_7 =
    (_GEN_6[13] ? 9'h1FC : 9'h0) | (_GEN_6[14] ? 9'h1F8 : 9'h0)
    | (_GEN_6[15] ? 9'h1F4 : 9'h0) | (_GEN_6[16] ? 9'h1F0 : 9'h0)
    | (_GEN_6[17] ? 9'h1EC : 9'h0) | (_GEN_6[18] ? 9'h1E8 : 9'h0)
    | (_GEN_6[19] ? 9'h1E4 : 9'h0) | (_GEN_6[20] ? 9'h1E0 : 9'h0)
    | (_GEN_6[21] ? 9'h1DC : 9'h0) | (_GEN_6[22] ? 9'h1D8 : 9'h0)
    | (_GEN_6[23] ? 9'h1D4 : 9'h0) | (_GEN_6[24] ? 9'h1D0 : 9'h0)
    | (_GEN_6[25] ? 9'h1CC : 9'h0) | (_GEN_6[26] ? 9'h1C8 : 9'h0)
    | (_GEN_6[27] ? 9'h1C4 : 9'h0) | (_GEN_6[28] ? 9'h1C0 : 9'h0)
    | (_GEN_6[29] ? 9'h1BC : 9'h0) | (_GEN_6[30] ? 9'h1B8 : 9'h0)
    | (_GEN_6[31] ? 9'h1B4 : 9'h0) | (_GEN_6[32] ? 9'h1B0 : 9'h0)
    | (_GEN_6[33] ? 9'h1AC : 9'h0) | (_GEN_6[34] ? 9'h1A8 : 9'h0)
    | (_GEN_6[35] ? 9'h1A4 : 9'h0) | (_GEN_6[36] ? 9'h1A0 : 9'h0)
    | (_GEN_6[37] ? 9'h19C : 9'h0) | (_GEN_6[38] ? 9'h198 : 9'h0)
    | (_GEN_6[39] ? 9'h194 : 9'h0) | (_GEN_6[40] ? 9'h190 : 9'h0)
    | (_GEN_6[41] ? 9'h18C : 9'h0) | (_GEN_6[42] ? 9'h188 : 9'h0)
    | (_GEN_6[43] ? 9'h184 : 9'h0) | (_GEN_6[44] ? 9'h180 : 9'h0)
    | (_GEN_6[45] ? 9'h17C : 9'h0) | (_GEN_6[46] ? 9'h178 : 9'h0)
    | (_GEN_6[47] ? 9'h174 : 9'h0) | (_GEN_6[48] ? 9'h170 : 9'h0)
    | (_GEN_6[49] ? 9'h16C : 9'h0) | (_GEN_6[50] ? 9'h168 : 9'h0)
    | (_GEN_6[51] ? 9'h164 : 9'h0) | (_GEN_6[52] ? 9'h160 : 9'h0)
    | (_GEN_6[53] ? 9'h15C : 9'h0) | (_GEN_6[54] ? 9'h158 : 9'h0)
    | (_GEN_6[55] ? 9'h154 : 9'h0) | (_GEN_6[56] ? 9'h150 : 9'h0)
    | (_GEN_6[57] ? 9'h14C : 9'h0) | (_GEN_6[58] ? 9'h148 : 9'h0)
    | (_GEN_6[59] ? 9'h144 : 9'h0) | (_GEN_6[60] ? 9'h140 : 9'h0)
    | (_GEN_6[61] ? 9'h13C : 9'h0) | (_GEN_6[62] ? 9'h138 : 9'h0)
    | (_GEN_6[63] ? 9'h134 : 9'h0) | (_GEN_6[64] ? 9'h130 : 9'h0)
    | (_GEN_6[65] ? 9'h12C : 9'h0) | (_GEN_6[66] ? 9'h128 : 9'h0)
    | (_GEN_6[67] ? 9'h124 : 9'h0) | (_GEN_6[68] ? 9'h120 : 9'h0)
    | (_GEN_6[69] ? 9'h11C : 9'h0) | (_GEN_6[70] ? 9'h118 : 9'h0)
    | (_GEN_6[71] ? 9'h114 : 9'h0) | (_GEN_6[72] ? 9'h110 : 9'h0)
    | (_GEN_6[73] ? 9'h10C : 9'h0) | (_GEN_6[74] ? 9'h108 : 9'h0)
    | (_GEN_6[75] ? 9'h104 : 9'h0);	// Mux.scala:27:73, :29:36, SourceB.scala:53:37
  wire [7:0]   _GEN_8 =
    _GEN_7[7:0] | (_GEN_6[77] ? 8'hFC : 8'h0) | (_GEN_6[78] ? 8'hF8 : 8'h0)
    | (_GEN_6[79] ? 8'hF4 : 8'h0) | (_GEN_6[80] ? 8'hF0 : 8'h0)
    | (_GEN_6[81] ? 8'hEC : 8'h0) | (_GEN_6[82] ? 8'hE8 : 8'h0)
    | (_GEN_6[83] ? 8'hE4 : 8'h0) | (_GEN_6[84] ? 8'hE0 : 8'h0)
    | (_GEN_6[85] ? 8'hDC : 8'h0) | (_GEN_6[86] ? 8'hD8 : 8'h0)
    | (_GEN_6[87] ? 8'hD4 : 8'h0) | (_GEN_6[88] ? 8'hD0 : 8'h0)
    | (_GEN_6[89] ? 8'hCC : 8'h0) | (_GEN_6[90] ? 8'hC8 : 8'h0)
    | (_GEN_6[91] ? 8'hC4 : 8'h0) | (_GEN_6[92] ? 8'hC0 : 8'h0)
    | (_GEN_6[93] ? 8'hBC : 8'h0) | (_GEN_6[94] ? 8'hB8 : 8'h0)
    | (_GEN_6[95] ? 8'hB4 : 8'h0) | (_GEN_6[96] ? 8'hB0 : 8'h0)
    | (_GEN_6[97] ? 8'hAC : 8'h0) | (_GEN_6[98] ? 8'hA8 : 8'h0)
    | (_GEN_6[99] ? 8'hA4 : 8'h0) | (_GEN_6[100] ? 8'hA0 : 8'h0)
    | (_GEN_6[101] ? 8'h9C : 8'h0) | (_GEN_6[102] ? 8'h98 : 8'h0)
    | (_GEN_6[103] ? 8'h94 : 8'h0) | (_GEN_6[104] ? 8'h90 : 8'h0)
    | (_GEN_6[105] ? 8'h8C : 8'h0) | (_GEN_6[106] ? 8'h88 : 8'h0)
    | (_GEN_6[107] ? 8'h84 : 8'h0);	// Mux.scala:27:73, :29:36, SourceB.scala:53:37, :81:23
  wire [6:0]   _GEN_9 =
    _GEN_8[6:0] | (_GEN_6[109] ? 7'h7C : 7'h0) | (_GEN_6[110] ? 7'h78 : 7'h0)
    | (_GEN_6[111] ? 7'h74 : 7'h0) | (_GEN_6[112] ? 7'h70 : 7'h0)
    | (_GEN_6[113] ? 7'h6C : 7'h0) | (_GEN_6[114] ? 7'h68 : 7'h0)
    | (_GEN_6[115] ? 7'h64 : 7'h0) | (_GEN_6[116] ? 7'h60 : 7'h0)
    | (_GEN_6[117] ? 7'h5C : 7'h0) | (_GEN_6[118] ? 7'h58 : 7'h0)
    | (_GEN_6[119] ? 7'h54 : 7'h0) | (_GEN_6[120] ? 7'h50 : 7'h0)
    | (_GEN_6[121] ? 7'h4C : 7'h0) | (_GEN_6[122] ? 7'h48 : 7'h0)
    | (_GEN_6[123] ? 7'h44 : 7'h0);	// Mux.scala:27:73, :29:36, Parameters.scala:220:15, SourceB.scala:53:37
  wire [5:0]   _GEN_10 =
    _GEN_9[5:0] | (_GEN_6[125] ? 6'h3C : 6'h0) | (_GEN_6[126] ? 6'h38 : 6'h0)
    | (_GEN_6[127] ? 6'h34 : 6'h0) | (_GEN_6[128] ? 6'h30 : 6'h0)
    | (_GEN_6[129] ? 6'h2C : 6'h0) | (_GEN_6[130] ? 6'h28 : 6'h0)
    | (_GEN_6[131] ? 6'h24 : 6'h0);	// Mux.scala:27:73, :29:36, Parameters.scala:220:15, SourceB.scala:53:37
  wire [4:0]   _GEN_11 =
    _GEN_10[4:0] | (_GEN_6[133] ? 5'h1C : 5'h0) | (_GEN_6[134] ? 5'h18 : 5'h0)
    | (_GEN_6[135] ? 5'h14 : 5'h0);	// Mux.scala:27:73, :29:36, SourceB.scala:53:37
  wire [3:0]   _GEN_12 = _GEN_11[3:0] | (_GEN_6[137] ? 4'hC : 4'h0);	// Mux.scala:27:73, :29:36, Parameters.scala:220:15, SourceB.scala:53:37
  always @(posedge clock) begin
    if (reset)
      remain <= 141'h0;	// SourceB.scala:46:25
    else
      remain <=
        (remain | (_param_T_1 ? io_req_bits_clients : 141'h0))
        & ~(io_b_ready & b_valid ? _GEN_6 : 141'h0);	// Decoupled.scala:51:35, SourceB.scala:46:25, :47:30, :48:30, :49:{23,37,39}, :53:37, :62:{24,37}, :68:21, :69:{19,32}
    if (_param_T_1) begin	// Decoupled.scala:51:35
      tag_r <= io_req_bits_tag;	// Reg.scala:19:16
      set_r <= io_req_bits_set;	// Reg.scala:19:16
      param_r <= io_req_bits_param;	// Reg.scala:19:16
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    always @(posedge clock) begin	// SourceB.scala:59:12
      if (~reset & ~(~io_req_valid | (|io_req_bits_clients))) begin	// SourceB.scala:59:{12,13,27,50}
        if (`ASSERT_VERBOSE_COND_)	// SourceB.scala:59:12
          $error("Assertion failed\n    at SourceB.scala:59 assert (!io.req.valid || io.req.bits.clients =/= 0.U)\n");	// SourceB.scala:59:12
        if (`STOP_COND_)	// SourceB.scala:59:12
          $fatal;	// SourceB.scala:59:12
      end
    end // always @(posedge)
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    logic [31:0] _RANDOM_1;
    logic [31:0] _RANDOM_2;
    logic [31:0] _RANDOM_3;
    logic [31:0] _RANDOM_4;
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
        remain = {_RANDOM_0, _RANDOM_1, _RANDOM_2, _RANDOM_3, _RANDOM_4[12:0]};	// SourceB.scala:46:25
        tag_r = _RANDOM_4[16:13];	// Reg.scala:19:16, SourceB.scala:46:25
        set_r = _RANDOM_4[23:17];	// Reg.scala:19:16, SourceB.scala:46:25
        param_r = _RANDOM_4[26:24];	// Reg.scala:19:16, SourceB.scala:46:25
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_req_ready = ~(|remain);	// SourceB.scala:46:25, :51:23, :61:21
  assign io_b_valid = b_valid;	// SourceB.scala:68:21
  assign io_b_bits_param = (|remain) ? param_r[1:0] : io_req_bits_param[1:0];	// Reg.scala:19:16, SourceB.scala:46:25, :51:23, :74:20
  assign io_b_bits_source =
    (_GEN_6[0] ? 10'h230 : 10'h0) | (_GEN_6[1] ? 10'h22C : 10'h0)
    | (_GEN_6[2] ? 10'h228 : 10'h0) | (_GEN_6[3] ? 10'h224 : 10'h0)
    | (_GEN_6[4] ? 10'h220 : 10'h0) | (_GEN_6[5] ? 10'h21C : 10'h0)
    | (_GEN_6[6] ? 10'h218 : 10'h0) | (_GEN_6[7] ? 10'h214 : 10'h0)
    | (_GEN_6[8] ? 10'h210 : 10'h0) | (_GEN_6[9] ? 10'h20C : 10'h0)
    | (_GEN_6[10] ? 10'h208 : 10'h0) | (_GEN_6[11] ? 10'h204 : 10'h0)
    | {_GEN_6[12],
       _GEN_7[8] | _GEN_6[76],
       _GEN_8[7] | _GEN_6[108],
       _GEN_9[6] | _GEN_6[124],
       _GEN_10[5] | _GEN_6[132],
       _GEN_11[4] | _GEN_6[136],
       _GEN_12[3] | _GEN_6[138],
       _GEN_12[2] | _GEN_6[139],
       _GEN_12[1:0]};	// Mux.scala:27:73, :29:36, SourceB.scala:53:37
  assign io_b_bits_address =
    {15'h0,
     (|remain) ? tag_r : io_req_bits_tag,
     (|remain) ? set_r : io_req_bits_set,
     6'h0};	// Cat.scala:33:92, Parameters.scala:220:15, Reg.scala:19:16, SourceB.scala:46:25, :51:23, :72:18, :73:18
endmodule

