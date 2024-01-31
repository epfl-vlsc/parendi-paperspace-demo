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

module IngressUnit_579(
  input        clock,
               reset,
               io_vcalloc_req_ready,
               io_vcalloc_resp_vc_sel_3_0,
               io_vcalloc_resp_vc_sel_2_0,
               io_vcalloc_resp_vc_sel_1_0,
               io_vcalloc_resp_vc_sel_0_0,
               io_vcalloc_resp_vc_sel_0_1,
               io_vcalloc_resp_vc_sel_0_2,
               io_vcalloc_resp_vc_sel_0_3,
               io_vcalloc_resp_vc_sel_0_4,
               io_out_credit_available_3_0,
               io_out_credit_available_2_0,
               io_out_credit_available_1_0,
               io_out_credit_available_0_1,
               io_out_credit_available_0_2,
               io_out_credit_available_0_3,
               io_out_credit_available_0_4,
               io_salloc_req_0_ready,
               io_in_valid,
               io_in_bits_head,
               io_in_bits_tail,
  input [72:0] io_in_bits_payload
);

  wire        _vcalloc_q_io_enq_ready;	// @[IngressUnit.scala:76:25]
  wire        _vcalloc_q_io_deq_valid;	// @[IngressUnit.scala:76:25]
  wire        _vcalloc_q_io_deq_bits_vc_sel_3_0;	// @[IngressUnit.scala:76:25]
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
  wire        _route_q_io_deq_bits_vc_sel_3_0;	// @[IngressUnit.scala:27:23]
  wire        _route_q_io_deq_bits_vc_sel_2_0;	// @[IngressUnit.scala:27:23]
  wire        _route_q_io_deq_bits_vc_sel_1_0;	// @[IngressUnit.scala:27:23]
  wire        _route_q_io_deq_bits_vc_sel_0_0;	// @[IngressUnit.scala:27:23]
  wire        _route_q_io_deq_bits_vc_sel_0_1;	// @[IngressUnit.scala:27:23]
  wire        _route_q_io_deq_bits_vc_sel_0_2;	// @[IngressUnit.scala:27:23]
  wire        _route_q_io_deq_bits_vc_sel_0_3;	// @[IngressUnit.scala:27:23]
  wire        _route_q_io_deq_bits_vc_sel_0_4;	// @[IngressUnit.scala:27:23]
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
  `ifndef SYNTHESIS	// @[IngressUnit.scala:30:9]
    always @(posedge clock) begin	// @[IngressUnit.scala:30:9]
      if (~reset & io_in_valid) begin	// @[IngressUnit.scala:30:9]
        if (`ASSERT_VERBOSE_COND_)	// @[IngressUnit.scala:30:9]
          $error("Assertion failed\n    at IngressUnit.scala:30 assert(!(io.in.valid && !cParam.possibleFlows.toSeq.map(_.egressId.U === io.in.bits.egress_id).orR))\n");	// @[IngressUnit.scala:30:9]
        if (`STOP_COND_)	// @[IngressUnit.scala:30:9]
          $fatal;	// @[IngressUnit.scala:30:9]
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire        _route_buffer_io_deq_ready_T_8 = _vcalloc_buffer_io_enq_ready & (_route_q_io_deq_valid | ~_route_buffer_io_deq_bits_head) & (io_vcalloc_req_ready | ~_route_buffer_io_deq_bits_head) & (_vcalloc_q_io_enq_ready | ~_route_buffer_io_deq_bits_head);	// @[IngressUnit.scala:26:28, :27:23, :75:30, :76:25, :88:30, :94:27, :95:{27,37}, :96:29]
  wire        _vcalloc_buffer_io_deq_ready_T_1 = io_salloc_req_0_ready & _vcalloc_q_io_deq_valid & (|({_vcalloc_q_io_deq_bits_vc_sel_3_0, _vcalloc_q_io_deq_bits_vc_sel_2_0, _vcalloc_q_io_deq_bits_vc_sel_1_0, _vcalloc_q_io_deq_bits_vc_sel_0_4, _vcalloc_q_io_deq_bits_vc_sel_0_3, _vcalloc_q_io_deq_bits_vc_sel_0_2, _vcalloc_q_io_deq_bits_vc_sel_0_1, _vcalloc_q_io_deq_bits_vc_sel_0_0} & {io_out_credit_available_3_0, io_out_credit_available_2_0, io_out_credit_available_1_0, io_out_credit_available_0_4, io_out_credit_available_0_3, io_out_credit_available_0_2, io_out_credit_available_0_1, 1'h1}));	// @[IngressUnit.scala:76:25, :107:{41,48,74,82}, :110:83]
  Queue_5 route_buffer (	// @[IngressUnit.scala:26:28]
    .clock                            (clock),
    .reset                            (reset),
    .io_enq_valid                     (io_in_valid),
    .io_enq_bits_head                 (io_in_bits_head),
    .io_enq_bits_tail                 (io_in_bits_tail),
    .io_enq_bits_payload              (io_in_bits_payload),
    .io_enq_bits_flow_vnet_id         (3'h0),	// @[IngressUnit.scala:36:35]
    .io_enq_bits_flow_ingress_node    (9'h0),	// @[IngressUnit.scala:36:35]
    .io_enq_bits_flow_ingress_node_id (2'h0),	// @[IngressUnit.scala:36:35]
    .io_enq_bits_flow_egress_node     (9'h0),	// @[IngressUnit.scala:36:35]
    .io_enq_bits_flow_egress_node_id  (2'h0),	// @[IngressUnit.scala:36:35]
    .io_enq_bits_virt_channel_id      (3'h0),	// @[IngressUnit.scala:36:35]
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
  Queue_3673 route_q (	// @[IngressUnit.scala:27:23]
    .clock                  (clock),
    .reset                  (reset),
    .io_enq_valid           (1'h0),
    .io_enq_bits_vc_sel_3_0 (1'h0),
    .io_enq_bits_vc_sel_2_0 (1'h0),
    .io_enq_bits_vc_sel_1_0 (1'h0),
    .io_enq_bits_vc_sel_0_1 (1'h0),
    .io_enq_bits_vc_sel_0_2 (1'h0),
    .io_enq_bits_vc_sel_0_3 (1'h0),
    .io_enq_bits_vc_sel_0_4 (1'h0),
    .io_deq_ready           (_route_buffer_io_deq_ready_T_8 & _route_buffer_io_deq_valid & _route_buffer_io_deq_bits_tail),	// @[IngressUnit.scala:26:28, :95:37, :97:55]
    .io_enq_ready           (_route_q_io_enq_ready),
    .io_deq_valid           (_route_q_io_deq_valid),
    .io_deq_bits_vc_sel_3_0 (_route_q_io_deq_bits_vc_sel_3_0),
    .io_deq_bits_vc_sel_2_0 (_route_q_io_deq_bits_vc_sel_2_0),
    .io_deq_bits_vc_sel_1_0 (_route_q_io_deq_bits_vc_sel_1_0),
    .io_deq_bits_vc_sel_0_0 (_route_q_io_deq_bits_vc_sel_0_0),
    .io_deq_bits_vc_sel_0_1 (_route_q_io_deq_bits_vc_sel_0_1),
    .io_deq_bits_vc_sel_0_2 (_route_q_io_deq_bits_vc_sel_0_2),
    .io_deq_bits_vc_sel_0_3 (_route_q_io_deq_bits_vc_sel_0_3),
    .io_deq_bits_vc_sel_0_4 (_route_q_io_deq_bits_vc_sel_0_4)
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
  Queue_3675 vcalloc_q (	// @[IngressUnit.scala:76:25]
    .clock                  (clock),
    .reset                  (reset),
    .io_enq_valid           (1'h0),
    .io_enq_bits_vc_sel_3_0 (io_vcalloc_resp_vc_sel_3_0),
    .io_enq_bits_vc_sel_2_0 (io_vcalloc_resp_vc_sel_2_0),
    .io_enq_bits_vc_sel_1_0 (io_vcalloc_resp_vc_sel_1_0),
    .io_enq_bits_vc_sel_0_0 (io_vcalloc_resp_vc_sel_0_0),
    .io_enq_bits_vc_sel_0_1 (io_vcalloc_resp_vc_sel_0_1),
    .io_enq_bits_vc_sel_0_2 (io_vcalloc_resp_vc_sel_0_2),
    .io_enq_bits_vc_sel_0_3 (io_vcalloc_resp_vc_sel_0_3),
    .io_enq_bits_vc_sel_0_4 (io_vcalloc_resp_vc_sel_0_4),
    .io_deq_ready           (_vcalloc_buffer_io_deq_bits_tail & _vcalloc_buffer_io_deq_ready_T_1 & _vcalloc_buffer_io_deq_valid),	// @[IngressUnit.scala:75:30, :110:83, :111:42]
    .io_enq_ready           (_vcalloc_q_io_enq_ready),
    .io_deq_valid           (_vcalloc_q_io_deq_valid),
    .io_deq_bits_vc_sel_3_0 (_vcalloc_q_io_deq_bits_vc_sel_3_0),
    .io_deq_bits_vc_sel_2_0 (_vcalloc_q_io_deq_bits_vc_sel_2_0),
    .io_deq_bits_vc_sel_1_0 (_vcalloc_q_io_deq_bits_vc_sel_1_0),
    .io_deq_bits_vc_sel_0_0 (_vcalloc_q_io_deq_bits_vc_sel_0_0),
    .io_deq_bits_vc_sel_0_1 (_vcalloc_q_io_deq_bits_vc_sel_0_1),
    .io_deq_bits_vc_sel_0_2 (_vcalloc_q_io_deq_bits_vc_sel_0_2),
    .io_deq_bits_vc_sel_0_3 (_vcalloc_q_io_deq_bits_vc_sel_0_3),
    .io_deq_bits_vc_sel_0_4 (_vcalloc_q_io_deq_bits_vc_sel_0_4)
  );
endmodule

