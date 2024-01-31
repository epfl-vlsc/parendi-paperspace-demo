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

module RouteComputer_174(
  input  [2:0] io_req_4_bits_src_virt_id,
               io_req_4_bits_flow_vnet_id,
  input  [7:0] io_req_4_bits_flow_ingress_node,
  input  [1:0] io_req_4_bits_flow_ingress_node_id,
  input  [7:0] io_req_4_bits_flow_egress_node,
  input  [1:0] io_req_4_bits_flow_egress_node_id,
  input  [2:0] io_req_3_bits_src_virt_id,
               io_req_3_bits_flow_vnet_id,
  input  [7:0] io_req_3_bits_flow_ingress_node,
  input  [1:0] io_req_3_bits_flow_ingress_node_id,
  input  [7:0] io_req_3_bits_flow_egress_node,
  input  [1:0] io_req_3_bits_flow_egress_node_id,
  input  [2:0] io_req_2_bits_src_virt_id,
               io_req_2_bits_flow_vnet_id,
  input  [7:0] io_req_2_bits_flow_ingress_node,
  input  [1:0] io_req_2_bits_flow_ingress_node_id,
  input  [7:0] io_req_2_bits_flow_egress_node,
  input  [1:0] io_req_2_bits_flow_egress_node_id,
  input  [2:0] io_req_1_bits_src_virt_id,
               io_req_1_bits_flow_vnet_id,
  input  [7:0] io_req_1_bits_flow_ingress_node,
  input  [1:0] io_req_1_bits_flow_ingress_node_id,
  input  [7:0] io_req_1_bits_flow_egress_node,
  input  [1:0] io_req_1_bits_flow_egress_node_id,
  input  [2:0] io_req_0_bits_src_virt_id,
               io_req_0_bits_flow_vnet_id,
  input  [7:0] io_req_0_bits_flow_ingress_node,
  input  [1:0] io_req_0_bits_flow_ingress_node_id,
  input  [7:0] io_req_0_bits_flow_egress_node,
  input  [1:0] io_req_0_bits_flow_egress_node_id,
  output       io_resp_4_vc_sel_1_1,
               io_resp_4_vc_sel_1_2,
               io_resp_4_vc_sel_1_3,
               io_resp_4_vc_sel_1_4,
               io_resp_4_vc_sel_0_1,
               io_resp_4_vc_sel_0_2,
               io_resp_4_vc_sel_0_3,
               io_resp_4_vc_sel_0_4,
               io_resp_3_vc_sel_4_4,
               io_resp_3_vc_sel_2_4,
               io_resp_2_vc_sel_4_4,
               io_resp_2_vc_sel_3_0,
               io_resp_2_vc_sel_3_1,
               io_resp_2_vc_sel_3_2,
               io_resp_2_vc_sel_3_3,
               io_resp_2_vc_sel_3_4,
               io_resp_1_vc_sel_4_4,
               io_resp_0_vc_sel_4_4,
               io_resp_0_vc_sel_3_0,
               io_resp_0_vc_sel_3_1,
               io_resp_0_vc_sel_3_2,
               io_resp_0_vc_sel_3_3,
               io_resp_0_vc_sel_3_4,
               io_resp_0_vc_sel_2_4
);

  wire [1:0] _GEN = ~(io_req_0_bits_flow_egress_node[1:0]);	// RouteComputer.scala:74:27, pla.scala:78:21
  wire [1:0] _decoded_T_1 =
    {io_req_0_bits_flow_egress_node_id[0], io_req_0_bits_src_virt_id[1]};	// Cat.scala:33:92, pla.scala:90:45
  wire [1:0] _decoded_T_5 =
    {io_req_0_bits_flow_egress_node_id[0], io_req_0_bits_src_virt_id[2]};	// Cat.scala:33:92, pla.scala:90:45
  wire [1:0] _decoded_T_159 =
    {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_src_virt_id[1]};	// Cat.scala:33:92, pla.scala:90:45
  wire [1:0] _decoded_T_163 =
    {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_src_virt_id[2]};	// Cat.scala:33:92, pla.scala:90:45
  wire [3:0] _GEN_0 = ~(io_req_4_bits_flow_egress_node[3:0]);	// RouteComputer.scala:74:27, pla.scala:78:21
  wire [2:0] _decoded_T_317 =
    {io_req_4_bits_flow_egress_node_id[0], _GEN_0[0], io_req_4_bits_src_virt_id[0]};	// Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29
  wire [3:0] _decoded_T_319 =
    {io_req_4_bits_flow_egress_node_id[0],
     io_req_4_bits_flow_egress_node[0],
     _GEN_0[3],
     io_req_4_bits_src_virt_id[0]};	// Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29
  wire [2:0] _decoded_T_321 =
    {io_req_4_bits_flow_egress_node_id[0],
     io_req_4_bits_flow_egress_node[3],
     io_req_4_bits_src_virt_id[0]};	// Cat.scala:33:92, pla.scala:90:45
  wire [2:0] _decoded_T_323 =
    {io_req_4_bits_flow_egress_node_id[0], _GEN_0[0], io_req_4_bits_src_virt_id[1]};	// Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29
  wire [3:0] _decoded_T_325 =
    {io_req_4_bits_flow_egress_node_id[0],
     io_req_4_bits_flow_egress_node[0],
     _GEN_0[3],
     io_req_4_bits_src_virt_id[1]};	// Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29
  wire [2:0] _decoded_T_327 =
    {io_req_4_bits_flow_egress_node_id[0],
     io_req_4_bits_flow_egress_node[3],
     io_req_4_bits_src_virt_id[1]};	// Cat.scala:33:92, pla.scala:90:45
  wire [2:0] _decoded_T_329 =
    {_GEN_0[0], io_req_4_bits_src_virt_id[0], io_req_4_bits_src_virt_id[1]};	// Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29
  wire [3:0] _decoded_T_331 =
    {io_req_4_bits_flow_egress_node[0],
     _GEN_0[3],
     io_req_4_bits_src_virt_id[0],
     io_req_4_bits_src_virt_id[1]};	// Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29
  wire [2:0] _decoded_T_333 =
    {io_req_4_bits_flow_egress_node[3],
     io_req_4_bits_src_virt_id[0],
     io_req_4_bits_src_virt_id[1]};	// Cat.scala:33:92, pla.scala:90:45
  wire [1:0] _decoded_T_335 = {_GEN_0[0], io_req_4_bits_src_virt_id[2]};	// Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29
  wire [2:0] _decoded_T_337 =
    {io_req_4_bits_flow_egress_node_id[0], _GEN_0[0], io_req_4_bits_src_virt_id[2]};	// Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29
  wire [2:0] _decoded_T_339 =
    {io_req_4_bits_flow_egress_node[0], _GEN_0[3], io_req_4_bits_src_virt_id[2]};	// Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29
  wire [3:0] _decoded_T_341 =
    {io_req_4_bits_flow_egress_node_id[0],
     io_req_4_bits_flow_egress_node[0],
     _GEN_0[3],
     io_req_4_bits_src_virt_id[2]};	// Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29
  wire [1:0] _decoded_T_343 =
    {io_req_4_bits_flow_egress_node[3], io_req_4_bits_src_virt_id[2]};	// Cat.scala:33:92, pla.scala:90:45
  wire [2:0] _decoded_T_345 =
    {io_req_4_bits_flow_egress_node_id[0],
     io_req_4_bits_flow_egress_node[3],
     io_req_4_bits_src_virt_id[2]};	// Cat.scala:33:92, pla.scala:90:45
  assign io_resp_4_vc_sel_1_1 =
    |{&_decoded_T_317,
      &_decoded_T_321,
      &_decoded_T_323,
      &_decoded_T_327,
      &_decoded_T_337,
      &_decoded_T_345};	// Cat.scala:33:92, pla.scala:98:74, :114:39
  assign io_resp_4_vc_sel_1_2 =
    |{&_decoded_T_317,
      &_decoded_T_321,
      &_decoded_T_323,
      &_decoded_T_327,
      &_decoded_T_337,
      &_decoded_T_345};	// Cat.scala:33:92, pla.scala:98:74, :114:39
  assign io_resp_4_vc_sel_1_3 =
    |{&_decoded_T_317,
      &_decoded_T_321,
      &_decoded_T_323,
      &_decoded_T_327,
      &_decoded_T_329,
      &_decoded_T_333,
      &_decoded_T_335,
      &_decoded_T_343};	// Cat.scala:33:92, pla.scala:98:74, :114:39
  assign io_resp_4_vc_sel_1_4 =
    |{&_decoded_T_317,
      &_decoded_T_321,
      &_decoded_T_323,
      &_decoded_T_327,
      &_decoded_T_329,
      &_decoded_T_333,
      &_decoded_T_335,
      &_decoded_T_343};	// Cat.scala:33:92, pla.scala:98:74, :114:39
  assign io_resp_4_vc_sel_0_1 = |{&_decoded_T_319, &_decoded_T_325, &_decoded_T_341};	// Cat.scala:33:92, pla.scala:98:74, :114:39
  assign io_resp_4_vc_sel_0_2 = |{&_decoded_T_319, &_decoded_T_325, &_decoded_T_341};	// Cat.scala:33:92, pla.scala:98:74, :114:39
  assign io_resp_4_vc_sel_0_3 =
    |{&_decoded_T_319, &_decoded_T_325, &_decoded_T_331, &_decoded_T_339};	// Cat.scala:33:92, pla.scala:98:74, :114:39
  assign io_resp_4_vc_sel_0_4 =
    |{&_decoded_T_319, &_decoded_T_325, &_decoded_T_331, &_decoded_T_339};	// Cat.scala:33:92, pla.scala:98:74, :114:39
  assign io_resp_3_vc_sel_4_4 =
    &{io_req_3_bits_flow_egress_node[0], io_req_3_bits_src_virt_id[2]};	// Cat.scala:33:92, pla.scala:90:45, :98:74
  assign io_resp_3_vc_sel_2_4 =
    &{~(io_req_3_bits_flow_egress_node[0]), io_req_3_bits_src_virt_id[2]};	// Cat.scala:33:92, RouteComputer.scala:74:27, pla.scala:78:21, :90:45, :98:74
  assign io_resp_2_vc_sel_4_4 =
    &{io_req_2_bits_flow_egress_node[0], io_req_2_bits_src_virt_id[2]};	// Cat.scala:33:92, pla.scala:90:45, :98:74
  assign io_resp_2_vc_sel_3_0 = io_req_2_bits_flow_egress_node_id[1];	// pla.scala:90:45
  assign io_resp_2_vc_sel_3_1 = io_req_2_bits_flow_egress_node_id[1];	// pla.scala:90:45
  assign io_resp_2_vc_sel_3_2 =
    |{io_req_2_bits_flow_egress_node_id[1], &_decoded_T_159, &_decoded_T_163};	// Cat.scala:33:92, pla.scala:90:45, :98:74, :114:39
  assign io_resp_2_vc_sel_3_3 =
    |{io_req_2_bits_flow_egress_node_id[1], &_decoded_T_159, &_decoded_T_163};	// Cat.scala:33:92, pla.scala:90:45, :98:74, :114:39
  assign io_resp_2_vc_sel_3_4 =
    |{io_req_2_bits_flow_egress_node_id[1],
      &_decoded_T_159,
      &{~(io_req_2_bits_flow_egress_node[0]), io_req_2_bits_src_virt_id[2]}};	// Cat.scala:33:92, RouteComputer.scala:74:27, pla.scala:78:21, :90:45, :98:74, :114:39
  assign io_resp_1_vc_sel_4_4 = io_req_1_bits_src_virt_id[2];	// pla.scala:90:45
  assign io_resp_0_vc_sel_4_4 =
    &{io_req_0_bits_flow_egress_node[0], io_req_0_bits_src_virt_id[2]};	// Cat.scala:33:92, pla.scala:90:45, :98:74
  assign io_resp_0_vc_sel_3_0 = io_req_0_bits_flow_egress_node_id[1];	// pla.scala:90:45
  assign io_resp_0_vc_sel_3_1 = io_req_0_bits_flow_egress_node_id[1];	// pla.scala:90:45
  assign io_resp_0_vc_sel_3_2 =
    |{io_req_0_bits_flow_egress_node_id[1], &_decoded_T_1, &_decoded_T_5};	// Cat.scala:33:92, pla.scala:90:45, :98:74, :114:39
  assign io_resp_0_vc_sel_3_3 =
    |{io_req_0_bits_flow_egress_node_id[1], &_decoded_T_1, &_decoded_T_5};	// Cat.scala:33:92, pla.scala:90:45, :98:74, :114:39
  assign io_resp_0_vc_sel_3_4 =
    |{io_req_0_bits_flow_egress_node_id[1],
      &_decoded_T_1,
      &{_GEN[1], io_req_0_bits_src_virt_id[2]}};	// Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29, :98:74, :114:39
  assign io_resp_0_vc_sel_2_4 =
    &{_GEN[0], io_req_0_bits_flow_egress_node[1], io_req_0_bits_src_virt_id[2]};	// Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29, :98:74
endmodule

