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
  input         clock,
                reset,
                io_req_valid,
  input  [2:0]  io_req_bits_param,
  input  [3:0]  io_req_bits_tag,
  input  [6:0]  io_req_bits_set,
  input  [77:0] io_req_bits_clients,
  input         io_b_ready,
  output        io_req_ready,
                io_b_valid,
  output [1:0]  io_b_bits_param,
  output [8:0]  io_b_bits_source,
  output [31:0] io_b_bits_address
);

  reg  [77:0] remain;	// SourceB.scala:46:25
  wire [77:0] todo = (|remain) ? remain : io_req_bits_clients;	// SourceB.scala:46:25, :51:23, :52:19
  wire [76:0] _GEN = todo[76:0] | {todo[75:0], 1'h0};	// SourceB.scala:52:19, :59:13, package.scala:245:{43,53}
  wire [76:0] _GEN_0 = _GEN | {_GEN[74:0], 2'h0};	// Cat.scala:33:92, package.scala:245:{43,53}
  wire [76:0] _GEN_1 = _GEN_0 | {_GEN_0[72:0], 4'h0};	// Parameters.scala:220:15, package.scala:245:{43,53}
  wire [76:0] _GEN_2 = _GEN_1 | {_GEN_1[68:0], 8'h0};	// SourceB.scala:81:23, package.scala:245:{43,53}
  wire [76:0] _GEN_3 = _GEN_2 | {_GEN_2[60:0], 16'h0};	// package.scala:245:{43,48,53}
  wire [76:0] _GEN_4 = _GEN_3 | {_GEN_3[44:0], 32'h0};	// package.scala:245:{43,48,53}
  wire [77:0] _GEN_5 = {~(_GEN_4 | {_GEN_4[12:0], 64'h0}), 1'h1} & todo;	// SourceB.scala:52:19, :53:{16,31,37}, :59:13, package.scala:245:{43,48,53}
  wire        _param_T_1 = ~(|remain) & io_req_valid;	// Decoupled.scala:51:35, SourceB.scala:46:25, :51:23, :61:21
  wire        b_valid = (|remain) | io_req_valid;	// SourceB.scala:46:25, :51:23, :68:21
  reg  [3:0]  tag_r;	// Reg.scala:19:16
  reg  [6:0]  set_r;	// Reg.scala:19:16
  reg  [2:0]  param_r;	// Reg.scala:19:16
  wire [7:0]  _GEN_6 =
    (_GEN_5[14] ? 8'hFC : 8'h0) | (_GEN_5[15] ? 8'hF8 : 8'h0)
    | (_GEN_5[16] ? 8'hF4 : 8'h0) | (_GEN_5[17] ? 8'hF0 : 8'h0)
    | (_GEN_5[18] ? 8'hEC : 8'h0) | (_GEN_5[19] ? 8'hE8 : 8'h0)
    | (_GEN_5[20] ? 8'hE4 : 8'h0) | (_GEN_5[21] ? 8'hE0 : 8'h0)
    | (_GEN_5[22] ? 8'hDC : 8'h0) | (_GEN_5[23] ? 8'hD8 : 8'h0)
    | (_GEN_5[24] ? 8'hD4 : 8'h0) | (_GEN_5[25] ? 8'hD0 : 8'h0)
    | (_GEN_5[26] ? 8'hCC : 8'h0) | (_GEN_5[27] ? 8'hC8 : 8'h0)
    | (_GEN_5[28] ? 8'hC4 : 8'h0) | (_GEN_5[29] ? 8'hC0 : 8'h0)
    | (_GEN_5[30] ? 8'hBC : 8'h0) | (_GEN_5[31] ? 8'hB8 : 8'h0)
    | (_GEN_5[32] ? 8'hB4 : 8'h0) | (_GEN_5[33] ? 8'hB0 : 8'h0)
    | (_GEN_5[34] ? 8'hAC : 8'h0) | (_GEN_5[35] ? 8'hA8 : 8'h0)
    | (_GEN_5[36] ? 8'hA4 : 8'h0) | (_GEN_5[37] ? 8'hA0 : 8'h0)
    | (_GEN_5[38] ? 8'h9C : 8'h0) | (_GEN_5[39] ? 8'h98 : 8'h0)
    | (_GEN_5[40] ? 8'h94 : 8'h0) | (_GEN_5[41] ? 8'h90 : 8'h0)
    | (_GEN_5[42] ? 8'h8C : 8'h0) | (_GEN_5[43] ? 8'h88 : 8'h0)
    | (_GEN_5[44] ? 8'h84 : 8'h0);	// Mux.scala:27:73, :29:36, SourceB.scala:53:37, :81:23
  wire [6:0]  _GEN_7 =
    _GEN_6[6:0] | (_GEN_5[46] ? 7'h7C : 7'h0) | (_GEN_5[47] ? 7'h78 : 7'h0)
    | (_GEN_5[48] ? 7'h74 : 7'h0) | (_GEN_5[49] ? 7'h70 : 7'h0)
    | (_GEN_5[50] ? 7'h6C : 7'h0) | (_GEN_5[51] ? 7'h68 : 7'h0)
    | (_GEN_5[52] ? 7'h64 : 7'h0) | (_GEN_5[53] ? 7'h60 : 7'h0)
    | (_GEN_5[54] ? 7'h5C : 7'h0) | (_GEN_5[55] ? 7'h58 : 7'h0)
    | (_GEN_5[56] ? 7'h54 : 7'h0) | (_GEN_5[57] ? 7'h50 : 7'h0)
    | (_GEN_5[58] ? 7'h4C : 7'h0) | (_GEN_5[59] ? 7'h48 : 7'h0)
    | (_GEN_5[60] ? 7'h44 : 7'h0);	// Mux.scala:27:73, :29:36, Parameters.scala:220:15, SourceB.scala:53:37
  wire [5:0]  _GEN_8 =
    _GEN_7[5:0] | (_GEN_5[62] ? 6'h3C : 6'h0) | (_GEN_5[63] ? 6'h38 : 6'h0)
    | (_GEN_5[64] ? 6'h34 : 6'h0) | (_GEN_5[65] ? 6'h30 : 6'h0)
    | (_GEN_5[66] ? 6'h2C : 6'h0) | (_GEN_5[67] ? 6'h28 : 6'h0)
    | (_GEN_5[68] ? 6'h24 : 6'h0);	// Mux.scala:27:73, :29:36, Parameters.scala:220:15, SourceB.scala:53:37
  wire [4:0]  _GEN_9 =
    _GEN_8[4:0] | (_GEN_5[70] ? 5'h1C : 5'h0) | (_GEN_5[71] ? 5'h18 : 5'h0)
    | (_GEN_5[72] ? 5'h14 : 5'h0);	// Mux.scala:27:73, :29:36, SourceB.scala:53:37
  wire [3:0]  _GEN_10 = _GEN_9[3:0] | (_GEN_5[74] ? 4'hC : 4'h0);	// Mux.scala:27:73, :29:36, Parameters.scala:220:15, SourceB.scala:53:37
  always @(posedge clock) begin
    if (reset)
      remain <= 78'h0;	// SourceB.scala:46:25
    else
      remain <=
        (remain | (_param_T_1 ? io_req_bits_clients : 78'h0))
        & ~(io_b_ready & b_valid ? _GEN_5 : 78'h0);	// Decoupled.scala:51:35, SourceB.scala:46:25, :47:30, :48:30, :49:{23,37,39}, :53:37, :62:{24,37}, :68:21, :69:{19,32}
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
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        _RANDOM_1 = `RANDOM;
        _RANDOM_2 = `RANDOM;
        remain = {_RANDOM_0, _RANDOM_1, _RANDOM_2[13:0]};	// SourceB.scala:46:25
        tag_r = _RANDOM_2[17:14];	// Reg.scala:19:16, SourceB.scala:46:25
        set_r = _RANDOM_2[24:18];	// Reg.scala:19:16, SourceB.scala:46:25
        param_r = _RANDOM_2[27:25];	// Reg.scala:19:16, SourceB.scala:46:25
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
    (_GEN_5[0] ? 9'h134 : 9'h0) | (_GEN_5[1] ? 9'h130 : 9'h0)
    | (_GEN_5[2] ? 9'h12C : 9'h0) | (_GEN_5[3] ? 9'h128 : 9'h0)
    | (_GEN_5[4] ? 9'h124 : 9'h0) | (_GEN_5[5] ? 9'h120 : 9'h0)
    | (_GEN_5[6] ? 9'h11C : 9'h0) | (_GEN_5[7] ? 9'h118 : 9'h0)
    | (_GEN_5[8] ? 9'h114 : 9'h0) | (_GEN_5[9] ? 9'h110 : 9'h0)
    | (_GEN_5[10] ? 9'h10C : 9'h0) | (_GEN_5[11] ? 9'h108 : 9'h0)
    | (_GEN_5[12] ? 9'h104 : 9'h0)
    | {_GEN_5[13],
       _GEN_6[7] | _GEN_5[45],
       _GEN_7[6] | _GEN_5[61],
       _GEN_8[5] | _GEN_5[69],
       _GEN_9[4] | _GEN_5[73],
       _GEN_10[3] | _GEN_5[75],
       _GEN_10[2] | _GEN_5[76],
       _GEN_10[1:0]};	// Mux.scala:27:73, :29:36, SourceB.scala:53:37
  assign io_b_bits_address =
    {15'h0,
     (|remain) ? tag_r : io_req_bits_tag,
     (|remain) ? set_r : io_req_bits_set,
     6'h0};	// Cat.scala:33:92, Parameters.scala:220:15, Reg.scala:19:16, SourceB.scala:46:25, :51:23, :72:18, :73:18
endmodule

