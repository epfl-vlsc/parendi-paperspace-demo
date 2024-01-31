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

module EgressUnit_339(
  input         clock,
                reset,
                io_in_0_valid,
                io_in_0_bits_head,
                io_in_0_bits_tail,
  input  [72:0] io_in_0_bits_payload,
  input  [8:0]  io_in_0_bits_flow_ingress_node,
  input  [1:0]  io_in_0_bits_flow_ingress_node_id,
  input         io_allocs_0_alloc,
                io_credit_alloc_0_alloc,
                io_credit_alloc_0_tail,
                io_out_ready,
  output        io_credit_available_0,
                io_channel_status_0_occupied,
                io_out_valid,
                io_out_bits_head,
                io_out_bits_tail,
  output [72:0] io_out_bits_payload
);

  wire       _q_io_enq_ready;	// @[EgressUnit.scala:22:17]
  wire [1:0] _q_io_count;	// @[EgressUnit.scala:22:17]
  reg        channel_empty;	// @[EgressUnit.scala:20:30]
  wire       _q_io_enq_bits_ingress_id_T_496 = io_in_0_bits_flow_ingress_node_id == 2'h1;	// @[EgressUnit.scala:32:27]
  wire [8:0] _GEN =
    (io_in_0_bits_flow_ingress_node == 9'h4C & _q_io_enq_bits_ingress_id_T_496 ? 9'hE5 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h9 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1C : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h9D & _q_io_enq_bits_ingress_id_T_496 ? 9'h1D8 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h65 & _q_io_enq_bits_ingress_id_T_496 ? 9'h130 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h8D & _q_io_enq_bits_ingress_id_T_496 ? 9'h1A8 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h2 & _q_io_enq_bits_ingress_id_T_496 ? 9'h7 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h41 & _q_io_enq_bits_ingress_id_T_496 ? 9'hC4 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h60 & _q_io_enq_bits_ingress_id_T_496 ? 9'h121 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h1B & _q_io_enq_bits_ingress_id_T_496 ? 9'h52 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h96 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1C3 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h30 & _q_io_enq_bits_ingress_id_T_496 ? 9'h91 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h3D & _q_io_enq_bits_ingress_id_T_496 ? 9'hB8 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h50 & _q_io_enq_bits_ingress_id_T_496 ? 9'hF1 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h32 & _q_io_enq_bits_ingress_id_T_496 ? 9'h97 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h76 & _q_io_enq_bits_ingress_id_T_496 ? 9'h163 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h52 & _q_io_enq_bits_ingress_id_T_496 ? 9'hF7 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h48 & _q_io_enq_bits_ingress_id_T_496 ? 9'hD9 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h7 & _q_io_enq_bits_ingress_id_T_496 ? 9'h16 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h3E & _q_io_enq_bits_ingress_id_T_496 ? 9'hBB : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h5C & _q_io_enq_bits_ingress_id_T_496 ? 9'h115 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h8F & _q_io_enq_bits_ingress_id_T_496 ? 9'h1AE : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 9'h93 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1BA : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h14 & _q_io_enq_bits_ingress_id_T_496 ? 9'h3D : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h61 & _q_io_enq_bits_ingress_id_T_496 ? 9'h124 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h5D & _q_io_enq_bits_ingress_id_T_496 ? 9'h118 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h90 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1B1 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h10 & _q_io_enq_bits_ingress_id_T_496 ? 9'h31 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h77 & _q_io_enq_bits_ingress_id_T_496 ? 9'h166 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h4F & _q_io_enq_bits_ingress_id_T_496 ? 9'hEE : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'hA0 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1E1 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h12 & _q_io_enq_bits_ingress_id_T_496 ? 9'h37 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h8E & _q_io_enq_bits_ingress_id_T_496 ? 9'h1AB : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'hC & _q_io_enq_bits_ingress_id_T_496 ? 9'h25 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h59 & _q_io_enq_bits_ingress_id_T_496 ? 9'h10C : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h26 & _q_io_enq_bits_ingress_id_T_496 ? 9'h73 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'hA3 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1EA : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h43 & _q_io_enq_bits_ingress_id_T_496 ? 9'hCA : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h4B & _q_io_enq_bits_ingress_id_T_496 ? 9'hE2 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h39 & _q_io_enq_bits_ingress_id_T_496 ? 9'hAC : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h19 & _q_io_enq_bits_ingress_id_T_496 ? 9'h4C : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h5B & _q_io_enq_bits_ingress_id_T_496 ? 9'h112 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h22 & _q_io_enq_bits_ingress_id_T_496 ? 9'h67 : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 9'h69 & _q_io_enq_bits_ingress_id_T_496 ? 9'h13C : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h6E & _q_io_enq_bits_ingress_id_T_496 ? 9'h14B : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h7E & _q_io_enq_bits_ingress_id_T_496 ? 9'h17B : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h7B & _q_io_enq_bits_ingress_id_T_496 ? 9'h172 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h95 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1C0 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h35 & _q_io_enq_bits_ingress_id_T_496 ? 9'hA0 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h8A & _q_io_enq_bits_ingress_id_T_496 ? 9'h19F : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h8C & _q_io_enq_bits_ingress_id_T_496 ? 9'h1A5 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h70 & _q_io_enq_bits_ingress_id_T_496 ? 9'h151 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h13 & _q_io_enq_bits_ingress_id_T_496 ? 9'h3A : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h36 & _q_io_enq_bits_ingress_id_T_496 ? 9'hA3 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h79 & _q_io_enq_bits_ingress_id_T_496 ? 9'h16C : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h20 & _q_io_enq_bits_ingress_id_T_496 ? 9'h61 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'hA4 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1ED : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'hA5 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1F0 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h45 & _q_io_enq_bits_ingress_id_T_496 ? 9'hD0 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h2C & _q_io_enq_bits_ingress_id_T_496 ? 9'h85 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'hA & _q_io_enq_bits_ingress_id_T_496 ? 9'h1F : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h3A & _q_io_enq_bits_ingress_id_T_496 ? 9'hAF : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h33 & _q_io_enq_bits_ingress_id_T_496 ? 9'h9A : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h6A & _q_io_enq_bits_ingress_id_T_496 ? 9'h13F : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 9'h34 & _q_io_enq_bits_ingress_id_T_496 ? 9'h9D : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h58 & _q_io_enq_bits_ingress_id_T_496 ? 9'h109 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h6 & _q_io_enq_bits_ingress_id_T_496 ? 9'h13 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h64 & _q_io_enq_bits_ingress_id_T_496 ? 9'h12D : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h7C & _q_io_enq_bits_ingress_id_T_496 ? 9'h175 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'hA1 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1E4 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h3F & _q_io_enq_bits_ingress_id_T_496 ? 9'hBE : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h72 & _q_io_enq_bits_ingress_id_T_496 ? 9'h157 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h81 & _q_io_enq_bits_ingress_id_T_496 ? 9'h184 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h88 & _q_io_enq_bits_ingress_id_T_496 ? 9'h199 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h18 & _q_io_enq_bits_ingress_id_T_496 ? 9'h49 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h2F & _q_io_enq_bits_ingress_id_T_496 ? 9'h8E : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h3B & _q_io_enq_bits_ingress_id_T_496 ? 9'hB2 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h7A & _q_io_enq_bits_ingress_id_T_496 ? 9'h16F : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h8B & _q_io_enq_bits_ingress_id_T_496 ? 9'h1A2 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h5A & _q_io_enq_bits_ingress_id_T_496 ? 9'h10F : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h46 & _q_io_enq_bits_ingress_id_T_496 ? 9'hD3 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h6B & _q_io_enq_bits_ingress_id_T_496 ? 9'h142 : 9'h0);	// @[EgressUnit.scala:31:{39,75}, :32:27, Mux.scala:27:73]
  wire [8:0] _GEN_0 =
    (io_in_0_bits_flow_ingress_node == 9'h1C & _q_io_enq_bits_ingress_id_T_496 ? 9'h55 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h83 & _q_io_enq_bits_ingress_id_T_496 ? 9'h18A : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h68 & _q_io_enq_bits_ingress_id_T_496 ? 9'h139 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h92 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1B7 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h4A & _q_io_enq_bits_ingress_id_T_496 ? 9'hDF : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h31 & _q_io_enq_bits_ingress_id_T_496 ? 9'h94 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h17 & _q_io_enq_bits_ingress_id_T_496 ? 9'h46 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h24 & _q_io_enq_bits_ingress_id_T_496 ? 9'h6D : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h27 & _q_io_enq_bits_ingress_id_T_496 ? 9'h76 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h73 & _q_io_enq_bits_ingress_id_T_496 ? 9'h15A : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h84 & _q_io_enq_bits_ingress_id_T_496 ? 9'h18D : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h4D & _q_io_enq_bits_ingress_id_T_496 ? 9'hE8 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h80 & _q_io_enq_bits_ingress_id_T_496 ? 9'h181 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h1D & _q_io_enq_bits_ingress_id_T_496 ? 9'h58 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h99 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1CC : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h4E & _q_io_enq_bits_ingress_id_T_496 ? 9'hEB : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h38 & _q_io_enq_bits_ingress_id_T_496 ? 9'hA9 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'hD & _q_io_enq_bits_ingress_id_T_496 ? 9'h28 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h9C & _q_io_enq_bits_ingress_id_T_496 ? 9'h1D5 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h57 & _q_io_enq_bits_ingress_id_T_496 ? 9'h106 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h47 & _q_io_enq_bits_ingress_id_T_496 ? 9'hD6 : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 9'h91 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1B4 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h67 & _q_io_enq_bits_ingress_id_T_496 ? 9'h136 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h75 & _q_io_enq_bits_ingress_id_T_496 ? 9'h160 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h4 & _q_io_enq_bits_ingress_id_T_496 ? 9'hD : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h42 & _q_io_enq_bits_ingress_id_T_496 ? 9'hC7 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h3C & _q_io_enq_bits_ingress_id_T_496 ? 9'hB5 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h9E & _q_io_enq_bits_ingress_id_T_496 ? 9'h1DB : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h51 & _q_io_enq_bits_ingress_id_T_496 ? 9'hF4 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h49 & _q_io_enq_bits_ingress_id_T_496 ? 9'hDC : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h71 & _q_io_enq_bits_ingress_id_T_496 ? 9'h154 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h40 & _q_io_enq_bits_ingress_id_T_496 ? 9'hC1 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'hF & _q_io_enq_bits_ingress_id_T_496 ? 9'h2E : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h78 & _q_io_enq_bits_ingress_id_T_496 ? 9'h169 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h1F & _q_io_enq_bits_ingress_id_T_496 ? 9'h5E : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h66 & _q_io_enq_bits_ingress_id_T_496 ? 9'h133 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h5E & _q_io_enq_bits_ingress_id_T_496 ? 9'h11B : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h37 & _q_io_enq_bits_ingress_id_T_496 ? 9'hA6 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h7D & _q_io_enq_bits_ingress_id_T_496 ? 9'h178 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h9A & _q_io_enq_bits_ingress_id_T_496 ? 9'h1CF : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h9B & _q_io_enq_bits_ingress_id_T_496 ? 9'h1D2 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h3 & _q_io_enq_bits_ingress_id_T_496 ? 9'hA : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 9'h62 & _q_io_enq_bits_ingress_id_T_496 ? 9'h127 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h82 & _q_io_enq_bits_ingress_id_T_496 ? 9'h187 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h63 & _q_io_enq_bits_ingress_id_T_496 ? 9'h12A : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h8 & _q_io_enq_bits_ingress_id_T_496 ? 9'h19 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h94 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1BD : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h86 & _q_io_enq_bits_ingress_id_T_496 ? 9'h193 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h53 & _q_io_enq_bits_ingress_id_T_496 ? 9'hFA : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h21 & _q_io_enq_bits_ingress_id_T_496 ? 9'h64 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h2E & _q_io_enq_bits_ingress_id_T_496 ? 9'h8B : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h2A & _q_io_enq_bits_ingress_id_T_496 ? 9'h7F : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h89 & _q_io_enq_bits_ingress_id_T_496 ? 9'h19C : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h56 & _q_io_enq_bits_ingress_id_T_496 ? 9'h103 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h98 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1C9 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h6D & _q_io_enq_bits_ingress_id_T_496 ? 9'h148 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h25 & _q_io_enq_bits_ingress_id_T_496 ? 9'h70 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'hA2 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1E7 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h2D & _q_io_enq_bits_ingress_id_T_496 ? 9'h88 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h29 & _q_io_enq_bits_ingress_id_T_496 ? 9'h7C : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h1A & _q_io_enq_bits_ingress_id_T_496 ? 9'h4F : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h85 & _q_io_enq_bits_ingress_id_T_496 ? 9'h190 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'hE & _q_io_enq_bits_ingress_id_T_496 ? 9'h2B : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 9'h6C & _q_io_enq_bits_ingress_id_T_496 ? 9'h145 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h44 & _q_io_enq_bits_ingress_id_T_496 ? 9'hCD : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h16 & _q_io_enq_bits_ingress_id_T_496 ? 9'h43 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h6F & _q_io_enq_bits_ingress_id_T_496 ? 9'h14E : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h9F & _q_io_enq_bits_ingress_id_T_496 ? 9'h1DE : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h87 & _q_io_enq_bits_ingress_id_T_496 ? 9'h196 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h11 & _q_io_enq_bits_ingress_id_T_496 ? 9'h34 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h28 & _q_io_enq_bits_ingress_id_T_496 ? 9'h79 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h97 & _q_io_enq_bits_ingress_id_T_496 ? 9'h1C6 : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h2B & _q_io_enq_bits_ingress_id_T_496 ? 9'h82 : 9'h0) | {io_in_0_bits_flow_ingress_node == 9'h55 & _q_io_enq_bits_ingress_id_T_496, 1'h0, io_in_0_bits_flow_ingress_node == 9'h15 & _q_io_enq_bits_ingress_id_T_496, 1'h0, io_in_0_bits_flow_ingress_node == 9'h5 & _q_io_enq_bits_ingress_id_T_496, 1'h0, io_in_0_bits_flow_ingress_node == 9'h1 & _q_io_enq_bits_ingress_id_T_496, 1'h0, io_in_0_bits_flow_ingress_node == 9'h0 & _q_io_enq_bits_ingress_id_T_496} | (io_in_0_bits_flow_ingress_node == 9'h1E & _q_io_enq_bits_ingress_id_T_496 ? 9'h5B : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h7F & _q_io_enq_bits_ingress_id_T_496 ? 9'h17E : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h23 & _q_io_enq_bits_ingress_id_T_496 ? 9'h6A : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h74 & _q_io_enq_bits_ingress_id_T_496 ? 9'h15D : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h54 & _q_io_enq_bits_ingress_id_T_496 ? 9'hFD : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'h5F & _q_io_enq_bits_ingress_id_T_496 ? 9'h11E : 9'h0) | (io_in_0_bits_flow_ingress_node == 9'hB & _q_io_enq_bits_ingress_id_T_496 ? 9'h22 : 9'h0);	// @[EgressUnit.scala:21:17, :31:{39,75}, :32:27, Mux.scala:27:73]
  always @(posedge clock) begin
    if (reset)
      channel_empty <= 1'h1;	// @[EgressUnit.scala:20:30]
    else
      channel_empty <= ~io_allocs_0_alloc & (io_credit_alloc_0_alloc & io_credit_alloc_0_tail | channel_empty);	// @[EgressUnit.scala:20:30, :44:{34,62}, :45:19, :49:29, :50:19]
  end // always @(posedge)
  `ifndef SYNTHESIS
    always @(posedge clock) begin	// @[EgressUnit.scala:38:9]
      if (~reset & io_in_0_valid & ~_q_io_enq_ready) begin	// @[EgressUnit.scala:22:17, :38:{9,30}]
        if (`ASSERT_VERBOSE_COND_)	// @[EgressUnit.scala:38:9]
          $error("Assertion failed\n    at EgressUnit.scala:38 assert(!(q.io.enq.valid && !q.io.enq.ready))\n");	// @[EgressUnit.scala:38:9]
        if (`STOP_COND_)	// @[EgressUnit.scala:38:9]
          $fatal;	// @[EgressUnit.scala:38:9]
      end
    end // always @(posedge)
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        channel_empty = _RANDOM_0[0];	// @[EgressUnit.scala:20:30]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  Queue_17 q (	// @[EgressUnit.scala:22:17]
    .clock                  (clock),
    .reset                  (reset),
    .io_enq_valid           (io_in_0_valid),
    .io_enq_bits_head       (io_in_0_bits_head),
    .io_enq_bits_tail       (io_in_0_bits_tail),
    .io_enq_bits_payload    (io_in_0_bits_payload),
    .io_enq_bits_ingress_id (_GEN | _GEN_0),	// @[Mux.scala:27:73]
    .io_deq_ready           (io_out_ready),
    .io_enq_ready           (_q_io_enq_ready),
    .io_deq_valid           (io_out_valid),
    .io_deq_bits_head       (io_out_bits_head),
    .io_deq_bits_tail       (io_out_bits_tail),
    .io_deq_bits_payload    (io_out_bits_payload),
    .io_count               (_q_io_count)
  );
  assign io_credit_available_0 = _q_io_count == 2'h0;	// @[EgressUnit.scala:22:17, :31:39, :40:40]
  assign io_channel_status_0_occupied = ~channel_empty;	// @[EgressUnit.scala:20:30, :41:36]
endmodule
