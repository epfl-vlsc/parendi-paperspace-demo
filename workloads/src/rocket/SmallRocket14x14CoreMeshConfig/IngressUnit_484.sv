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

module IngressUnit_484(
  input         clock,
                reset,
                io_vcalloc_req_ready,
                io_vcalloc_resp_vc_sel_2_0,
                io_vcalloc_resp_vc_sel_1_0,
                io_vcalloc_resp_vc_sel_0_0,
                io_vcalloc_resp_vc_sel_0_1,
                io_vcalloc_resp_vc_sel_0_2,
                io_vcalloc_resp_vc_sel_0_3,
                io_vcalloc_resp_vc_sel_0_4,
                io_out_credit_available_2_0,
                io_out_credit_available_1_0,
                io_out_credit_available_0_0,
                io_out_credit_available_0_1,
                io_out_credit_available_0_2,
                io_out_credit_available_0_3,
                io_out_credit_available_0_4,
                io_salloc_req_0_ready,
                io_in_valid,
                io_in_bits_head,
                io_in_bits_tail,
  input  [72:0] io_in_bits_payload,
  output        io_vcalloc_req_valid,
                io_vcalloc_req_bits_vc_sel_2_0,
                io_vcalloc_req_bits_vc_sel_1_0,
                io_vcalloc_req_bits_vc_sel_0_0,
                io_vcalloc_req_bits_vc_sel_0_1,
                io_vcalloc_req_bits_vc_sel_0_2,
                io_vcalloc_req_bits_vc_sel_0_3,
                io_vcalloc_req_bits_vc_sel_0_4,
                io_salloc_req_0_valid,
                io_salloc_req_0_bits_vc_sel_2_0,
                io_salloc_req_0_bits_vc_sel_1_0,
                io_salloc_req_0_bits_vc_sel_0_0,
                io_salloc_req_0_bits_vc_sel_0_1,
                io_salloc_req_0_bits_vc_sel_0_2,
                io_salloc_req_0_bits_vc_sel_0_3,
                io_salloc_req_0_bits_vc_sel_0_4,
                io_salloc_req_0_bits_tail,
                io_out_0_valid,
                io_out_0_bits_flit_head,
                io_out_0_bits_flit_tail,
  output [72:0] io_out_0_bits_flit_payload,
  output [2:0]  io_out_0_bits_flit_flow_vnet_id,
  output [8:0]  io_out_0_bits_flit_flow_ingress_node,
  output [1:0]  io_out_0_bits_flit_flow_ingress_node_id,
  output [8:0]  io_out_0_bits_flit_flow_egress_node,
  output [1:0]  io_out_0_bits_flit_flow_egress_node_id,
  output [2:0]  io_out_0_bits_out_virt_channel,
  output        io_in_ready
);

  wire        _vcalloc_q_io_enq_ready;	// @[IngressUnit.scala:76:25]
  wire        _vcalloc_q_io_deq_valid;	// @[IngressUnit.scala:76:25]
  wire        _vcalloc_q_io_deq_bits_vc_sel_2_0;	// @[IngressUnit.scala:76:25]
  wire        _vcalloc_q_io_deq_bits_vc_sel_1_0;	// @[IngressUnit.scala:76:25]
  wire        _vcalloc_q_io_deq_bits_vc_sel_0_0;	// @[IngressUnit.scala:76:25]
  wire        _vcalloc_q_io_deq_bits_vc_sel_0_1;	// @[IngressUnit.scala:76:25]
  wire        _vcalloc_q_io_deq_bits_vc_sel_0_2;	// @[IngressUnit.scala:76:25]
  wire        _vcalloc_q_io_deq_bits_vc_sel_0_3;	// @[IngressUnit.scala:76:25]
  wire        _vcalloc_q_io_deq_bits_vc_sel_0_4;	// @[IngressUnit.scala:76:25]
  wire        _vcalloc_buffer_io_enq_ready;	// @[IngressUnit.scala:75:30]
  wire        _vcalloc_buffer_io_deq_valid;	// @[IngressUnit.scala:75:30]
  wire        _vcalloc_buffer_io_deq_bits_head;	// @[IngressUnit.scala:75:30]
  wire        _vcalloc_buffer_io_deq_bits_tail;	// @[IngressUnit.scala:75:30]
  wire [72:0] _vcalloc_buffer_io_deq_bits_payload;	// @[IngressUnit.scala:75:30]
  wire [2:0]  _vcalloc_buffer_io_deq_bits_flow_vnet_id;	// @[IngressUnit.scala:75:30]
  wire [8:0]  _vcalloc_buffer_io_deq_bits_flow_ingress_node;	// @[IngressUnit.scala:75:30]
  wire [1:0]  _vcalloc_buffer_io_deq_bits_flow_ingress_node_id;	// @[IngressUnit.scala:75:30]
  wire [8:0]  _vcalloc_buffer_io_deq_bits_flow_egress_node;	// @[IngressUnit.scala:75:30]
  wire [1:0]  _vcalloc_buffer_io_deq_bits_flow_egress_node_id;	// @[IngressUnit.scala:75:30]
  wire [2:0]  _vcalloc_buffer_io_deq_bits_virt_channel_id;	// @[IngressUnit.scala:75:30]
  wire        _route_q_io_enq_ready;	// @[IngressUnit.scala:27:23]
  wire        _route_q_io_deq_valid;	// @[IngressUnit.scala:27:23]
  wire        _route_buffer_io_enq_ready;	// @[IngressUnit.scala:26:28]
  wire        _route_buffer_io_deq_valid;	// @[IngressUnit.scala:26:28]
  wire        _route_buffer_io_deq_bits_head;	// @[IngressUnit.scala:26:28]
  wire        _route_buffer_io_deq_bits_tail;	// @[IngressUnit.scala:26:28]
  wire [72:0] _route_buffer_io_deq_bits_payload;	// @[IngressUnit.scala:26:28]
  wire [2:0]  _route_buffer_io_deq_bits_flow_vnet_id;	// @[IngressUnit.scala:26:28]
  wire [8:0]  _route_buffer_io_deq_bits_flow_ingress_node;	// @[IngressUnit.scala:26:28]
  wire [1:0]  _route_buffer_io_deq_bits_flow_ingress_node_id;	// @[IngressUnit.scala:26:28]
  wire [8:0]  _route_buffer_io_deq_bits_flow_egress_node;	// @[IngressUnit.scala:26:28]
  wire [1:0]  _route_buffer_io_deq_bits_flow_egress_node_id;	// @[IngressUnit.scala:26:28]
  wire [2:0]  _route_buffer_io_deq_bits_virt_channel_id;	// @[IngressUnit.scala:26:28]
  wire        _io_router_req_valid_T_1 = io_in_valid & _route_buffer_io_enq_ready & io_in_bits_head;	// @[IngressUnit.scala:26:28, :58:67]
  wire        _io_vcalloc_req_valid_output = _route_buffer_io_deq_valid & _route_q_io_deq_valid & _route_buffer_io_deq_bits_head & _vcalloc_buffer_io_enq_ready & _vcalloc_q_io_enq_ready;	// @[IngressUnit.scala:26:28, :27:23, :75:30, :76:25, :92:41]
  wire        _route_buffer_io_deq_ready_T_8 = _vcalloc_buffer_io_enq_ready & (_route_q_io_deq_valid | ~_route_buffer_io_deq_bits_head) & (io_vcalloc_req_ready | ~_route_buffer_io_deq_bits_head) & (_vcalloc_q_io_enq_ready | ~_route_buffer_io_deq_bits_head);	// @[IngressUnit.scala:26:28, :27:23, :75:30, :76:25, :88:30, :94:27, :95:{27,37}, :96:29]
  wire        _vcalloc_q_io_enq_valid_T = io_vcalloc_req_ready & _io_vcalloc_req_valid_output;	// @[Decoupled.scala:51:35, IngressUnit.scala:92:41]
  wire [6:0]  _c_T_2 = {_vcalloc_q_io_deq_bits_vc_sel_2_0, _vcalloc_q_io_deq_bits_vc_sel_1_0, _vcalloc_q_io_deq_bits_vc_sel_0_4, _vcalloc_q_io_deq_bits_vc_sel_0_3, _vcalloc_q_io_deq_bits_vc_sel_0_2, _vcalloc_q_io_deq_bits_vc_sel_0_1, _vcalloc_q_io_deq_bits_vc_sel_0_0} & {io_out_credit_available_2_0, io_out_credit_available_1_0, io_out_credit_available_0_4, io_out_credit_available_0_3, io_out_credit_available_0_2, io_out_credit_available_0_1, io_out_credit_available_0_0};	// @[IngressUnit.scala:76:25, :107:{41,48,74}]
  wire        _vcalloc_buffer_io_deq_ready_T_1 = io_salloc_req_0_ready & _vcalloc_q_io_deq_valid & (|_c_T_2);	// @[IngressUnit.scala:76:25, :107:{48,82}, :110:83]
  wire        _out_bundle_valid_T = _vcalloc_buffer_io_deq_ready_T_1 & _vcalloc_buffer_io_deq_valid;	// @[Decoupled.scala:51:35, IngressUnit.scala:75:30, :110:83]
  reg         out_bundle_valid;	// @[IngressUnit.scala:116:8]
  reg         out_bundle_bits_flit_head;	// @[IngressUnit.scala:116:8]
  reg         out_bundle_bits_flit_tail;	// @[IngressUnit.scala:116:8]
  reg  [72:0] out_bundle_bits_flit_payload;	// @[IngressUnit.scala:116:8]
  reg  [2:0]  out_bundle_bits_flit_flow_vnet_id;	// @[IngressUnit.scala:116:8]
  reg  [8:0]  out_bundle_bits_flit_flow_ingress_node;	// @[IngressUnit.scala:116:8]
  reg  [1:0]  out_bundle_bits_flit_flow_ingress_node_id;	// @[IngressUnit.scala:116:8]
  reg  [8:0]  out_bundle_bits_flit_flow_egress_node;	// @[IngressUnit.scala:116:8]
  reg  [1:0]  out_bundle_bits_flit_flow_egress_node_id;	// @[IngressUnit.scala:116:8]
  reg  [2:0]  out_bundle_bits_out_virt_channel;	// @[IngressUnit.scala:116:8]
  always @(posedge clock) begin
    out_bundle_valid <= _out_bundle_valid_T;	// @[Decoupled.scala:51:35, IngressUnit.scala:116:8]
    out_bundle_bits_flit_head <= _vcalloc_buffer_io_deq_bits_head;	// @[IngressUnit.scala:75:30, :116:8]
    out_bundle_bits_flit_tail <= _vcalloc_buffer_io_deq_bits_tail;	// @[IngressUnit.scala:75:30, :116:8]
    out_bundle_bits_flit_payload <= _vcalloc_buffer_io_deq_bits_payload;	// @[IngressUnit.scala:75:30, :116:8]
    out_bundle_bits_flit_flow_vnet_id <= _vcalloc_buffer_io_deq_bits_flow_vnet_id;	// @[IngressUnit.scala:75:30, :116:8]
    out_bundle_bits_flit_flow_ingress_node <= _vcalloc_buffer_io_deq_bits_flow_ingress_node;	// @[IngressUnit.scala:75:30, :116:8]
    out_bundle_bits_flit_flow_ingress_node_id <= _vcalloc_buffer_io_deq_bits_flow_ingress_node_id;	// @[IngressUnit.scala:75:30, :116:8]
    out_bundle_bits_flit_flow_egress_node <= _vcalloc_buffer_io_deq_bits_flow_egress_node;	// @[IngressUnit.scala:75:30, :116:8]
    out_bundle_bits_flit_flow_egress_node_id <= _vcalloc_buffer_io_deq_bits_flow_egress_node_id;	// @[IngressUnit.scala:75:30, :116:8]
    if (_vcalloc_q_io_deq_bits_vc_sel_0_0 | _vcalloc_q_io_deq_bits_vc_sel_0_1 | _vcalloc_q_io_deq_bits_vc_sel_0_2 | _vcalloc_q_io_deq_bits_vc_sel_0_3 | _vcalloc_q_io_deq_bits_vc_sel_0_4)	// @[IngressUnit.scala:76:25, :123:67]
      out_bundle_bits_out_virt_channel <= {_vcalloc_q_io_deq_bits_vc_sel_0_4, |{_vcalloc_q_io_deq_bits_vc_sel_0_3, _vcalloc_q_io_deq_bits_vc_sel_0_2}, _vcalloc_q_io_deq_bits_vc_sel_0_3 | _vcalloc_q_io_deq_bits_vc_sel_0_1};	// @[Cat.scala:33:92, IngressUnit.scala:76:25, :116:8, OneHot.scala:30:18, :32:{14,28}]
    else	// @[IngressUnit.scala:123:67]
      out_bundle_bits_out_virt_channel <= 3'h0;	// @[IngressUnit.scala:51:44, :116:8]
  end // always @(posedge)
  `ifndef SYNTHESIS
    always @(posedge clock) begin	// @[IngressUnit.scala:73:9]
      if (~reset & _io_router_req_valid_T_1 & ~_route_q_io_enq_ready) begin	// @[IngressUnit.scala:27:23, :58:67, :73:{9,36}]
        if (`ASSERT_VERBOSE_COND_)	// @[IngressUnit.scala:73:9]
          $error("Assertion failed\n    at IngressUnit.scala:73 assert(!(route_q.io.enq.valid && !route_q.io.enq.ready))\n");	// @[IngressUnit.scala:73:9]
        if (`STOP_COND_)	// @[IngressUnit.scala:73:9]
          $fatal;	// @[IngressUnit.scala:73:9]
      end
      if (~reset & _vcalloc_q_io_enq_valid_T & ~_vcalloc_q_io_enq_ready) begin	// @[Decoupled.scala:51:35, IngressUnit.scala:76:25, :102:{9,38}]
        if (`ASSERT_VERBOSE_COND_)	// @[IngressUnit.scala:102:9]
          $error("Assertion failed\n    at IngressUnit.scala:102 assert(!(vcalloc_q.io.enq.valid && !vcalloc_q.io.enq.ready))\n");	// @[IngressUnit.scala:102:9]
        if (`STOP_COND_)	// @[IngressUnit.scala:102:9]
          $fatal;	// @[IngressUnit.scala:102:9]
      end
    end // always @(posedge)
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    logic [31:0] _RANDOM_1;
    logic [31:0] _RANDOM_2;
    logic [31:0] _RANDOM_3;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        _RANDOM_1 = `RANDOM;
        _RANDOM_2 = `RANDOM;
        _RANDOM_3 = `RANDOM;
        out_bundle_valid = _RANDOM_0[0];	// @[IngressUnit.scala:116:8]
        out_bundle_bits_flit_head = _RANDOM_0[1];	// @[IngressUnit.scala:116:8]
        out_bundle_bits_flit_tail = _RANDOM_0[2];	// @[IngressUnit.scala:116:8]
        out_bundle_bits_flit_payload = {_RANDOM_0[31:3], _RANDOM_1, _RANDOM_2[11:0]};	// @[IngressUnit.scala:116:8]
        out_bundle_bits_flit_flow_vnet_id = _RANDOM_2[14:12];	// @[IngressUnit.scala:116:8]
        out_bundle_bits_flit_flow_ingress_node = _RANDOM_2[23:15];	// @[IngressUnit.scala:116:8]
        out_bundle_bits_flit_flow_ingress_node_id = _RANDOM_2[25:24];	// @[IngressUnit.scala:116:8]
        out_bundle_bits_flit_flow_egress_node = {_RANDOM_2[31:26], _RANDOM_3[2:0]};	// @[IngressUnit.scala:116:8]
        out_bundle_bits_flit_flow_egress_node_id = _RANDOM_3[4:3];	// @[IngressUnit.scala:116:8]
        out_bundle_bits_out_virt_channel = _RANDOM_3[10:8];	// @[IngressUnit.scala:116:8]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  Queue_5 route_buffer (	// @[IngressUnit.scala:26:28]
    .clock                            (clock),
    .reset                            (reset),
    .io_enq_valid                     (io_in_valid),
    .io_enq_bits_head                 (io_in_bits_head),
    .io_enq_bits_tail                 (io_in_bits_tail),
    .io_enq_bits_payload              (io_in_bits_payload),
    .io_enq_bits_flow_vnet_id         (3'h2),
    .io_enq_bits_flow_ingress_node    (9'hA1),
    .io_enq_bits_flow_ingress_node_id (2'h1),
    .io_enq_bits_flow_egress_node     (9'hC3),
    .io_enq_bits_flow_egress_node_id  (2'h1),
    .io_enq_bits_virt_channel_id      (3'h0),	// @[IngressUnit.scala:51:44]
    .io_deq_ready                     (_route_buffer_io_deq_ready_T_8),	// @[IngressUnit.scala:95:37]
    .io_enq_ready                     (_route_buffer_io_enq_ready),
    .io_deq_valid                     (_route_buffer_io_deq_valid),
    .io_deq_bits_head                 (_route_buffer_io_deq_bits_head),
    .io_deq_bits_tail                 (_route_buffer_io_deq_bits_tail),
    .io_deq_bits_payload              (_route_buffer_io_deq_bits_payload),
    .io_deq_bits_flow_vnet_id         (_route_buffer_io_deq_bits_flow_vnet_id),
    .io_deq_bits_flow_ingress_node    (_route_buffer_io_deq_bits_flow_ingress_node),
    .io_deq_bits_flow_ingress_node_id (_route_buffer_io_deq_bits_flow_ingress_node_id),
    .io_deq_bits_flow_egress_node     (_route_buffer_io_deq_bits_flow_egress_node),
    .io_deq_bits_flow_egress_node_id  (_route_buffer_io_deq_bits_flow_egress_node_id),
    .io_deq_bits_virt_channel_id      (_route_buffer_io_deq_bits_virt_channel_id)
  );
  Queue_6 route_q (	// @[IngressUnit.scala:27:23]
    .clock                  (clock),
    .reset                  (reset),
    .io_enq_valid           (_io_router_req_valid_T_1),	// @[IngressUnit.scala:58:67]
    .io_enq_bits_vc_sel_2_0 (1'h0),
    .io_enq_bits_vc_sel_1_0 (1'h0),
    .io_enq_bits_vc_sel_0_0 (1'h0),
    .io_enq_bits_vc_sel_0_1 (1'h0),
    .io_enq_bits_vc_sel_0_2 (1'h1),
    .io_enq_bits_vc_sel_0_3 (1'h1),
    .io_enq_bits_vc_sel_0_4 (1'h1),
    .io_deq_ready           (_route_buffer_io_deq_ready_T_8 & _route_buffer_io_deq_valid & _route_buffer_io_deq_bits_tail),	// @[IngressUnit.scala:26:28, :95:37, :97:55]
    .io_enq_ready           (_route_q_io_enq_ready),
    .io_deq_valid           (_route_q_io_deq_valid),
    .io_deq_bits_vc_sel_2_0 (io_vcalloc_req_bits_vc_sel_2_0),
    .io_deq_bits_vc_sel_1_0 (io_vcalloc_req_bits_vc_sel_1_0),
    .io_deq_bits_vc_sel_0_0 (io_vcalloc_req_bits_vc_sel_0_0),
    .io_deq_bits_vc_sel_0_1 (io_vcalloc_req_bits_vc_sel_0_1),
    .io_deq_bits_vc_sel_0_2 (io_vcalloc_req_bits_vc_sel_0_2),
    .io_deq_bits_vc_sel_0_3 (io_vcalloc_req_bits_vc_sel_0_3),
    .io_deq_bits_vc_sel_0_4 (io_vcalloc_req_bits_vc_sel_0_4)
  );
  Queue_5 vcalloc_buffer (	// @[IngressUnit.scala:75:30]
    .clock                            (clock),
    .reset                            (reset),
    .io_enq_valid                     (_route_buffer_io_deq_valid & (_route_q_io_deq_valid | ~_route_buffer_io_deq_bits_head) & (io_vcalloc_req_ready | ~_route_buffer_io_deq_bits_head)),	// @[IngressUnit.scala:26:28, :27:23, :88:{27,30,37}, :89:27]
    .io_enq_bits_head                 (_route_buffer_io_deq_bits_head),	// @[IngressUnit.scala:26:28]
    .io_enq_bits_tail                 (_route_buffer_io_deq_bits_tail),	// @[IngressUnit.scala:26:28]
    .io_enq_bits_payload              (_route_buffer_io_deq_bits_payload),	// @[IngressUnit.scala:26:28]
    .io_enq_bits_flow_vnet_id         (_route_buffer_io_deq_bits_flow_vnet_id),	// @[IngressUnit.scala:26:28]
    .io_enq_bits_flow_ingress_node    (_route_buffer_io_deq_bits_flow_ingress_node),	// @[IngressUnit.scala:26:28]
    .io_enq_bits_flow_ingress_node_id (_route_buffer_io_deq_bits_flow_ingress_node_id),	// @[IngressUnit.scala:26:28]
    .io_enq_bits_flow_egress_node     (_route_buffer_io_deq_bits_flow_egress_node),	// @[IngressUnit.scala:26:28]
    .io_enq_bits_flow_egress_node_id  (_route_buffer_io_deq_bits_flow_egress_node_id),	// @[IngressUnit.scala:26:28]
    .io_enq_bits_virt_channel_id      (_route_buffer_io_deq_bits_virt_channel_id),	// @[IngressUnit.scala:26:28]
    .io_deq_ready                     (_vcalloc_buffer_io_deq_ready_T_1),	// @[IngressUnit.scala:110:83]
    .io_enq_ready                     (_vcalloc_buffer_io_enq_ready),
    .io_deq_valid                     (_vcalloc_buffer_io_deq_valid),
    .io_deq_bits_head                 (_vcalloc_buffer_io_deq_bits_head),
    .io_deq_bits_tail                 (_vcalloc_buffer_io_deq_bits_tail),
    .io_deq_bits_payload              (_vcalloc_buffer_io_deq_bits_payload),
    .io_deq_bits_flow_vnet_id         (_vcalloc_buffer_io_deq_bits_flow_vnet_id),
    .io_deq_bits_flow_ingress_node    (_vcalloc_buffer_io_deq_bits_flow_ingress_node),
    .io_deq_bits_flow_ingress_node_id (_vcalloc_buffer_io_deq_bits_flow_ingress_node_id),
    .io_deq_bits_flow_egress_node     (_vcalloc_buffer_io_deq_bits_flow_egress_node),
    .io_deq_bits_flow_egress_node_id  (_vcalloc_buffer_io_deq_bits_flow_egress_node_id),
    .io_deq_bits_virt_channel_id      (_vcalloc_buffer_io_deq_bits_virt_channel_id)
  );
  Queue_8 vcalloc_q (	// @[IngressUnit.scala:76:25]
    .clock                  (clock),
    .reset                  (reset),
    .io_enq_valid           (_vcalloc_q_io_enq_valid_T),	// @[Decoupled.scala:51:35]
    .io_enq_bits_vc_sel_2_0 (io_vcalloc_resp_vc_sel_2_0),
    .io_enq_bits_vc_sel_1_0 (io_vcalloc_resp_vc_sel_1_0),
    .io_enq_bits_vc_sel_0_0 (io_vcalloc_resp_vc_sel_0_0),
    .io_enq_bits_vc_sel_0_1 (io_vcalloc_resp_vc_sel_0_1),
    .io_enq_bits_vc_sel_0_2 (io_vcalloc_resp_vc_sel_0_2),
    .io_enq_bits_vc_sel_0_3 (io_vcalloc_resp_vc_sel_0_3),
    .io_enq_bits_vc_sel_0_4 (io_vcalloc_resp_vc_sel_0_4),
    .io_deq_ready           (_vcalloc_buffer_io_deq_bits_tail & _out_bundle_valid_T),	// @[Decoupled.scala:51:35, IngressUnit.scala:75:30, :111:42]
    .io_enq_ready           (_vcalloc_q_io_enq_ready),
    .io_deq_valid           (_vcalloc_q_io_deq_valid),
    .io_deq_bits_vc_sel_2_0 (_vcalloc_q_io_deq_bits_vc_sel_2_0),
    .io_deq_bits_vc_sel_1_0 (_vcalloc_q_io_deq_bits_vc_sel_1_0),
    .io_deq_bits_vc_sel_0_0 (_vcalloc_q_io_deq_bits_vc_sel_0_0),
    .io_deq_bits_vc_sel_0_1 (_vcalloc_q_io_deq_bits_vc_sel_0_1),
    .io_deq_bits_vc_sel_0_2 (_vcalloc_q_io_deq_bits_vc_sel_0_2),
    .io_deq_bits_vc_sel_0_3 (_vcalloc_q_io_deq_bits_vc_sel_0_3),
    .io_deq_bits_vc_sel_0_4 (_vcalloc_q_io_deq_bits_vc_sel_0_4)
  );
  assign io_vcalloc_req_valid = _io_vcalloc_req_valid_output;	// @[IngressUnit.scala:92:41]
  assign io_salloc_req_0_valid = _vcalloc_buffer_io_deq_valid & _vcalloc_q_io_deq_valid & (|_c_T_2);	// @[IngressUnit.scala:75:30, :76:25, :107:{48,82}, :109:83]
  assign io_salloc_req_0_bits_vc_sel_2_0 = _vcalloc_q_io_deq_bits_vc_sel_2_0;	// @[IngressUnit.scala:76:25]
  assign io_salloc_req_0_bits_vc_sel_1_0 = _vcalloc_q_io_deq_bits_vc_sel_1_0;	// @[IngressUnit.scala:76:25]
  assign io_salloc_req_0_bits_vc_sel_0_0 = _vcalloc_q_io_deq_bits_vc_sel_0_0;	// @[IngressUnit.scala:76:25]
  assign io_salloc_req_0_bits_vc_sel_0_1 = _vcalloc_q_io_deq_bits_vc_sel_0_1;	// @[IngressUnit.scala:76:25]
  assign io_salloc_req_0_bits_vc_sel_0_2 = _vcalloc_q_io_deq_bits_vc_sel_0_2;	// @[IngressUnit.scala:76:25]
  assign io_salloc_req_0_bits_vc_sel_0_3 = _vcalloc_q_io_deq_bits_vc_sel_0_3;	// @[IngressUnit.scala:76:25]
  assign io_salloc_req_0_bits_vc_sel_0_4 = _vcalloc_q_io_deq_bits_vc_sel_0_4;	// @[IngressUnit.scala:76:25]
  assign io_salloc_req_0_bits_tail = _vcalloc_buffer_io_deq_bits_tail;	// @[IngressUnit.scala:75:30]
  assign io_out_0_valid = out_bundle_valid;	// @[IngressUnit.scala:116:8]
  assign io_out_0_bits_flit_head = out_bundle_bits_flit_head;	// @[IngressUnit.scala:116:8]
  assign io_out_0_bits_flit_tail = out_bundle_bits_flit_tail;	// @[IngressUnit.scala:116:8]
  assign io_out_0_bits_flit_payload = out_bundle_bits_flit_payload;	// @[IngressUnit.scala:116:8]
  assign io_out_0_bits_flit_flow_vnet_id = out_bundle_bits_flit_flow_vnet_id;	// @[IngressUnit.scala:116:8]
  assign io_out_0_bits_flit_flow_ingress_node = out_bundle_bits_flit_flow_ingress_node;	// @[IngressUnit.scala:116:8]
  assign io_out_0_bits_flit_flow_ingress_node_id = out_bundle_bits_flit_flow_ingress_node_id;	// @[IngressUnit.scala:116:8]
  assign io_out_0_bits_flit_flow_egress_node = out_bundle_bits_flit_flow_egress_node;	// @[IngressUnit.scala:116:8]
  assign io_out_0_bits_flit_flow_egress_node_id = out_bundle_bits_flit_flow_egress_node_id;	// @[IngressUnit.scala:116:8]
  assign io_out_0_bits_out_virt_channel = out_bundle_bits_out_virt_channel;	// @[IngressUnit.scala:116:8]
  assign io_in_ready = _route_buffer_io_enq_ready;	// @[IngressUnit.scala:26:28]
endmodule

