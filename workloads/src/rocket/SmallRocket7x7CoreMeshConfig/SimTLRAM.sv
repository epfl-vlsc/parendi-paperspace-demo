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

module SimTLRAM(
  input         clock,
                reset,
                auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
  input  [1:0]  auto_in_a_bits_size,
  input  [9:0]  auto_in_a_bits_source,
  input  [31:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_d_ready,
  output        auto_in_a_ready,
                auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_size,
  output [9:0]  auto_in_d_bits_source,
  output [63:0] auto_in_d_bits_data
);

  wire [7:0]  r_raw_data_7;	// package.scala:80:42
  wire [7:0]  r_raw_data_6;	// package.scala:80:42
  wire [7:0]  r_raw_data_5;	// package.scala:80:42
  wire [7:0]  r_raw_data_4;	// package.scala:80:42
  wire [7:0]  r_raw_data_3;	// package.scala:80:42
  wire [7:0]  r_raw_data_2;	// package.scala:80:42
  wire [7:0]  r_raw_data_1;	// package.scala:80:42
  wire [7:0]  r_raw_data_0;	// package.scala:80:42
  wire [63:0] _d_updated_alu_io_data_out;	// HarnessExtMem.scala:664:23
  wire [63:0] _mem_rdata;	// HarnessExtMem.scala:131:56
  reg         d_full;	// HarnessExtMem.scala:598:30
  reg         d_respond;	// HarnessExtMem.scala:599:26
  reg  [2:0]  d_opcode;	// HarnessExtMem.scala:600:26
  reg  [2:0]  d_param;	// HarnessExtMem.scala:601:26
  reg  [1:0]  d_size;	// HarnessExtMem.scala:602:26
  reg  [9:0]  d_source;	// HarnessExtMem.scala:603:26
  reg         d_read;	// HarnessExtMem.scala:604:26
  reg         d_atomic;	// HarnessExtMem.scala:605:26
  reg         d_sublane;	// HarnessExtMem.scala:606:26
  reg  [31:0] d_address;	// HarnessExtMem.scala:607:26
  reg  [7:0]  d_mask;	// HarnessExtMem.scala:608:26
  reg  [63:0] d_rmw_data;	// HarnessExtMem.scala:609:26
  reg  [7:0]  d_raw_data_0;	// HarnessExtMem.scala:611:26
  reg  [7:0]  d_raw_data_1;	// HarnessExtMem.scala:611:26
  reg  [7:0]  d_raw_data_2;	// HarnessExtMem.scala:611:26
  reg  [7:0]  d_raw_data_3;	// HarnessExtMem.scala:611:26
  reg  [7:0]  d_raw_data_4;	// HarnessExtMem.scala:611:26
  reg  [7:0]  d_raw_data_5;	// HarnessExtMem.scala:611:26
  reg  [7:0]  d_raw_data_6;	// HarnessExtMem.scala:611:26
  reg  [7:0]  d_raw_data_7;	// HarnessExtMem.scala:611:26
  reg         r_full;	// HarnessExtMem.scala:614:30
  reg  [2:0]  r_opcode;	// HarnessExtMem.scala:615:26
  reg  [2:0]  r_param;	// HarnessExtMem.scala:616:26
  reg  [1:0]  r_size;	// HarnessExtMem.scala:617:26
  reg  [9:0]  r_source;	// HarnessExtMem.scala:618:26
  reg         r_read;	// HarnessExtMem.scala:619:26
  reg         r_atomic;	// HarnessExtMem.scala:620:26
  reg         r_sublane;	// HarnessExtMem.scala:621:26
  reg  [31:0] r_address;	// HarnessExtMem.scala:622:26
  reg  [7:0]  r_mask;	// HarnessExtMem.scala:623:26
  reg  [63:0] r_rmw_data;	// HarnessExtMem.scala:624:26
  wire [63:0] d_corrected =
    {d_raw_data_7,
     d_raw_data_6,
     d_raw_data_5,
     d_raw_data_4,
     d_raw_data_3,
     d_raw_data_2,
     d_raw_data_1,
     d_raw_data_0};	// Cat.scala:33:92, HarnessExtMem.scala:611:26
  wire        d_mux = d_full & d_respond;	// HarnessExtMem.scala:598:30, :599:26, :686:24
  wire        d_wb = d_full & (d_sublane | d_atomic);	// HarnessExtMem.scala:598:30, :605:26, :606:26, :709:{23,37}
  wire        d_ready = ~d_respond | auto_in_d_ready;	// HarnessExtMem.scala:599:26, :721:{19,30}
  wire        r_ready = ~d_wb & (~d_full | d_ready) & ~d_mux & auto_in_d_ready;	// HarnessExtMem.scala:598:30, :686:24, :709:23, :720:68, :721:30, :722:{42,50,62,81}
  wire        in_a_ready =
    ~(d_full & d_wb) & (~r_full | r_ready) & (~r_full | ~(r_atomic | r_sublane));	// HarnessExtMem.scala:598:30, :614:30, :620:26, :621:26, :709:23, :722:62, :723:{19,28,41,49,61,73,76,87}
  wire        a_atomic = auto_in_a_bits_opcode == 3'h2 | auto_in_a_bits_opcode == 3'h3;	// HarnessExtMem.scala:729:{24,54}, :730:24
  wire        a_read = auto_in_a_bits_opcode == 3'h4;	// HarnessExtMem.scala:731:35
  wire        a_fire = in_a_ready & auto_in_a_valid;	// Decoupled.scala:51:35, HarnessExtMem.scala:723:61
  wire        wen = d_wb | a_fire & ~(a_read | a_atomic);	// Decoupled.scala:51:35, HarnessExtMem.scala:709:23, :729:54, :731:35, :787:24, :789:{20,52,55}
  wire        ren = ~wen & a_fire;	// Decoupled.scala:51:35, HarnessExtMem.scala:789:20, :790:{15,20}
  reg         REG;	// HarnessExtMem.scala:807:47
  reg  [7:0]  r_0;	// Reg.scala:19:16
  reg  [7:0]  r_1;	// Reg.scala:19:16
  reg  [7:0]  r_2;	// Reg.scala:19:16
  reg  [7:0]  r_3;	// Reg.scala:19:16
  reg  [7:0]  r_4;	// Reg.scala:19:16
  reg  [7:0]  r_5;	// Reg.scala:19:16
  reg  [7:0]  r_6;	// Reg.scala:19:16
  reg  [7:0]  r_7;	// Reg.scala:19:16
  assign r_raw_data_0 = REG ? _mem_rdata[7:0] : r_0;	// HarnessExtMem.scala:131:56, :805:68, :807:47, Reg.scala:19:16, package.scala:80:42
  assign r_raw_data_1 = REG ? _mem_rdata[15:8] : r_1;	// HarnessExtMem.scala:131:56, :805:68, :807:47, Reg.scala:19:16, package.scala:80:42
  assign r_raw_data_2 = REG ? _mem_rdata[23:16] : r_2;	// HarnessExtMem.scala:131:56, :805:68, :807:47, Reg.scala:19:16, package.scala:80:42
  assign r_raw_data_3 = REG ? _mem_rdata[31:24] : r_3;	// HarnessExtMem.scala:131:56, :805:68, :807:47, Reg.scala:19:16, package.scala:80:42
  assign r_raw_data_4 = REG ? _mem_rdata[39:32] : r_4;	// HarnessExtMem.scala:131:56, :805:68, :807:47, Reg.scala:19:16, package.scala:80:42
  assign r_raw_data_5 = REG ? _mem_rdata[47:40] : r_5;	// HarnessExtMem.scala:131:56, :805:68, :807:47, Reg.scala:19:16, package.scala:80:42
  assign r_raw_data_6 = REG ? _mem_rdata[55:48] : r_6;	// HarnessExtMem.scala:131:56, :805:68, :807:47, Reg.scala:19:16, package.scala:80:42
  assign r_raw_data_7 = REG ? _mem_rdata[63:56] : r_7;	// HarnessExtMem.scala:131:56, :805:68, :807:47, Reg.scala:19:16, package.scala:80:42
  wire        _T_18 = r_full & r_ready;	// HarnessExtMem.scala:614:30, :722:62, :735:18
  always @(posedge clock) begin
    if (reset) begin
      d_full <= 1'h0;	// HarnessExtMem.scala:552:16, :598:30
      r_full <= 1'h0;	// HarnessExtMem.scala:552:16, :614:30
    end
    else begin
      d_full <= _T_18 | ~d_ready & d_full;	// HarnessExtMem.scala:598:30, :721:30, :734:{20,29}, :735:{18,30}, :736:18
      r_full <= a_fire | ~r_ready & r_full;	// Decoupled.scala:51:35, HarnessExtMem.scala:614:30, :722:62, :753:{20,29}, :754:24, :755:18
    end
    d_respond <= ~_T_18 & d_respond;	// HarnessExtMem.scala:599:26, :735:{18,30}, :737:18
    if (_T_18) begin	// HarnessExtMem.scala:735:18
      d_opcode <= r_opcode;	// HarnessExtMem.scala:600:26, :615:26
      d_param <= r_param;	// HarnessExtMem.scala:601:26, :616:26
      d_size <= r_size;	// HarnessExtMem.scala:602:26, :617:26
      d_source <= r_source;	// HarnessExtMem.scala:603:26, :618:26
      d_read <= r_read;	// HarnessExtMem.scala:604:26, :619:26
      d_atomic <= r_atomic;	// HarnessExtMem.scala:605:26, :620:26
      d_sublane <= r_sublane;	// HarnessExtMem.scala:606:26, :621:26
      d_address <= r_address;	// HarnessExtMem.scala:607:26, :622:26
      d_mask <= r_mask;	// HarnessExtMem.scala:608:26, :623:26
      d_rmw_data <= r_rmw_data;	// HarnessExtMem.scala:609:26, :624:26
      if (REG) begin	// HarnessExtMem.scala:807:47
        d_raw_data_0 <= _mem_rdata[7:0];	// HarnessExtMem.scala:131:56, :611:26, :805:68
        d_raw_data_1 <= _mem_rdata[15:8];	// HarnessExtMem.scala:131:56, :611:26, :805:68
        d_raw_data_2 <= _mem_rdata[23:16];	// HarnessExtMem.scala:131:56, :611:26, :805:68
        d_raw_data_3 <= _mem_rdata[31:24];	// HarnessExtMem.scala:131:56, :611:26, :805:68
        d_raw_data_4 <= _mem_rdata[39:32];	// HarnessExtMem.scala:131:56, :611:26, :805:68
        d_raw_data_5 <= _mem_rdata[47:40];	// HarnessExtMem.scala:131:56, :611:26, :805:68
        d_raw_data_6 <= _mem_rdata[55:48];	// HarnessExtMem.scala:131:56, :611:26, :805:68
        d_raw_data_7 <= _mem_rdata[63:56];	// HarnessExtMem.scala:131:56, :611:26, :805:68
      end
      else begin	// HarnessExtMem.scala:807:47
        d_raw_data_0 <= r_0;	// HarnessExtMem.scala:611:26, Reg.scala:19:16
        d_raw_data_1 <= r_1;	// HarnessExtMem.scala:611:26, Reg.scala:19:16
        d_raw_data_2 <= r_2;	// HarnessExtMem.scala:611:26, Reg.scala:19:16
        d_raw_data_3 <= r_3;	// HarnessExtMem.scala:611:26, Reg.scala:19:16
        d_raw_data_4 <= r_4;	// HarnessExtMem.scala:611:26, Reg.scala:19:16
        d_raw_data_5 <= r_5;	// HarnessExtMem.scala:611:26, Reg.scala:19:16
        d_raw_data_6 <= r_6;	// HarnessExtMem.scala:611:26, Reg.scala:19:16
        d_raw_data_7 <= r_7;	// HarnessExtMem.scala:611:26, Reg.scala:19:16
      end
    end
    if (a_fire) begin	// Decoupled.scala:51:35
      r_opcode <= auto_in_a_bits_opcode;	// HarnessExtMem.scala:615:26
      r_param <= auto_in_a_bits_param;	// HarnessExtMem.scala:616:26
      r_size <= auto_in_a_bits_size;	// HarnessExtMem.scala:617:26
      r_source <= auto_in_a_bits_source;	// HarnessExtMem.scala:618:26
      r_read <= a_read;	// HarnessExtMem.scala:619:26, :731:35
      r_atomic <= a_atomic;	// HarnessExtMem.scala:620:26, :729:54
      r_address <= auto_in_a_bits_address;	// HarnessExtMem.scala:622:26
      r_mask <= auto_in_a_bits_mask;	// HarnessExtMem.scala:623:26
    end
    r_sublane <= ~a_fire & r_sublane;	// Decoupled.scala:51:35, HarnessExtMem.scala:621:26, :754:24, :763:18
    if (a_fire & ~a_read)	// Decoupled.scala:51:35, HarnessExtMem.scala:624:26, :731:35, :754:24, :767:{13,22,35}
      r_rmw_data <= auto_in_a_bits_data;	// HarnessExtMem.scala:624:26
    REG <= ren;	// HarnessExtMem.scala:790:20, :807:47
    if (REG) begin	// HarnessExtMem.scala:807:47
      r_0 <= _mem_rdata[7:0];	// HarnessExtMem.scala:131:56, :805:68, Reg.scala:19:16
      r_1 <= _mem_rdata[15:8];	// HarnessExtMem.scala:131:56, :805:68, Reg.scala:19:16
      r_2 <= _mem_rdata[23:16];	// HarnessExtMem.scala:131:56, :805:68, Reg.scala:19:16
      r_3 <= _mem_rdata[31:24];	// HarnessExtMem.scala:131:56, :805:68, Reg.scala:19:16
      r_4 <= _mem_rdata[39:32];	// HarnessExtMem.scala:131:56, :805:68, Reg.scala:19:16
      r_5 <= _mem_rdata[47:40];	// HarnessExtMem.scala:131:56, :805:68, Reg.scala:19:16
      r_6 <= _mem_rdata[55:48];	// HarnessExtMem.scala:131:56, :805:68, Reg.scala:19:16
      r_7 <= _mem_rdata[63:56];	// HarnessExtMem.scala:131:56, :805:68, Reg.scala:19:16
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    always @(posedge clock) begin	// HarnessExtMem.scala:717:12
      if (~reset & r_full & d_wb) begin	// HarnessExtMem.scala:614:30, :709:23, :717:12
        if (`ASSERT_VERBOSE_COND_)	// HarnessExtMem.scala:717:12
          $error("Assertion failed\n    at HarnessExtMem.scala:717 assert (!(r_full && d_wb) || (d_full && d_read && d_need_fix))\n");	// HarnessExtMem.scala:717:12
        if (`STOP_COND_)	// HarnessExtMem.scala:717:12
          $fatal;	// HarnessExtMem.scala:717:12
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
    logic [31:0] _RANDOM_5;
    logic [31:0] _RANDOM_6;
    logic [31:0] _RANDOM_7;
    logic [31:0] _RANDOM_8;
    logic [31:0] _RANDOM_9;
    logic [31:0] _RANDOM_10;
    logic [31:0] _RANDOM_11;
    logic [31:0] _RANDOM_12;
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
        _RANDOM_9 = `RANDOM;
        _RANDOM_10 = `RANDOM;
        _RANDOM_11 = `RANDOM;
        _RANDOM_12 = `RANDOM;
        d_full = _RANDOM_0[0];	// HarnessExtMem.scala:598:30
        d_respond = _RANDOM_0[1];	// HarnessExtMem.scala:598:30, :599:26
        d_opcode = _RANDOM_0[4:2];	// HarnessExtMem.scala:598:30, :600:26
        d_param = _RANDOM_0[7:5];	// HarnessExtMem.scala:598:30, :601:26
        d_size = _RANDOM_0[9:8];	// HarnessExtMem.scala:598:30, :602:26
        d_source = _RANDOM_0[19:10];	// HarnessExtMem.scala:598:30, :603:26
        d_read = _RANDOM_0[20];	// HarnessExtMem.scala:598:30, :604:26
        d_atomic = _RANDOM_0[21];	// HarnessExtMem.scala:598:30, :605:26
        d_sublane = _RANDOM_0[22];	// HarnessExtMem.scala:598:30, :606:26
        d_address = {_RANDOM_0[31:23], _RANDOM_1[22:0]};	// HarnessExtMem.scala:598:30, :607:26
        d_mask = _RANDOM_1[30:23];	// HarnessExtMem.scala:607:26, :608:26
        d_rmw_data = {_RANDOM_1[31], _RANDOM_2, _RANDOM_3[30:0]};	// HarnessExtMem.scala:607:26, :609:26
        d_raw_data_0 = _RANDOM_4[7:0];	// HarnessExtMem.scala:611:26
        d_raw_data_1 = _RANDOM_4[15:8];	// HarnessExtMem.scala:611:26
        d_raw_data_2 = _RANDOM_4[23:16];	// HarnessExtMem.scala:611:26
        d_raw_data_3 = _RANDOM_4[31:24];	// HarnessExtMem.scala:611:26
        d_raw_data_4 = _RANDOM_5[7:0];	// HarnessExtMem.scala:611:26
        d_raw_data_5 = _RANDOM_5[15:8];	// HarnessExtMem.scala:611:26
        d_raw_data_6 = _RANDOM_5[23:16];	// HarnessExtMem.scala:611:26
        d_raw_data_7 = _RANDOM_5[31:24];	// HarnessExtMem.scala:611:26
        r_full = _RANDOM_6[0];	// HarnessExtMem.scala:614:30
        r_opcode = _RANDOM_6[3:1];	// HarnessExtMem.scala:614:30, :615:26
        r_param = _RANDOM_6[6:4];	// HarnessExtMem.scala:614:30, :616:26
        r_size = _RANDOM_6[8:7];	// HarnessExtMem.scala:614:30, :617:26
        r_source = _RANDOM_6[18:9];	// HarnessExtMem.scala:614:30, :618:26
        r_read = _RANDOM_6[19];	// HarnessExtMem.scala:614:30, :619:26
        r_atomic = _RANDOM_6[20];	// HarnessExtMem.scala:614:30, :620:26
        r_sublane = _RANDOM_6[21];	// HarnessExtMem.scala:614:30, :621:26
        r_address = {_RANDOM_6[31:22], _RANDOM_7[21:0]};	// HarnessExtMem.scala:614:30, :622:26
        r_mask = _RANDOM_7[29:22];	// HarnessExtMem.scala:622:26, :623:26
        r_rmw_data = {_RANDOM_7[31:30], _RANDOM_8, _RANDOM_9[29:0]};	// HarnessExtMem.scala:622:26, :624:26
        REG = _RANDOM_10[0];	// HarnessExtMem.scala:807:47
        r_0 = _RANDOM_10[8:1];	// HarnessExtMem.scala:807:47, Reg.scala:19:16
        r_1 = _RANDOM_10[16:9];	// HarnessExtMem.scala:807:47, Reg.scala:19:16
        r_2 = _RANDOM_10[24:17];	// HarnessExtMem.scala:807:47, Reg.scala:19:16
        r_3 = {_RANDOM_10[31:25], _RANDOM_11[0]};	// HarnessExtMem.scala:807:47, Reg.scala:19:16
        r_4 = _RANDOM_11[8:1];	// Reg.scala:19:16
        r_5 = _RANDOM_11[16:9];	// Reg.scala:19:16
        r_6 = _RANDOM_11[24:17];	// Reg.scala:19:16
        r_7 = {_RANDOM_11[31:25], _RANDOM_12[0]};	// Reg.scala:19:16
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  SimRAMLoadHex #(
    .SIZE(16384),
    .BITS(8),
    .LANES(8)
  ) mem (	// HarnessExtMem.scala:131:56
    .addr  (d_wb ? d_address[16:3] : auto_in_a_bits_address[16:3]),	// HarnessExtMem.scala:607:26, :709:23, :792:21
    .wdata
      ({d_wb ? _d_updated_alu_io_data_out[63:56] : auto_in_a_bits_data[63:56],
        d_wb ? _d_updated_alu_io_data_out[55:48] : auto_in_a_bits_data[55:48],
        d_wb ? _d_updated_alu_io_data_out[47:40] : auto_in_a_bits_data[47:40],
        d_wb ? _d_updated_alu_io_data_out[39:32] : auto_in_a_bits_data[39:32],
        d_wb ? _d_updated_alu_io_data_out[31:24] : auto_in_a_bits_data[31:24],
        d_wb ? _d_updated_alu_io_data_out[23:16] : auto_in_a_bits_data[23:16],
        d_wb ? _d_updated_alu_io_data_out[15:8] : auto_in_a_bits_data[15:8],
        d_wb ? _d_updated_alu_io_data_out[7:0] : auto_in_a_bits_data[7:0]}),	// HarnessExtMem.scala:664:23, :709:23, :771:67, :773:62, :794:21, :810:29
    .wstrb (wen ? (d_wb ? d_mask : auto_in_a_bits_mask) : 8'h0),	// Bundles.scala:259:74, HarnessExtMem.scala:554:18, :608:26, :709:23, :789:20, :793:21, :809:16, :813:20
    .wen   (wen),	// HarnessExtMem.scala:789:20
    .ren   (ren),	// HarnessExtMem.scala:790:20
    .clock (clock),
    .reset (reset),
    .rdata (_mem_rdata)
  );
  Atomics_1 d_updated_alu (	// HarnessExtMem.scala:664:23
    .io_a_opcode (d_opcode),	// HarnessExtMem.scala:600:26
    .io_a_param  (d_param),	// HarnessExtMem.scala:601:26
    .io_a_mask   (d_mask),	// HarnessExtMem.scala:608:26
    .io_a_data   (d_rmw_data),	// HarnessExtMem.scala:609:26
    .io_data_in  (d_corrected),	// Cat.scala:33:92
    .io_data_out (_d_updated_alu_io_data_out)
  );
  assign auto_in_a_ready = in_a_ready;	// HarnessExtMem.scala:723:61
  assign auto_in_d_valid = d_mux | r_full & ~d_wb;	// HarnessExtMem.scala:614:30, :686:24, :709:23, :720:{41,65,68}
  assign auto_in_d_bits_opcode = {2'h0, d_mux ? d_read | d_atomic : r_read | r_atomic};	// HarnessExtMem.scala:604:26, :605:26, :619:26, :620:26, :686:24, :688:{22,37,57}, :689:23
  assign auto_in_d_bits_size = d_mux ? d_size : r_size;	// HarnessExtMem.scala:602:26, :617:26, :686:24, :691:29
  assign auto_in_d_bits_source = d_mux ? d_source : r_source;	// HarnessExtMem.scala:603:26, :618:26, :686:24, :692:29
  assign auto_in_d_bits_data =
    d_mux
      ? d_corrected
      : {r_raw_data_7,
         r_raw_data_6,
         r_raw_data_5,
         r_raw_data_4,
         r_raw_data_3,
         r_raw_data_2,
         r_raw_data_1,
         r_raw_data_0};	// Cat.scala:33:92, HarnessExtMem.scala:686:24, :695:29, package.scala:80:42
endmodule

