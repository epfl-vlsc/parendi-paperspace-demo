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

module OutputUnit_166(
  input         clock,
                reset,
                io_in_0_valid,
                io_in_0_bits_head,
                io_in_0_bits_tail,
  input  [72:0] io_in_0_bits_payload,
  input  [2:0]  io_in_0_bits_flow_vnet_id,
  input  [8:0]  io_in_0_bits_flow_ingress_node,
  input  [1:0]  io_in_0_bits_flow_ingress_node_id,
  input  [8:0]  io_in_0_bits_flow_egress_node,
  input  [1:0]  io_in_0_bits_flow_egress_node_id,
  input  [2:0]  io_in_0_bits_virt_channel_id,
  input         io_allocs_1_alloc,
                io_allocs_2_alloc,
                io_allocs_3_alloc,
                io_allocs_4_alloc,
                io_credit_alloc_1_alloc,
                io_credit_alloc_2_alloc,
                io_credit_alloc_3_alloc,
                io_credit_alloc_4_alloc,
  input  [4:0]  io_out_credit_return,
                io_out_vc_free,
  output        io_credit_available_1,
                io_credit_available_2,
                io_credit_available_3,
                io_credit_available_4,
                io_channel_status_1_occupied,
                io_channel_status_2_occupied,
                io_channel_status_3_occupied,
                io_channel_status_4_occupied,
                io_out_flit_0_valid,
                io_out_flit_0_bits_head,
                io_out_flit_0_bits_tail,
  output [72:0] io_out_flit_0_bits_payload,
  output [2:0]  io_out_flit_0_bits_flow_vnet_id,
  output [8:0]  io_out_flit_0_bits_flow_ingress_node,
  output [1:0]  io_out_flit_0_bits_flow_ingress_node_id,
  output [8:0]  io_out_flit_0_bits_flow_egress_node,
  output [1:0]  io_out_flit_0_bits_flow_egress_node_id,
  output [2:0]  io_out_flit_0_bits_virt_channel_id
);

  reg        states_4_occupied;	// @[OutputUnit.scala:66:19]
  reg  [2:0] states_4_c;	// @[OutputUnit.scala:66:19]
  reg        states_3_occupied;	// @[OutputUnit.scala:66:19]
  reg  [2:0] states_3_c;	// @[OutputUnit.scala:66:19]
  reg        states_2_occupied;	// @[OutputUnit.scala:66:19]
  reg  [2:0] states_2_c;	// @[OutputUnit.scala:66:19]
  reg        states_1_occupied;	// @[OutputUnit.scala:66:19]
  reg  [2:0] states_1_c;	// @[OutputUnit.scala:66:19]
  wire       _GEN = ~(io_out_vc_free[1]) & states_1_occupied;	// @[OutputUnit.scala:66:19, :74:{25,30}, :76:18]
  wire       _GEN_0 = ~(io_out_vc_free[2]) & states_2_occupied;	// @[OutputUnit.scala:66:19, :74:{25,30}, :76:18]
  wire       _GEN_1 = ~(io_out_vc_free[3]) & states_3_occupied;	// @[OutputUnit.scala:66:19, :74:{25,30}, :76:18]
  wire       _GEN_2 = ~(io_out_vc_free[4]) & states_4_occupied;	// @[OutputUnit.scala:66:19, :74:{25,30}, :76:18]
  always @(posedge clock) begin
    if (reset) begin
      states_4_occupied <= 1'h0;	// @[OutputUnit.scala:66:19]
      states_4_c <= 3'h4;	// @[OutputUnit.scala:66:19, :105:29]
      states_3_occupied <= 1'h0;	// @[OutputUnit.scala:66:19]
      states_3_c <= 3'h4;	// @[OutputUnit.scala:66:19, :105:29]
      states_2_occupied <= 1'h0;	// @[OutputUnit.scala:66:19]
      states_2_c <= 3'h4;	// @[OutputUnit.scala:66:19, :105:29]
      states_1_occupied <= 1'h0;	// @[OutputUnit.scala:66:19]
      states_1_c <= 3'h4;	// @[OutputUnit.scala:66:19, :105:29]
    end
    else begin
      states_4_occupied <= io_allocs_4_alloc | _GEN_2;	// @[OutputUnit.scala:66:19, :74:30, :76:18, :83:20, :84:18]
      states_4_c <= states_4_c + {2'h0, io_out_credit_return[4]} - {2'h0, io_credit_alloc_4_alloc};	// @[OutputUnit.scala:66:19, :94:36, :97:{18,26}]
      states_3_occupied <= io_allocs_3_alloc | _GEN_1;	// @[OutputUnit.scala:66:19, :74:30, :76:18, :83:20, :84:18]
      states_3_c <= states_3_c + {2'h0, io_out_credit_return[3]} - {2'h0, io_credit_alloc_3_alloc};	// @[OutputUnit.scala:66:19, :94:36, :97:{18,26}]
      states_2_occupied <= io_allocs_2_alloc | _GEN_0;	// @[OutputUnit.scala:66:19, :74:30, :76:18, :83:20, :84:18]
      states_2_c <= states_2_c + {2'h0, io_out_credit_return[2]} - {2'h0, io_credit_alloc_2_alloc};	// @[OutputUnit.scala:66:19, :94:36, :97:{18,26}]
      states_1_occupied <= io_allocs_1_alloc | _GEN;	// @[OutputUnit.scala:66:19, :74:30, :76:18, :83:20, :84:18]
      states_1_c <= states_1_c + {2'h0, io_out_credit_return[1]} - {2'h0, io_credit_alloc_1_alloc};	// @[OutputUnit.scala:66:19, :94:36, :97:{18,26}]
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    always @(posedge clock) begin	// @[OutputUnit.scala:75:13]
      if (io_out_vc_free[1] & ~reset & ~states_1_occupied) begin	// @[OutputUnit.scala:66:19, :74:25, :75:13]
        if (`ASSERT_VERBOSE_COND_)	// @[OutputUnit.scala:75:13]
          $error("Assertion failed\n    at OutputUnit.scala:75 assert(s.occupied)\n");	// @[OutputUnit.scala:75:13]
        if (`STOP_COND_)	// @[OutputUnit.scala:75:13]
          $fatal;	// @[OutputUnit.scala:75:13]
      end
      if (io_out_vc_free[2] & ~reset & ~states_2_occupied) begin	// @[OutputUnit.scala:66:19, :74:25, :75:13]
        if (`ASSERT_VERBOSE_COND_)	// @[OutputUnit.scala:75:13]
          $error("Assertion failed\n    at OutputUnit.scala:75 assert(s.occupied)\n");	// @[OutputUnit.scala:75:13]
        if (`STOP_COND_)	// @[OutputUnit.scala:75:13]
          $fatal;	// @[OutputUnit.scala:75:13]
      end
      if (io_out_vc_free[3] & ~reset & ~states_3_occupied) begin	// @[OutputUnit.scala:66:19, :74:25, :75:13]
        if (`ASSERT_VERBOSE_COND_)	// @[OutputUnit.scala:75:13]
          $error("Assertion failed\n    at OutputUnit.scala:75 assert(s.occupied)\n");	// @[OutputUnit.scala:75:13]
        if (`STOP_COND_)	// @[OutputUnit.scala:75:13]
          $fatal;	// @[OutputUnit.scala:75:13]
      end
      if (io_out_vc_free[4] & ~reset & ~states_4_occupied) begin	// @[OutputUnit.scala:66:19, :74:25, :75:13]
        if (`ASSERT_VERBOSE_COND_)	// @[OutputUnit.scala:75:13]
          $error("Assertion failed\n    at OutputUnit.scala:75 assert(s.occupied)\n");	// @[OutputUnit.scala:75:13]
        if (`STOP_COND_)	// @[OutputUnit.scala:75:13]
          $fatal;	// @[OutputUnit.scala:75:13]
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
        states_4_occupied = _RANDOM_0[0];	// @[OutputUnit.scala:66:19]
        states_4_c = _RANDOM_0[3:1];	// @[OutputUnit.scala:66:19]
        states_3_occupied = _RANDOM_0[29];	// @[OutputUnit.scala:66:19]
        states_3_c = {_RANDOM_0[31:30], _RANDOM_1[0]};	// @[OutputUnit.scala:66:19]
        states_2_occupied = _RANDOM_1[26];	// @[OutputUnit.scala:66:19]
        states_2_c = _RANDOM_1[29:27];	// @[OutputUnit.scala:66:19]
        states_1_occupied = _RANDOM_2[23];	// @[OutputUnit.scala:66:19]
        states_1_c = _RANDOM_2[26:24];	// @[OutputUnit.scala:66:19]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_credit_available_1 = |states_1_c;	// @[OutputUnit.scala:66:19, :90:14]
  assign io_credit_available_2 = |states_2_c;	// @[OutputUnit.scala:66:19, :90:14]
  assign io_credit_available_3 = |states_3_c;	// @[OutputUnit.scala:66:19, :90:14]
  assign io_credit_available_4 = |states_4_c;	// @[OutputUnit.scala:66:19, :90:14]
  assign io_channel_status_1_occupied = _GEN;	// @[OutputUnit.scala:66:19, :74:30, :76:18]
  assign io_channel_status_2_occupied = _GEN_0;	// @[OutputUnit.scala:66:19, :74:30, :76:18]
  assign io_channel_status_3_occupied = _GEN_1;	// @[OutputUnit.scala:66:19, :74:30, :76:18]
  assign io_channel_status_4_occupied = _GEN_2;	// @[OutputUnit.scala:66:19, :74:30, :76:18]
  assign io_out_flit_0_valid = io_in_0_valid;
  assign io_out_flit_0_bits_head = io_in_0_bits_head;
  assign io_out_flit_0_bits_tail = io_in_0_bits_tail;
  assign io_out_flit_0_bits_payload = io_in_0_bits_payload;
  assign io_out_flit_0_bits_flow_vnet_id = io_in_0_bits_flow_vnet_id;
  assign io_out_flit_0_bits_flow_ingress_node = io_in_0_bits_flow_ingress_node;
  assign io_out_flit_0_bits_flow_ingress_node_id = io_in_0_bits_flow_ingress_node_id;
  assign io_out_flit_0_bits_flow_egress_node = io_in_0_bits_flow_egress_node;
  assign io_out_flit_0_bits_flow_egress_node_id = io_in_0_bits_flow_egress_node_id;
  assign io_out_flit_0_bits_virt_channel_id = io_in_0_bits_virt_channel_id;
endmodule

