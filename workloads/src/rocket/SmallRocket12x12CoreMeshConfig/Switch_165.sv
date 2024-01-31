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

module Switch_165(
  input         clock,
                reset,
                io_in_4_0_valid,
                io_in_4_0_bits_flit_head,
                io_in_4_0_bits_flit_tail,
  input  [72:0] io_in_4_0_bits_flit_payload,
  input  [2:0]  io_in_4_0_bits_flit_flow_vnet_id,
  input  [8:0]  io_in_4_0_bits_flit_flow_ingress_node,
  input  [1:0]  io_in_4_0_bits_flit_flow_ingress_node_id,
  input  [8:0]  io_in_4_0_bits_flit_flow_egress_node,
  input  [1:0]  io_in_4_0_bits_flit_flow_egress_node_id,
  input  [2:0]  io_in_4_0_bits_out_virt_channel,
  input         io_in_3_0_valid,
                io_in_3_0_bits_flit_head,
                io_in_3_0_bits_flit_tail,
  input  [72:0] io_in_3_0_bits_flit_payload,
  input  [2:0]  io_in_3_0_bits_flit_flow_vnet_id,
  input  [8:0]  io_in_3_0_bits_flit_flow_ingress_node,
  input  [1:0]  io_in_3_0_bits_flit_flow_ingress_node_id,
  input  [8:0]  io_in_3_0_bits_flit_flow_egress_node,
  input  [1:0]  io_in_3_0_bits_flit_flow_egress_node_id,
  input  [2:0]  io_in_3_0_bits_out_virt_channel,
  input         io_in_2_0_valid,
                io_in_2_0_bits_flit_head,
                io_in_2_0_bits_flit_tail,
  input  [72:0] io_in_2_0_bits_flit_payload,
  input  [2:0]  io_in_2_0_bits_flit_flow_vnet_id,
  input  [8:0]  io_in_2_0_bits_flit_flow_ingress_node,
  input  [1:0]  io_in_2_0_bits_flit_flow_ingress_node_id,
  input  [8:0]  io_in_2_0_bits_flit_flow_egress_node,
  input  [1:0]  io_in_2_0_bits_flit_flow_egress_node_id,
  input  [2:0]  io_in_2_0_bits_out_virt_channel,
  input         io_in_1_0_valid,
                io_in_1_0_bits_flit_head,
                io_in_1_0_bits_flit_tail,
  input  [72:0] io_in_1_0_bits_flit_payload,
  input  [2:0]  io_in_1_0_bits_flit_flow_vnet_id,
  input  [8:0]  io_in_1_0_bits_flit_flow_ingress_node,
  input  [1:0]  io_in_1_0_bits_flit_flow_ingress_node_id,
  input  [8:0]  io_in_1_0_bits_flit_flow_egress_node,
  input  [1:0]  io_in_1_0_bits_flit_flow_egress_node_id,
  input  [2:0]  io_in_1_0_bits_out_virt_channel,
  input         io_in_0_0_valid,
                io_in_0_0_bits_flit_head,
                io_in_0_0_bits_flit_tail,
  input  [72:0] io_in_0_0_bits_flit_payload,
  input  [2:0]  io_in_0_0_bits_flit_flow_vnet_id,
  input  [8:0]  io_in_0_0_bits_flit_flow_ingress_node,
  input  [1:0]  io_in_0_0_bits_flit_flow_ingress_node_id,
  input  [8:0]  io_in_0_0_bits_flit_flow_egress_node,
  input  [1:0]  io_in_0_0_bits_flit_flow_egress_node_id,
  input  [2:0]  io_in_0_0_bits_out_virt_channel,
  input         io_sel_3_0_4_0,
                io_sel_3_0_3_0,
                io_sel_3_0_2_0,
                io_sel_3_0_1_0,
                io_sel_3_0_0_0,
                io_sel_2_0_4_0,
                io_sel_2_0_3_0,
                io_sel_2_0_2_0,
                io_sel_2_0_1_0,
                io_sel_2_0_0_0,
                io_sel_1_0_4_0,
                io_sel_1_0_3_0,
                io_sel_1_0_2_0,
                io_sel_1_0_1_0,
                io_sel_1_0_0_0,
                io_sel_0_0_4_0,
                io_sel_0_0_3_0,
                io_sel_0_0_2_0,
                io_sel_0_0_1_0,
                io_sel_0_0_0_0,
  output        io_out_3_0_valid,
                io_out_3_0_bits_head,
                io_out_3_0_bits_tail,
  output [72:0] io_out_3_0_bits_payload,
  output [2:0]  io_out_3_0_bits_flow_vnet_id,
  output [8:0]  io_out_3_0_bits_flow_ingress_node,
  output [1:0]  io_out_3_0_bits_flow_ingress_node_id,
  output [8:0]  io_out_3_0_bits_flow_egress_node,
  output [1:0]  io_out_3_0_bits_flow_egress_node_id,
  output [2:0]  io_out_3_0_bits_virt_channel_id,
  output        io_out_2_0_valid,
                io_out_2_0_bits_head,
                io_out_2_0_bits_tail,
  output [72:0] io_out_2_0_bits_payload,
  output [2:0]  io_out_2_0_bits_flow_vnet_id,
  output [8:0]  io_out_2_0_bits_flow_ingress_node,
  output [1:0]  io_out_2_0_bits_flow_ingress_node_id,
  output [8:0]  io_out_2_0_bits_flow_egress_node,
  output [1:0]  io_out_2_0_bits_flow_egress_node_id,
  output [2:0]  io_out_2_0_bits_virt_channel_id,
  output        io_out_1_0_valid,
                io_out_1_0_bits_head,
                io_out_1_0_bits_tail,
  output [72:0] io_out_1_0_bits_payload,
  output [2:0]  io_out_1_0_bits_flow_vnet_id,
  output [8:0]  io_out_1_0_bits_flow_ingress_node,
  output [1:0]  io_out_1_0_bits_flow_ingress_node_id,
  output [8:0]  io_out_1_0_bits_flow_egress_node,
  output [1:0]  io_out_1_0_bits_flow_egress_node_id,
  output [2:0]  io_out_1_0_bits_virt_channel_id,
  output        io_out_0_0_valid,
                io_out_0_0_bits_head,
                io_out_0_0_bits_tail,
  output [72:0] io_out_0_0_bits_payload,
  output [2:0]  io_out_0_0_bits_flow_vnet_id,
  output [8:0]  io_out_0_0_bits_flow_ingress_node,
  output [1:0]  io_out_0_0_bits_flow_ingress_node_id,
  output [8:0]  io_out_0_0_bits_flow_egress_node,
  output [1:0]  io_out_0_0_bits_flow_egress_node_id,
  output [2:0]  io_out_0_0_bits_virt_channel_id
);

  `ifndef SYNTHESIS	// Switch.scala:47:13
    wire [2:0] _T_12 =
      {1'h0, {1'h0, io_sel_0_0_0_0} + {1'h0, io_sel_0_0_1_0}}
      + {1'h0, {1'h0, io_sel_0_0_2_0} + {1'h0, io_sel_0_0_3_0} + {1'h0, io_sel_0_0_4_0}};	// Bitwise.scala:51:90, Switch.scala:47:13
    wire [2:0] _T_29 =
      {1'h0, {1'h0, io_sel_1_0_0_0} + {1'h0, io_sel_1_0_1_0}}
      + {1'h0, {1'h0, io_sel_1_0_2_0} + {1'h0, io_sel_1_0_3_0} + {1'h0, io_sel_1_0_4_0}};	// Bitwise.scala:51:90, Switch.scala:47:13
    wire [2:0] _T_46 =
      {1'h0, {1'h0, io_sel_2_0_0_0} + {1'h0, io_sel_2_0_1_0}}
      + {1'h0, {1'h0, io_sel_2_0_2_0} + {1'h0, io_sel_2_0_3_0} + {1'h0, io_sel_2_0_4_0}};	// Bitwise.scala:51:90, Switch.scala:47:13
    wire [2:0] _T_63 =
      {1'h0, {1'h0, io_sel_3_0_0_0} + {1'h0, io_sel_3_0_1_0}}
      + {1'h0, {1'h0, io_sel_3_0_2_0} + {1'h0, io_sel_3_0_3_0} + {1'h0, io_sel_3_0_4_0}};	// Bitwise.scala:51:90, Switch.scala:47:13
    always @(posedge clock) begin	// Switch.scala:47:13
      if (~reset & (|(_T_12[2:1]))) begin	// Bitwise.scala:51:90, Switch.scala:47:{13,33}
        if (`ASSERT_VERBOSE_COND_)	// Switch.scala:47:13
          $error("Assertion failed\n    at Switch.scala:47 assert(PopCount(sel_flat) <= 1.U)\n");	// Switch.scala:47:13
        if (`STOP_COND_)	// Switch.scala:47:13
          $fatal;	// Switch.scala:47:13
      end
      if (~reset & (|(_T_29[2:1]))) begin	// Bitwise.scala:51:90, Switch.scala:47:{13,33}
        if (`ASSERT_VERBOSE_COND_)	// Switch.scala:47:13
          $error("Assertion failed\n    at Switch.scala:47 assert(PopCount(sel_flat) <= 1.U)\n");	// Switch.scala:47:13
        if (`STOP_COND_)	// Switch.scala:47:13
          $fatal;	// Switch.scala:47:13
      end
      if (~reset & (|(_T_46[2:1]))) begin	// Bitwise.scala:51:90, Switch.scala:47:{13,33}
        if (`ASSERT_VERBOSE_COND_)	// Switch.scala:47:13
          $error("Assertion failed\n    at Switch.scala:47 assert(PopCount(sel_flat) <= 1.U)\n");	// Switch.scala:47:13
        if (`STOP_COND_)	// Switch.scala:47:13
          $fatal;	// Switch.scala:47:13
      end
      if (~reset & (|(_T_63[2:1]))) begin	// Bitwise.scala:51:90, Switch.scala:47:{13,33}
        if (`ASSERT_VERBOSE_COND_)	// Switch.scala:47:13
          $error("Assertion failed\n    at Switch.scala:47 assert(PopCount(sel_flat) <= 1.U)\n");	// Switch.scala:47:13
        if (`STOP_COND_)	// Switch.scala:47:13
          $fatal;	// Switch.scala:47:13
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  assign io_out_3_0_valid =
    (io_sel_3_0_0_0 & io_in_0_0_valid | io_sel_3_0_1_0 & io_in_1_0_valid | io_sel_3_0_2_0
     & io_in_2_0_valid | io_sel_3_0_3_0 & io_in_3_0_valid | io_sel_3_0_4_0
     & io_in_4_0_valid)
    & (|{io_sel_3_0_4_0, io_sel_3_0_3_0, io_sel_3_0_2_0, io_sel_3_0_1_0, io_sel_3_0_0_0});	// Mux.scala:27:73, Switch.scala:46:35, :48:{67,79}
  assign io_out_3_0_bits_head =
    io_sel_3_0_0_0 & io_in_0_0_bits_flit_head | io_sel_3_0_1_0 & io_in_1_0_bits_flit_head
    | io_sel_3_0_2_0 & io_in_2_0_bits_flit_head | io_sel_3_0_3_0
    & io_in_3_0_bits_flit_head | io_sel_3_0_4_0 & io_in_4_0_bits_flit_head;	// Mux.scala:27:73
  assign io_out_3_0_bits_tail =
    io_sel_3_0_0_0 & io_in_0_0_bits_flit_tail | io_sel_3_0_1_0 & io_in_1_0_bits_flit_tail
    | io_sel_3_0_2_0 & io_in_2_0_bits_flit_tail | io_sel_3_0_3_0
    & io_in_3_0_bits_flit_tail | io_sel_3_0_4_0 & io_in_4_0_bits_flit_tail;	// Mux.scala:27:73
  assign io_out_3_0_bits_payload =
    (io_sel_3_0_0_0 ? io_in_0_0_bits_flit_payload : 73'h0)
    | (io_sel_3_0_1_0 ? io_in_1_0_bits_flit_payload : 73'h0)
    | (io_sel_3_0_2_0 ? io_in_2_0_bits_flit_payload : 73'h0)
    | (io_sel_3_0_3_0 ? io_in_3_0_bits_flit_payload : 73'h0)
    | (io_sel_3_0_4_0 ? io_in_4_0_bits_flit_payload : 73'h0);	// Mux.scala:27:73
  assign io_out_3_0_bits_flow_vnet_id =
    (io_sel_3_0_0_0 ? io_in_0_0_bits_flit_flow_vnet_id : 3'h0)
    | (io_sel_3_0_1_0 ? io_in_1_0_bits_flit_flow_vnet_id : 3'h0)
    | (io_sel_3_0_2_0 ? io_in_2_0_bits_flit_flow_vnet_id : 3'h0)
    | (io_sel_3_0_3_0 ? io_in_3_0_bits_flit_flow_vnet_id : 3'h0)
    | (io_sel_3_0_4_0 ? io_in_4_0_bits_flit_flow_vnet_id : 3'h0);	// Mux.scala:27:73
  assign io_out_3_0_bits_flow_ingress_node =
    (io_sel_3_0_0_0 ? io_in_0_0_bits_flit_flow_ingress_node : 9'h0)
    | (io_sel_3_0_1_0 ? io_in_1_0_bits_flit_flow_ingress_node : 9'h0)
    | (io_sel_3_0_2_0 ? io_in_2_0_bits_flit_flow_ingress_node : 9'h0)
    | (io_sel_3_0_3_0 ? io_in_3_0_bits_flit_flow_ingress_node : 9'h0)
    | (io_sel_3_0_4_0 ? io_in_4_0_bits_flit_flow_ingress_node : 9'h0);	// Mux.scala:27:73
  assign io_out_3_0_bits_flow_ingress_node_id =
    (io_sel_3_0_0_0 ? io_in_0_0_bits_flit_flow_ingress_node_id : 2'h0)
    | (io_sel_3_0_1_0 ? io_in_1_0_bits_flit_flow_ingress_node_id : 2'h0)
    | (io_sel_3_0_2_0 ? io_in_2_0_bits_flit_flow_ingress_node_id : 2'h0)
    | (io_sel_3_0_3_0 ? io_in_3_0_bits_flit_flow_ingress_node_id : 2'h0)
    | (io_sel_3_0_4_0 ? io_in_4_0_bits_flit_flow_ingress_node_id : 2'h0);	// Mux.scala:27:73
  assign io_out_3_0_bits_flow_egress_node =
    (io_sel_3_0_0_0 ? io_in_0_0_bits_flit_flow_egress_node : 9'h0)
    | (io_sel_3_0_1_0 ? io_in_1_0_bits_flit_flow_egress_node : 9'h0)
    | (io_sel_3_0_2_0 ? io_in_2_0_bits_flit_flow_egress_node : 9'h0)
    | (io_sel_3_0_3_0 ? io_in_3_0_bits_flit_flow_egress_node : 9'h0)
    | (io_sel_3_0_4_0 ? io_in_4_0_bits_flit_flow_egress_node : 9'h0);	// Mux.scala:27:73
  assign io_out_3_0_bits_flow_egress_node_id =
    (io_sel_3_0_0_0 ? io_in_0_0_bits_flit_flow_egress_node_id : 2'h0)
    | (io_sel_3_0_1_0 ? io_in_1_0_bits_flit_flow_egress_node_id : 2'h0)
    | (io_sel_3_0_2_0 ? io_in_2_0_bits_flit_flow_egress_node_id : 2'h0)
    | (io_sel_3_0_3_0 ? io_in_3_0_bits_flit_flow_egress_node_id : 2'h0)
    | (io_sel_3_0_4_0 ? io_in_4_0_bits_flit_flow_egress_node_id : 2'h0);	// Mux.scala:27:73
  assign io_out_3_0_bits_virt_channel_id =
    (io_sel_3_0_0_0 ? io_in_0_0_bits_out_virt_channel : 3'h0)
    | (io_sel_3_0_1_0 ? io_in_1_0_bits_out_virt_channel : 3'h0)
    | (io_sel_3_0_2_0 ? io_in_2_0_bits_out_virt_channel : 3'h0)
    | (io_sel_3_0_3_0 ? io_in_3_0_bits_out_virt_channel : 3'h0)
    | (io_sel_3_0_4_0 ? io_in_4_0_bits_out_virt_channel : 3'h0);	// Mux.scala:27:73
  assign io_out_2_0_valid =
    (io_sel_2_0_0_0 & io_in_0_0_valid | io_sel_2_0_1_0 & io_in_1_0_valid | io_sel_2_0_2_0
     & io_in_2_0_valid | io_sel_2_0_3_0 & io_in_3_0_valid | io_sel_2_0_4_0
     & io_in_4_0_valid)
    & (|{io_sel_2_0_4_0, io_sel_2_0_3_0, io_sel_2_0_2_0, io_sel_2_0_1_0, io_sel_2_0_0_0});	// Mux.scala:27:73, Switch.scala:46:35, :48:{67,79}
  assign io_out_2_0_bits_head =
    io_sel_2_0_0_0 & io_in_0_0_bits_flit_head | io_sel_2_0_1_0 & io_in_1_0_bits_flit_head
    | io_sel_2_0_2_0 & io_in_2_0_bits_flit_head | io_sel_2_0_3_0
    & io_in_3_0_bits_flit_head | io_sel_2_0_4_0 & io_in_4_0_bits_flit_head;	// Mux.scala:27:73
  assign io_out_2_0_bits_tail =
    io_sel_2_0_0_0 & io_in_0_0_bits_flit_tail | io_sel_2_0_1_0 & io_in_1_0_bits_flit_tail
    | io_sel_2_0_2_0 & io_in_2_0_bits_flit_tail | io_sel_2_0_3_0
    & io_in_3_0_bits_flit_tail | io_sel_2_0_4_0 & io_in_4_0_bits_flit_tail;	// Mux.scala:27:73
  assign io_out_2_0_bits_payload =
    (io_sel_2_0_0_0 ? io_in_0_0_bits_flit_payload : 73'h0)
    | (io_sel_2_0_1_0 ? io_in_1_0_bits_flit_payload : 73'h0)
    | (io_sel_2_0_2_0 ? io_in_2_0_bits_flit_payload : 73'h0)
    | (io_sel_2_0_3_0 ? io_in_3_0_bits_flit_payload : 73'h0)
    | (io_sel_2_0_4_0 ? io_in_4_0_bits_flit_payload : 73'h0);	// Mux.scala:27:73
  assign io_out_2_0_bits_flow_vnet_id =
    (io_sel_2_0_0_0 ? io_in_0_0_bits_flit_flow_vnet_id : 3'h0)
    | (io_sel_2_0_1_0 ? io_in_1_0_bits_flit_flow_vnet_id : 3'h0)
    | (io_sel_2_0_2_0 ? io_in_2_0_bits_flit_flow_vnet_id : 3'h0)
    | (io_sel_2_0_3_0 ? io_in_3_0_bits_flit_flow_vnet_id : 3'h0)
    | (io_sel_2_0_4_0 ? io_in_4_0_bits_flit_flow_vnet_id : 3'h0);	// Mux.scala:27:73
  assign io_out_2_0_bits_flow_ingress_node =
    (io_sel_2_0_0_0 ? io_in_0_0_bits_flit_flow_ingress_node : 9'h0)
    | (io_sel_2_0_1_0 ? io_in_1_0_bits_flit_flow_ingress_node : 9'h0)
    | (io_sel_2_0_2_0 ? io_in_2_0_bits_flit_flow_ingress_node : 9'h0)
    | (io_sel_2_0_3_0 ? io_in_3_0_bits_flit_flow_ingress_node : 9'h0)
    | (io_sel_2_0_4_0 ? io_in_4_0_bits_flit_flow_ingress_node : 9'h0);	// Mux.scala:27:73
  assign io_out_2_0_bits_flow_ingress_node_id =
    (io_sel_2_0_0_0 ? io_in_0_0_bits_flit_flow_ingress_node_id : 2'h0)
    | (io_sel_2_0_1_0 ? io_in_1_0_bits_flit_flow_ingress_node_id : 2'h0)
    | (io_sel_2_0_2_0 ? io_in_2_0_bits_flit_flow_ingress_node_id : 2'h0)
    | (io_sel_2_0_3_0 ? io_in_3_0_bits_flit_flow_ingress_node_id : 2'h0)
    | (io_sel_2_0_4_0 ? io_in_4_0_bits_flit_flow_ingress_node_id : 2'h0);	// Mux.scala:27:73
  assign io_out_2_0_bits_flow_egress_node =
    (io_sel_2_0_0_0 ? io_in_0_0_bits_flit_flow_egress_node : 9'h0)
    | (io_sel_2_0_1_0 ? io_in_1_0_bits_flit_flow_egress_node : 9'h0)
    | (io_sel_2_0_2_0 ? io_in_2_0_bits_flit_flow_egress_node : 9'h0)
    | (io_sel_2_0_3_0 ? io_in_3_0_bits_flit_flow_egress_node : 9'h0)
    | (io_sel_2_0_4_0 ? io_in_4_0_bits_flit_flow_egress_node : 9'h0);	// Mux.scala:27:73
  assign io_out_2_0_bits_flow_egress_node_id =
    (io_sel_2_0_0_0 ? io_in_0_0_bits_flit_flow_egress_node_id : 2'h0)
    | (io_sel_2_0_1_0 ? io_in_1_0_bits_flit_flow_egress_node_id : 2'h0)
    | (io_sel_2_0_2_0 ? io_in_2_0_bits_flit_flow_egress_node_id : 2'h0)
    | (io_sel_2_0_3_0 ? io_in_3_0_bits_flit_flow_egress_node_id : 2'h0)
    | (io_sel_2_0_4_0 ? io_in_4_0_bits_flit_flow_egress_node_id : 2'h0);	// Mux.scala:27:73
  assign io_out_2_0_bits_virt_channel_id =
    (io_sel_2_0_0_0 ? io_in_0_0_bits_out_virt_channel : 3'h0)
    | (io_sel_2_0_1_0 ? io_in_1_0_bits_out_virt_channel : 3'h0)
    | (io_sel_2_0_2_0 ? io_in_2_0_bits_out_virt_channel : 3'h0)
    | (io_sel_2_0_3_0 ? io_in_3_0_bits_out_virt_channel : 3'h0)
    | (io_sel_2_0_4_0 ? io_in_4_0_bits_out_virt_channel : 3'h0);	// Mux.scala:27:73
  assign io_out_1_0_valid =
    (io_sel_1_0_0_0 & io_in_0_0_valid | io_sel_1_0_1_0 & io_in_1_0_valid | io_sel_1_0_2_0
     & io_in_2_0_valid | io_sel_1_0_3_0 & io_in_3_0_valid | io_sel_1_0_4_0
     & io_in_4_0_valid)
    & (|{io_sel_1_0_4_0, io_sel_1_0_3_0, io_sel_1_0_2_0, io_sel_1_0_1_0, io_sel_1_0_0_0});	// Mux.scala:27:73, Switch.scala:46:35, :48:{67,79}
  assign io_out_1_0_bits_head =
    io_sel_1_0_0_0 & io_in_0_0_bits_flit_head | io_sel_1_0_1_0 & io_in_1_0_bits_flit_head
    | io_sel_1_0_2_0 & io_in_2_0_bits_flit_head | io_sel_1_0_3_0
    & io_in_3_0_bits_flit_head | io_sel_1_0_4_0 & io_in_4_0_bits_flit_head;	// Mux.scala:27:73
  assign io_out_1_0_bits_tail =
    io_sel_1_0_0_0 & io_in_0_0_bits_flit_tail | io_sel_1_0_1_0 & io_in_1_0_bits_flit_tail
    | io_sel_1_0_2_0 & io_in_2_0_bits_flit_tail | io_sel_1_0_3_0
    & io_in_3_0_bits_flit_tail | io_sel_1_0_4_0 & io_in_4_0_bits_flit_tail;	// Mux.scala:27:73
  assign io_out_1_0_bits_payload =
    (io_sel_1_0_0_0 ? io_in_0_0_bits_flit_payload : 73'h0)
    | (io_sel_1_0_1_0 ? io_in_1_0_bits_flit_payload : 73'h0)
    | (io_sel_1_0_2_0 ? io_in_2_0_bits_flit_payload : 73'h0)
    | (io_sel_1_0_3_0 ? io_in_3_0_bits_flit_payload : 73'h0)
    | (io_sel_1_0_4_0 ? io_in_4_0_bits_flit_payload : 73'h0);	// Mux.scala:27:73
  assign io_out_1_0_bits_flow_vnet_id =
    (io_sel_1_0_0_0 ? io_in_0_0_bits_flit_flow_vnet_id : 3'h0)
    | (io_sel_1_0_1_0 ? io_in_1_0_bits_flit_flow_vnet_id : 3'h0)
    | (io_sel_1_0_2_0 ? io_in_2_0_bits_flit_flow_vnet_id : 3'h0)
    | (io_sel_1_0_3_0 ? io_in_3_0_bits_flit_flow_vnet_id : 3'h0)
    | (io_sel_1_0_4_0 ? io_in_4_0_bits_flit_flow_vnet_id : 3'h0);	// Mux.scala:27:73
  assign io_out_1_0_bits_flow_ingress_node =
    (io_sel_1_0_0_0 ? io_in_0_0_bits_flit_flow_ingress_node : 9'h0)
    | (io_sel_1_0_1_0 ? io_in_1_0_bits_flit_flow_ingress_node : 9'h0)
    | (io_sel_1_0_2_0 ? io_in_2_0_bits_flit_flow_ingress_node : 9'h0)
    | (io_sel_1_0_3_0 ? io_in_3_0_bits_flit_flow_ingress_node : 9'h0)
    | (io_sel_1_0_4_0 ? io_in_4_0_bits_flit_flow_ingress_node : 9'h0);	// Mux.scala:27:73
  assign io_out_1_0_bits_flow_ingress_node_id =
    (io_sel_1_0_0_0 ? io_in_0_0_bits_flit_flow_ingress_node_id : 2'h0)
    | (io_sel_1_0_1_0 ? io_in_1_0_bits_flit_flow_ingress_node_id : 2'h0)
    | (io_sel_1_0_2_0 ? io_in_2_0_bits_flit_flow_ingress_node_id : 2'h0)
    | (io_sel_1_0_3_0 ? io_in_3_0_bits_flit_flow_ingress_node_id : 2'h0)
    | (io_sel_1_0_4_0 ? io_in_4_0_bits_flit_flow_ingress_node_id : 2'h0);	// Mux.scala:27:73
  assign io_out_1_0_bits_flow_egress_node =
    (io_sel_1_0_0_0 ? io_in_0_0_bits_flit_flow_egress_node : 9'h0)
    | (io_sel_1_0_1_0 ? io_in_1_0_bits_flit_flow_egress_node : 9'h0)
    | (io_sel_1_0_2_0 ? io_in_2_0_bits_flit_flow_egress_node : 9'h0)
    | (io_sel_1_0_3_0 ? io_in_3_0_bits_flit_flow_egress_node : 9'h0)
    | (io_sel_1_0_4_0 ? io_in_4_0_bits_flit_flow_egress_node : 9'h0);	// Mux.scala:27:73
  assign io_out_1_0_bits_flow_egress_node_id =
    (io_sel_1_0_0_0 ? io_in_0_0_bits_flit_flow_egress_node_id : 2'h0)
    | (io_sel_1_0_1_0 ? io_in_1_0_bits_flit_flow_egress_node_id : 2'h0)
    | (io_sel_1_0_2_0 ? io_in_2_0_bits_flit_flow_egress_node_id : 2'h0)
    | (io_sel_1_0_3_0 ? io_in_3_0_bits_flit_flow_egress_node_id : 2'h0)
    | (io_sel_1_0_4_0 ? io_in_4_0_bits_flit_flow_egress_node_id : 2'h0);	// Mux.scala:27:73
  assign io_out_1_0_bits_virt_channel_id =
    (io_sel_1_0_0_0 ? io_in_0_0_bits_out_virt_channel : 3'h0)
    | (io_sel_1_0_1_0 ? io_in_1_0_bits_out_virt_channel : 3'h0)
    | (io_sel_1_0_2_0 ? io_in_2_0_bits_out_virt_channel : 3'h0)
    | (io_sel_1_0_3_0 ? io_in_3_0_bits_out_virt_channel : 3'h0)
    | (io_sel_1_0_4_0 ? io_in_4_0_bits_out_virt_channel : 3'h0);	// Mux.scala:27:73
  assign io_out_0_0_valid =
    (io_sel_0_0_0_0 & io_in_0_0_valid | io_sel_0_0_1_0 & io_in_1_0_valid | io_sel_0_0_2_0
     & io_in_2_0_valid | io_sel_0_0_3_0 & io_in_3_0_valid | io_sel_0_0_4_0
     & io_in_4_0_valid)
    & (|{io_sel_0_0_4_0, io_sel_0_0_3_0, io_sel_0_0_2_0, io_sel_0_0_1_0, io_sel_0_0_0_0});	// Mux.scala:27:73, Switch.scala:46:35, :48:{67,79}
  assign io_out_0_0_bits_head =
    io_sel_0_0_0_0 & io_in_0_0_bits_flit_head | io_sel_0_0_1_0 & io_in_1_0_bits_flit_head
    | io_sel_0_0_2_0 & io_in_2_0_bits_flit_head | io_sel_0_0_3_0
    & io_in_3_0_bits_flit_head | io_sel_0_0_4_0 & io_in_4_0_bits_flit_head;	// Mux.scala:27:73
  assign io_out_0_0_bits_tail =
    io_sel_0_0_0_0 & io_in_0_0_bits_flit_tail | io_sel_0_0_1_0 & io_in_1_0_bits_flit_tail
    | io_sel_0_0_2_0 & io_in_2_0_bits_flit_tail | io_sel_0_0_3_0
    & io_in_3_0_bits_flit_tail | io_sel_0_0_4_0 & io_in_4_0_bits_flit_tail;	// Mux.scala:27:73
  assign io_out_0_0_bits_payload =
    (io_sel_0_0_0_0 ? io_in_0_0_bits_flit_payload : 73'h0)
    | (io_sel_0_0_1_0 ? io_in_1_0_bits_flit_payload : 73'h0)
    | (io_sel_0_0_2_0 ? io_in_2_0_bits_flit_payload : 73'h0)
    | (io_sel_0_0_3_0 ? io_in_3_0_bits_flit_payload : 73'h0)
    | (io_sel_0_0_4_0 ? io_in_4_0_bits_flit_payload : 73'h0);	// Mux.scala:27:73
  assign io_out_0_0_bits_flow_vnet_id =
    (io_sel_0_0_0_0 ? io_in_0_0_bits_flit_flow_vnet_id : 3'h0)
    | (io_sel_0_0_1_0 ? io_in_1_0_bits_flit_flow_vnet_id : 3'h0)
    | (io_sel_0_0_2_0 ? io_in_2_0_bits_flit_flow_vnet_id : 3'h0)
    | (io_sel_0_0_3_0 ? io_in_3_0_bits_flit_flow_vnet_id : 3'h0)
    | (io_sel_0_0_4_0 ? io_in_4_0_bits_flit_flow_vnet_id : 3'h0);	// Mux.scala:27:73
  assign io_out_0_0_bits_flow_ingress_node =
    (io_sel_0_0_0_0 ? io_in_0_0_bits_flit_flow_ingress_node : 9'h0)
    | (io_sel_0_0_1_0 ? io_in_1_0_bits_flit_flow_ingress_node : 9'h0)
    | (io_sel_0_0_2_0 ? io_in_2_0_bits_flit_flow_ingress_node : 9'h0)
    | (io_sel_0_0_3_0 ? io_in_3_0_bits_flit_flow_ingress_node : 9'h0)
    | (io_sel_0_0_4_0 ? io_in_4_0_bits_flit_flow_ingress_node : 9'h0);	// Mux.scala:27:73
  assign io_out_0_0_bits_flow_ingress_node_id =
    (io_sel_0_0_0_0 ? io_in_0_0_bits_flit_flow_ingress_node_id : 2'h0)
    | (io_sel_0_0_1_0 ? io_in_1_0_bits_flit_flow_ingress_node_id : 2'h0)
    | (io_sel_0_0_2_0 ? io_in_2_0_bits_flit_flow_ingress_node_id : 2'h0)
    | (io_sel_0_0_3_0 ? io_in_3_0_bits_flit_flow_ingress_node_id : 2'h0)
    | (io_sel_0_0_4_0 ? io_in_4_0_bits_flit_flow_ingress_node_id : 2'h0);	// Mux.scala:27:73
  assign io_out_0_0_bits_flow_egress_node =
    (io_sel_0_0_0_0 ? io_in_0_0_bits_flit_flow_egress_node : 9'h0)
    | (io_sel_0_0_1_0 ? io_in_1_0_bits_flit_flow_egress_node : 9'h0)
    | (io_sel_0_0_2_0 ? io_in_2_0_bits_flit_flow_egress_node : 9'h0)
    | (io_sel_0_0_3_0 ? io_in_3_0_bits_flit_flow_egress_node : 9'h0)
    | (io_sel_0_0_4_0 ? io_in_4_0_bits_flit_flow_egress_node : 9'h0);	// Mux.scala:27:73
  assign io_out_0_0_bits_flow_egress_node_id =
    (io_sel_0_0_0_0 ? io_in_0_0_bits_flit_flow_egress_node_id : 2'h0)
    | (io_sel_0_0_1_0 ? io_in_1_0_bits_flit_flow_egress_node_id : 2'h0)
    | (io_sel_0_0_2_0 ? io_in_2_0_bits_flit_flow_egress_node_id : 2'h0)
    | (io_sel_0_0_3_0 ? io_in_3_0_bits_flit_flow_egress_node_id : 2'h0)
    | (io_sel_0_0_4_0 ? io_in_4_0_bits_flit_flow_egress_node_id : 2'h0);	// Mux.scala:27:73
  assign io_out_0_0_bits_virt_channel_id =
    (io_sel_0_0_0_0 ? io_in_0_0_bits_out_virt_channel : 3'h0)
    | (io_sel_0_0_1_0 ? io_in_1_0_bits_out_virt_channel : 3'h0)
    | (io_sel_0_0_2_0 ? io_in_2_0_bits_out_virt_channel : 3'h0)
    | (io_sel_0_0_3_0 ? io_in_3_0_bits_out_virt_channel : 3'h0)
    | (io_sel_0_0_4_0 ? io_in_4_0_bits_out_virt_channel : 3'h0);	// Mux.scala:27:73
endmodule

