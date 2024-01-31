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

module ClockSinkDomain_235(
  input         auto_buffer_in_2_flit_0_valid,
                auto_buffer_in_2_flit_0_bits_head,
                auto_buffer_in_2_flit_0_bits_tail,
  input  [72:0] auto_buffer_in_2_flit_0_bits_payload,
  input  [2:0]  auto_buffer_in_2_flit_0_bits_flow_vnet_id,
  input  [8:0]  auto_buffer_in_2_flit_0_bits_flow_ingress_node,
  input  [1:0]  auto_buffer_in_2_flit_0_bits_flow_ingress_node_id,
  input  [8:0]  auto_buffer_in_2_flit_0_bits_flow_egress_node,
  input  [1:0]  auto_buffer_in_2_flit_0_bits_flow_egress_node_id,
  input  [2:0]  auto_buffer_in_2_flit_0_bits_virt_channel_id,
  input         auto_buffer_in_1_flit_0_valid,
                auto_buffer_in_1_flit_0_bits_head,
                auto_buffer_in_1_flit_0_bits_tail,
  input  [72:0] auto_buffer_in_1_flit_0_bits_payload,
  input  [2:0]  auto_buffer_in_1_flit_0_bits_flow_vnet_id,
  input  [8:0]  auto_buffer_in_1_flit_0_bits_flow_ingress_node,
  input  [1:0]  auto_buffer_in_1_flit_0_bits_flow_ingress_node_id,
  input  [8:0]  auto_buffer_in_1_flit_0_bits_flow_egress_node,
  input  [1:0]  auto_buffer_in_1_flit_0_bits_flow_egress_node_id,
  input  [2:0]  auto_buffer_in_1_flit_0_bits_virt_channel_id,
  input         auto_buffer_in_0_flit_0_valid,
                auto_buffer_in_0_flit_0_bits_head,
                auto_buffer_in_0_flit_0_bits_tail,
  input  [72:0] auto_buffer_in_0_flit_0_bits_payload,
  input  [2:0]  auto_buffer_in_0_flit_0_bits_flow_vnet_id,
  input  [8:0]  auto_buffer_in_0_flit_0_bits_flow_ingress_node,
  input  [1:0]  auto_buffer_in_0_flit_0_bits_flow_ingress_node_id,
  input  [8:0]  auto_buffer_in_0_flit_0_bits_flow_egress_node,
  input  [1:0]  auto_buffer_in_0_flit_0_bits_flow_egress_node_id,
  input  [2:0]  auto_buffer_in_0_flit_0_bits_virt_channel_id,
  input  [4:0]  auto_routers_source_nodes_out_2_credit_return,
                auto_routers_source_nodes_out_2_vc_free,
                auto_routers_source_nodes_out_1_credit_return,
                auto_routers_source_nodes_out_1_vc_free,
                auto_routers_source_nodes_out_0_credit_return,
                auto_routers_source_nodes_out_0_vc_free,
  input         auto_clock_in_clock,
                auto_clock_in_reset,
  output [4:0]  auto_buffer_in_2_credit_return,
                auto_buffer_in_2_vc_free,
                auto_buffer_in_1_credit_return,
                auto_buffer_in_1_vc_free,
                auto_buffer_in_0_credit_return,
                auto_buffer_in_0_vc_free,
  output [2:0]  auto_routers_debug_out_va_stall_0,
                auto_routers_debug_out_va_stall_1,
                auto_routers_debug_out_va_stall_2,
                auto_routers_debug_out_sa_stall_0,
                auto_routers_debug_out_sa_stall_1,
                auto_routers_debug_out_sa_stall_2,
  output        auto_routers_source_nodes_out_2_flit_0_valid,
                auto_routers_source_nodes_out_2_flit_0_bits_head,
                auto_routers_source_nodes_out_2_flit_0_bits_tail,
  output [72:0] auto_routers_source_nodes_out_2_flit_0_bits_payload,
  output [2:0]  auto_routers_source_nodes_out_2_flit_0_bits_flow_vnet_id,
  output [8:0]  auto_routers_source_nodes_out_2_flit_0_bits_flow_ingress_node,
  output [1:0]  auto_routers_source_nodes_out_2_flit_0_bits_flow_ingress_node_id,
  output [8:0]  auto_routers_source_nodes_out_2_flit_0_bits_flow_egress_node,
  output [1:0]  auto_routers_source_nodes_out_2_flit_0_bits_flow_egress_node_id,
  output [2:0]  auto_routers_source_nodes_out_2_flit_0_bits_virt_channel_id,
  output        auto_routers_source_nodes_out_1_flit_0_valid,
                auto_routers_source_nodes_out_1_flit_0_bits_head,
                auto_routers_source_nodes_out_1_flit_0_bits_tail,
  output [72:0] auto_routers_source_nodes_out_1_flit_0_bits_payload,
  output [2:0]  auto_routers_source_nodes_out_1_flit_0_bits_flow_vnet_id,
  output [8:0]  auto_routers_source_nodes_out_1_flit_0_bits_flow_ingress_node,
  output [1:0]  auto_routers_source_nodes_out_1_flit_0_bits_flow_ingress_node_id,
  output [8:0]  auto_routers_source_nodes_out_1_flit_0_bits_flow_egress_node,
  output [1:0]  auto_routers_source_nodes_out_1_flit_0_bits_flow_egress_node_id,
  output [2:0]  auto_routers_source_nodes_out_1_flit_0_bits_virt_channel_id,
  output        auto_routers_source_nodes_out_0_flit_0_valid,
                auto_routers_source_nodes_out_0_flit_0_bits_head,
                auto_routers_source_nodes_out_0_flit_0_bits_tail,
  output [72:0] auto_routers_source_nodes_out_0_flit_0_bits_payload,
  output [2:0]  auto_routers_source_nodes_out_0_flit_0_bits_flow_vnet_id,
  output [8:0]  auto_routers_source_nodes_out_0_flit_0_bits_flow_ingress_node,
  output [1:0]  auto_routers_source_nodes_out_0_flit_0_bits_flow_ingress_node_id,
  output [8:0]  auto_routers_source_nodes_out_0_flit_0_bits_flow_egress_node,
  output [1:0]  auto_routers_source_nodes_out_0_flit_0_bits_flow_egress_node_id,
  output [2:0]  auto_routers_source_nodes_out_0_flit_0_bits_virt_channel_id
);

  wire [4:0]  _routers_auto_dest_nodes_in_2_credit_return;	// NoC.scala:64:22
  wire [4:0]  _routers_auto_dest_nodes_in_2_vc_free;	// NoC.scala:64:22
  wire [4:0]  _routers_auto_dest_nodes_in_1_credit_return;	// NoC.scala:64:22
  wire [4:0]  _routers_auto_dest_nodes_in_1_vc_free;	// NoC.scala:64:22
  wire [4:0]  _routers_auto_dest_nodes_in_0_credit_return;	// NoC.scala:64:22
  wire [4:0]  _routers_auto_dest_nodes_in_0_vc_free;	// NoC.scala:64:22
  reg         buffer_x1_flit_0_v;	// Valid.scala:130:22
  reg         buffer_x1_flit_0_b_head;	// Reg.scala:19:16
  reg         buffer_x1_flit_0_b_tail;	// Reg.scala:19:16
  reg  [72:0] buffer_x1_flit_0_b_payload;	// Reg.scala:19:16
  reg  [2:0]  buffer_x1_flit_0_b_flow_vnet_id;	// Reg.scala:19:16
  reg  [8:0]  buffer_x1_flit_0_b_flow_ingress_node;	// Reg.scala:19:16
  reg  [1:0]  buffer_x1_flit_0_b_flow_ingress_node_id;	// Reg.scala:19:16
  reg  [8:0]  buffer_x1_flit_0_b_flow_egress_node;	// Reg.scala:19:16
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
  reg         buffer_1_x1_flit_0_v;	// Valid.scala:130:22
  reg         buffer_1_x1_flit_0_b_head;	// Reg.scala:19:16
  reg         buffer_1_x1_flit_0_b_tail;	// Reg.scala:19:16
  reg  [72:0] buffer_1_x1_flit_0_b_payload;	// Reg.scala:19:16
  reg  [2:0]  buffer_1_x1_flit_0_b_flow_vnet_id;	// Reg.scala:19:16
  reg  [8:0]  buffer_1_x1_flit_0_b_flow_ingress_node;	// Reg.scala:19:16
  reg  [1:0]  buffer_1_x1_flit_0_b_flow_ingress_node_id;	// Reg.scala:19:16
  reg  [8:0]  buffer_1_x1_flit_0_b_flow_egress_node;	// Reg.scala:19:16
  reg  [1:0]  buffer_1_x1_flit_0_b_flow_egress_node_id;	// Reg.scala:19:16
  reg  [2:0]  buffer_1_x1_flit_0_b_virt_channel_id;	// Reg.scala:19:16
  reg  [4:0]  buffer_1_x1_credit_return_r;	// Reg.scala:19:16
  reg  [4:0]  buffer_1_x1_credit_return_r_1;	// Reg.scala:19:16
  reg  [4:0]  buffer_1_x1_credit_return_r_2;	// Reg.scala:19:16
  reg  [4:0]  buffer_1_x1_credit_return_r_3;	// Reg.scala:19:16
  reg  [4:0]  buffer_1_x1_vc_free_r;	// Reg.scala:19:16
  reg  [4:0]  buffer_1_x1_vc_free_r_1;	// Reg.scala:19:16
  reg  [4:0]  buffer_1_x1_vc_free_r_2;	// Reg.scala:19:16
  reg  [4:0]  buffer_1_x1_vc_free_r_3;	// Reg.scala:19:16
  reg         buffer_2_x1_flit_0_v;	// Valid.scala:130:22
  reg         buffer_2_x1_flit_0_b_head;	// Reg.scala:19:16
  reg         buffer_2_x1_flit_0_b_tail;	// Reg.scala:19:16
  reg  [72:0] buffer_2_x1_flit_0_b_payload;	// Reg.scala:19:16
  reg  [2:0]  buffer_2_x1_flit_0_b_flow_vnet_id;	// Reg.scala:19:16
  reg  [8:0]  buffer_2_x1_flit_0_b_flow_ingress_node;	// Reg.scala:19:16
  reg  [1:0]  buffer_2_x1_flit_0_b_flow_ingress_node_id;	// Reg.scala:19:16
  reg  [8:0]  buffer_2_x1_flit_0_b_flow_egress_node;	// Reg.scala:19:16
  reg  [1:0]  buffer_2_x1_flit_0_b_flow_egress_node_id;	// Reg.scala:19:16
  reg  [2:0]  buffer_2_x1_flit_0_b_virt_channel_id;	// Reg.scala:19:16
  reg  [4:0]  buffer_2_x1_credit_return_r;	// Reg.scala:19:16
  reg  [4:0]  buffer_2_x1_credit_return_r_1;	// Reg.scala:19:16
  reg  [4:0]  buffer_2_x1_credit_return_r_2;	// Reg.scala:19:16
  reg  [4:0]  buffer_2_x1_credit_return_r_3;	// Reg.scala:19:16
  reg  [4:0]  buffer_2_x1_vc_free_r;	// Reg.scala:19:16
  reg  [4:0]  buffer_2_x1_vc_free_r_1;	// Reg.scala:19:16
  reg  [4:0]  buffer_2_x1_vc_free_r_2;	// Reg.scala:19:16
  reg  [4:0]  buffer_2_x1_vc_free_r_3;	// Reg.scala:19:16
  always @(posedge auto_clock_in_clock) begin
    if (auto_clock_in_reset) begin
      buffer_x1_flit_0_v <= 1'h0;	// LazyModule.scala:411:29, Valid.scala:130:22
      buffer_1_x1_flit_0_v <= 1'h0;	// LazyModule.scala:411:29, Valid.scala:130:22
      buffer_2_x1_flit_0_v <= 1'h0;	// LazyModule.scala:411:29, Valid.scala:130:22
    end
    else begin
      buffer_x1_flit_0_v <= auto_buffer_in_0_flit_0_valid;	// Valid.scala:130:22
      buffer_1_x1_flit_0_v <= auto_buffer_in_1_flit_0_valid;	// Valid.scala:130:22
      buffer_2_x1_flit_0_v <= auto_buffer_in_2_flit_0_valid;	// Valid.scala:130:22
    end
    if (auto_buffer_in_0_flit_0_valid) begin
      buffer_x1_flit_0_b_head <= auto_buffer_in_0_flit_0_bits_head;	// Reg.scala:19:16
      buffer_x1_flit_0_b_tail <= auto_buffer_in_0_flit_0_bits_tail;	// Reg.scala:19:16
      buffer_x1_flit_0_b_payload <= auto_buffer_in_0_flit_0_bits_payload;	// Reg.scala:19:16
      buffer_x1_flit_0_b_flow_vnet_id <= auto_buffer_in_0_flit_0_bits_flow_vnet_id;	// Reg.scala:19:16
      buffer_x1_flit_0_b_flow_ingress_node <=
        auto_buffer_in_0_flit_0_bits_flow_ingress_node;	// Reg.scala:19:16
      buffer_x1_flit_0_b_flow_ingress_node_id <=
        auto_buffer_in_0_flit_0_bits_flow_ingress_node_id;	// Reg.scala:19:16
      buffer_x1_flit_0_b_flow_egress_node <=
        auto_buffer_in_0_flit_0_bits_flow_egress_node;	// Reg.scala:19:16
      buffer_x1_flit_0_b_flow_egress_node_id <=
        auto_buffer_in_0_flit_0_bits_flow_egress_node_id;	// Reg.scala:19:16
      buffer_x1_flit_0_b_virt_channel_id <= auto_buffer_in_0_flit_0_bits_virt_channel_id;	// Reg.scala:19:16
    end
    buffer_x1_credit_return_r <= _routers_auto_dest_nodes_in_0_credit_return;	// NoC.scala:64:22, Reg.scala:19:16
    buffer_x1_credit_return_r_1 <= buffer_x1_credit_return_r;	// Reg.scala:19:16
    buffer_x1_credit_return_r_2 <= buffer_x1_credit_return_r_1;	// Reg.scala:19:16
    buffer_x1_credit_return_r_3 <= buffer_x1_credit_return_r_2;	// Reg.scala:19:16
    buffer_x1_vc_free_r <= _routers_auto_dest_nodes_in_0_vc_free;	// NoC.scala:64:22, Reg.scala:19:16
    buffer_x1_vc_free_r_1 <= buffer_x1_vc_free_r;	// Reg.scala:19:16
    buffer_x1_vc_free_r_2 <= buffer_x1_vc_free_r_1;	// Reg.scala:19:16
    buffer_x1_vc_free_r_3 <= buffer_x1_vc_free_r_2;	// Reg.scala:19:16
    if (auto_buffer_in_1_flit_0_valid) begin
      buffer_1_x1_flit_0_b_head <= auto_buffer_in_1_flit_0_bits_head;	// Reg.scala:19:16
      buffer_1_x1_flit_0_b_tail <= auto_buffer_in_1_flit_0_bits_tail;	// Reg.scala:19:16
      buffer_1_x1_flit_0_b_payload <= auto_buffer_in_1_flit_0_bits_payload;	// Reg.scala:19:16
      buffer_1_x1_flit_0_b_flow_vnet_id <= auto_buffer_in_1_flit_0_bits_flow_vnet_id;	// Reg.scala:19:16
      buffer_1_x1_flit_0_b_flow_ingress_node <=
        auto_buffer_in_1_flit_0_bits_flow_ingress_node;	// Reg.scala:19:16
      buffer_1_x1_flit_0_b_flow_ingress_node_id <=
        auto_buffer_in_1_flit_0_bits_flow_ingress_node_id;	// Reg.scala:19:16
      buffer_1_x1_flit_0_b_flow_egress_node <=
        auto_buffer_in_1_flit_0_bits_flow_egress_node;	// Reg.scala:19:16
      buffer_1_x1_flit_0_b_flow_egress_node_id <=
        auto_buffer_in_1_flit_0_bits_flow_egress_node_id;	// Reg.scala:19:16
      buffer_1_x1_flit_0_b_virt_channel_id <=
        auto_buffer_in_1_flit_0_bits_virt_channel_id;	// Reg.scala:19:16
    end
    buffer_1_x1_credit_return_r <= _routers_auto_dest_nodes_in_1_credit_return;	// NoC.scala:64:22, Reg.scala:19:16
    buffer_1_x1_credit_return_r_1 <= buffer_1_x1_credit_return_r;	// Reg.scala:19:16
    buffer_1_x1_credit_return_r_2 <= buffer_1_x1_credit_return_r_1;	// Reg.scala:19:16
    buffer_1_x1_credit_return_r_3 <= buffer_1_x1_credit_return_r_2;	// Reg.scala:19:16
    buffer_1_x1_vc_free_r <= _routers_auto_dest_nodes_in_1_vc_free;	// NoC.scala:64:22, Reg.scala:19:16
    buffer_1_x1_vc_free_r_1 <= buffer_1_x1_vc_free_r;	// Reg.scala:19:16
    buffer_1_x1_vc_free_r_2 <= buffer_1_x1_vc_free_r_1;	// Reg.scala:19:16
    buffer_1_x1_vc_free_r_3 <= buffer_1_x1_vc_free_r_2;	// Reg.scala:19:16
    if (auto_buffer_in_2_flit_0_valid) begin
      buffer_2_x1_flit_0_b_head <= auto_buffer_in_2_flit_0_bits_head;	// Reg.scala:19:16
      buffer_2_x1_flit_0_b_tail <= auto_buffer_in_2_flit_0_bits_tail;	// Reg.scala:19:16
      buffer_2_x1_flit_0_b_payload <= auto_buffer_in_2_flit_0_bits_payload;	// Reg.scala:19:16
      buffer_2_x1_flit_0_b_flow_vnet_id <= auto_buffer_in_2_flit_0_bits_flow_vnet_id;	// Reg.scala:19:16
      buffer_2_x1_flit_0_b_flow_ingress_node <=
        auto_buffer_in_2_flit_0_bits_flow_ingress_node;	// Reg.scala:19:16
      buffer_2_x1_flit_0_b_flow_ingress_node_id <=
        auto_buffer_in_2_flit_0_bits_flow_ingress_node_id;	// Reg.scala:19:16
      buffer_2_x1_flit_0_b_flow_egress_node <=
        auto_buffer_in_2_flit_0_bits_flow_egress_node;	// Reg.scala:19:16
      buffer_2_x1_flit_0_b_flow_egress_node_id <=
        auto_buffer_in_2_flit_0_bits_flow_egress_node_id;	// Reg.scala:19:16
      buffer_2_x1_flit_0_b_virt_channel_id <=
        auto_buffer_in_2_flit_0_bits_virt_channel_id;	// Reg.scala:19:16
    end
    buffer_2_x1_credit_return_r <= _routers_auto_dest_nodes_in_2_credit_return;	// NoC.scala:64:22, Reg.scala:19:16
    buffer_2_x1_credit_return_r_1 <= buffer_2_x1_credit_return_r;	// Reg.scala:19:16
    buffer_2_x1_credit_return_r_2 <= buffer_2_x1_credit_return_r_1;	// Reg.scala:19:16
    buffer_2_x1_credit_return_r_3 <= buffer_2_x1_credit_return_r_2;	// Reg.scala:19:16
    buffer_2_x1_vc_free_r <= _routers_auto_dest_nodes_in_2_vc_free;	// NoC.scala:64:22, Reg.scala:19:16
    buffer_2_x1_vc_free_r_1 <= buffer_2_x1_vc_free_r;	// Reg.scala:19:16
    buffer_2_x1_vc_free_r_2 <= buffer_2_x1_vc_free_r_1;	// Reg.scala:19:16
    buffer_2_x1_vc_free_r_3 <= buffer_2_x1_vc_free_r_2;	// Reg.scala:19:16
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
    logic [31:0] _RANDOM_5;
    logic [31:0] _RANDOM_6;
    logic [31:0] _RANDOM_7;
    logic [31:0] _RANDOM_8;
    logic [31:0] _RANDOM_9;
    logic [31:0] _RANDOM_10;
    logic [31:0] _RANDOM_11;
    logic [31:0] _RANDOM_12;
    logic [31:0] _RANDOM_13;
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
        _RANDOM_13 = `RANDOM;
        buffer_x1_flit_0_v = _RANDOM_0[0];	// Valid.scala:130:22
        buffer_x1_flit_0_b_head = _RANDOM_0[1];	// Reg.scala:19:16, Valid.scala:130:22
        buffer_x1_flit_0_b_tail = _RANDOM_0[2];	// Reg.scala:19:16, Valid.scala:130:22
        buffer_x1_flit_0_b_payload = {_RANDOM_0[31:3], _RANDOM_1, _RANDOM_2[11:0]};	// Reg.scala:19:16, Valid.scala:130:22
        buffer_x1_flit_0_b_flow_vnet_id = _RANDOM_2[14:12];	// Reg.scala:19:16
        buffer_x1_flit_0_b_flow_ingress_node = _RANDOM_2[23:15];	// Reg.scala:19:16
        buffer_x1_flit_0_b_flow_ingress_node_id = _RANDOM_2[25:24];	// Reg.scala:19:16
        buffer_x1_flit_0_b_flow_egress_node = {_RANDOM_2[31:26], _RANDOM_3[2:0]};	// Reg.scala:19:16
        buffer_x1_flit_0_b_flow_egress_node_id = _RANDOM_3[4:3];	// Reg.scala:19:16
        buffer_x1_flit_0_b_virt_channel_id = _RANDOM_3[7:5];	// Reg.scala:19:16
        buffer_x1_credit_return_r = _RANDOM_3[12:8];	// Reg.scala:19:16
        buffer_x1_credit_return_r_1 = _RANDOM_3[17:13];	// Reg.scala:19:16
        buffer_x1_credit_return_r_2 = _RANDOM_3[22:18];	// Reg.scala:19:16
        buffer_x1_credit_return_r_3 = _RANDOM_3[27:23];	// Reg.scala:19:16
        buffer_x1_vc_free_r = {_RANDOM_3[31:28], _RANDOM_4[0]};	// Reg.scala:19:16
        buffer_x1_vc_free_r_1 = _RANDOM_4[5:1];	// Reg.scala:19:16
        buffer_x1_vc_free_r_2 = _RANDOM_4[10:6];	// Reg.scala:19:16
        buffer_x1_vc_free_r_3 = _RANDOM_4[15:11];	// Reg.scala:19:16
        buffer_1_x1_flit_0_v = _RANDOM_4[16];	// Reg.scala:19:16, Valid.scala:130:22
        buffer_1_x1_flit_0_b_head = _RANDOM_4[17];	// Reg.scala:19:16
        buffer_1_x1_flit_0_b_tail = _RANDOM_4[18];	// Reg.scala:19:16
        buffer_1_x1_flit_0_b_payload = {_RANDOM_4[31:19], _RANDOM_5, _RANDOM_6[27:0]};	// Reg.scala:19:16
        buffer_1_x1_flit_0_b_flow_vnet_id = _RANDOM_6[30:28];	// Reg.scala:19:16
        buffer_1_x1_flit_0_b_flow_ingress_node = {_RANDOM_6[31], _RANDOM_7[7:0]};	// Reg.scala:19:16
        buffer_1_x1_flit_0_b_flow_ingress_node_id = _RANDOM_7[9:8];	// Reg.scala:19:16
        buffer_1_x1_flit_0_b_flow_egress_node = _RANDOM_7[18:10];	// Reg.scala:19:16
        buffer_1_x1_flit_0_b_flow_egress_node_id = _RANDOM_7[20:19];	// Reg.scala:19:16
        buffer_1_x1_flit_0_b_virt_channel_id = _RANDOM_7[23:21];	// Reg.scala:19:16
        buffer_1_x1_credit_return_r = _RANDOM_7[28:24];	// Reg.scala:19:16
        buffer_1_x1_credit_return_r_1 = {_RANDOM_7[31:29], _RANDOM_8[1:0]};	// Reg.scala:19:16
        buffer_1_x1_credit_return_r_2 = _RANDOM_8[6:2];	// Reg.scala:19:16
        buffer_1_x1_credit_return_r_3 = _RANDOM_8[11:7];	// Reg.scala:19:16
        buffer_1_x1_vc_free_r = _RANDOM_8[16:12];	// Reg.scala:19:16
        buffer_1_x1_vc_free_r_1 = _RANDOM_8[21:17];	// Reg.scala:19:16
        buffer_1_x1_vc_free_r_2 = _RANDOM_8[26:22];	// Reg.scala:19:16
        buffer_1_x1_vc_free_r_3 = _RANDOM_8[31:27];	// Reg.scala:19:16
        buffer_2_x1_flit_0_v = _RANDOM_9[0];	// Valid.scala:130:22
        buffer_2_x1_flit_0_b_head = _RANDOM_9[1];	// Reg.scala:19:16, Valid.scala:130:22
        buffer_2_x1_flit_0_b_tail = _RANDOM_9[2];	// Reg.scala:19:16, Valid.scala:130:22
        buffer_2_x1_flit_0_b_payload = {_RANDOM_9[31:3], _RANDOM_10, _RANDOM_11[11:0]};	// Reg.scala:19:16, Valid.scala:130:22
        buffer_2_x1_flit_0_b_flow_vnet_id = _RANDOM_11[14:12];	// Reg.scala:19:16
        buffer_2_x1_flit_0_b_flow_ingress_node = _RANDOM_11[23:15];	// Reg.scala:19:16
        buffer_2_x1_flit_0_b_flow_ingress_node_id = _RANDOM_11[25:24];	// Reg.scala:19:16
        buffer_2_x1_flit_0_b_flow_egress_node = {_RANDOM_11[31:26], _RANDOM_12[2:0]};	// Reg.scala:19:16
        buffer_2_x1_flit_0_b_flow_egress_node_id = _RANDOM_12[4:3];	// Reg.scala:19:16
        buffer_2_x1_flit_0_b_virt_channel_id = _RANDOM_12[7:5];	// Reg.scala:19:16
        buffer_2_x1_credit_return_r = _RANDOM_12[12:8];	// Reg.scala:19:16
        buffer_2_x1_credit_return_r_1 = _RANDOM_12[17:13];	// Reg.scala:19:16
        buffer_2_x1_credit_return_r_2 = _RANDOM_12[22:18];	// Reg.scala:19:16
        buffer_2_x1_credit_return_r_3 = _RANDOM_12[27:23];	// Reg.scala:19:16
        buffer_2_x1_vc_free_r = {_RANDOM_12[31:28], _RANDOM_13[0]};	// Reg.scala:19:16
        buffer_2_x1_vc_free_r_1 = _RANDOM_13[5:1];	// Reg.scala:19:16
        buffer_2_x1_vc_free_r_2 = _RANDOM_13[10:6];	// Reg.scala:19:16
        buffer_2_x1_vc_free_r_3 = _RANDOM_13[15:11];	// Reg.scala:19:16
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  Router_235 routers (	// NoC.scala:64:22
    .clock                                                    (auto_clock_in_clock),
    .reset                                                    (auto_clock_in_reset),
    .auto_source_nodes_out_2_credit_return
      (auto_routers_source_nodes_out_2_credit_return),
    .auto_source_nodes_out_2_vc_free
      (auto_routers_source_nodes_out_2_vc_free),
    .auto_source_nodes_out_1_credit_return
      (auto_routers_source_nodes_out_1_credit_return),
    .auto_source_nodes_out_1_vc_free
      (auto_routers_source_nodes_out_1_vc_free),
    .auto_source_nodes_out_0_credit_return
      (auto_routers_source_nodes_out_0_credit_return),
    .auto_source_nodes_out_0_vc_free
      (auto_routers_source_nodes_out_0_vc_free),
    .auto_dest_nodes_in_2_flit_0_valid                        (buffer_2_x1_flit_0_v),	// Valid.scala:130:22
    .auto_dest_nodes_in_2_flit_0_bits_head                    (buffer_2_x1_flit_0_b_head),	// Reg.scala:19:16
    .auto_dest_nodes_in_2_flit_0_bits_tail                    (buffer_2_x1_flit_0_b_tail),	// Reg.scala:19:16
    .auto_dest_nodes_in_2_flit_0_bits_payload
      (buffer_2_x1_flit_0_b_payload),	// Reg.scala:19:16
    .auto_dest_nodes_in_2_flit_0_bits_flow_vnet_id
      (buffer_2_x1_flit_0_b_flow_vnet_id),	// Reg.scala:19:16
    .auto_dest_nodes_in_2_flit_0_bits_flow_ingress_node
      (buffer_2_x1_flit_0_b_flow_ingress_node),	// Reg.scala:19:16
    .auto_dest_nodes_in_2_flit_0_bits_flow_ingress_node_id
      (buffer_2_x1_flit_0_b_flow_ingress_node_id),	// Reg.scala:19:16
    .auto_dest_nodes_in_2_flit_0_bits_flow_egress_node
      (buffer_2_x1_flit_0_b_flow_egress_node),	// Reg.scala:19:16
    .auto_dest_nodes_in_2_flit_0_bits_flow_egress_node_id
      (buffer_2_x1_flit_0_b_flow_egress_node_id),	// Reg.scala:19:16
    .auto_dest_nodes_in_2_flit_0_bits_virt_channel_id
      (buffer_2_x1_flit_0_b_virt_channel_id),	// Reg.scala:19:16
    .auto_dest_nodes_in_1_flit_0_valid                        (buffer_1_x1_flit_0_v),	// Valid.scala:130:22
    .auto_dest_nodes_in_1_flit_0_bits_head                    (buffer_1_x1_flit_0_b_head),	// Reg.scala:19:16
    .auto_dest_nodes_in_1_flit_0_bits_tail                    (buffer_1_x1_flit_0_b_tail),	// Reg.scala:19:16
    .auto_dest_nodes_in_1_flit_0_bits_payload
      (buffer_1_x1_flit_0_b_payload),	// Reg.scala:19:16
    .auto_dest_nodes_in_1_flit_0_bits_flow_vnet_id
      (buffer_1_x1_flit_0_b_flow_vnet_id),	// Reg.scala:19:16
    .auto_dest_nodes_in_1_flit_0_bits_flow_ingress_node
      (buffer_1_x1_flit_0_b_flow_ingress_node),	// Reg.scala:19:16
    .auto_dest_nodes_in_1_flit_0_bits_flow_ingress_node_id
      (buffer_1_x1_flit_0_b_flow_ingress_node_id),	// Reg.scala:19:16
    .auto_dest_nodes_in_1_flit_0_bits_flow_egress_node
      (buffer_1_x1_flit_0_b_flow_egress_node),	// Reg.scala:19:16
    .auto_dest_nodes_in_1_flit_0_bits_flow_egress_node_id
      (buffer_1_x1_flit_0_b_flow_egress_node_id),	// Reg.scala:19:16
    .auto_dest_nodes_in_1_flit_0_bits_virt_channel_id
      (buffer_1_x1_flit_0_b_virt_channel_id),	// Reg.scala:19:16
    .auto_dest_nodes_in_0_flit_0_valid                        (buffer_x1_flit_0_v),	// Valid.scala:130:22
    .auto_dest_nodes_in_0_flit_0_bits_head                    (buffer_x1_flit_0_b_head),	// Reg.scala:19:16
    .auto_dest_nodes_in_0_flit_0_bits_tail                    (buffer_x1_flit_0_b_tail),	// Reg.scala:19:16
    .auto_dest_nodes_in_0_flit_0_bits_payload
      (buffer_x1_flit_0_b_payload),	// Reg.scala:19:16
    .auto_dest_nodes_in_0_flit_0_bits_flow_vnet_id
      (buffer_x1_flit_0_b_flow_vnet_id),	// Reg.scala:19:16
    .auto_dest_nodes_in_0_flit_0_bits_flow_ingress_node
      (buffer_x1_flit_0_b_flow_ingress_node),	// Reg.scala:19:16
    .auto_dest_nodes_in_0_flit_0_bits_flow_ingress_node_id
      (buffer_x1_flit_0_b_flow_ingress_node_id),	// Reg.scala:19:16
    .auto_dest_nodes_in_0_flit_0_bits_flow_egress_node
      (buffer_x1_flit_0_b_flow_egress_node),	// Reg.scala:19:16
    .auto_dest_nodes_in_0_flit_0_bits_flow_egress_node_id
      (buffer_x1_flit_0_b_flow_egress_node_id),	// Reg.scala:19:16
    .auto_dest_nodes_in_0_flit_0_bits_virt_channel_id
      (buffer_x1_flit_0_b_virt_channel_id),	// Reg.scala:19:16
    .auto_debug_out_va_stall_0
      (auto_routers_debug_out_va_stall_0),
    .auto_debug_out_va_stall_1
      (auto_routers_debug_out_va_stall_1),
    .auto_debug_out_va_stall_2
      (auto_routers_debug_out_va_stall_2),
    .auto_debug_out_sa_stall_0
      (auto_routers_debug_out_sa_stall_0),
    .auto_debug_out_sa_stall_1
      (auto_routers_debug_out_sa_stall_1),
    .auto_debug_out_sa_stall_2
      (auto_routers_debug_out_sa_stall_2),
    .auto_source_nodes_out_2_flit_0_valid
      (auto_routers_source_nodes_out_2_flit_0_valid),
    .auto_source_nodes_out_2_flit_0_bits_head
      (auto_routers_source_nodes_out_2_flit_0_bits_head),
    .auto_source_nodes_out_2_flit_0_bits_tail
      (auto_routers_source_nodes_out_2_flit_0_bits_tail),
    .auto_source_nodes_out_2_flit_0_bits_payload
      (auto_routers_source_nodes_out_2_flit_0_bits_payload),
    .auto_source_nodes_out_2_flit_0_bits_flow_vnet_id
      (auto_routers_source_nodes_out_2_flit_0_bits_flow_vnet_id),
    .auto_source_nodes_out_2_flit_0_bits_flow_ingress_node
      (auto_routers_source_nodes_out_2_flit_0_bits_flow_ingress_node),
    .auto_source_nodes_out_2_flit_0_bits_flow_ingress_node_id
      (auto_routers_source_nodes_out_2_flit_0_bits_flow_ingress_node_id),
    .auto_source_nodes_out_2_flit_0_bits_flow_egress_node
      (auto_routers_source_nodes_out_2_flit_0_bits_flow_egress_node),
    .auto_source_nodes_out_2_flit_0_bits_flow_egress_node_id
      (auto_routers_source_nodes_out_2_flit_0_bits_flow_egress_node_id),
    .auto_source_nodes_out_2_flit_0_bits_virt_channel_id
      (auto_routers_source_nodes_out_2_flit_0_bits_virt_channel_id),
    .auto_source_nodes_out_1_flit_0_valid
      (auto_routers_source_nodes_out_1_flit_0_valid),
    .auto_source_nodes_out_1_flit_0_bits_head
      (auto_routers_source_nodes_out_1_flit_0_bits_head),
    .auto_source_nodes_out_1_flit_0_bits_tail
      (auto_routers_source_nodes_out_1_flit_0_bits_tail),
    .auto_source_nodes_out_1_flit_0_bits_payload
      (auto_routers_source_nodes_out_1_flit_0_bits_payload),
    .auto_source_nodes_out_1_flit_0_bits_flow_vnet_id
      (auto_routers_source_nodes_out_1_flit_0_bits_flow_vnet_id),
    .auto_source_nodes_out_1_flit_0_bits_flow_ingress_node
      (auto_routers_source_nodes_out_1_flit_0_bits_flow_ingress_node),
    .auto_source_nodes_out_1_flit_0_bits_flow_ingress_node_id
      (auto_routers_source_nodes_out_1_flit_0_bits_flow_ingress_node_id),
    .auto_source_nodes_out_1_flit_0_bits_flow_egress_node
      (auto_routers_source_nodes_out_1_flit_0_bits_flow_egress_node),
    .auto_source_nodes_out_1_flit_0_bits_flow_egress_node_id
      (auto_routers_source_nodes_out_1_flit_0_bits_flow_egress_node_id),
    .auto_source_nodes_out_1_flit_0_bits_virt_channel_id
      (auto_routers_source_nodes_out_1_flit_0_bits_virt_channel_id),
    .auto_source_nodes_out_0_flit_0_valid
      (auto_routers_source_nodes_out_0_flit_0_valid),
    .auto_source_nodes_out_0_flit_0_bits_head
      (auto_routers_source_nodes_out_0_flit_0_bits_head),
    .auto_source_nodes_out_0_flit_0_bits_tail
      (auto_routers_source_nodes_out_0_flit_0_bits_tail),
    .auto_source_nodes_out_0_flit_0_bits_payload
      (auto_routers_source_nodes_out_0_flit_0_bits_payload),
    .auto_source_nodes_out_0_flit_0_bits_flow_vnet_id
      (auto_routers_source_nodes_out_0_flit_0_bits_flow_vnet_id),
    .auto_source_nodes_out_0_flit_0_bits_flow_ingress_node
      (auto_routers_source_nodes_out_0_flit_0_bits_flow_ingress_node),
    .auto_source_nodes_out_0_flit_0_bits_flow_ingress_node_id
      (auto_routers_source_nodes_out_0_flit_0_bits_flow_ingress_node_id),
    .auto_source_nodes_out_0_flit_0_bits_flow_egress_node
      (auto_routers_source_nodes_out_0_flit_0_bits_flow_egress_node),
    .auto_source_nodes_out_0_flit_0_bits_flow_egress_node_id
      (auto_routers_source_nodes_out_0_flit_0_bits_flow_egress_node_id),
    .auto_source_nodes_out_0_flit_0_bits_virt_channel_id
      (auto_routers_source_nodes_out_0_flit_0_bits_virt_channel_id),
    .auto_dest_nodes_in_2_credit_return
      (_routers_auto_dest_nodes_in_2_credit_return),
    .auto_dest_nodes_in_2_vc_free
      (_routers_auto_dest_nodes_in_2_vc_free),
    .auto_dest_nodes_in_1_credit_return
      (_routers_auto_dest_nodes_in_1_credit_return),
    .auto_dest_nodes_in_1_vc_free
      (_routers_auto_dest_nodes_in_1_vc_free),
    .auto_dest_nodes_in_0_credit_return
      (_routers_auto_dest_nodes_in_0_credit_return),
    .auto_dest_nodes_in_0_vc_free
      (_routers_auto_dest_nodes_in_0_vc_free)
  );
  assign auto_buffer_in_2_credit_return = buffer_2_x1_credit_return_r_3;	// Reg.scala:19:16
  assign auto_buffer_in_2_vc_free = buffer_2_x1_vc_free_r_3;	// Reg.scala:19:16
  assign auto_buffer_in_1_credit_return = buffer_1_x1_credit_return_r_3;	// Reg.scala:19:16
  assign auto_buffer_in_1_vc_free = buffer_1_x1_vc_free_r_3;	// Reg.scala:19:16
  assign auto_buffer_in_0_credit_return = buffer_x1_credit_return_r_3;	// Reg.scala:19:16
  assign auto_buffer_in_0_vc_free = buffer_x1_vc_free_r_3;	// Reg.scala:19:16
endmodule

