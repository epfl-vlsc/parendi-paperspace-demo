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

module RouteComputer_157(
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
  output       io_resp_2_vc_sel_2_1,
               io_resp_2_vc_sel_2_2,
               io_resp_2_vc_sel_2_3,
               io_resp_2_vc_sel_2_4,
               io_resp_2_vc_sel_1_1,
               io_resp_2_vc_sel_1_2,
               io_resp_2_vc_sel_1_3,
               io_resp_2_vc_sel_1_4,
               io_resp_2_vc_sel_0_1,
               io_resp_2_vc_sel_0_2,
               io_resp_2_vc_sel_0_3,
               io_resp_2_vc_sel_0_4,
               io_resp_1_vc_sel_3_0,
               io_resp_1_vc_sel_3_1,
               io_resp_1_vc_sel_3_2,
               io_resp_1_vc_sel_3_3,
               io_resp_1_vc_sel_3_4,
               io_resp_0_vc_sel_3_0,
               io_resp_0_vc_sel_3_1,
               io_resp_0_vc_sel_3_2,
               io_resp_0_vc_sel_3_3,
               io_resp_0_vc_sel_3_4
);

  wire [1:0] _decoded_T_1 = {io_req_0_bits_flow_egress_node_id[0], io_req_0_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:90:45]
  wire [1:0] _decoded_T_4 = {io_req_0_bits_flow_egress_node_id[0], io_req_0_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:90:45]
  wire [1:0] _decoded_T_57 = {io_req_1_bits_flow_egress_node_id[0], io_req_1_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:90:45]
  wire [1:0] _decoded_T_60 = {io_req_1_bits_flow_egress_node_id[0], io_req_1_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:90:45]
  wire [6:0] _GEN = ~(io_req_2_bits_flow_egress_node[6:0]);	// @[RouteComputer.scala:74:27, pla.scala:78:21]
  wire [4:0] _decoded_T_112 = {io_req_2_bits_flow_egress_node_id[0], _GEN[0], _GEN[2], _GEN[5], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_114 = {io_req_2_bits_flow_egress_node_id[0], _GEN[1], _GEN[2], _GEN[5], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_116 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], _GEN[3], _GEN[5], _GEN[6], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_118 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[2], _GEN[3], _GEN[4], _GEN[5], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_120 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], io_req_2_bits_flow_egress_node[2], _GEN[4], _GEN[5], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_122 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[1], io_req_2_bits_flow_egress_node[2], _GEN[3], _GEN[5], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_124 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], io_req_2_bits_flow_egress_node[1], io_req_2_bits_flow_egress_node[2], _GEN[5], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [7:0] _decoded_T_126 = {io_req_2_bits_flow_egress_node_id[0], _GEN[0], _GEN[1], _GEN[2], io_req_2_bits_flow_egress_node[3], _GEN[4], _GEN[6], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_128 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], _GEN[2], io_req_2_bits_flow_egress_node[3], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_130 = {io_req_2_bits_flow_egress_node_id[0], _GEN[0], io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[3], _GEN[6], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_132 = {io_req_2_bits_flow_egress_node_id[0], _GEN[0], _GEN[1], io_req_2_bits_flow_egress_node[4], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_134 = {io_req_2_bits_flow_egress_node_id[0], _GEN[1], io_req_2_bits_flow_egress_node[3], io_req_2_bits_flow_egress_node[4], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [6:0] _decoded_T_136 = {io_req_2_bits_flow_egress_node_id[0], _GEN[0], io_req_2_bits_flow_egress_node[1], _GEN[2], io_req_2_bits_flow_egress_node[3], io_req_2_bits_flow_egress_node[4], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_138 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], _GEN[2], _GEN[3], io_req_2_bits_flow_egress_node[5], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [3:0] _decoded_T_140 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[5], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:90:45]
  wire [5:0] _decoded_T_142 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], io_req_2_bits_flow_egress_node[1], _GEN[3], io_req_2_bits_flow_egress_node[6], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [3:0] _decoded_T_144 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[6], io_req_2_bits_src_virt_id[0]};	// @[Cat.scala:33:92, pla.scala:90:45]
  wire [4:0] _decoded_T_146 = {io_req_2_bits_flow_egress_node_id[0], _GEN[0], _GEN[2], _GEN[5], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_148 = {io_req_2_bits_flow_egress_node_id[0], _GEN[1], _GEN[2], _GEN[5], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_150 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], _GEN[3], _GEN[5], _GEN[6], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_152 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[2], _GEN[3], _GEN[4], _GEN[5], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_154 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], io_req_2_bits_flow_egress_node[2], _GEN[4], _GEN[5], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_156 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[1], io_req_2_bits_flow_egress_node[2], _GEN[3], _GEN[5], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_158 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], io_req_2_bits_flow_egress_node[1], io_req_2_bits_flow_egress_node[2], _GEN[5], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [7:0] _decoded_T_160 = {io_req_2_bits_flow_egress_node_id[0], _GEN[0], _GEN[1], _GEN[2], io_req_2_bits_flow_egress_node[3], _GEN[4], _GEN[6], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_162 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], _GEN[2], io_req_2_bits_flow_egress_node[3], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_164 = {io_req_2_bits_flow_egress_node_id[0], _GEN[0], io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[3], _GEN[6], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_166 = {io_req_2_bits_flow_egress_node_id[0], _GEN[0], _GEN[1], io_req_2_bits_flow_egress_node[4], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_168 = {io_req_2_bits_flow_egress_node_id[0], _GEN[1], io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[4], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [6:0] _decoded_T_170 = {io_req_2_bits_flow_egress_node_id[0], _GEN[0], io_req_2_bits_flow_egress_node[1], _GEN[2], io_req_2_bits_flow_egress_node[3], io_req_2_bits_flow_egress_node[4], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_172 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], _GEN[2], _GEN[3], io_req_2_bits_flow_egress_node[5], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [3:0] _decoded_T_174 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[5], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:90:45]
  wire [5:0] _decoded_T_176 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], io_req_2_bits_flow_egress_node[1], _GEN[3], io_req_2_bits_flow_egress_node[6], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [3:0] _decoded_T_178 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[6], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:90:45]
  wire [4:0] _decoded_T_180 = {_GEN[0], _GEN[2], _GEN[5], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_182 = {_GEN[1], _GEN[2], _GEN[5], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_184 = {io_req_2_bits_flow_egress_node[0], _GEN[3], _GEN[5], _GEN[6], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_186 = {io_req_2_bits_flow_egress_node[2], _GEN[3], _GEN[4], _GEN[5], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_188 = {io_req_2_bits_flow_egress_node[0], io_req_2_bits_flow_egress_node[2], _GEN[4], _GEN[5], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_190 = {io_req_2_bits_flow_egress_node[1], io_req_2_bits_flow_egress_node[2], _GEN[3], _GEN[5], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_192 = {io_req_2_bits_flow_egress_node[0], io_req_2_bits_flow_egress_node[1], io_req_2_bits_flow_egress_node[2], _GEN[5], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_194 = {io_req_2_bits_flow_egress_node[0], _GEN[2], io_req_2_bits_flow_egress_node[3], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_196 = {_GEN[0], io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[3], _GEN[6], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_198 = {_GEN[0], _GEN[1], io_req_2_bits_flow_egress_node[4], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_200 = {_GEN[1], io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[4], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_202 = {_GEN[2], _GEN[4], io_req_2_bits_flow_egress_node[5], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_204 = {io_req_2_bits_flow_egress_node[0], _GEN[2], _GEN[3], io_req_2_bits_flow_egress_node[5], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_206 = {io_req_2_bits_flow_egress_node[1], _GEN[2], io_req_2_bits_flow_egress_node[5], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [3:0] _decoded_T_208 = {io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[5], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:90:45]
  wire [5:0] _decoded_T_210 = {io_req_2_bits_flow_egress_node[0], io_req_2_bits_flow_egress_node[1], _GEN[3], io_req_2_bits_flow_egress_node[6], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [3:0] _decoded_T_212 = {io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[6], io_req_2_bits_src_virt_id[0], io_req_2_bits_src_virt_id[1]};	// @[Cat.scala:33:92, pla.scala:90:45]
  wire [3:0] _decoded_T_214 = {_GEN[0], _GEN[2], _GEN[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [3:0] _decoded_T_216 = {_GEN[1], _GEN[2], _GEN[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_218 = {io_req_2_bits_flow_egress_node_id[0], _GEN[0], _GEN[2], _GEN[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_220 = {io_req_2_bits_flow_egress_node_id[0], _GEN[1], _GEN[2], _GEN[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_222 = {io_req_2_bits_flow_egress_node[0], _GEN[3], _GEN[5], _GEN[6], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_224 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], _GEN[3], _GEN[5], _GEN[6], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_226 = {io_req_2_bits_flow_egress_node[2], _GEN[3], _GEN[4], _GEN[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_228 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[2], _GEN[3], _GEN[4], _GEN[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_230 = {io_req_2_bits_flow_egress_node[0], io_req_2_bits_flow_egress_node[2], _GEN[4], _GEN[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_232 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], io_req_2_bits_flow_egress_node[2], _GEN[4], _GEN[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_234 = {io_req_2_bits_flow_egress_node[1], io_req_2_bits_flow_egress_node[2], _GEN[3], _GEN[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_236 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[1], io_req_2_bits_flow_egress_node[2], _GEN[3], _GEN[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_238 = {io_req_2_bits_flow_egress_node[0], io_req_2_bits_flow_egress_node[1], io_req_2_bits_flow_egress_node[2], _GEN[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_240 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], io_req_2_bits_flow_egress_node[1], io_req_2_bits_flow_egress_node[2], _GEN[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [7:0] _decoded_T_242 = {io_req_2_bits_flow_egress_node_id[0], _GEN[0], _GEN[1], _GEN[2], io_req_2_bits_flow_egress_node[3], _GEN[4], _GEN[6], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [3:0] _decoded_T_244 = {io_req_2_bits_flow_egress_node[0], _GEN[2], io_req_2_bits_flow_egress_node[3], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_246 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], _GEN[2], io_req_2_bits_flow_egress_node[3], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_248 = {_GEN[0], io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[3], _GEN[6], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_250 = {io_req_2_bits_flow_egress_node_id[0], _GEN[0], io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[3], _GEN[6], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [3:0] _decoded_T_252 = {_GEN[0], _GEN[1], io_req_2_bits_flow_egress_node[4], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_254 = {io_req_2_bits_flow_egress_node_id[0], _GEN[0], _GEN[1], io_req_2_bits_flow_egress_node[4], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [3:0] _decoded_T_256 = {_GEN[1], io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[4], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_258 = {io_req_2_bits_flow_egress_node_id[0], _GEN[1], io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[4], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [6:0] _decoded_T_260 = {io_req_2_bits_flow_egress_node_id[0], _GEN[0], io_req_2_bits_flow_egress_node[1], _GEN[2], io_req_2_bits_flow_egress_node[3], io_req_2_bits_flow_egress_node[4], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [3:0] _decoded_T_262 = {_GEN[2], _GEN[4], io_req_2_bits_flow_egress_node[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [4:0] _decoded_T_264 = {io_req_2_bits_flow_egress_node[0], _GEN[2], _GEN[3], io_req_2_bits_flow_egress_node[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_266 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], _GEN[2], _GEN[3], io_req_2_bits_flow_egress_node[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [3:0] _decoded_T_268 = {io_req_2_bits_flow_egress_node[1], _GEN[2], io_req_2_bits_flow_egress_node[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [2:0] _decoded_T_270 = {io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:90:45]
  wire [3:0] _decoded_T_272 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[5], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:90:45]
  wire [4:0] _decoded_T_274 = {io_req_2_bits_flow_egress_node[0], io_req_2_bits_flow_egress_node[1], _GEN[3], io_req_2_bits_flow_egress_node[6], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [5:0] _decoded_T_276 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[0], io_req_2_bits_flow_egress_node[1], _GEN[3], io_req_2_bits_flow_egress_node[6], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:78:21, :90:45, :91:29]
  wire [2:0] _decoded_T_278 = {io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[6], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:90:45]
  wire [3:0] _decoded_T_280 = {io_req_2_bits_flow_egress_node_id[0], io_req_2_bits_flow_egress_node[2], io_req_2_bits_flow_egress_node[6], io_req_2_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:90:45]
  assign io_resp_2_vc_sel_2_1 = |{&_decoded_T_112, &_decoded_T_114, &_decoded_T_116, &_decoded_T_128, &_decoded_T_130, &_decoded_T_132, &_decoded_T_134, &_decoded_T_140, &_decoded_T_146, &_decoded_T_148, &_decoded_T_150, &_decoded_T_162, &_decoded_T_164, &_decoded_T_166, &_decoded_T_168, &_decoded_T_174, &_decoded_T_218, &_decoded_T_220, &_decoded_T_224, &_decoded_T_246, &_decoded_T_250, &_decoded_T_254, &_decoded_T_258, &_decoded_T_272};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_resp_2_vc_sel_2_2 = |{&_decoded_T_112, &_decoded_T_114, &_decoded_T_116, &_decoded_T_128, &_decoded_T_130, &_decoded_T_132, &_decoded_T_134, &_decoded_T_140, &_decoded_T_146, &_decoded_T_148, &_decoded_T_150, &_decoded_T_162, &_decoded_T_164, &_decoded_T_166, &_decoded_T_168, &_decoded_T_174, &_decoded_T_218, &_decoded_T_220, &_decoded_T_224, &_decoded_T_246, &_decoded_T_250, &_decoded_T_254, &_decoded_T_258, &_decoded_T_272};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_resp_2_vc_sel_2_3 = |{&_decoded_T_112, &_decoded_T_114, &_decoded_T_116, &_decoded_T_128, &_decoded_T_130, &_decoded_T_132, &_decoded_T_134, &_decoded_T_140, &_decoded_T_146, &_decoded_T_148, &_decoded_T_150, &_decoded_T_162, &_decoded_T_164, &_decoded_T_166, &_decoded_T_168, &_decoded_T_174, &_decoded_T_180, &_decoded_T_182, &_decoded_T_184, &_decoded_T_194, &_decoded_T_196, &_decoded_T_198, &_decoded_T_200, &_decoded_T_208, &_decoded_T_214, &_decoded_T_216, &_decoded_T_222, &_decoded_T_244, &_decoded_T_248, &_decoded_T_252, &_decoded_T_256, &_decoded_T_270};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_resp_2_vc_sel_2_4 = |{&_decoded_T_112, &_decoded_T_114, &_decoded_T_116, &_decoded_T_128, &_decoded_T_130, &_decoded_T_132, &_decoded_T_134, &_decoded_T_140, &_decoded_T_146, &_decoded_T_148, &_decoded_T_150, &_decoded_T_162, &_decoded_T_164, &_decoded_T_166, &_decoded_T_168, &_decoded_T_174, &_decoded_T_180, &_decoded_T_182, &_decoded_T_184, &_decoded_T_194, &_decoded_T_196, &_decoded_T_198, &_decoded_T_200, &_decoded_T_208, &_decoded_T_214, &_decoded_T_216, &_decoded_T_222, &_decoded_T_244, &_decoded_T_248, &_decoded_T_252, &_decoded_T_256, &_decoded_T_270};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_resp_2_vc_sel_1_1 = |{&_decoded_T_118, &_decoded_T_120, &_decoded_T_122, &_decoded_T_124, &_decoded_T_126, &_decoded_T_136, &_decoded_T_138, &_decoded_T_142, &_decoded_T_152, &_decoded_T_154, &_decoded_T_156, &_decoded_T_158, &_decoded_T_160, &_decoded_T_170, &_decoded_T_172, &_decoded_T_176, &_decoded_T_228, &_decoded_T_232, &_decoded_T_236, &_decoded_T_240, &_decoded_T_242, &_decoded_T_260, &_decoded_T_266, &_decoded_T_276};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_resp_2_vc_sel_1_2 = |{&_decoded_T_118, &_decoded_T_120, &_decoded_T_122, &_decoded_T_124, &_decoded_T_126, &_decoded_T_136, &_decoded_T_138, &_decoded_T_142, &_decoded_T_152, &_decoded_T_154, &_decoded_T_156, &_decoded_T_158, &_decoded_T_160, &_decoded_T_170, &_decoded_T_172, &_decoded_T_176, &_decoded_T_228, &_decoded_T_232, &_decoded_T_236, &_decoded_T_240, &_decoded_T_242, &_decoded_T_260, &_decoded_T_266, &_decoded_T_276};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_resp_2_vc_sel_1_3 = |{&_decoded_T_118, &_decoded_T_120, &_decoded_T_122, &_decoded_T_124, &_decoded_T_126, &_decoded_T_136, &_decoded_T_138, &_decoded_T_142, &_decoded_T_152, &_decoded_T_154, &_decoded_T_156, &_decoded_T_158, &_decoded_T_160, &_decoded_T_170, &_decoded_T_172, &_decoded_T_176, &_decoded_T_186, &_decoded_T_188, &_decoded_T_190, &_decoded_T_192, &_decoded_T_202, &_decoded_T_204, &_decoded_T_206, &_decoded_T_210, &_decoded_T_226, &_decoded_T_230, &_decoded_T_234, &_decoded_T_238, &_decoded_T_262, &_decoded_T_264, &_decoded_T_268, &_decoded_T_274};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_resp_2_vc_sel_1_4 = |{&_decoded_T_118, &_decoded_T_120, &_decoded_T_122, &_decoded_T_124, &_decoded_T_126, &_decoded_T_136, &_decoded_T_138, &_decoded_T_142, &_decoded_T_152, &_decoded_T_154, &_decoded_T_156, &_decoded_T_158, &_decoded_T_160, &_decoded_T_170, &_decoded_T_172, &_decoded_T_176, &_decoded_T_186, &_decoded_T_188, &_decoded_T_190, &_decoded_T_192, &_decoded_T_202, &_decoded_T_204, &_decoded_T_206, &_decoded_T_210, &_decoded_T_226, &_decoded_T_230, &_decoded_T_234, &_decoded_T_238, &_decoded_T_262, &_decoded_T_264, &_decoded_T_268, &_decoded_T_274};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_resp_2_vc_sel_0_1 = |{&_decoded_T_144, &_decoded_T_178, &_decoded_T_280};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_resp_2_vc_sel_0_2 = |{&_decoded_T_144, &_decoded_T_178, &_decoded_T_280};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_resp_2_vc_sel_0_3 = |{&_decoded_T_144, &_decoded_T_178, &_decoded_T_212, &_decoded_T_278};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_resp_2_vc_sel_0_4 = |{&_decoded_T_144, &_decoded_T_178, &_decoded_T_212, &_decoded_T_278};	// @[Cat.scala:33:92, pla.scala:98:74, :114:39]
  assign io_resp_1_vc_sel_3_0 = io_req_1_bits_flow_egress_node_id[1];	// @[pla.scala:90:45]
  assign io_resp_1_vc_sel_3_1 = io_req_1_bits_flow_egress_node_id[1];	// @[pla.scala:90:45]
  assign io_resp_1_vc_sel_3_2 = |{io_req_1_bits_flow_egress_node_id[1], &_decoded_T_57, &_decoded_T_60};	// @[Cat.scala:33:92, pla.scala:90:45, :98:74, :114:39]
  assign io_resp_1_vc_sel_3_3 = |{io_req_1_bits_flow_egress_node_id[1], &_decoded_T_57, &_decoded_T_60};	// @[Cat.scala:33:92, pla.scala:90:45, :98:74, :114:39]
  assign io_resp_1_vc_sel_3_4 = |{io_req_1_bits_flow_egress_node_id[1], &_decoded_T_57, io_req_1_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:90:45, :98:74, :114:39]
  assign io_resp_0_vc_sel_3_0 = io_req_0_bits_flow_egress_node_id[1];	// @[pla.scala:90:45]
  assign io_resp_0_vc_sel_3_1 = io_req_0_bits_flow_egress_node_id[1];	// @[pla.scala:90:45]
  assign io_resp_0_vc_sel_3_2 = |{io_req_0_bits_flow_egress_node_id[1], &_decoded_T_1, &_decoded_T_4};	// @[Cat.scala:33:92, pla.scala:90:45, :98:74, :114:39]
  assign io_resp_0_vc_sel_3_3 = |{io_req_0_bits_flow_egress_node_id[1], &_decoded_T_1, &_decoded_T_4};	// @[Cat.scala:33:92, pla.scala:90:45, :98:74, :114:39]
  assign io_resp_0_vc_sel_3_4 = |{io_req_0_bits_flow_egress_node_id[1], &_decoded_T_1, io_req_0_bits_src_virt_id[2]};	// @[Cat.scala:33:92, pla.scala:90:45, :98:74, :114:39]
endmodule

