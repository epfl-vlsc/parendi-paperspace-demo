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

module SourceC(
  input         clock,
                reset,
                io_req_valid,
  input  [2:0]  io_req_bits_opcode,
                io_req_bits_param,
                io_req_bits_source,
  input  [3:0]  io_req_bits_tag,
  input  [6:0]  io_req_bits_set,
  input  [2:0]  io_req_bits_way,
  input         io_req_bits_dirty,
                io_c_ready,
                io_bs_adr_ready,
  input  [63:0] io_bs_dat_data,
  input         io_evict_safe,
  output        io_req_ready,
                io_c_valid,
  output [2:0]  io_c_bits_opcode,
                io_c_bits_size,
                io_c_bits_source,
  output [31:0] io_c_bits_address,
  output [63:0] io_c_bits_data,
  output        io_c_bits_corrupt,
                io_bs_adr_valid,
  output [2:0]  io_bs_adr_bits_way,
  output [6:0]  io_bs_adr_bits_set,
  output [2:0]  io_bs_adr_bits_beat,
  output [6:0]  io_evict_req_set,
  output [2:0]  io_evict_req_way
);

  wire       _queue_io_enq_ready;	// @[SourceC.scala:54:21]
  wire       _queue_io_deq_valid;	// @[SourceC.scala:54:21]
  wire [3:0] _queue_io_count;	// @[SourceC.scala:54:21]
  reg  [3:0] fill;	// @[SourceC.scala:58:21]
  reg        room;	// @[SourceC.scala:59:21]
  reg        busy;	// @[SourceC.scala:66:21]
  reg  [2:0] beat;	// @[SourceC.scala:67:21]
  reg  [2:0] req_r_opcode;	// @[Reg.scala:19:16]
  reg  [2:0] req_r_param;	// @[Reg.scala:19:16]
  reg  [2:0] req_r_source;	// @[Reg.scala:19:16]
  reg  [3:0] req_r_tag;	// @[Reg.scala:19:16]
  reg  [6:0] req_r_set;	// @[Reg.scala:19:16]
  reg  [2:0] req_r_way;	// @[Reg.scala:19:16]
  wire [6:0] req_set = busy ? req_r_set : io_req_bits_set;	// @[Reg.scala:19:16, SourceC.scala:66:21, :69:17]
  wire [2:0] req_way = busy ? req_r_way : io_req_bits_way;	// @[Reg.scala:19:16, SourceC.scala:66:21, :69:17]
  wire       _T_14 = io_req_valid & room;	// @[SourceC.scala:59:21, :70:41]
  wire       want_data = busy | _T_14 & io_req_bits_dirty;	// @[SourceC.scala:66:21, :70:{24,41,49}]
  wire       _io_req_ready_output = ~busy & room;	// @[SourceC.scala:59:21, :66:21, :69:18, :72:25]
  wire       _io_bs_adr_valid_output = ((|beat) | io_evict_safe) & want_data;	// @[SourceC.scala:67:21, :70:24, :77:{28,32,50}]
  reg        s2_valid;	// @[SourceC.scala:94:25]
  reg  [2:0] s2_req_opcode;	// @[Reg.scala:19:16]
  reg  [2:0] s2_req_param;	// @[Reg.scala:19:16]
  reg  [2:0] s2_req_source;	// @[Reg.scala:19:16]
  reg  [3:0] s2_req_tag;	// @[Reg.scala:19:16]
  reg  [6:0] s2_req_set;	// @[Reg.scala:19:16]
  reg        s3_valid;	// @[SourceC.scala:100:25]
  reg  [2:0] s3_req_opcode;	// @[Reg.scala:19:16]
  reg  [2:0] s3_req_param;	// @[Reg.scala:19:16]
  reg  [2:0] s3_req_source;	// @[Reg.scala:19:16]
  reg  [3:0] s3_req_tag;	// @[Reg.scala:19:16]
  reg  [6:0] s3_req_set;	// @[Reg.scala:19:16]
  wire       _room_T_4 = _queue_io_enq_ready & s3_valid;	// @[Decoupled.scala:51:35, SourceC.scala:54:21, :100:25]
  wire       _s2_latch_T = io_bs_adr_ready & _io_bs_adr_valid_output;	// @[Decoupled.scala:51:35, SourceC.scala:77:50]
  wire       _s2_latch_T_1 = _io_req_ready_output & io_req_valid;	// @[Decoupled.scala:51:35, SourceC.scala:72:25]
  always @(posedge clock) begin
    if (reset) begin
      fill <= 4'h0;	// @[SourceC.scala:58:21]
      room <= 1'h1;	// @[SourceC.scala:59:21]
      busy <= 1'h0;	// @[SourceC.scala:62:18, :66:21]
      beat <= 3'h0;	// @[SourceC.scala:67:21]
    end
    else begin
      if (_room_T_4 != (io_c_ready & _queue_io_deq_valid)) begin	// @[Decoupled.scala:51:35, SourceC.scala:54:21, :60:27]
        fill <= fill + (_room_T_4 ? 4'h1 : 4'hF);	// @[Decoupled.scala:51:35, SourceC.scala:58:21, :61:{18,23,48}]
        room <= fill == 4'h0 | (fill == 4'h1 | fill == 4'h2) & ~_room_T_4;	// @[Decoupled.scala:51:35, SourceC.scala:58:21, :59:21, :61:23, :62:{18,26,36,44,52,61,64}]
      end
      busy <= ~(_s2_latch_T & (&beat)) & (_T_14 & io_req_bits_dirty | busy);	// @[Decoupled.scala:51:35, SourceC.scala:66:21, :67:21, :68:19, :70:41, :87:{30,52,59}, :88:25, :89:{17,24}]
      if (_s2_latch_T)	// @[Decoupled.scala:51:35]
        beat <= beat + 3'h1;	// @[SourceC.scala:61:23, :67:21, :90:18]
    end
    if (~busy & io_req_valid) begin	// @[SourceC.scala:66:21, :69:{18,67}]
      req_r_opcode <= io_req_bits_opcode;	// @[Reg.scala:19:16]
      req_r_param <= io_req_bits_param;	// @[Reg.scala:19:16]
      req_r_source <= io_req_bits_source;	// @[Reg.scala:19:16]
      req_r_tag <= io_req_bits_tag;	// @[Reg.scala:19:16]
      req_r_set <= io_req_bits_set;	// @[Reg.scala:19:16]
      req_r_way <= io_req_bits_way;	// @[Reg.scala:19:16]
    end
    if (want_data)	// @[SourceC.scala:70:24]
      s2_valid <= _s2_latch_T;	// @[Decoupled.scala:51:35, SourceC.scala:94:25]
    else	// @[SourceC.scala:70:24]
      s2_valid <= _s2_latch_T_1;	// @[Decoupled.scala:51:35, SourceC.scala:94:25]
    if (want_data ? _s2_latch_T : _s2_latch_T_1) begin	// @[Decoupled.scala:51:35, SourceC.scala:70:24, :93:21]
      if (busy) begin	// @[SourceC.scala:66:21]
        s2_req_opcode <= req_r_opcode;	// @[Reg.scala:19:16]
        s2_req_param <= req_r_param;	// @[Reg.scala:19:16]
        s2_req_source <= req_r_source;	// @[Reg.scala:19:16]
        s2_req_tag <= req_r_tag;	// @[Reg.scala:19:16]
        s2_req_set <= req_r_set;	// @[Reg.scala:19:16]
      end
      else begin	// @[SourceC.scala:66:21]
        s2_req_opcode <= io_req_bits_opcode;	// @[Reg.scala:19:16]
        s2_req_param <= io_req_bits_param;	// @[Reg.scala:19:16]
        s2_req_source <= io_req_bits_source;	// @[Reg.scala:19:16]
        s2_req_tag <= io_req_bits_tag;	// @[Reg.scala:19:16]
        s2_req_set <= io_req_bits_set;	// @[Reg.scala:19:16]
      end
    end
    s3_valid <= s2_valid;	// @[SourceC.scala:94:25, :100:25]
    if (s2_valid) begin	// @[SourceC.scala:94:25]
      s3_req_opcode <= s2_req_opcode;	// @[Reg.scala:19:16]
      s3_req_param <= s2_req_param;	// @[Reg.scala:19:16]
      s3_req_source <= s2_req_source;	// @[Reg.scala:19:16]
      s3_req_tag <= s2_req_tag;	// @[Reg.scala:19:16]
      s3_req_set <= s2_req_set;	// @[Reg.scala:19:16]
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    always @(posedge clock) begin	// @[SourceC.scala:64:10]
      if (~reset & room != (_queue_io_count < 4'h2)) begin	// @[SourceC.scala:54:21, :59:21, :62:52, :64:{10,16,35}]
        if (`ASSERT_VERBOSE_COND_)	// @[SourceC.scala:64:10]
          $error("Assertion failed\n    at SourceC.scala:64 assert (room === queue.io.count <= 1.U)\n");	// @[SourceC.scala:64:10]
        if (`STOP_COND_)	// @[SourceC.scala:64:10]
          $fatal;	// @[SourceC.scala:64:10]
      end
      if (~reset & ~(~s3_valid | _queue_io_enq_ready)) begin	// @[SourceC.scala:54:21, :100:25, :116:{9,10,19}]
        if (`ASSERT_VERBOSE_COND_)	// @[SourceC.scala:116:9]
          $error("Assertion failed\n    at SourceC.scala:116 assert(!c.valid || c.ready)\n");	// @[SourceC.scala:116:9]
        if (`STOP_COND_)	// @[SourceC.scala:116:9]
          $fatal;	// @[SourceC.scala:116:9]
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
        fill = _RANDOM_0[3:0];	// @[SourceC.scala:58:21]
        room = _RANDOM_0[4];	// @[SourceC.scala:58:21, :59:21]
        busy = _RANDOM_0[5];	// @[SourceC.scala:58:21, :66:21]
        beat = _RANDOM_0[8:6];	// @[SourceC.scala:58:21, :67:21]
        req_r_opcode = _RANDOM_0[11:9];	// @[Reg.scala:19:16, SourceC.scala:58:21]
        req_r_param = _RANDOM_0[14:12];	// @[Reg.scala:19:16, SourceC.scala:58:21]
        req_r_source = _RANDOM_0[17:15];	// @[Reg.scala:19:16, SourceC.scala:58:21]
        req_r_tag = _RANDOM_0[21:18];	// @[Reg.scala:19:16, SourceC.scala:58:21]
        req_r_set = _RANDOM_0[28:22];	// @[Reg.scala:19:16, SourceC.scala:58:21]
        req_r_way = _RANDOM_0[31:29];	// @[Reg.scala:19:16, SourceC.scala:58:21]
        s2_valid = _RANDOM_1[1];	// @[SourceC.scala:94:25]
        s2_req_opcode = _RANDOM_1[4:2];	// @[Reg.scala:19:16, SourceC.scala:94:25]
        s2_req_param = _RANDOM_1[7:5];	// @[Reg.scala:19:16, SourceC.scala:94:25]
        s2_req_source = _RANDOM_1[10:8];	// @[Reg.scala:19:16, SourceC.scala:94:25]
        s2_req_tag = _RANDOM_1[14:11];	// @[Reg.scala:19:16, SourceC.scala:94:25]
        s2_req_set = _RANDOM_1[21:15];	// @[Reg.scala:19:16, SourceC.scala:94:25]
        s3_valid = _RANDOM_1[30];	// @[SourceC.scala:94:25, :100:25]
        s3_req_opcode = {_RANDOM_1[31], _RANDOM_2[1:0]};	// @[Reg.scala:19:16, SourceC.scala:94:25]
        s3_req_param = _RANDOM_2[4:2];	// @[Reg.scala:19:16]
        s3_req_source = _RANDOM_2[7:5];	// @[Reg.scala:19:16]
        s3_req_tag = _RANDOM_2[11:8];	// @[Reg.scala:19:16]
        s3_req_set = _RANDOM_2[18:12];	// @[Reg.scala:19:16]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  Queue_6488 queue (	// @[SourceC.scala:54:21]
    .clock               (clock),
    .reset               (reset),
    .io_enq_valid        (s3_valid),	// @[SourceC.scala:100:25]
    .io_enq_bits_opcode  (s3_req_opcode),	// @[Reg.scala:19:16]
    .io_enq_bits_param   (s3_req_param),	// @[Reg.scala:19:16]
    .io_enq_bits_source  (s3_req_source),	// @[Reg.scala:19:16]
    .io_enq_bits_address ({15'h0, s3_req_tag, s3_req_set, 6'h0}),	// @[Cat.scala:33:92, Parameters.scala:220:15, Reg.scala:19:16]
    .io_enq_bits_data    (io_bs_dat_data),
    .io_deq_ready        (io_c_ready),
    .io_enq_ready        (_queue_io_enq_ready),
    .io_deq_valid        (_queue_io_deq_valid),
    .io_deq_bits_opcode  (io_c_bits_opcode),
    .io_deq_bits_size    (io_c_bits_size),
    .io_deq_bits_source  (io_c_bits_source),
    .io_deq_bits_address (io_c_bits_address),
    .io_deq_bits_data    (io_c_bits_data),
    .io_deq_bits_corrupt (io_c_bits_corrupt),
    .io_count            (_queue_io_count)
  );
  assign io_req_ready = _io_req_ready_output;	// @[SourceC.scala:72:25]
  assign io_c_valid = _queue_io_deq_valid;	// @[SourceC.scala:54:21]
  assign io_bs_adr_valid = _io_bs_adr_valid_output;	// @[SourceC.scala:77:50]
  assign io_bs_adr_bits_way = req_way;	// @[SourceC.scala:69:17]
  assign io_bs_adr_bits_set = req_set;	// @[SourceC.scala:69:17]
  assign io_bs_adr_bits_beat = beat;	// @[SourceC.scala:67:21]
  assign io_evict_req_set = req_set;	// @[SourceC.scala:69:17]
  assign io_evict_req_way = req_way;	// @[SourceC.scala:69:17]
endmodule

