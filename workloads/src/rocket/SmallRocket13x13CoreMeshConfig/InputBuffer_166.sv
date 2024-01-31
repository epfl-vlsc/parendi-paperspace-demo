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

module InputBuffer_166(
  input         clock,
                reset,
                io_enq_0_valid,
                io_enq_0_bits_head,
                io_enq_0_bits_tail,
  input  [72:0] io_enq_0_bits_payload,
  input  [2:0]  io_enq_0_bits_virt_channel_id,
  input         io_deq_4_ready,
  output        io_deq_0_bits_head,
                io_deq_0_bits_tail,
  output [72:0] io_deq_0_bits_payload,
  output        io_deq_1_bits_head,
                io_deq_1_bits_tail,
  output [72:0] io_deq_1_bits_payload,
  output        io_deq_2_bits_head,
                io_deq_2_bits_tail,
  output [72:0] io_deq_2_bits_payload,
  output        io_deq_3_bits_head,
                io_deq_3_bits_tail,
  output [72:0] io_deq_3_bits_payload,
  output        io_deq_4_valid,
                io_deq_4_bits_head,
                io_deq_4_bits_tail,
  output [72:0] io_deq_4_bits_payload
);

  wire            _qs_4_io_enq_ready;	// @[InputUnit.scala:90:49]
  wire            _qs_3_io_enq_ready;	// @[InputUnit.scala:90:49]
  wire            _qs_3_io_deq_valid;	// @[InputUnit.scala:90:49]
  wire            _qs_2_io_enq_ready;	// @[InputUnit.scala:90:49]
  wire            _qs_2_io_deq_valid;	// @[InputUnit.scala:90:49]
  wire            _qs_1_io_enq_ready;	// @[InputUnit.scala:90:49]
  wire            _qs_1_io_deq_valid;	// @[InputUnit.scala:90:49]
  wire            _qs_0_io_enq_ready;	// @[InputUnit.scala:90:49]
  wire            _qs_0_io_deq_valid;	// @[InputUnit.scala:90:49]
  wire [74:0]     _mem_ext_R0_data;	// @[InputUnit.scala:85:18]
  wire [74:0]     _mem_ext_R1_data;	// @[InputUnit.scala:85:18]
  wire [74:0]     _mem_ext_R2_data;	// @[InputUnit.scala:85:18]
  wire [74:0]     _mem_ext_R3_data;	// @[InputUnit.scala:85:18]
  wire [74:0]     _mem_ext_R4_data;	// @[InputUnit.scala:85:18]
  reg  [1:0]      heads_0;	// @[InputUnit.scala:86:24]
  reg  [1:0]      heads_1;	// @[InputUnit.scala:86:24]
  reg  [1:0]      heads_2;	// @[InputUnit.scala:86:24]
  reg  [1:0]      heads_3;	// @[InputUnit.scala:86:24]
  reg  [1:0]      heads_4;	// @[InputUnit.scala:86:24]
  reg  [1:0]      tails_0;	// @[InputUnit.scala:87:24]
  reg  [1:0]      tails_1;	// @[InputUnit.scala:87:24]
  reg  [1:0]      tails_2;	// @[InputUnit.scala:87:24]
  reg  [1:0]      tails_3;	// @[InputUnit.scala:87:24]
  reg  [1:0]      tails_4;	// @[InputUnit.scala:87:24]
  wire            empty_0 = heads_0 == tails_0;	// @[InputUnit.scala:86:24, :87:24, :88:49]
  wire            empty_1 = heads_1 == tails_1;	// @[InputUnit.scala:86:24, :87:24, :88:49]
  wire            empty_2 = heads_2 == tails_2;	// @[InputUnit.scala:86:24, :87:24, :88:49]
  wire            empty_3 = heads_3 == tails_3;	// @[InputUnit.scala:86:24, :87:24, :88:49]
  wire            empty_4 = heads_4 == tails_4;	// @[InputUnit.scala:86:24, :87:24, :88:49]
  wire            _tails_T_15 = io_enq_0_bits_virt_channel_id == 3'h0;	// @[Mux.scala:29:36]
  wire            _tails_T_16 = io_enq_0_bits_virt_channel_id == 3'h1;	// @[InputUnit.scala:103:45, Mux.scala:29:36]
  wire            _tails_T_17 = io_enq_0_bits_virt_channel_id == 3'h2;	// @[InputUnit.scala:103:45, Mux.scala:29:36]
  wire            _tails_T_18 = io_enq_0_bits_virt_channel_id == 3'h3;	// @[InputUnit.scala:103:45, Mux.scala:29:36]
  wire            _tails_T_19 = io_enq_0_bits_virt_channel_id == 3'h4;	// @[InputUnit.scala:109:46, Mux.scala:29:36]
  wire            direct_to_q = (_tails_T_15 & _qs_0_io_enq_ready | _tails_T_16 & _qs_1_io_enq_ready | _tails_T_17 & _qs_2_io_enq_ready | _tails_T_18 & _qs_3_io_enq_ready | _tails_T_19 & _qs_4_io_enq_ready) & (_tails_T_15 & empty_0 | _tails_T_16 & empty_1 | _tails_T_17 & empty_2 | _tails_T_18 & empty_3 | _tails_T_19 & empty_4);	// @[InputUnit.scala:88:49, :90:49, :96:62, Mux.scala:27:73, :29:36]
  wire            mem_MPORT_en = io_enq_0_valid & ~direct_to_q;	// @[InputUnit.scala:96:62, :100:{27,30}]
  wire [7:0][1:0] _GEN = {{tails_0}, {tails_0}, {tails_0}, {tails_4}, {tails_3}, {tails_2}, {tails_1}, {tails_0}};	// @[InputUnit.scala:87:24]
  wire [1:0]      mem_MPORT_addr = _GEN[io_enq_0_bits_virt_channel_id];
  wire            _T_2 = io_enq_0_valid & direct_to_q;	// @[InputUnit.scala:96:62, :107:34]
  wire            can_to_q_0 = ~empty_0 & _qs_0_io_enq_ready;	// @[InputUnit.scala:88:49, :90:49, :117:{60,70}]
  wire            can_to_q_1 = ~empty_1 & _qs_1_io_enq_ready;	// @[InputUnit.scala:88:49, :90:49, :117:{60,70}]
  wire            can_to_q_2 = ~empty_2 & _qs_2_io_enq_ready;	// @[InputUnit.scala:88:49, :90:49, :117:{60,70}]
  wire            can_to_q_3 = ~empty_3 & _qs_3_io_enq_ready;	// @[InputUnit.scala:88:49, :90:49, :117:{60,70}]
  wire            can_to_q_4 = ~empty_4 & _qs_4_io_enq_ready;	// @[InputUnit.scala:88:49, :90:49, :117:{60,70}]
  wire [4:0]      to_q_oh_enc = can_to_q_0 ? 5'h1 : can_to_q_1 ? 5'h2 : can_to_q_2 ? 5'h4 : can_to_q_3 ? 5'h8 : {can_to_q_4, 4'h0};	// @[InputUnit.scala:117:70, Mux.scala:47:70]
  wire            _T_11 = can_to_q_0 | can_to_q_1 | can_to_q_2 | can_to_q_3 | can_to_q_4;	// @[InputUnit.scala:117:70, package.scala:73:59]
  wire [1:0]      head = (to_q_oh_enc[0] ? heads_0 : 2'h0) | (to_q_oh_enc[1] ? heads_1 : 2'h0) | (to_q_oh_enc[2] ? heads_2 : 2'h0) | (to_q_oh_enc[3] ? heads_3 : 2'h0) | (to_q_oh_enc[4] ? heads_4 : 2'h0);	// @[InputUnit.scala:86:{24,32}, Mux.scala:27:73, :47:70, OneHot.scala:82:30]
  wire            _GEN_0 = _T_11 & to_q_oh_enc[0];	// @[InputUnit.scala:100:44, :120:27, :127:29, :128:32, Mux.scala:47:70, OneHot.scala:82:30, package.scala:73:59]
  wire            _GEN_1 = _T_11 & to_q_oh_enc[1];	// @[InputUnit.scala:100:44, :120:27, :127:29, :128:32, Mux.scala:47:70, OneHot.scala:82:30, package.scala:73:59]
  wire            _GEN_2 = _T_11 & to_q_oh_enc[2];	// @[InputUnit.scala:100:44, :120:27, :127:29, :128:32, Mux.scala:47:70, OneHot.scala:82:30, package.scala:73:59]
  wire            _GEN_3 = _T_11 & to_q_oh_enc[3];	// @[InputUnit.scala:100:44, :120:27, :127:29, :128:32, Mux.scala:47:70, OneHot.scala:82:30, package.scala:73:59]
  wire            _GEN_4 = _T_11 & to_q_oh_enc[4];	// @[InputUnit.scala:100:44, :120:27, :127:29, :128:32, Mux.scala:47:70, OneHot.scala:82:30, package.scala:73:59]
  wire            _tails_T_14 = mem_MPORT_addr == {2{_tails_T_19}};	// @[InputUnit.scala:104:14, Mux.scala:27:73, :29:36]
  wire [1:0]      _tails_T_30 = mem_MPORT_addr + 2'h1;	// @[InputUnit.scala:103:45, :106:14]
  wire [2:0]      to_q = {to_q_oh_enc[4], |(to_q_oh_enc[3:2]), to_q_oh_enc[3] | to_q_oh_enc[1]};	// @[Cat.scala:33:92, Mux.scala:47:70, OneHot.scala:30:18, :31:18, :32:{14,28}]
  wire            _heads_T_9 = head == {2{to_q_oh_enc[4]}};	// @[InputUnit.scala:123:16, Mux.scala:27:73, :47:70, OneHot.scala:82:30]
  wire [1:0]      _heads_T_20 = head + 2'h1;	// @[InputUnit.scala:103:45, :125:16, Mux.scala:27:73]
  always @(posedge clock) begin
    if (reset) begin
      heads_0 <= 2'h0;	// @[InputUnit.scala:86:{24,32}]
      heads_1 <= 2'h0;	// @[InputUnit.scala:86:{24,32}]
      heads_2 <= 2'h0;	// @[InputUnit.scala:86:{24,32}]
      heads_3 <= 2'h0;	// @[InputUnit.scala:86:{24,32}]
      heads_4 <= 2'h0;	// @[InputUnit.scala:86:{24,32}]
      tails_0 <= 2'h0;	// @[InputUnit.scala:86:32, :87:24]
      tails_1 <= 2'h0;	// @[InputUnit.scala:86:32, :87:24]
      tails_2 <= 2'h0;	// @[InputUnit.scala:86:32, :87:24]
      tails_3 <= 2'h0;	// @[InputUnit.scala:86:32, :87:24]
      tails_4 <= 2'h0;	// @[InputUnit.scala:86:32, :87:24]
    end
    else begin
      if (_T_11 & to_q == 3'h0) begin	// @[Cat.scala:33:92, InputUnit.scala:86:24, :120:27, :122:21, package.scala:73:59]
        if (_heads_T_9)	// @[InputUnit.scala:123:16]
          heads_0 <= 2'h0;	// @[InputUnit.scala:86:{24,32}]
        else	// @[InputUnit.scala:123:16]
          heads_0 <= _heads_T_20;	// @[InputUnit.scala:86:24, :125:16]
      end
      if (_T_11 & to_q == 3'h1) begin	// @[Cat.scala:33:92, InputUnit.scala:86:24, :103:45, :120:27, :122:21, package.scala:73:59]
        if (_heads_T_9)	// @[InputUnit.scala:123:16]
          heads_1 <= 2'h0;	// @[InputUnit.scala:86:{24,32}]
        else	// @[InputUnit.scala:123:16]
          heads_1 <= _heads_T_20;	// @[InputUnit.scala:86:24, :125:16]
      end
      if (_T_11 & to_q == 3'h2) begin	// @[Cat.scala:33:92, InputUnit.scala:86:24, :103:45, :120:27, :122:21, package.scala:73:59]
        if (_heads_T_9)	// @[InputUnit.scala:123:16]
          heads_2 <= 2'h0;	// @[InputUnit.scala:86:{24,32}]
        else	// @[InputUnit.scala:123:16]
          heads_2 <= _heads_T_20;	// @[InputUnit.scala:86:24, :125:16]
      end
      if (_T_11 & to_q == 3'h3) begin	// @[Cat.scala:33:92, InputUnit.scala:86:24, :103:45, :120:27, :122:21, package.scala:73:59]
        if (_heads_T_9)	// @[InputUnit.scala:123:16]
          heads_3 <= 2'h0;	// @[InputUnit.scala:86:{24,32}]
        else	// @[InputUnit.scala:123:16]
          heads_3 <= _heads_T_20;	// @[InputUnit.scala:86:24, :125:16]
      end
      if (_T_11 & to_q == 3'h4) begin	// @[Cat.scala:33:92, InputUnit.scala:86:24, :109:46, :120:27, :122:21, package.scala:73:59]
        if (_heads_T_9)	// @[InputUnit.scala:123:16]
          heads_4 <= 2'h0;	// @[InputUnit.scala:86:{24,32}]
        else	// @[InputUnit.scala:123:16]
          heads_4 <= _heads_T_20;	// @[InputUnit.scala:86:24, :125:16]
      end
      if (mem_MPORT_en & ~(|io_enq_0_bits_virt_channel_id)) begin	// @[InputUnit.scala:87:24, :100:{27,44}, :103:45]
        if (_tails_T_14)	// @[InputUnit.scala:104:14]
          tails_0 <= 2'h0;	// @[InputUnit.scala:86:32, :87:24]
        else	// @[InputUnit.scala:104:14]
          tails_0 <= _tails_T_30;	// @[InputUnit.scala:87:24, :106:14]
      end
      if (mem_MPORT_en & io_enq_0_bits_virt_channel_id == 3'h1) begin	// @[InputUnit.scala:87:24, :100:{27,44}, :103:45]
        if (_tails_T_14)	// @[InputUnit.scala:104:14]
          tails_1 <= 2'h0;	// @[InputUnit.scala:86:32, :87:24]
        else	// @[InputUnit.scala:104:14]
          tails_1 <= _tails_T_30;	// @[InputUnit.scala:87:24, :106:14]
      end
      if (mem_MPORT_en & io_enq_0_bits_virt_channel_id == 3'h2) begin	// @[InputUnit.scala:87:24, :100:{27,44}, :103:45]
        if (_tails_T_14)	// @[InputUnit.scala:104:14]
          tails_2 <= 2'h0;	// @[InputUnit.scala:86:32, :87:24]
        else	// @[InputUnit.scala:104:14]
          tails_2 <= _tails_T_30;	// @[InputUnit.scala:87:24, :106:14]
      end
      if (mem_MPORT_en & io_enq_0_bits_virt_channel_id == 3'h3) begin	// @[InputUnit.scala:87:24, :100:{27,44}, :103:45]
        if (_tails_T_14)	// @[InputUnit.scala:104:14]
          tails_3 <= 2'h0;	// @[InputUnit.scala:86:32, :87:24]
        else	// @[InputUnit.scala:104:14]
          tails_3 <= _tails_T_30;	// @[InputUnit.scala:87:24, :106:14]
      end
      if (mem_MPORT_en & io_enq_0_bits_virt_channel_id == 3'h4) begin	// @[InputUnit.scala:87:24, :100:{27,44}, :103:45, :109:46]
        if (_tails_T_14)	// @[InputUnit.scala:104:14]
          tails_4 <= 2'h0;	// @[InputUnit.scala:86:32, :87:24]
        else	// @[InputUnit.scala:104:14]
          tails_4 <= _tails_T_30;	// @[InputUnit.scala:87:24, :106:14]
      end
    end
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
        heads_0 = _RANDOM_0[1:0];	// @[InputUnit.scala:86:24]
        heads_1 = _RANDOM_0[3:2];	// @[InputUnit.scala:86:24]
        heads_2 = _RANDOM_0[5:4];	// @[InputUnit.scala:86:24]
        heads_3 = _RANDOM_0[7:6];	// @[InputUnit.scala:86:24]
        heads_4 = _RANDOM_0[9:8];	// @[InputUnit.scala:86:24]
        tails_0 = _RANDOM_0[11:10];	// @[InputUnit.scala:86:24, :87:24]
        tails_1 = _RANDOM_0[13:12];	// @[InputUnit.scala:86:24, :87:24]
        tails_2 = _RANDOM_0[15:14];	// @[InputUnit.scala:86:24, :87:24]
        tails_3 = _RANDOM_0[17:16];	// @[InputUnit.scala:86:24, :87:24]
        tails_4 = _RANDOM_0[19:18];	// @[InputUnit.scala:86:24, :87:24]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  mem_combMem mem_ext (	// @[InputUnit.scala:85:18]
    .R0_addr (head),	// @[Mux.scala:27:73]
    .R0_en   (_T_11 & to_q_oh_enc[0]),	// @[InputUnit.scala:85:18, :120:27, :127:29, Mux.scala:47:70, OneHot.scala:82:30, package.scala:73:59]
    .R0_clk  (clock),
    .R1_addr (head),	// @[Mux.scala:27:73]
    .R1_en   (_T_11 & to_q_oh_enc[1]),	// @[InputUnit.scala:85:18, :120:27, :127:29, Mux.scala:47:70, OneHot.scala:82:30, package.scala:73:59]
    .R1_clk  (clock),
    .R2_addr (head),	// @[Mux.scala:27:73]
    .R2_en   (_T_11 & to_q_oh_enc[2]),	// @[InputUnit.scala:85:18, :120:27, :127:29, Mux.scala:47:70, OneHot.scala:82:30, package.scala:73:59]
    .R2_clk  (clock),
    .R3_addr (head),	// @[Mux.scala:27:73]
    .R3_en   (_T_11 & to_q_oh_enc[3]),	// @[InputUnit.scala:85:18, :120:27, :127:29, Mux.scala:47:70, OneHot.scala:82:30, package.scala:73:59]
    .R3_clk  (clock),
    .R4_addr (head),	// @[Mux.scala:27:73]
    .R4_en   (_T_11 & to_q_oh_enc[4]),	// @[InputUnit.scala:85:18, :120:27, :127:29, Mux.scala:47:70, OneHot.scala:82:30, package.scala:73:59]
    .R4_clk  (clock),
    .W0_addr (mem_MPORT_addr),
    .W0_en   (mem_MPORT_en),	// @[InputUnit.scala:100:27]
    .W0_clk  (clock),
    .W0_data ({io_enq_0_bits_payload, io_enq_0_bits_tail, io_enq_0_bits_head}),	// @[InputUnit.scala:85:18]
    .R0_data (_mem_ext_R0_data),
    .R1_data (_mem_ext_R1_data),
    .R2_data (_mem_ext_R2_data),
    .R3_data (_mem_ext_R3_data),
    .R4_data (_mem_ext_R4_data)
  );
  Queue qs_0 (	// @[InputUnit.scala:90:49]
    .clock               (clock),
    .reset               (reset),
    .io_enq_valid        (_GEN_0 | ~mem_MPORT_en & _T_2 & ~(|io_enq_0_bits_virt_channel_id)),	// @[InputUnit.scala:91:31, :100:{27,44}, :103:45, :107:{34,50}, :109:46, :120:27, :127:29, :128:32]
    .io_enq_bits_head    (_GEN_0 ? _mem_ext_R0_data[0] : io_enq_0_bits_head),	// @[InputUnit.scala:85:18, :100:44, :120:27, :127:29, :128:32, :129:31]
    .io_enq_bits_tail    (_GEN_0 ? _mem_ext_R0_data[1] : io_enq_0_bits_tail),	// @[InputUnit.scala:85:18, :100:44, :120:27, :127:29, :128:32, :129:31]
    .io_enq_bits_payload (_GEN_0 ? _mem_ext_R0_data[74:2] : io_enq_0_bits_payload),	// @[InputUnit.scala:85:18, :100:44, :120:27, :127:29, :128:32, :129:31]
    .io_deq_ready        (1'h0),
    .io_enq_ready        (_qs_0_io_enq_ready),
    .io_deq_valid        (_qs_0_io_deq_valid),
    .io_deq_bits_head    (io_deq_0_bits_head),
    .io_deq_bits_tail    (io_deq_0_bits_tail),
    .io_deq_bits_payload (io_deq_0_bits_payload)
  );
  Queue qs_1 (	// @[InputUnit.scala:90:49]
    .clock               (clock),
    .reset               (reset),
    .io_enq_valid        (_GEN_1 | ~mem_MPORT_en & _T_2 & io_enq_0_bits_virt_channel_id == 3'h1),	// @[InputUnit.scala:91:31, :100:{27,44}, :103:45, :107:{34,50}, :109:46, :120:27, :127:29, :128:32]
    .io_enq_bits_head    (_GEN_1 ? _mem_ext_R1_data[0] : io_enq_0_bits_head),	// @[InputUnit.scala:85:18, :100:44, :120:27, :127:29, :128:32, :129:31]
    .io_enq_bits_tail    (_GEN_1 ? _mem_ext_R1_data[1] : io_enq_0_bits_tail),	// @[InputUnit.scala:85:18, :100:44, :120:27, :127:29, :128:32, :129:31]
    .io_enq_bits_payload (_GEN_1 ? _mem_ext_R1_data[74:2] : io_enq_0_bits_payload),	// @[InputUnit.scala:85:18, :100:44, :120:27, :127:29, :128:32, :129:31]
    .io_deq_ready        (1'h0),
    .io_enq_ready        (_qs_1_io_enq_ready),
    .io_deq_valid        (_qs_1_io_deq_valid),
    .io_deq_bits_head    (io_deq_1_bits_head),
    .io_deq_bits_tail    (io_deq_1_bits_tail),
    .io_deq_bits_payload (io_deq_1_bits_payload)
  );
  Queue qs_2 (	// @[InputUnit.scala:90:49]
    .clock               (clock),
    .reset               (reset),
    .io_enq_valid        (_GEN_2 | ~mem_MPORT_en & _T_2 & io_enq_0_bits_virt_channel_id == 3'h2),	// @[InputUnit.scala:91:31, :100:{27,44}, :103:45, :107:{34,50}, :109:46, :120:27, :127:29, :128:32]
    .io_enq_bits_head    (_GEN_2 ? _mem_ext_R2_data[0] : io_enq_0_bits_head),	// @[InputUnit.scala:85:18, :100:44, :120:27, :127:29, :128:32, :129:31]
    .io_enq_bits_tail    (_GEN_2 ? _mem_ext_R2_data[1] : io_enq_0_bits_tail),	// @[InputUnit.scala:85:18, :100:44, :120:27, :127:29, :128:32, :129:31]
    .io_enq_bits_payload (_GEN_2 ? _mem_ext_R2_data[74:2] : io_enq_0_bits_payload),	// @[InputUnit.scala:85:18, :100:44, :120:27, :127:29, :128:32, :129:31]
    .io_deq_ready        (1'h0),
    .io_enq_ready        (_qs_2_io_enq_ready),
    .io_deq_valid        (_qs_2_io_deq_valid),
    .io_deq_bits_head    (io_deq_2_bits_head),
    .io_deq_bits_tail    (io_deq_2_bits_tail),
    .io_deq_bits_payload (io_deq_2_bits_payload)
  );
  Queue qs_3 (	// @[InputUnit.scala:90:49]
    .clock               (clock),
    .reset               (reset),
    .io_enq_valid        (_GEN_3 | ~mem_MPORT_en & _T_2 & io_enq_0_bits_virt_channel_id == 3'h3),	// @[InputUnit.scala:91:31, :100:{27,44}, :103:45, :107:{34,50}, :109:46, :120:27, :127:29, :128:32]
    .io_enq_bits_head    (_GEN_3 ? _mem_ext_R3_data[0] : io_enq_0_bits_head),	// @[InputUnit.scala:85:18, :100:44, :120:27, :127:29, :128:32, :129:31]
    .io_enq_bits_tail    (_GEN_3 ? _mem_ext_R3_data[1] : io_enq_0_bits_tail),	// @[InputUnit.scala:85:18, :100:44, :120:27, :127:29, :128:32, :129:31]
    .io_enq_bits_payload (_GEN_3 ? _mem_ext_R3_data[74:2] : io_enq_0_bits_payload),	// @[InputUnit.scala:85:18, :100:44, :120:27, :127:29, :128:32, :129:31]
    .io_deq_ready        (1'h0),
    .io_enq_ready        (_qs_3_io_enq_ready),
    .io_deq_valid        (_qs_3_io_deq_valid),
    .io_deq_bits_head    (io_deq_3_bits_head),
    .io_deq_bits_tail    (io_deq_3_bits_tail),
    .io_deq_bits_payload (io_deq_3_bits_payload)
  );
  Queue qs_4 (	// @[InputUnit.scala:90:49]
    .clock               (clock),
    .reset               (reset),
    .io_enq_valid        (_GEN_4 | ~mem_MPORT_en & _T_2 & io_enq_0_bits_virt_channel_id == 3'h4),	// @[InputUnit.scala:91:31, :100:{27,44}, :107:{34,50}, :109:46, :120:27, :127:29, :128:32]
    .io_enq_bits_head    (_GEN_4 ? _mem_ext_R4_data[0] : io_enq_0_bits_head),	// @[InputUnit.scala:85:18, :100:44, :120:27, :127:29, :128:32, :129:31]
    .io_enq_bits_tail    (_GEN_4 ? _mem_ext_R4_data[1] : io_enq_0_bits_tail),	// @[InputUnit.scala:85:18, :100:44, :120:27, :127:29, :128:32, :129:31]
    .io_enq_bits_payload (_GEN_4 ? _mem_ext_R4_data[74:2] : io_enq_0_bits_payload),	// @[InputUnit.scala:85:18, :100:44, :120:27, :127:29, :128:32, :129:31]
    .io_deq_ready        (io_deq_4_ready),
    .io_enq_ready        (_qs_4_io_enq_ready),
    .io_deq_valid        (io_deq_4_valid),
    .io_deq_bits_head    (io_deq_4_bits_head),
    .io_deq_bits_tail    (io_deq_4_bits_tail),
    .io_deq_bits_payload (io_deq_4_bits_payload)
  );
endmodule

