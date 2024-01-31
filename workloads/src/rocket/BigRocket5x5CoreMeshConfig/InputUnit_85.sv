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

module InputUnit_85(
  input         clock,
                reset,
                io_router_resp_vc_sel_3_4,
                io_vcalloc_req_ready,
                io_vcalloc_resp_vc_sel_3_4,
                io_out_credit_available_3_4,
                io_out_credit_available_2_0,
                io_out_credit_available_2_1,
                io_out_credit_available_2_2,
                io_out_credit_available_2_3,
                io_out_credit_available_2_4,
                io_out_credit_available_1_1,
                io_out_credit_available_1_2,
                io_out_credit_available_1_3,
                io_out_credit_available_1_4,
                io_out_credit_available_0_1,
                io_out_credit_available_0_2,
                io_out_credit_available_0_3,
                io_out_credit_available_0_4,
                io_salloc_req_0_ready,
                io_in_flit_0_valid,
                io_in_flit_0_bits_head,
                io_in_flit_0_bits_tail,
  input  [72:0] io_in_flit_0_bits_payload,
  input  [2:0]  io_in_flit_0_bits_flow_vnet_id,
  input  [5:0]  io_in_flit_0_bits_flow_ingress_node,
  input  [1:0]  io_in_flit_0_bits_flow_ingress_node_id,
  input  [5:0]  io_in_flit_0_bits_flow_egress_node,
  input  [1:0]  io_in_flit_0_bits_flow_egress_node_id,
  input  [2:0]  io_in_flit_0_bits_virt_channel_id,
  output [2:0]  io_router_req_bits_src_virt_id,
                io_router_req_bits_flow_vnet_id,
  output [5:0]  io_router_req_bits_flow_ingress_node,
  output [1:0]  io_router_req_bits_flow_ingress_node_id,
  output [5:0]  io_router_req_bits_flow_egress_node,
  output [1:0]  io_router_req_bits_flow_egress_node_id,
  output        io_vcalloc_req_valid,
                io_vcalloc_req_bits_vc_sel_3_4,
                io_salloc_req_0_valid,
                io_salloc_req_0_bits_vc_sel_3_0,
                io_salloc_req_0_bits_vc_sel_3_1,
                io_salloc_req_0_bits_vc_sel_3_2,
                io_salloc_req_0_bits_vc_sel_3_3,
                io_salloc_req_0_bits_vc_sel_3_4,
                io_salloc_req_0_bits_vc_sel_2_0,
                io_salloc_req_0_bits_vc_sel_2_1,
                io_salloc_req_0_bits_vc_sel_2_2,
                io_salloc_req_0_bits_vc_sel_2_3,
                io_salloc_req_0_bits_vc_sel_2_4,
                io_salloc_req_0_bits_vc_sel_1_1,
                io_salloc_req_0_bits_vc_sel_1_2,
                io_salloc_req_0_bits_vc_sel_1_3,
                io_salloc_req_0_bits_vc_sel_1_4,
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
  output [5:0]  io_out_0_bits_flit_flow_ingress_node,
  output [1:0]  io_out_0_bits_flit_flow_ingress_node_id,
  output [5:0]  io_out_0_bits_flit_flow_egress_node,
  output [1:0]  io_out_0_bits_flit_flow_egress_node_id,
  output [2:0]  io_out_0_bits_out_virt_channel,
                io_debug_va_stall,
                io_debug_sa_stall,
  output [4:0]  io_in_credit_return,
                io_in_vc_free
);

  wire        vcalloc_vals_4;	// @[InputUnit.scala:266:32]
  wire        _salloc_arb_io_in_0_ready;	// @[InputUnit.scala:296:26]
  wire        _salloc_arb_io_in_1_ready;	// @[InputUnit.scala:296:26]
  wire        _salloc_arb_io_in_2_ready;	// @[InputUnit.scala:296:26]
  wire        _salloc_arb_io_in_3_ready;	// @[InputUnit.scala:296:26]
  wire        _salloc_arb_io_in_4_ready;	// @[InputUnit.scala:296:26]
  wire        _salloc_arb_io_out_0_valid;	// @[InputUnit.scala:296:26]
  wire [4:0]  _salloc_arb_io_chosen_oh_0;	// @[InputUnit.scala:296:26]
  wire        _route_arbiter_io_in_1_ready;	// @[InputUnit.scala:187:29]
  wire        _route_arbiter_io_in_2_ready;	// @[InputUnit.scala:187:29]
  wire        _route_arbiter_io_in_3_ready;	// @[InputUnit.scala:187:29]
  wire        _route_arbiter_io_in_4_ready;	// @[InputUnit.scala:187:29]
  wire        _route_arbiter_io_out_valid;	// @[InputUnit.scala:187:29]
  wire [2:0]  _route_arbiter_io_out_bits_src_virt_id;	// @[InputUnit.scala:187:29]
  wire        _input_buffer_io_deq_0_bits_head;	// @[InputUnit.scala:181:28]
  wire        _input_buffer_io_deq_0_bits_tail;	// @[InputUnit.scala:181:28]
  wire [72:0] _input_buffer_io_deq_0_bits_payload;	// @[InputUnit.scala:181:28]
  wire        _input_buffer_io_deq_1_bits_head;	// @[InputUnit.scala:181:28]
  wire        _input_buffer_io_deq_1_bits_tail;	// @[InputUnit.scala:181:28]
  wire [72:0] _input_buffer_io_deq_1_bits_payload;	// @[InputUnit.scala:181:28]
  wire        _input_buffer_io_deq_2_bits_head;	// @[InputUnit.scala:181:28]
  wire        _input_buffer_io_deq_2_bits_tail;	// @[InputUnit.scala:181:28]
  wire [72:0] _input_buffer_io_deq_2_bits_payload;	// @[InputUnit.scala:181:28]
  wire        _input_buffer_io_deq_3_bits_head;	// @[InputUnit.scala:181:28]
  wire        _input_buffer_io_deq_3_bits_tail;	// @[InputUnit.scala:181:28]
  wire [72:0] _input_buffer_io_deq_3_bits_payload;	// @[InputUnit.scala:181:28]
  wire        _input_buffer_io_deq_4_valid;	// @[InputUnit.scala:181:28]
  wire        _input_buffer_io_deq_4_bits_head;	// @[InputUnit.scala:181:28]
  wire        _input_buffer_io_deq_4_bits_tail;	// @[InputUnit.scala:181:28]
  wire [72:0] _input_buffer_io_deq_4_bits_payload;	// @[InputUnit.scala:181:28]
  reg  [2:0]  states_4_g;	// @[InputUnit.scala:192:19]
  reg         states_4_vc_sel_3_4;	// @[InputUnit.scala:192:19]
  reg  [2:0]  states_4_flow_vnet_id;	// @[InputUnit.scala:192:19]
  reg  [5:0]  states_4_flow_ingress_node;	// @[InputUnit.scala:192:19]
  reg  [1:0]  states_4_flow_ingress_node_id;	// @[InputUnit.scala:192:19]
  reg  [5:0]  states_4_flow_egress_node;	// @[InputUnit.scala:192:19]
  reg  [1:0]  states_4_flow_egress_node_id;	// @[InputUnit.scala:192:19]
  wire        _T = io_in_flit_0_valid & io_in_flit_0_bits_head;	// @[InputUnit.scala:205:32]
  wire        _route_arbiter_io_in_4_valid_T = states_4_g == 3'h1;	// @[InputUnit.scala:192:19, :210:26, :229:22]
  reg  [4:0]  mask;	// @[InputUnit.scala:250:21]
  wire [9:0]  _vcalloc_filter_T_20 = vcalloc_vals_4 & ~(mask[4]) ? 10'h10 : {vcalloc_vals_4, 9'h0};	// @[InputUnit.scala:250:21, :253:{87,89}, :266:32, Mux.scala:47:70]
  wire [4:0]  vcalloc_sel = _vcalloc_filter_T_20[4:0] | _vcalloc_filter_T_20[9:5];	// @[InputUnit.scala:254:{35,58,76}, Mux.scala:47:70]
  assign vcalloc_vals_4 = states_4_g == 3'h2;	// @[InputUnit.scala:192:19, :210:26, :266:32]
  wire        _T_28 = io_vcalloc_req_ready & vcalloc_vals_4;	// @[Decoupled.scala:51:35, InputUnit.scala:266:32]
  wire        _GEN = _T_28 & vcalloc_sel[4];	// @[Decoupled.scala:51:35, InputUnit.scala:254:58, :287:29, Mux.scala:29:36]
  wire        _salloc_arb_io_in_4_valid_T_2 = states_4_g == 3'h3 & states_4_vc_sel_3_4 & io_out_credit_available_3_4 & _input_buffer_io_deq_4_valid;	// @[InputUnit.scala:181:28, :192:19, :210:20, :305:{22,50}]
  reg         salloc_outs_0_valid;	// @[InputUnit.scala:336:8]
  reg  [2:0]  salloc_outs_0_out_vid;	// @[InputUnit.scala:336:8]
  reg         salloc_outs_0_flit_head;	// @[InputUnit.scala:336:8]
  reg         salloc_outs_0_flit_tail;	// @[InputUnit.scala:336:8]
  reg  [72:0] salloc_outs_0_flit_payload;	// @[InputUnit.scala:336:8]
  reg  [2:0]  salloc_outs_0_flit_flow_vnet_id;	// @[InputUnit.scala:336:8]
  reg  [5:0]  salloc_outs_0_flit_flow_ingress_node;	// @[InputUnit.scala:336:8]
  reg  [1:0]  salloc_outs_0_flit_flow_ingress_node_id;	// @[InputUnit.scala:336:8]
  reg  [5:0]  salloc_outs_0_flit_flow_egress_node;	// @[InputUnit.scala:336:8]
  reg  [1:0]  salloc_outs_0_flit_flow_egress_node_id;	// @[InputUnit.scala:336:8]
  wire        _T_56 = io_salloc_req_0_ready & _salloc_arb_io_out_0_valid;	// @[Decoupled.scala:51:35, InputUnit.scala:296:26]
  wire [7:0]  _mask_T = 8'h1 << _route_arbiter_io_out_bits_src_virt_id;	// @[InputUnit.scala:187:29, :257:18]
  wire        _GEN_0 = _T & io_in_flit_0_bits_virt_channel_id == 3'h4;	// @[InputUnit.scala:192:19, :205:{32,60}, :210:20]
  wire        _vc_sel_WIRE_23 = _salloc_arb_io_chosen_oh_0[4] & states_4_vc_sel_3_4;	// @[InputUnit.scala:192:19, :296:26, Mux.scala:27:73, :29:36]
  always @(posedge clock) begin
    if (reset | _salloc_arb_io_in_4_ready & _salloc_arb_io_in_4_valid_T_2 & _input_buffer_io_deq_4_bits_tail)	// @[InputUnit.scala:181:28, :285:32, :296:26, :305:50, :309:{22,35}, :310:13, :395:23, :396:24]
      states_4_g <= 3'h0;	// @[InputUnit.scala:192:19, :208:27]
    else if (_T_28 & vcalloc_sel[4] | vcalloc_vals_4 & vcalloc_sel[4] & io_vcalloc_req_ready)	// @[Decoupled.scala:51:35, InputUnit.scala:239:31, :254:58, :266:32, :270:{51,76,82}, :285:32, :287:29, :289:21, Mux.scala:29:36]
      states_4_g <= 3'h3;	// @[InputUnit.scala:192:19, :210:20]
    else if (_route_arbiter_io_out_valid & _route_arbiter_io_out_bits_src_virt_id == 3'h4 | _route_arbiter_io_in_4_ready & _route_arbiter_io_in_4_valid_T)	// @[Decoupled.scala:51:35, InputUnit.scala:187:29, :205:60, :210:20, :229:22, :232:{23,29}, :239:31, :242:18]
      states_4_g <= 3'h2;	// @[InputUnit.scala:192:19, :210:26]
    else if (_GEN_0) begin	// @[InputUnit.scala:192:19, :205:60, :210:20]
      if (io_in_flit_0_bits_flow_egress_node == 6'h2A)	// @[InputUnit.scala:209:57]
        states_4_g <= 3'h2;	// @[InputUnit.scala:192:19, :210:26]
      else	// @[InputUnit.scala:209:57]
        states_4_g <= 3'h1;	// @[InputUnit.scala:192:19, :210:26]
    end
    if (_GEN)	// @[InputUnit.scala:287:29]
      states_4_vc_sel_3_4 <= io_vcalloc_resp_vc_sel_3_4;	// @[InputUnit.scala:192:19]
    else if (_route_arbiter_io_out_valid & _route_arbiter_io_out_bits_src_virt_id == 3'h4)	// @[InputUnit.scala:187:29, :205:60, :210:20, :239:31, :244:{17,25}, :245:26]
      states_4_vc_sel_3_4 <= io_router_resp_vc_sel_3_4;	// @[InputUnit.scala:192:19]
    else	// @[InputUnit.scala:205:60, :239:31, :244:25, :245:26]
      states_4_vc_sel_3_4 <= ~_GEN_0 & states_4_vc_sel_3_4;	// @[InputUnit.scala:192:19, :205:60, :210:20, :211:45]
    if (_GEN_0) begin	// @[InputUnit.scala:192:19, :205:60, :210:20]
      states_4_flow_vnet_id <= io_in_flit_0_bits_flow_vnet_id;	// @[InputUnit.scala:192:19]
      states_4_flow_ingress_node <= io_in_flit_0_bits_flow_ingress_node;	// @[InputUnit.scala:192:19]
      states_4_flow_ingress_node_id <= io_in_flit_0_bits_flow_ingress_node_id;	// @[InputUnit.scala:192:19]
      states_4_flow_egress_node <= io_in_flit_0_bits_flow_egress_node;	// @[InputUnit.scala:192:19]
      states_4_flow_egress_node_id <= io_in_flit_0_bits_flow_egress_node_id;	// @[InputUnit.scala:192:19]
    end
    salloc_outs_0_valid <= _T_56;	// @[Decoupled.scala:51:35, InputUnit.scala:336:8]
    if (_vc_sel_WIRE_23)	// @[Mux.scala:27:73]
      salloc_outs_0_out_vid <= {_vc_sel_WIRE_23, 2'h0};	// @[Bitwise.scala:51:90, Cat.scala:33:92, InputUnit.scala:336:8, Mux.scala:27:73]
    else	// @[Mux.scala:27:73]
      salloc_outs_0_out_vid <= 3'h0;	// @[InputUnit.scala:208:27, :336:8]
    salloc_outs_0_flit_head <= _salloc_arb_io_chosen_oh_0[0] & _input_buffer_io_deq_0_bits_head | _salloc_arb_io_chosen_oh_0[1] & _input_buffer_io_deq_1_bits_head | _salloc_arb_io_chosen_oh_0[2] & _input_buffer_io_deq_2_bits_head | _salloc_arb_io_chosen_oh_0[3] & _input_buffer_io_deq_3_bits_head | _salloc_arb_io_chosen_oh_0[4] & _input_buffer_io_deq_4_bits_head;	// @[InputUnit.scala:181:28, :296:26, :336:8, Mux.scala:27:73, :29:36]
    salloc_outs_0_flit_tail <= _salloc_arb_io_chosen_oh_0[0] & _input_buffer_io_deq_0_bits_tail | _salloc_arb_io_chosen_oh_0[1] & _input_buffer_io_deq_1_bits_tail | _salloc_arb_io_chosen_oh_0[2] & _input_buffer_io_deq_2_bits_tail | _salloc_arb_io_chosen_oh_0[3] & _input_buffer_io_deq_3_bits_tail | _salloc_arb_io_chosen_oh_0[4] & _input_buffer_io_deq_4_bits_tail;	// @[InputUnit.scala:181:28, :296:26, :336:8, Mux.scala:27:73, :29:36]
    salloc_outs_0_flit_payload <= (_salloc_arb_io_chosen_oh_0[0] ? _input_buffer_io_deq_0_bits_payload : 73'h0) | (_salloc_arb_io_chosen_oh_0[1] ? _input_buffer_io_deq_1_bits_payload : 73'h0) | (_salloc_arb_io_chosen_oh_0[2] ? _input_buffer_io_deq_2_bits_payload : 73'h0) | (_salloc_arb_io_chosen_oh_0[3] ? _input_buffer_io_deq_3_bits_payload : 73'h0) | (_salloc_arb_io_chosen_oh_0[4] ? _input_buffer_io_deq_4_bits_payload : 73'h0);	// @[InputUnit.scala:181:28, :296:26, :336:8, Mux.scala:27:73, :29:36]
    if (_salloc_arb_io_chosen_oh_0[4]) begin	// @[InputUnit.scala:296:26, Mux.scala:29:36]
      salloc_outs_0_flit_flow_vnet_id <= states_4_flow_vnet_id;	// @[InputUnit.scala:192:19, :336:8]
      salloc_outs_0_flit_flow_ingress_node <= states_4_flow_ingress_node;	// @[InputUnit.scala:192:19, :336:8]
      salloc_outs_0_flit_flow_ingress_node_id <= states_4_flow_ingress_node_id;	// @[InputUnit.scala:192:19, :336:8]
      salloc_outs_0_flit_flow_egress_node <= states_4_flow_egress_node;	// @[InputUnit.scala:192:19, :336:8]
      salloc_outs_0_flit_flow_egress_node_id <= states_4_flow_egress_node_id;	// @[InputUnit.scala:192:19, :336:8]
    end
    else begin	// @[Mux.scala:29:36]
      salloc_outs_0_flit_flow_vnet_id <= 3'h0;	// @[InputUnit.scala:208:27, :336:8]
      salloc_outs_0_flit_flow_ingress_node <= 6'h0;	// @[InputUnit.scala:235:14, :336:8]
      salloc_outs_0_flit_flow_ingress_node_id <= 2'h0;	// @[Bitwise.scala:51:90, InputUnit.scala:336:8]
      salloc_outs_0_flit_flow_egress_node <= 6'h0;	// @[InputUnit.scala:235:14, :336:8]
      salloc_outs_0_flit_flow_egress_node_id <= 2'h0;	// @[Bitwise.scala:51:90, InputUnit.scala:336:8]
    end
    if (reset)
      mask <= 5'h0;	// @[InputUnit.scala:250:21]
    else if (_route_arbiter_io_out_valid)	// @[InputUnit.scala:187:29]
      mask <= _mask_T[4:0] - 5'h1;	// @[InputUnit.scala:250:21, :257:{18,53}]
    else if (vcalloc_vals_4)	// @[InputUnit.scala:266:32]
      mask <= {1'h0, {1'h0, {1'h0, {1'h0, vcalloc_sel[0]} | {2{vcalloc_sel[1]}}} | {3{vcalloc_sel[2]}}} | {4{vcalloc_sel[3]}}} | {5{vcalloc_sel[4]}};	// @[InputUnit.scala:250:21, :254:58, Mux.scala:27:73, :29:36]
  end // always @(posedge)
  `ifndef SYNTHESIS
    wire  [2:0][2:0] _GEN_1 = '{3'h0, 3'h0, 3'h0};	// @[InputUnit.scala:208:27]
    wire  [7:0][2:0] _GEN_2 = {_GEN_1, {{states_4_g}, {3'h0}, {3'h0}, {3'h0}, {3'h0}}};	// @[InputUnit.scala:192:19, :208:27]
    always @(posedge clock) begin	// @[InputUnit.scala:207:13]
      if (_T & ~reset & io_in_flit_0_bits_virt_channel_id > 3'h4) begin	// @[InputUnit.scala:205:32, :207:{13,17}, :210:20]
        if (`ASSERT_VERBOSE_COND_)	// @[InputUnit.scala:207:13]
          $error("Assertion failed\n    at InputUnit.scala:207 assert(id < nVirtualChannels.U)\n");	// @[InputUnit.scala:207:13]
        if (`STOP_COND_)	// @[InputUnit.scala:207:13]
          $fatal;	// @[InputUnit.scala:207:13]
      end
      if (_T & ~reset & (|_GEN_2[io_in_flit_0_bits_virt_channel_id])) begin	// @[InputUnit.scala:205:32, :208:{13,27}]
        if (`ASSERT_VERBOSE_COND_)	// @[InputUnit.scala:208:13]
          $error("Assertion failed\n    at InputUnit.scala:208 assert(states(id).g === g_i)\n");	// @[InputUnit.scala:208:13]
        if (`STOP_COND_)	// @[InputUnit.scala:208:13]
          $fatal;	// @[InputUnit.scala:208:13]
      end
      if (_route_arbiter_io_out_valid & ~reset & _GEN_2[_route_arbiter_io_out_bits_src_virt_id] != 3'h1) begin	// @[InputUnit.scala:187:29, :208:27, :210:26, :241:{11,25}]
        if (`ASSERT_VERBOSE_COND_)	// @[InputUnit.scala:241:11]
          $error("Assertion failed\n    at InputUnit.scala:241 assert(states(id).g === g_r)\n");	// @[InputUnit.scala:241:11]
        if (`STOP_COND_)	// @[InputUnit.scala:241:11]
          $fatal;	// @[InputUnit.scala:241:11]
      end
      if (_T_28 & vcalloc_sel[0] & ~reset) begin	// @[Decoupled.scala:51:35, InputUnit.scala:254:58, :291:17, Mux.scala:29:36]
        if (`ASSERT_VERBOSE_COND_)	// @[InputUnit.scala:291:17]
          $error("Assertion failed\n    at InputUnit.scala:291 assert(states(i).g === g_v)\n");	// @[InputUnit.scala:291:17]
        if (`STOP_COND_)	// @[InputUnit.scala:291:17]
          $fatal;	// @[InputUnit.scala:291:17]
      end
      if (_T_28 & vcalloc_sel[1] & ~reset) begin	// @[Decoupled.scala:51:35, InputUnit.scala:254:58, :291:17, Mux.scala:29:36]
        if (`ASSERT_VERBOSE_COND_)	// @[InputUnit.scala:291:17]
          $error("Assertion failed\n    at InputUnit.scala:291 assert(states(i).g === g_v)\n");	// @[InputUnit.scala:291:17]
        if (`STOP_COND_)	// @[InputUnit.scala:291:17]
          $fatal;	// @[InputUnit.scala:291:17]
      end
      if (_T_28 & vcalloc_sel[2] & ~reset) begin	// @[Decoupled.scala:51:35, InputUnit.scala:254:58, :291:17, Mux.scala:29:36]
        if (`ASSERT_VERBOSE_COND_)	// @[InputUnit.scala:291:17]
          $error("Assertion failed\n    at InputUnit.scala:291 assert(states(i).g === g_v)\n");	// @[InputUnit.scala:291:17]
        if (`STOP_COND_)	// @[InputUnit.scala:291:17]
          $fatal;	// @[InputUnit.scala:291:17]
      end
      if (_T_28 & vcalloc_sel[3] & ~reset) begin	// @[Decoupled.scala:51:35, InputUnit.scala:254:58, :291:17, Mux.scala:29:36]
        if (`ASSERT_VERBOSE_COND_)	// @[InputUnit.scala:291:17]
          $error("Assertion failed\n    at InputUnit.scala:291 assert(states(i).g === g_v)\n");	// @[InputUnit.scala:291:17]
        if (`STOP_COND_)	// @[InputUnit.scala:291:17]
          $fatal;	// @[InputUnit.scala:291:17]
      end
      if (_GEN & ~reset & ~vcalloc_vals_4) begin	// @[InputUnit.scala:266:32, :287:29, :291:17]
        if (`ASSERT_VERBOSE_COND_)	// @[InputUnit.scala:291:17]
          $error("Assertion failed\n    at InputUnit.scala:291 assert(states(i).g === g_v)\n");	// @[InputUnit.scala:291:17]
        if (`STOP_COND_)	// @[InputUnit.scala:291:17]
          $fatal;	// @[InputUnit.scala:291:17]
      end
    end // always @(posedge)
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0]     _RANDOM_0;
    logic [31:0]     _RANDOM_1;
    logic [31:0]     _RANDOM_2;
    logic [31:0]     _RANDOM_3;
    logic [31:0]     _RANDOM_4;
    logic [31:0]     _RANDOM_5;
    logic [31:0]     _RANDOM_6;
    logic [31:0]     _RANDOM_7;
    logic [31:0]     _RANDOM_8;
    logic [31:0]     _RANDOM_9;
    logic [31:0]     _RANDOM_10;
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
        states_4_g = _RANDOM_5[30:28];	// @[InputUnit.scala:192:19]
        states_4_vc_sel_3_4 = _RANDOM_6[3];	// @[InputUnit.scala:192:19]
        states_4_flow_vnet_id = _RANDOM_6[21:19];	// @[InputUnit.scala:192:19]
        states_4_flow_ingress_node = _RANDOM_6[27:22];	// @[InputUnit.scala:192:19]
        states_4_flow_ingress_node_id = _RANDOM_6[29:28];	// @[InputUnit.scala:192:19]
        states_4_flow_egress_node = {_RANDOM_6[31:30], _RANDOM_7[3:0]};	// @[InputUnit.scala:192:19]
        states_4_flow_egress_node_id = _RANDOM_7[5:4];	// @[InputUnit.scala:192:19]
        mask = _RANDOM_7[15:11];	// @[InputUnit.scala:192:19, :250:21]
        salloc_outs_0_valid = _RANDOM_7[16];	// @[InputUnit.scala:192:19, :336:8]
        salloc_outs_0_out_vid = _RANDOM_7[22:20];	// @[InputUnit.scala:192:19, :336:8]
        salloc_outs_0_flit_head = _RANDOM_7[23];	// @[InputUnit.scala:192:19, :336:8]
        salloc_outs_0_flit_tail = _RANDOM_7[24];	// @[InputUnit.scala:192:19, :336:8]
        salloc_outs_0_flit_payload = {_RANDOM_7[31:25], _RANDOM_8, _RANDOM_9, _RANDOM_10[1:0]};	// @[InputUnit.scala:192:19, :336:8]
        salloc_outs_0_flit_flow_vnet_id = _RANDOM_10[4:2];	// @[InputUnit.scala:336:8]
        salloc_outs_0_flit_flow_ingress_node = _RANDOM_10[10:5];	// @[InputUnit.scala:336:8]
        salloc_outs_0_flit_flow_ingress_node_id = _RANDOM_10[12:11];	// @[InputUnit.scala:336:8]
        salloc_outs_0_flit_flow_egress_node = _RANDOM_10[18:13];	// @[InputUnit.scala:336:8]
        salloc_outs_0_flit_flow_egress_node_id = _RANDOM_10[20:19];	// @[InputUnit.scala:336:8]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  InputBuffer_22 input_buffer (	// @[InputUnit.scala:181:28]
    .clock                         (clock),
    .reset                         (reset),
    .io_enq_0_valid                (io_in_flit_0_valid),
    .io_enq_0_bits_head            (io_in_flit_0_bits_head),
    .io_enq_0_bits_tail            (io_in_flit_0_bits_tail),
    .io_enq_0_bits_payload         (io_in_flit_0_bits_payload),
    .io_enq_0_bits_virt_channel_id (io_in_flit_0_bits_virt_channel_id),
    .io_deq_4_ready                (_salloc_arb_io_in_4_ready),	// @[InputUnit.scala:296:26]
    .io_deq_0_bits_head            (_input_buffer_io_deq_0_bits_head),
    .io_deq_0_bits_tail            (_input_buffer_io_deq_0_bits_tail),
    .io_deq_0_bits_payload         (_input_buffer_io_deq_0_bits_payload),
    .io_deq_1_bits_head            (_input_buffer_io_deq_1_bits_head),
    .io_deq_1_bits_tail            (_input_buffer_io_deq_1_bits_tail),
    .io_deq_1_bits_payload         (_input_buffer_io_deq_1_bits_payload),
    .io_deq_2_bits_head            (_input_buffer_io_deq_2_bits_head),
    .io_deq_2_bits_tail            (_input_buffer_io_deq_2_bits_tail),
    .io_deq_2_bits_payload         (_input_buffer_io_deq_2_bits_payload),
    .io_deq_3_bits_head            (_input_buffer_io_deq_3_bits_head),
    .io_deq_3_bits_tail            (_input_buffer_io_deq_3_bits_tail),
    .io_deq_3_bits_payload         (_input_buffer_io_deq_3_bits_payload),
    .io_deq_4_valid                (_input_buffer_io_deq_4_valid),
    .io_deq_4_bits_head            (_input_buffer_io_deq_4_bits_head),
    .io_deq_4_bits_tail            (_input_buffer_io_deq_4_bits_tail),
    .io_deq_4_bits_payload         (_input_buffer_io_deq_4_bits_payload)
  );
  Arbiter route_arbiter (	// @[InputUnit.scala:187:29]
    .io_in_0_valid                     (1'h0),
    .io_in_0_bits_flow_vnet_id         (3'h0),	// @[InputUnit.scala:208:27]
    .io_in_0_bits_flow_ingress_node    (6'h0),	// @[InputUnit.scala:235:14]
    .io_in_0_bits_flow_ingress_node_id (2'h0),	// @[Bitwise.scala:51:90]
    .io_in_0_bits_flow_egress_node     (6'h0),	// @[InputUnit.scala:235:14]
    .io_in_0_bits_flow_egress_node_id  (2'h0),	// @[Bitwise.scala:51:90]
    .io_in_1_valid                     (1'h0),
    .io_in_1_bits_src_virt_id          (3'h0),	// @[InputUnit.scala:208:27]
    .io_in_1_bits_flow_vnet_id         (3'h0),	// @[InputUnit.scala:208:27]
    .io_in_1_bits_flow_ingress_node    (6'h0),	// @[InputUnit.scala:235:14]
    .io_in_1_bits_flow_ingress_node_id (2'h0),	// @[Bitwise.scala:51:90]
    .io_in_1_bits_flow_egress_node     (6'h0),	// @[InputUnit.scala:235:14]
    .io_in_1_bits_flow_egress_node_id  (2'h0),	// @[Bitwise.scala:51:90]
    .io_in_2_valid                     (1'h0),
    .io_in_2_bits_src_virt_id          (3'h0),	// @[InputUnit.scala:208:27]
    .io_in_2_bits_flow_vnet_id         (3'h0),	// @[InputUnit.scala:208:27]
    .io_in_2_bits_flow_ingress_node    (6'h0),	// @[InputUnit.scala:235:14]
    .io_in_2_bits_flow_ingress_node_id (2'h0),	// @[Bitwise.scala:51:90]
    .io_in_2_bits_flow_egress_node     (6'h0),	// @[InputUnit.scala:235:14]
    .io_in_2_bits_flow_egress_node_id  (2'h0),	// @[Bitwise.scala:51:90]
    .io_in_3_valid                     (1'h0),
    .io_in_3_bits_src_virt_id          (3'h0),	// @[InputUnit.scala:208:27]
    .io_in_3_bits_flow_vnet_id         (3'h0),	// @[InputUnit.scala:208:27]
    .io_in_3_bits_flow_ingress_node    (6'h0),	// @[InputUnit.scala:235:14]
    .io_in_3_bits_flow_ingress_node_id (2'h0),	// @[Bitwise.scala:51:90]
    .io_in_3_bits_flow_egress_node     (6'h0),	// @[InputUnit.scala:235:14]
    .io_in_3_bits_flow_egress_node_id  (2'h0),	// @[Bitwise.scala:51:90]
    .io_in_4_valid                     (_route_arbiter_io_in_4_valid_T),	// @[InputUnit.scala:229:22]
    .io_in_4_bits_flow_vnet_id         (states_4_flow_vnet_id),	// @[InputUnit.scala:192:19]
    .io_in_4_bits_flow_ingress_node    (states_4_flow_ingress_node),	// @[InputUnit.scala:192:19]
    .io_in_4_bits_flow_ingress_node_id (states_4_flow_ingress_node_id),	// @[InputUnit.scala:192:19]
    .io_in_4_bits_flow_egress_node     (states_4_flow_egress_node),	// @[InputUnit.scala:192:19]
    .io_in_4_bits_flow_egress_node_id  (states_4_flow_egress_node_id),	// @[InputUnit.scala:192:19]
    .io_in_1_ready                     (_route_arbiter_io_in_1_ready),
    .io_in_2_ready                     (_route_arbiter_io_in_2_ready),
    .io_in_3_ready                     (_route_arbiter_io_in_3_ready),
    .io_in_4_ready                     (_route_arbiter_io_in_4_ready),
    .io_out_valid                      (_route_arbiter_io_out_valid),
    .io_out_bits_src_virt_id           (_route_arbiter_io_out_bits_src_virt_id),
    .io_out_bits_flow_vnet_id          (io_router_req_bits_flow_vnet_id),
    .io_out_bits_flow_ingress_node     (io_router_req_bits_flow_ingress_node),
    .io_out_bits_flow_ingress_node_id  (io_router_req_bits_flow_ingress_node_id),
    .io_out_bits_flow_egress_node      (io_router_req_bits_flow_egress_node),
    .io_out_bits_flow_egress_node_id   (io_router_req_bits_flow_egress_node_id)
  );
  SwitchArbiter_119 salloc_arb (	// @[InputUnit.scala:296:26]
    .clock                    (clock),
    .reset                    (reset),
    .io_in_0_valid            (1'h0),
    .io_in_0_bits_vc_sel_3_0  (1'h0),
    .io_in_0_bits_vc_sel_3_1  (1'h0),
    .io_in_0_bits_vc_sel_3_2  (1'h0),
    .io_in_0_bits_vc_sel_3_3  (1'h0),
    .io_in_0_bits_vc_sel_3_4  (1'h0),
    .io_in_0_bits_vc_sel_2_0  (1'h0),
    .io_in_0_bits_vc_sel_2_1  (1'h0),
    .io_in_0_bits_vc_sel_2_2  (1'h0),
    .io_in_0_bits_vc_sel_2_3  (1'h0),
    .io_in_0_bits_vc_sel_2_4  (1'h0),
    .io_in_0_bits_vc_sel_1_1  (1'h0),
    .io_in_0_bits_vc_sel_1_2  (1'h0),
    .io_in_0_bits_vc_sel_1_3  (1'h0),
    .io_in_0_bits_vc_sel_1_4  (1'h0),
    .io_in_0_bits_vc_sel_0_1  (1'h0),
    .io_in_0_bits_vc_sel_0_2  (1'h0),
    .io_in_0_bits_vc_sel_0_3  (1'h0),
    .io_in_0_bits_vc_sel_0_4  (1'h0),
    .io_in_0_bits_tail        (1'h0),
    .io_in_1_valid            (1'h0),
    .io_in_1_bits_vc_sel_3_0  (1'h0),
    .io_in_1_bits_vc_sel_3_1  (1'h0),
    .io_in_1_bits_vc_sel_3_2  (1'h0),
    .io_in_1_bits_vc_sel_3_3  (1'h0),
    .io_in_1_bits_vc_sel_3_4  (1'h0),
    .io_in_1_bits_vc_sel_2_0  (1'h0),
    .io_in_1_bits_vc_sel_2_1  (1'h0),
    .io_in_1_bits_vc_sel_2_2  (1'h0),
    .io_in_1_bits_vc_sel_2_3  (1'h0),
    .io_in_1_bits_vc_sel_2_4  (1'h0),
    .io_in_1_bits_vc_sel_1_1  (1'h0),
    .io_in_1_bits_vc_sel_1_2  (1'h0),
    .io_in_1_bits_vc_sel_1_3  (1'h0),
    .io_in_1_bits_vc_sel_1_4  (1'h0),
    .io_in_1_bits_vc_sel_0_1  (1'h0),
    .io_in_1_bits_vc_sel_0_2  (1'h0),
    .io_in_1_bits_vc_sel_0_3  (1'h0),
    .io_in_1_bits_vc_sel_0_4  (1'h0),
    .io_in_1_bits_tail        (1'h0),
    .io_in_2_valid            (1'h0),
    .io_in_2_bits_vc_sel_3_0  (1'h0),
    .io_in_2_bits_vc_sel_3_1  (1'h0),
    .io_in_2_bits_vc_sel_3_2  (1'h0),
    .io_in_2_bits_vc_sel_3_3  (1'h0),
    .io_in_2_bits_vc_sel_3_4  (1'h0),
    .io_in_2_bits_vc_sel_2_0  (1'h0),
    .io_in_2_bits_vc_sel_2_1  (1'h0),
    .io_in_2_bits_vc_sel_2_2  (1'h0),
    .io_in_2_bits_vc_sel_2_3  (1'h0),
    .io_in_2_bits_vc_sel_2_4  (1'h0),
    .io_in_2_bits_vc_sel_1_1  (1'h0),
    .io_in_2_bits_vc_sel_1_2  (1'h0),
    .io_in_2_bits_vc_sel_1_3  (1'h0),
    .io_in_2_bits_vc_sel_1_4  (1'h0),
    .io_in_2_bits_vc_sel_0_1  (1'h0),
    .io_in_2_bits_vc_sel_0_2  (1'h0),
    .io_in_2_bits_vc_sel_0_3  (1'h0),
    .io_in_2_bits_vc_sel_0_4  (1'h0),
    .io_in_2_bits_tail        (1'h0),
    .io_in_3_valid            (1'h0),
    .io_in_3_bits_vc_sel_3_0  (1'h0),
    .io_in_3_bits_vc_sel_3_1  (1'h0),
    .io_in_3_bits_vc_sel_3_2  (1'h0),
    .io_in_3_bits_vc_sel_3_3  (1'h0),
    .io_in_3_bits_vc_sel_3_4  (1'h0),
    .io_in_3_bits_vc_sel_2_0  (1'h0),
    .io_in_3_bits_vc_sel_2_1  (1'h0),
    .io_in_3_bits_vc_sel_2_2  (1'h0),
    .io_in_3_bits_vc_sel_2_3  (1'h0),
    .io_in_3_bits_vc_sel_2_4  (1'h0),
    .io_in_3_bits_vc_sel_1_1  (1'h0),
    .io_in_3_bits_vc_sel_1_2  (1'h0),
    .io_in_3_bits_vc_sel_1_3  (1'h0),
    .io_in_3_bits_vc_sel_1_4  (1'h0),
    .io_in_3_bits_vc_sel_0_1  (1'h0),
    .io_in_3_bits_vc_sel_0_2  (1'h0),
    .io_in_3_bits_vc_sel_0_3  (1'h0),
    .io_in_3_bits_vc_sel_0_4  (1'h0),
    .io_in_3_bits_tail        (1'h0),
    .io_in_4_valid            (_salloc_arb_io_in_4_valid_T_2),	// @[InputUnit.scala:305:50]
    .io_in_4_bits_vc_sel_3_0  (1'h0),
    .io_in_4_bits_vc_sel_3_1  (1'h0),
    .io_in_4_bits_vc_sel_3_2  (1'h0),
    .io_in_4_bits_vc_sel_3_3  (1'h0),
    .io_in_4_bits_vc_sel_3_4  (states_4_vc_sel_3_4),	// @[InputUnit.scala:192:19]
    .io_in_4_bits_vc_sel_2_0  (1'h0),
    .io_in_4_bits_vc_sel_2_1  (1'h0),
    .io_in_4_bits_vc_sel_2_2  (1'h0),
    .io_in_4_bits_vc_sel_2_3  (1'h0),
    .io_in_4_bits_vc_sel_2_4  (1'h0),
    .io_in_4_bits_vc_sel_1_1  (1'h0),
    .io_in_4_bits_vc_sel_1_2  (1'h0),
    .io_in_4_bits_vc_sel_1_3  (1'h0),
    .io_in_4_bits_vc_sel_1_4  (1'h0),
    .io_in_4_bits_vc_sel_0_1  (1'h0),
    .io_in_4_bits_vc_sel_0_2  (1'h0),
    .io_in_4_bits_vc_sel_0_3  (1'h0),
    .io_in_4_bits_vc_sel_0_4  (1'h0),
    .io_in_4_bits_tail        (_input_buffer_io_deq_4_bits_tail),	// @[InputUnit.scala:181:28]
    .io_out_0_ready           (io_salloc_req_0_ready),
    .io_in_0_ready            (_salloc_arb_io_in_0_ready),
    .io_in_1_ready            (_salloc_arb_io_in_1_ready),
    .io_in_2_ready            (_salloc_arb_io_in_2_ready),
    .io_in_3_ready            (_salloc_arb_io_in_3_ready),
    .io_in_4_ready            (_salloc_arb_io_in_4_ready),
    .io_out_0_valid           (_salloc_arb_io_out_0_valid),
    .io_out_0_bits_vc_sel_3_0 (io_salloc_req_0_bits_vc_sel_3_0),
    .io_out_0_bits_vc_sel_3_1 (io_salloc_req_0_bits_vc_sel_3_1),
    .io_out_0_bits_vc_sel_3_2 (io_salloc_req_0_bits_vc_sel_3_2),
    .io_out_0_bits_vc_sel_3_3 (io_salloc_req_0_bits_vc_sel_3_3),
    .io_out_0_bits_vc_sel_3_4 (io_salloc_req_0_bits_vc_sel_3_4),
    .io_out_0_bits_vc_sel_2_0 (io_salloc_req_0_bits_vc_sel_2_0),
    .io_out_0_bits_vc_sel_2_1 (io_salloc_req_0_bits_vc_sel_2_1),
    .io_out_0_bits_vc_sel_2_2 (io_salloc_req_0_bits_vc_sel_2_2),
    .io_out_0_bits_vc_sel_2_3 (io_salloc_req_0_bits_vc_sel_2_3),
    .io_out_0_bits_vc_sel_2_4 (io_salloc_req_0_bits_vc_sel_2_4),
    .io_out_0_bits_vc_sel_1_1 (io_salloc_req_0_bits_vc_sel_1_1),
    .io_out_0_bits_vc_sel_1_2 (io_salloc_req_0_bits_vc_sel_1_2),
    .io_out_0_bits_vc_sel_1_3 (io_salloc_req_0_bits_vc_sel_1_3),
    .io_out_0_bits_vc_sel_1_4 (io_salloc_req_0_bits_vc_sel_1_4),
    .io_out_0_bits_vc_sel_0_1 (io_salloc_req_0_bits_vc_sel_0_1),
    .io_out_0_bits_vc_sel_0_2 (io_salloc_req_0_bits_vc_sel_0_2),
    .io_out_0_bits_vc_sel_0_3 (io_salloc_req_0_bits_vc_sel_0_3),
    .io_out_0_bits_vc_sel_0_4 (io_salloc_req_0_bits_vc_sel_0_4),
    .io_out_0_bits_tail       (io_salloc_req_0_bits_tail),
    .io_chosen_oh_0           (_salloc_arb_io_chosen_oh_0)
  );
  assign io_router_req_bits_src_virt_id = _route_arbiter_io_out_bits_src_virt_id;	// @[InputUnit.scala:187:29]
  assign io_vcalloc_req_valid = vcalloc_vals_4;	// @[InputUnit.scala:266:32]
  assign io_vcalloc_req_bits_vc_sel_3_4 = vcalloc_sel[4] & states_4_vc_sel_3_4;	// @[InputUnit.scala:192:19, :254:58, Mux.scala:27:73, :29:36]
  assign io_salloc_req_0_valid = _salloc_arb_io_out_0_valid;	// @[InputUnit.scala:296:26]
  assign io_out_0_valid = salloc_outs_0_valid;	// @[InputUnit.scala:336:8]
  assign io_out_0_bits_flit_head = salloc_outs_0_flit_head;	// @[InputUnit.scala:336:8]
  assign io_out_0_bits_flit_tail = salloc_outs_0_flit_tail;	// @[InputUnit.scala:336:8]
  assign io_out_0_bits_flit_payload = salloc_outs_0_flit_payload;	// @[InputUnit.scala:336:8]
  assign io_out_0_bits_flit_flow_vnet_id = salloc_outs_0_flit_flow_vnet_id;	// @[InputUnit.scala:336:8]
  assign io_out_0_bits_flit_flow_ingress_node = salloc_outs_0_flit_flow_ingress_node;	// @[InputUnit.scala:336:8]
  assign io_out_0_bits_flit_flow_ingress_node_id = salloc_outs_0_flit_flow_ingress_node_id;	// @[InputUnit.scala:336:8]
  assign io_out_0_bits_flit_flow_egress_node = salloc_outs_0_flit_flow_egress_node;	// @[InputUnit.scala:336:8]
  assign io_out_0_bits_flit_flow_egress_node_id = salloc_outs_0_flit_flow_egress_node_id;	// @[InputUnit.scala:336:8]
  assign io_out_0_bits_out_virt_channel = salloc_outs_0_out_vid;	// @[InputUnit.scala:336:8]
  assign io_debug_va_stall = {2'h0, vcalloc_vals_4} - {2'h0, io_vcalloc_req_ready};	// @[Bitwise.scala:51:90, InputUnit.scala:266:32, :283:47]
  assign io_debug_sa_stall = {2'h0, _salloc_arb_io_in_4_valid_T_2 & ~_salloc_arb_io_in_4_ready};	// @[Bitwise.scala:51:90, InputUnit.scala:296:26, :305:50, :319:{67,70}]
  assign io_in_credit_return = _T_56 ? _salloc_arb_io_chosen_oh_0 : 5'h0;	// @[Decoupled.scala:51:35, InputUnit.scala:250:21, :296:26, :340:8]
  assign io_in_vc_free = _T_56 & (_salloc_arb_io_chosen_oh_0[0] & _input_buffer_io_deq_0_bits_tail | _salloc_arb_io_chosen_oh_0[1] & _input_buffer_io_deq_1_bits_tail | _salloc_arb_io_chosen_oh_0[2] & _input_buffer_io_deq_2_bits_tail | _salloc_arb_io_chosen_oh_0[3] & _input_buffer_io_deq_3_bits_tail | _salloc_arb_io_chosen_oh_0[4] & _input_buffer_io_deq_4_bits_tail) ? _salloc_arb_io_chosen_oh_0 : 5'h0;	// @[Decoupled.scala:51:35, InputUnit.scala:181:28, :250:21, :296:26, :343:{8,18}, Mux.scala:27:73, :29:36]
endmodule

