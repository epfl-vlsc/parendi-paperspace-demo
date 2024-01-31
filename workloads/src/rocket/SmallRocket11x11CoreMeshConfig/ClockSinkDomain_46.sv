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

module ClockSinkDomain_46(
  input         auto_buffer_in_flit_0_valid,
                auto_buffer_in_flit_0_bits_head,
                auto_buffer_in_flit_0_bits_tail,
  input  [72:0] auto_buffer_in_flit_0_bits_payload,
  input  [2:0]  auto_buffer_in_flit_0_bits_flow_vnet_id,
  input  [7:0]  auto_buffer_in_flit_0_bits_flow_ingress_node,
  input  [1:0]  auto_buffer_in_flit_0_bits_flow_ingress_node_id,
  input  [7:0]  auto_buffer_in_flit_0_bits_flow_egress_node,
  input  [1:0]  auto_buffer_in_flit_0_bits_flow_egress_node_id,
  input  [2:0]  auto_buffer_in_flit_0_bits_virt_channel_id,
  input         auto_routers_egress_nodes_out_1_flit_ready,
                auto_routers_egress_nodes_out_0_flit_ready,
                auto_routers_ingress_nodes_in_2_flit_valid,
                auto_routers_ingress_nodes_in_2_flit_bits_head,
  input  [72:0] auto_routers_ingress_nodes_in_2_flit_bits_payload,
  input         auto_routers_ingress_nodes_in_1_flit_valid,
                auto_routers_ingress_nodes_in_1_flit_bits_head,
                auto_routers_ingress_nodes_in_1_flit_bits_tail,
  input  [72:0] auto_routers_ingress_nodes_in_1_flit_bits_payload,
  input         auto_routers_ingress_nodes_in_0_flit_valid,
                auto_routers_ingress_nodes_in_0_flit_bits_head,
                auto_routers_ingress_nodes_in_0_flit_bits_tail,
  input  [72:0] auto_routers_ingress_nodes_in_0_flit_bits_payload,
  input  [7:0]  auto_routers_ingress_nodes_in_0_flit_bits_egress_id,
  input  [4:0]  auto_routers_source_nodes_out_credit_return,
                auto_routers_source_nodes_out_vc_free,
  input         auto_clock_in_clock,
                auto_clock_in_reset,
  output [4:0]  auto_buffer_in_credit_return,
                auto_buffer_in_vc_free,
  output [2:0]  auto_routers_debug_out_va_stall_0,
                auto_routers_debug_out_va_stall_1,
                auto_routers_debug_out_va_stall_2,
                auto_routers_debug_out_va_stall_3,
                auto_routers_debug_out_sa_stall_0,
                auto_routers_debug_out_sa_stall_1,
                auto_routers_debug_out_sa_stall_2,
                auto_routers_debug_out_sa_stall_3,
  output        auto_routers_egress_nodes_out_1_flit_valid,
                auto_routers_egress_nodes_out_1_flit_bits_head,
                auto_routers_egress_nodes_out_1_flit_bits_tail,
  output [72:0] auto_routers_egress_nodes_out_1_flit_bits_payload,
  output        auto_routers_egress_nodes_out_0_flit_valid,
                auto_routers_egress_nodes_out_0_flit_bits_head,
                auto_routers_egress_nodes_out_0_flit_bits_tail,
  output [72:0] auto_routers_egress_nodes_out_0_flit_bits_payload,
  output        auto_routers_ingress_nodes_in_2_flit_ready,
                auto_routers_ingress_nodes_in_1_flit_ready,
                auto_routers_ingress_nodes_in_0_flit_ready,
                auto_routers_source_nodes_out_flit_0_valid,
                auto_routers_source_nodes_out_flit_0_bits_head,
                auto_routers_source_nodes_out_flit_0_bits_tail,
  output [72:0] auto_routers_source_nodes_out_flit_0_bits_payload,
  output [2:0]  auto_routers_source_nodes_out_flit_0_bits_flow_vnet_id,
  output [7:0]  auto_routers_source_nodes_out_flit_0_bits_flow_ingress_node,
  output [1:0]  auto_routers_source_nodes_out_flit_0_bits_flow_ingress_node_id,
  output [7:0]  auto_routers_source_nodes_out_flit_0_bits_flow_egress_node,
  output [1:0]  auto_routers_source_nodes_out_flit_0_bits_flow_egress_node_id,
  output [2:0]  auto_routers_source_nodes_out_flit_0_bits_virt_channel_id
);

  wire [4:0]  _routers_auto_dest_nodes_in_credit_return;	// NoC.scala:64:22
  wire [4:0]  _routers_auto_dest_nodes_in_vc_free;	// NoC.scala:64:22
  reg         buffer_x1_flit_0_v;	// Valid.scala:130:22
  reg         buffer_x1_flit_0_b_head;	// Reg.scala:19:16
  reg         buffer_x1_flit_0_b_tail;	// Reg.scala:19:16
  reg  [72:0] buffer_x1_flit_0_b_payload;	// Reg.scala:19:16
  reg  [2:0]  buffer_x1_flit_0_b_flow_vnet_id;	// Reg.scala:19:16
  reg  [7:0]  buffer_x1_flit_0_b_flow_ingress_node;	// Reg.scala:19:16
  reg  [1:0]  buffer_x1_flit_0_b_flow_ingress_node_id;	// Reg.scala:19:16
  reg  [7:0]  buffer_x1_flit_0_b_flow_egress_node;	// Reg.scala:19:16
  reg  [1:0]  buffer_x1_flit_0_b_flow_egress_node_id;	// Reg.scala:19:16
  reg  [2:0]  buffer_x1_flit_0_b_virt_channel_id;	// Reg.scala:19:16
  reg  [4:0]  buffer_x1_credit_return_r;	// Reg.scala:19:16
  reg  [4:0]  buffer_x1_credit_return_r_1;	// Reg.scala:19:16
  reg  [4:0]  buffer_x1_credit_return_r_2;	// Reg.scala:19:16
  reg  [4:0]  buffer_x1_credit_return_r_3;	// Reg.scala:19:16
  reg  [4:0]  buffer_x1_vc_free_r;	// Reg.scala:19:16
  reg  [4:0]  buffer_x1_vc_free_r_1;	// Reg.scala:19:16
  reg  [4:0]  buffer_x1_vc_free_r_2;	// Reg.scala:19:16
  reg  [4:0]  buffer_x1_vc_free_r_3;	// Reg.scala:19:16
  always @(posedge auto_clock_in_clock) begin
    if (auto_clock_in_reset)
      buffer_x1_flit_0_v <= 1'h0;	// LazyModule.scala:411:29, Valid.scala:130:22
    else
      buffer_x1_flit_0_v <= auto_buffer_in_flit_0_valid;	// Valid.scala:130:22
    if (auto_buffer_in_flit_0_valid) begin
      buffer_x1_flit_0_b_head <= auto_buffer_in_flit_0_bits_head;	// Reg.scala:19:16
      buffer_x1_flit_0_b_tail <= auto_buffer_in_flit_0_bits_tail;	// Reg.scala:19:16
      buffer_x1_flit_0_b_payload <= auto_buffer_in_flit_0_bits_payload;	// Reg.scala:19:16
      buffer_x1_flit_0_b_flow_vnet_id <= auto_buffer_in_flit_0_bits_flow_vnet_id;	// Reg.scala:19:16
      buffer_x1_flit_0_b_flow_ingress_node <=
        auto_buffer_in_flit_0_bits_flow_ingress_node;	// Reg.scala:19:16
      buffer_x1_flit_0_b_flow_ingress_node_id <=
        auto_buffer_in_flit_0_bits_flow_ingress_node_id;	// Reg.scala:19:16
      buffer_x1_flit_0_b_flow_egress_node <= auto_buffer_in_flit_0_bits_flow_egress_node;	// Reg.scala:19:16
      buffer_x1_flit_0_b_flow_egress_node_id <=
        auto_buffer_in_flit_0_bits_flow_egress_node_id;	// Reg.scala:19:16
      buffer_x1_flit_0_b_virt_channel_id <= auto_buffer_in_flit_0_bits_virt_channel_id;	// Reg.scala:19:16
    end
    buffer_x1_credit_return_r <= _routers_auto_dest_nodes_in_credit_return;	// NoC.scala:64:22, Reg.scala:19:16
    buffer_x1_credit_return_r_1 <= buffer_x1_credit_return_r;	// Reg.scala:19:16
    buffer_x1_credit_return_r_2 <= buffer_x1_credit_return_r_1;	// Reg.scala:19:16
    buffer_x1_credit_return_r_3 <= buffer_x1_credit_return_r_2;	// Reg.scala:19:16
    buffer_x1_vc_free_r <= _routers_auto_dest_nodes_in_vc_free;	// NoC.scala:64:22, Reg.scala:19:16
    buffer_x1_vc_free_r_1 <= buffer_x1_vc_free_r;	// Reg.scala:19:16
    buffer_x1_vc_free_r_2 <= buffer_x1_vc_free_r_1;	// Reg.scala:19:16
    buffer_x1_vc_free_r_3 <= buffer_x1_vc_free_r_2;	// Reg.scala:19:16
  end // always @(posedge)
  `ifndef SYNTHESIS
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
        buffer_x1_flit_0_v = _RANDOM_0[0];	// Valid.scala:130:22
        buffer_x1_flit_0_b_head = _RANDOM_0[1];	// Reg.scala:19:16, Valid.scala:130:22
        buffer_x1_flit_0_b_tail = _RANDOM_0[2];	// Reg.scala:19:16, Valid.scala:130:22
        buffer_x1_flit_0_b_payload = {_RANDOM_0[31:3], _RANDOM_1, _RANDOM_2[11:0]};	// Reg.scala:19:16, Valid.scala:130:22
        buffer_x1_flit_0_b_flow_vnet_id = _RANDOM_2[14:12];	// Reg.scala:19:16
        buffer_x1_flit_0_b_flow_ingress_node = _RANDOM_2[22:15];	// Reg.scala:19:16
        buffer_x1_flit_0_b_flow_ingress_node_id = _RANDOM_2[24:23];	// Reg.scala:19:16
        buffer_x1_flit_0_b_flow_egress_node = {_RANDOM_2[31:25], _RANDOM_3[0]};	// Reg.scala:19:16
        buffer_x1_flit_0_b_flow_egress_node_id = _RANDOM_3[2:1];	// Reg.scala:19:16
        buffer_x1_flit_0_b_virt_channel_id = _RANDOM_3[5:3];	// Reg.scala:19:16
        buffer_x1_credit_return_r = _RANDOM_3[10:6];	// Reg.scala:19:16
        buffer_x1_credit_return_r_1 = _RANDOM_3[15:11];	// Reg.scala:19:16
        buffer_x1_credit_return_r_2 = _RANDOM_3[20:16];	// Reg.scala:19:16
        buffer_x1_credit_return_r_3 = _RANDOM_3[25:21];	// Reg.scala:19:16
        buffer_x1_vc_free_r = _RANDOM_3[30:26];	// Reg.scala:19:16
        buffer_x1_vc_free_r_1 = {_RANDOM_3[31], _RANDOM_4[3:0]};	// Reg.scala:19:16
        buffer_x1_vc_free_r_2 = _RANDOM_4[8:4];	// Reg.scala:19:16
        buffer_x1_vc_free_r_3 = _RANDOM_4[13:9];	// Reg.scala:19:16
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  Router_46 routers (	// NoC.scala:64:22
    .clock                                                  (auto_clock_in_clock),
    .reset                                                  (auto_clock_in_reset),
    .auto_egress_nodes_out_1_flit_ready
      (auto_routers_egress_nodes_out_1_flit_ready),
    .auto_egress_nodes_out_0_flit_ready
      (auto_routers_egress_nodes_out_0_flit_ready),
    .auto_ingress_nodes_in_2_flit_valid
      (auto_routers_ingress_nodes_in_2_flit_valid),
    .auto_ingress_nodes_in_2_flit_bits_head
      (auto_routers_ingress_nodes_in_2_flit_bits_head),
    .auto_ingress_nodes_in_2_flit_bits_payload
      (auto_routers_ingress_nodes_in_2_flit_bits_payload),
    .auto_ingress_nodes_in_1_flit_valid
      (auto_routers_ingress_nodes_in_1_flit_valid),
    .auto_ingress_nodes_in_1_flit_bits_head
      (auto_routers_ingress_nodes_in_1_flit_bits_head),
    .auto_ingress_nodes_in_1_flit_bits_tail
      (auto_routers_ingress_nodes_in_1_flit_bits_tail),
    .auto_ingress_nodes_in_1_flit_bits_payload
      (auto_routers_ingress_nodes_in_1_flit_bits_payload),
    .auto_ingress_nodes_in_0_flit_valid
      (auto_routers_ingress_nodes_in_0_flit_valid),
    .auto_ingress_nodes_in_0_flit_bits_head
      (auto_routers_ingress_nodes_in_0_flit_bits_head),
    .auto_ingress_nodes_in_0_flit_bits_tail
      (auto_routers_ingress_nodes_in_0_flit_bits_tail),
    .auto_ingress_nodes_in_0_flit_bits_payload
      (auto_routers_ingress_nodes_in_0_flit_bits_payload),
    .auto_ingress_nodes_in_0_flit_bits_egress_id
      (auto_routers_ingress_nodes_in_0_flit_bits_egress_id),
    .auto_source_nodes_out_credit_return
      (auto_routers_source_nodes_out_credit_return),
    .auto_source_nodes_out_vc_free
      (auto_routers_source_nodes_out_vc_free),
    .auto_dest_nodes_in_flit_0_valid                        (buffer_x1_flit_0_v),	// Valid.scala:130:22
    .auto_dest_nodes_in_flit_0_bits_head                    (buffer_x1_flit_0_b_head),	// Reg.scala:19:16
    .auto_dest_nodes_in_flit_0_bits_tail                    (buffer_x1_flit_0_b_tail),	// Reg.scala:19:16
    .auto_dest_nodes_in_flit_0_bits_payload                 (buffer_x1_flit_0_b_payload),	// Reg.scala:19:16
    .auto_dest_nodes_in_flit_0_bits_flow_vnet_id
      (buffer_x1_flit_0_b_flow_vnet_id),	// Reg.scala:19:16
    .auto_dest_nodes_in_flit_0_bits_flow_ingress_node
      (buffer_x1_flit_0_b_flow_ingress_node),	// Reg.scala:19:16
    .auto_dest_nodes_in_flit_0_bits_flow_ingress_node_id
      (buffer_x1_flit_0_b_flow_ingress_node_id),	// Reg.scala:19:16
    .auto_dest_nodes_in_flit_0_bits_flow_egress_node
      (buffer_x1_flit_0_b_flow_egress_node),	// Reg.scala:19:16
    .auto_dest_nodes_in_flit_0_bits_flow_egress_node_id
      (buffer_x1_flit_0_b_flow_egress_node_id),	// Reg.scala:19:16
    .auto_dest_nodes_in_flit_0_bits_virt_channel_id
      (buffer_x1_flit_0_b_virt_channel_id),	// Reg.scala:19:16
    .auto_debug_out_va_stall_0
      (auto_routers_debug_out_va_stall_0),
    .auto_debug_out_va_stall_1
      (auto_routers_debug_out_va_stall_1),
    .auto_debug_out_va_stall_2
      (auto_routers_debug_out_va_stall_2),
    .auto_debug_out_va_stall_3
      (auto_routers_debug_out_va_stall_3),
    .auto_debug_out_sa_stall_0
      (auto_routers_debug_out_sa_stall_0),
    .auto_debug_out_sa_stall_1
      (auto_routers_debug_out_sa_stall_1),
    .auto_debug_out_sa_stall_2
      (auto_routers_debug_out_sa_stall_2),
    .auto_debug_out_sa_stall_3
      (auto_routers_debug_out_sa_stall_3),
    .auto_egress_nodes_out_1_flit_valid
      (auto_routers_egress_nodes_out_1_flit_valid),
    .auto_egress_nodes_out_1_flit_bits_head
      (auto_routers_egress_nodes_out_1_flit_bits_head),
    .auto_egress_nodes_out_1_flit_bits_tail
      (auto_routers_egress_nodes_out_1_flit_bits_tail),
    .auto_egress_nodes_out_1_flit_bits_payload
      (auto_routers_egress_nodes_out_1_flit_bits_payload),
    .auto_egress_nodes_out_0_flit_valid
      (auto_routers_egress_nodes_out_0_flit_valid),
    .auto_egress_nodes_out_0_flit_bits_head
      (auto_routers_egress_nodes_out_0_flit_bits_head),
    .auto_egress_nodes_out_0_flit_bits_tail
      (auto_routers_egress_nodes_out_0_flit_bits_tail),
    .auto_egress_nodes_out_0_flit_bits_payload
      (auto_routers_egress_nodes_out_0_flit_bits_payload),
    .auto_ingress_nodes_in_2_flit_ready
      (auto_routers_ingress_nodes_in_2_flit_ready),
    .auto_ingress_nodes_in_1_flit_ready
      (auto_routers_ingress_nodes_in_1_flit_ready),
    .auto_ingress_nodes_in_0_flit_ready
      (auto_routers_ingress_nodes_in_0_flit_ready),
    .auto_source_nodes_out_flit_0_valid
      (auto_routers_source_nodes_out_flit_0_valid),
    .auto_source_nodes_out_flit_0_bits_head
      (auto_routers_source_nodes_out_flit_0_bits_head),
    .auto_source_nodes_out_flit_0_bits_tail
      (auto_routers_source_nodes_out_flit_0_bits_tail),
    .auto_source_nodes_out_flit_0_bits_payload
      (auto_routers_source_nodes_out_flit_0_bits_payload),
    .auto_source_nodes_out_flit_0_bits_flow_vnet_id
      (auto_routers_source_nodes_out_flit_0_bits_flow_vnet_id),
    .auto_source_nodes_out_flit_0_bits_flow_ingress_node
      (auto_routers_source_nodes_out_flit_0_bits_flow_ingress_node),
    .auto_source_nodes_out_flit_0_bits_flow_ingress_node_id
      (auto_routers_source_nodes_out_flit_0_bits_flow_ingress_node_id),
    .auto_source_nodes_out_flit_0_bits_flow_egress_node
      (auto_routers_source_nodes_out_flit_0_bits_flow_egress_node),
    .auto_source_nodes_out_flit_0_bits_flow_egress_node_id
      (auto_routers_source_nodes_out_flit_0_bits_flow_egress_node_id),
    .auto_source_nodes_out_flit_0_bits_virt_channel_id
      (auto_routers_source_nodes_out_flit_0_bits_virt_channel_id),
    .auto_dest_nodes_in_credit_return
      (_routers_auto_dest_nodes_in_credit_return),
    .auto_dest_nodes_in_vc_free
      (_routers_auto_dest_nodes_in_vc_free)
  );
  assign auto_buffer_in_credit_return = buffer_x1_credit_return_r_3;	// Reg.scala:19:16
  assign auto_buffer_in_vc_free = buffer_x1_vc_free_r_3;	// Reg.scala:19:16
endmodule

