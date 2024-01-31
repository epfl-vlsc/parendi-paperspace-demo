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

module InclusiveCache(
  input         clock,
                reset,
                auto_ctl_in_a_valid,
  input  [2:0]  auto_ctl_in_a_bits_opcode,
  input  [1:0]  auto_ctl_in_a_bits_size,
  input  [11:0] auto_ctl_in_a_bits_source,
  input  [25:0] auto_ctl_in_a_bits_address,
  input  [7:0]  auto_ctl_in_a_bits_mask,
  input  [63:0] auto_ctl_in_a_bits_data,
  input         auto_ctl_in_d_ready,
                auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
                auto_in_a_bits_size,
  input  [7:0]  auto_in_a_bits_source,
  input  [31:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
                auto_in_b_ready,
                auto_in_c_valid,
  input  [2:0]  auto_in_c_bits_opcode,
                auto_in_c_bits_param,
                auto_in_c_bits_size,
  input  [7:0]  auto_in_c_bits_source,
  input  [31:0] auto_in_c_bits_address,
  input  [63:0] auto_in_c_bits_data,
  input         auto_in_c_bits_corrupt,
                auto_in_d_ready,
                auto_in_e_valid,
  input  [2:0]  auto_in_e_bits_sink,
  input         auto_out_a_ready,
                auto_out_c_ready,
                auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [2:0]  auto_out_d_bits_size,
                auto_out_d_bits_source,
                auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt,
  output        auto_ctl_in_a_ready,
                auto_ctl_in_d_valid,
  output [2:0]  auto_ctl_in_d_bits_opcode,
  output [1:0]  auto_ctl_in_d_bits_size,
  output [11:0] auto_ctl_in_d_bits_source,
  output [63:0] auto_ctl_in_d_bits_data,
  output        auto_in_a_ready,
                auto_in_b_valid,
  output [1:0]  auto_in_b_bits_param,
  output [7:0]  auto_in_b_bits_source,
  output [31:0] auto_in_b_bits_address,
  output        auto_in_c_ready,
                auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [2:0]  auto_in_d_bits_size,
  output [7:0]  auto_in_d_bits_source,
  output [2:0]  auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
                auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
                auto_out_a_bits_param,
                auto_out_a_bits_size,
                auto_out_a_bits_source,
  output [31:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
                auto_out_c_valid,
  output [2:0]  auto_out_c_bits_opcode,
                auto_out_c_bits_size,
                auto_out_c_bits_source,
  output [31:0] auto_out_c_bits_address,
  output [63:0] auto_out_c_bits_data,
  output        auto_out_c_bits_corrupt,
                auto_out_d_ready,
                auto_out_e_valid,
  output [2:0]  auto_out_e_bits_sink
);

  wire             _GEN;	// InclusiveCache.scala:130:34, :194:{26,41}
  wire             _out_wofireMux_T_2;	// RegisterRouter.scala:83:24
  wire             out_backSel_3;	// RegisterRouter.scala:83:24
  wire             out_backSel_2;	// RegisterRouter.scala:83:24
  wire [31:0]      _inclusive_cache_bank_sched_io_in_b_bits_address;	// InclusiveCache.scala:186:29
  wire [31:0]      _inclusive_cache_bank_sched_io_out_a_bits_address;	// InclusiveCache.scala:186:29
  wire [31:0]      _inclusive_cache_bank_sched_io_out_c_bits_address;	// InclusiveCache.scala:186:29
  wire             _inclusive_cache_bank_sched_io_req_ready;	// InclusiveCache.scala:186:29
  wire             _inclusive_cache_bank_sched_io_resp_valid;	// InclusiveCache.scala:186:29
  wire             _out_back_io_enq_ready;	// Decoupled.scala:375:21
  wire             _out_back_io_deq_valid;	// Decoupled.scala:375:21
  wire             _out_back_io_deq_bits_read;	// Decoupled.scala:375:21
  wire [8:0]       _out_back_io_deq_bits_index;	// Decoupled.scala:375:21
  wire [7:0]       _out_back_io_deq_bits_mask;	// Decoupled.scala:375:21
  wire [3:0][63:0] _GEN_0 = '{64'h0, 64'h0, 64'h0, 64'h6070801};	// MuxLiteral.scala:49:10
  reg              flushInValid;	// InclusiveCache.scala:127:33
  reg  [63:0]      flushInAddress;	// InclusiveCache.scala:129:29
  reg              flushOutValid;	// InclusiveCache.scala:131:33
  wire             _T = _GEN & flushInValid;	// InclusiveCache.scala:127:33, :130:34, :137:24, :194:{26,41}
  wire             out_front_bits_read = auto_ctl_in_a_bits_opcode == 3'h4;	// RegisterRouter.scala:72:36
  wire [6:0]       _GEN_1 =
    {auto_ctl_in_a_bits_address[11:10],
     auto_ctl_in_a_bits_address[8:7],
     auto_ctl_in_a_bits_address[5:3]};	// RegisterRouter.scala:83:24
  wire [6:0]       _GEN_2 =
    {_out_back_io_deq_bits_index[8:7],
     _out_back_io_deq_bits_index[5:4],
     _out_back_io_deq_bits_index[2:0]};	// Decoupled.scala:375:21, RegisterRouter.scala:83:24
  wire [7:0]       _out_frontMask_T_9 = {8{auto_ctl_in_a_bits_mask[0]}};	// Bitwise.scala:28:17, :77:12
  wire [7:0]       _out_frontMask_T_11 = {8{auto_ctl_in_a_bits_mask[1]}};	// Bitwise.scala:28:17, :77:12
  wire [7:0]       _out_frontMask_T_13 = {8{auto_ctl_in_a_bits_mask[2]}};	// Bitwise.scala:28:17, :77:12
  wire [7:0]       _out_frontMask_T_15 = {8{auto_ctl_in_a_bits_mask[3]}};	// Bitwise.scala:28:17, :77:12
  wire [63:0]      out_frontMask =
    {{8{auto_ctl_in_a_bits_mask[7]}},
     {8{auto_ctl_in_a_bits_mask[6]}},
     {8{auto_ctl_in_a_bits_mask[5]}},
     {8{auto_ctl_in_a_bits_mask[4]}},
     _out_frontMask_T_15,
     _out_frontMask_T_13,
     _out_frontMask_T_11,
     _out_frontMask_T_9};	// Bitwise.scala:28:17, :77:12, Cat.scala:33:92
  wire [7:0]       _out_backMask_T_9 = {8{_out_back_io_deq_bits_mask[0]}};	// Bitwise.scala:28:17, :77:12, Decoupled.scala:375:21
  wire [7:0]       _out_backMask_T_11 = {8{_out_back_io_deq_bits_mask[1]}};	// Bitwise.scala:28:17, :77:12, Decoupled.scala:375:21
  wire [7:0]       _out_backMask_T_13 = {8{_out_back_io_deq_bits_mask[2]}};	// Bitwise.scala:28:17, :77:12, Decoupled.scala:375:21
  wire [7:0]       _out_backMask_T_15 = {8{_out_back_io_deq_bits_mask[3]}};	// Bitwise.scala:28:17, :77:12, Decoupled.scala:375:21
  wire [63:0]      out_backMask =
    {{8{_out_back_io_deq_bits_mask[7]}},
     {8{_out_back_io_deq_bits_mask[6]}},
     {8{_out_back_io_deq_bits_mask[5]}},
     {8{_out_back_io_deq_bits_mask[4]}},
     _out_backMask_T_15,
     _out_backMask_T_13,
     _out_backMask_T_11,
     _out_backMask_T_9};	// Bitwise.scala:28:17, :77:12, Cat.scala:33:92, Decoupled.scala:375:21
  wire [31:0]      _out_wimask_T_5 =
    {_out_frontMask_T_15, _out_frontMask_T_13, _out_frontMask_T_11, _out_frontMask_T_9};	// Bitwise.scala:77:12, RegisterRouter.scala:83:24
  wire [31:0]      _out_womask_T_5 =
    {_out_backMask_T_15, _out_backMask_T_13, _out_backMask_T_11, _out_backMask_T_9};	// Bitwise.scala:77:12, RegisterRouter.scala:83:24
  wire [1:0]       out_oindex =
    {_out_back_io_deq_bits_index[6], _out_back_io_deq_bits_index[3]};	// Cat.scala:33:92, Decoupled.scala:375:21, RegisterRouter.scala:83:24
  wire [1:0]       _GEN_3 =
    {auto_ctl_in_a_bits_address[9], auto_ctl_in_a_bits_address[6]};	// OneHot.scala:57:35, RegisterRouter.scala:83:24
  wire [1:0]       _GEN_4 =
    {_out_back_io_deq_bits_index[6], _out_back_io_deq_bits_index[3]};	// Decoupled.scala:375:21, OneHot.scala:57:35, RegisterRouter.scala:83:24
  assign out_backSel_2 = _GEN_4 == 2'h2;	// OneHot.scala:57:35, RegisterRouter.scala:83:24
  assign out_backSel_3 = &_GEN_4;	// OneHot.scala:57:35, RegisterRouter.scala:83:24
  wire             _out_wifireMux_T_2 =
    auto_ctl_in_a_valid & _out_back_io_enq_ready & ~out_front_bits_read;	// Decoupled.scala:375:21, RegisterRouter.scala:72:36, :83:24
  wire [3:0]       _GEN_5 =
    {{~flushInValid | ~(&_out_wimask_T_5) | (|_GEN_1)},
     {~flushInValid | ~(&out_frontMask) | (|_GEN_1)},
     {1'h1},
     {1'h1}};	// Cat.scala:33:92, InclusiveCache.scala:127:33, :152:23, MuxLiteral.scala:49:10, RegisterRouter.scala:83:24
  assign _out_wofireMux_T_2 =
    _out_back_io_deq_valid & auto_ctl_in_d_ready & ~_out_back_io_deq_bits_read;	// Decoupled.scala:375:21, RegisterRouter.scala:83:24
  wire [3:0]       _GEN_6 =
    {{flushOutValid | ~(&_out_womask_T_5) | (|_GEN_2)},
     {flushOutValid | ~(&out_backMask) | (|_GEN_2)},
     {1'h1},
     {1'h1}};	// Cat.scala:33:92, InclusiveCache.scala:131:33, MuxLiteral.scala:49:10, RegisterRouter.scala:83:24
  wire             out_iready =
    out_front_bits_read
    | _GEN_5[{auto_ctl_in_a_bits_address[9], auto_ctl_in_a_bits_address[6]}];	// Cat.scala:33:92, MuxLiteral.scala:49:10, RegisterRouter.scala:72:36, :83:24
  wire             out_oready = _out_back_io_deq_bits_read | _GEN_6[out_oindex];	// Cat.scala:33:92, Decoupled.scala:375:21, MuxLiteral.scala:49:10, RegisterRouter.scala:83:24
  wire [3:0]       _GEN_7 = {{~(|_GEN_2)}, {~(|_GEN_2)}, {1'h1}, {~(|_GEN_2)}};	// MuxLiteral.scala:49:10, RegisterRouter.scala:83:24
  wire             flushSelect = flushInAddress[63:17] == 47'h4000;	// InclusiveCache.scala:129:29, Parameters.scala:137:{31,65}
  assign _GEN = ~flushSelect;	// InclusiveCache.scala:130:34, :194:{26,41}, Parameters.scala:137:65
  wire             out_f_wivalid_4 =
    _out_wifireMux_T_2 & _GEN_3 == 2'h2 & ~(|_GEN_1) & (&out_frontMask);	// Cat.scala:33:92, OneHot.scala:57:35, RegisterRouter.scala:83:24
  wire             out_f_wivalid_5 =
    _out_wifireMux_T_2 & (&_GEN_3) & ~(|_GEN_1) & (&_out_wimask_T_5);	// OneHot.scala:57:35, RegisterRouter.scala:83:24
  always @(posedge clock) begin
    if (reset) begin
      flushInValid <= 1'h0;	// InclusiveCache.scala:127:33
      flushOutValid <= 1'h0;	// InclusiveCache.scala:131:33
    end
    else begin
      flushInValid <=
        out_f_wivalid_5 | out_f_wivalid_4
        | ~(flushSelect & _inclusive_cache_bank_sched_io_req_ready | _T) & flushInValid;	// InclusiveCache.scala:127:33, :135:{26,42}, :137:{24,41}, :144:{21,36}, :151:{21,36}, :186:29, :196:{25,53,68}, Parameters.scala:137:65, RegisterRouter.scala:83:24
      flushOutValid <=
        _inclusive_cache_bank_sched_io_resp_valid | _T
        | ~(_out_wofireMux_T_2 & out_backSel_3 & ~(|_GEN_2) & (&_out_womask_T_5)
            | _out_wofireMux_T_2 & out_backSel_2 & ~(|_GEN_2) & (&out_backMask))
        & flushOutValid;	// Cat.scala:33:92, InclusiveCache.scala:131:33, :134:{26,42}, :137:{24,41}, :139:21, :143:{21,37}, :150:21, :186:29, :197:{38,54}, RegisterRouter.scala:83:24
    end
    if (out_f_wivalid_5 & ~flushInValid)	// InclusiveCache.scala:127:33, :145:20, :152:23, RegisterRouter.scala:83:24
      flushInAddress <= {28'h0, auto_ctl_in_a_bits_data[31:0], 4'h0};	// InclusiveCache.scala:129:29, :145:{55,63}, RegisterRouter.scala:83:24
    else if (out_f_wivalid_4 & ~flushInValid)	// InclusiveCache.scala:127:33, :152:{20,23}, RegisterRouter.scala:83:24
      flushInAddress <= auto_ctl_in_a_bits_data;	// InclusiveCache.scala:129:29
  end // always @(posedge)
  `ifndef SYNTHESIS
    always @(posedge clock) begin	// InclusiveCache.scala:198:14
      if (~reset & ~(~_inclusive_cache_bank_sched_io_resp_valid | flushSelect)) begin	// InclusiveCache.scala:186:29, :198:{14,15,40}, Parameters.scala:137:65
        if (`ASSERT_VERBOSE_COND_)	// InclusiveCache.scala:198:14
          $error("Assertion failed\n    at InclusiveCache.scala:198 assert (!scheduler.io.resp.valid || flushSelect)\n");	// InclusiveCache.scala:198:14
        if (`STOP_COND_)	// InclusiveCache.scala:198:14
          $fatal;	// InclusiveCache.scala:198:14
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
        flushInValid = _RANDOM_0[0];	// InclusiveCache.scala:127:33
        flushInAddress = {_RANDOM_0[31:1], _RANDOM_1, _RANDOM_2[0]};	// InclusiveCache.scala:127:33, :129:29
        flushOutValid = _RANDOM_2[1];	// InclusiveCache.scala:129:29, :131:33
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  Queue_1926 out_back (	// Decoupled.scala:375:21
    .clock                               (clock),
    .reset                               (reset),
    .io_enq_valid                        (auto_ctl_in_a_valid & out_iready),	// RegisterRouter.scala:83:24
    .io_enq_bits_read                    (out_front_bits_read),	// RegisterRouter.scala:72:36
    .io_enq_bits_index                   (auto_ctl_in_a_bits_address[11:3]),	// Edges.scala:192:34, RegisterRouter.scala:73:19
    .io_enq_bits_data                    (auto_ctl_in_a_bits_data),
    .io_enq_bits_mask                    (auto_ctl_in_a_bits_mask),
    .io_enq_bits_extra_tlrr_extra_source (auto_ctl_in_a_bits_source),
    .io_enq_bits_extra_tlrr_extra_size   (auto_ctl_in_a_bits_size),
    .io_deq_ready                        (auto_ctl_in_d_ready & out_oready),	// RegisterRouter.scala:83:24
    .io_enq_ready                        (_out_back_io_enq_ready),
    .io_deq_valid                        (_out_back_io_deq_valid),
    .io_deq_bits_read                    (_out_back_io_deq_bits_read),
    .io_deq_bits_index                   (_out_back_io_deq_bits_index),
    .io_deq_bits_mask                    (_out_back_io_deq_bits_mask),
    .io_deq_bits_extra_tlrr_extra_source (auto_ctl_in_d_bits_source),
    .io_deq_bits_extra_tlrr_extra_size   (auto_ctl_in_d_bits_size)
  );
  InclusiveCacheBankScheduler inclusive_cache_bank_sched (	// InclusiveCache.scala:186:29
    .clock                 (clock),
    .reset                 (reset),
    .io_in_a_valid         (auto_in_a_valid),
    .io_in_a_bits_opcode   (auto_in_a_bits_opcode),
    .io_in_a_bits_param    (auto_in_a_bits_param),
    .io_in_a_bits_size     (auto_in_a_bits_size),
    .io_in_a_bits_source   (auto_in_a_bits_source),
    .io_in_a_bits_address  (auto_in_a_bits_address),
    .io_in_a_bits_mask     (auto_in_a_bits_mask),
    .io_in_a_bits_data     (auto_in_a_bits_data),
    .io_in_a_bits_corrupt  (auto_in_a_bits_corrupt),
    .io_in_b_ready         (auto_in_b_ready),
    .io_in_c_valid         (auto_in_c_valid),
    .io_in_c_bits_opcode   (auto_in_c_bits_opcode),
    .io_in_c_bits_param    (auto_in_c_bits_param),
    .io_in_c_bits_size     (auto_in_c_bits_size),
    .io_in_c_bits_source   (auto_in_c_bits_source),
    .io_in_c_bits_address  (auto_in_c_bits_address),
    .io_in_c_bits_data     (auto_in_c_bits_data),
    .io_in_c_bits_corrupt  (auto_in_c_bits_corrupt),
    .io_in_d_ready         (auto_in_d_ready),
    .io_in_e_valid         (auto_in_e_valid),
    .io_in_e_bits_sink     (auto_in_e_bits_sink),
    .io_out_a_ready        (auto_out_a_ready),
    .io_out_c_ready        (auto_out_c_ready),
    .io_out_d_valid        (auto_out_d_valid),
    .io_out_d_bits_opcode  (auto_out_d_bits_opcode),
    .io_out_d_bits_param   (auto_out_d_bits_param),
    .io_out_d_bits_size    (auto_out_d_bits_size),
    .io_out_d_bits_source  (auto_out_d_bits_source),
    .io_out_d_bits_sink    (auto_out_d_bits_sink),
    .io_out_d_bits_denied  (auto_out_d_bits_denied),
    .io_out_d_bits_data    (auto_out_d_bits_data),
    .io_out_d_bits_corrupt (auto_out_d_bits_corrupt),
    .io_req_valid          (flushInValid & flushSelect),	// InclusiveCache.scala:127:33, :200:46, Parameters.scala:137:65
    .io_req_bits_address   (flushInAddress[31:0]),	// InclusiveCache.scala:129:29, :201:37
    .io_resp_ready         (~flushOutValid),	// InclusiveCache.scala:131:33, :202:34
    .io_in_a_ready         (auto_in_a_ready),
    .io_in_b_valid         (auto_in_b_valid),
    .io_in_b_bits_param    (auto_in_b_bits_param),
    .io_in_b_bits_source   (auto_in_b_bits_source),
    .io_in_b_bits_address  (_inclusive_cache_bank_sched_io_in_b_bits_address),
    .io_in_c_ready         (auto_in_c_ready),
    .io_in_d_valid         (auto_in_d_valid),
    .io_in_d_bits_opcode   (auto_in_d_bits_opcode),
    .io_in_d_bits_param    (auto_in_d_bits_param),
    .io_in_d_bits_size     (auto_in_d_bits_size),
    .io_in_d_bits_source   (auto_in_d_bits_source),
    .io_in_d_bits_sink     (auto_in_d_bits_sink),
    .io_in_d_bits_denied   (auto_in_d_bits_denied),
    .io_in_d_bits_data     (auto_in_d_bits_data),
    .io_in_d_bits_corrupt  (auto_in_d_bits_corrupt),
    .io_out_a_valid        (auto_out_a_valid),
    .io_out_a_bits_opcode  (auto_out_a_bits_opcode),
    .io_out_a_bits_param   (auto_out_a_bits_param),
    .io_out_a_bits_size    (auto_out_a_bits_size),
    .io_out_a_bits_source  (auto_out_a_bits_source),
    .io_out_a_bits_address (_inclusive_cache_bank_sched_io_out_a_bits_address),
    .io_out_a_bits_mask    (auto_out_a_bits_mask),
    .io_out_a_bits_data    (auto_out_a_bits_data),
    .io_out_a_bits_corrupt (auto_out_a_bits_corrupt),
    .io_out_c_valid        (auto_out_c_valid),
    .io_out_c_bits_opcode  (auto_out_c_bits_opcode),
    .io_out_c_bits_size    (auto_out_c_bits_size),
    .io_out_c_bits_source  (auto_out_c_bits_source),
    .io_out_c_bits_address (_inclusive_cache_bank_sched_io_out_c_bits_address),
    .io_out_c_bits_data    (auto_out_c_bits_data),
    .io_out_c_bits_corrupt (auto_out_c_bits_corrupt),
    .io_out_d_ready        (auto_out_d_ready),
    .io_out_e_valid        (auto_out_e_valid),
    .io_out_e_bits_sink    (auto_out_e_bits_sink),
    .io_req_ready          (_inclusive_cache_bank_sched_io_req_ready),
    .io_resp_valid         (_inclusive_cache_bank_sched_io_resp_valid)
  );
  assign auto_ctl_in_a_ready = _out_back_io_enq_ready & out_iready;	// Decoupled.scala:375:21, RegisterRouter.scala:83:24
  assign auto_ctl_in_d_valid = _out_back_io_deq_valid & out_oready;	// Decoupled.scala:375:21, RegisterRouter.scala:83:24
  assign auto_ctl_in_d_bits_opcode = {2'h0, _out_back_io_deq_bits_read};	// Decoupled.scala:375:21, OneHot.scala:57:35, RegisterRouter.scala:98:19
  assign auto_ctl_in_d_bits_data = _GEN_7[out_oindex] ? _GEN_0[out_oindex] : 64'h0;	// Cat.scala:33:92, MuxLiteral.scala:49:10, RegisterRouter.scala:83:24
  assign auto_in_b_bits_address =
    _inclusive_cache_bank_sched_io_in_b_bits_address | 32'h80000000;	// InclusiveCache.scala:186:29, Parameters.scala:137:31, :247:14
  assign auto_out_a_bits_address =
    _inclusive_cache_bank_sched_io_out_a_bits_address | 32'h80000000;	// InclusiveCache.scala:186:29, Parameters.scala:137:31, :247:14
  assign auto_out_c_bits_address =
    _inclusive_cache_bank_sched_io_out_c_bits_address | 32'h80000000;	// InclusiveCache.scala:186:29, Parameters.scala:137:31, :247:14
endmodule

