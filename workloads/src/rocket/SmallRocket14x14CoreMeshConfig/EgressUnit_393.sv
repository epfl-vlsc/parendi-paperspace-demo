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

module EgressUnit_393(
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
  wire       _q_io_enq_bits_ingress_id_T_577 = io_in_0_bits_flow_ingress_node_id == 2'h1;	// @[EgressUnit.scala:32:27]
  wire [9:0] _GEN =
    (io_in_0_bits_flow_ingress_node == 9'h69 & _q_io_enq_bits_ingress_id_T_577 ? 10'h13C : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h85 & _q_io_enq_bits_ingress_id_T_577 ? 10'h190 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h2F & _q_io_enq_bits_ingress_id_T_577 ? 10'h8E : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h42 & _q_io_enq_bits_ingress_id_T_577 ? 10'hC7 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h52 & _q_io_enq_bits_ingress_id_T_577 ? 10'hF7 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h54 & _q_io_enq_bits_ingress_id_T_577 ? 10'hFD : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hA2 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1E7 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h34 & _q_io_enq_bits_ingress_id_T_577 ? 10'h9D : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h83 & _q_io_enq_bits_ingress_id_T_577 ? 10'h18A : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h58 & _q_io_enq_bits_ingress_id_T_577 ? 10'h109 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hA & _q_io_enq_bits_ingress_id_T_577 ? 10'h1F : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h2E & _q_io_enq_bits_ingress_id_T_577 ? 10'h8B : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h63 & _q_io_enq_bits_ingress_id_T_577 ? 10'h12A : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h92 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1B7 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h41 & _q_io_enq_bits_ingress_id_T_577 ? 10'hC4 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h3A & _q_io_enq_bits_ingress_id_T_577 ? 10'hAF : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hBD & _q_io_enq_bits_ingress_id_T_577 ? 10'h238 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h5D & _q_io_enq_bits_ingress_id_T_577 ? 10'h118 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h95 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1C0 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h40 & _q_io_enq_bits_ingress_id_T_577 ? 10'hC1 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hF & _q_io_enq_bits_ingress_id_T_577 ? 10'h2E : 10'h0)
    | (io_in_0_bits_flow_ingress_node == 9'h5F & _q_io_enq_bits_ingress_id_T_577 ? 10'h11E : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h8 & _q_io_enq_bits_ingress_id_T_577 ? 10'h19 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hBF & _q_io_enq_bits_ingress_id_T_577 ? 10'h23E : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h3B & _q_io_enq_bits_ingress_id_T_577 ? 10'hB2 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hB7 & _q_io_enq_bits_ingress_id_T_577 ? 10'h226 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h75 & _q_io_enq_bits_ingress_id_T_577 ? 10'h160 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h19 & _q_io_enq_bits_ingress_id_T_577 ? 10'h4C : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h33 & _q_io_enq_bits_ingress_id_T_577 ? 10'h9A : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h4B & _q_io_enq_bits_ingress_id_T_577 ? 10'hE2 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h5A & _q_io_enq_bits_ingress_id_T_577 ? 10'h10F : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hA3 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1EA : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h7F & _q_io_enq_bits_ingress_id_T_577 ? 10'h17E : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h9D & _q_io_enq_bits_ingress_id_T_577 ? 10'h1D8 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h29 & _q_io_enq_bits_ingress_id_T_577 ? 10'h7C : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h8C & _q_io_enq_bits_ingress_id_T_577 ? 10'h1A5 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h73 & _q_io_enq_bits_ingress_id_T_577 ? 10'h15A : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h72 & _q_io_enq_bits_ingress_id_T_577 ? 10'h157 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h96 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1C3 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h1F & _q_io_enq_bits_ingress_id_T_577 ? 10'h5E : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h17 & _q_io_enq_bits_ingress_id_T_577 ? 10'h46 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h80 & _q_io_enq_bits_ingress_id_T_577 ? 10'h181 : 10'h0)
    | (io_in_0_bits_flow_ingress_node == 9'h9E & _q_io_enq_bits_ingress_id_T_577 ? 10'h1DB : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h26 & _q_io_enq_bits_ingress_id_T_577 ? 10'h73 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h18 & _q_io_enq_bits_ingress_id_T_577 ? 10'h49 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hA4 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1ED : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h7D & _q_io_enq_bits_ingress_id_T_577 ? 10'h178 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hAA & _q_io_enq_bits_ingress_id_T_577 ? 10'h1FF : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hAF & _q_io_enq_bits_ingress_id_T_577 ? 10'h20E : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h60 & _q_io_enq_bits_ingress_id_T_577 ? 10'h121 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hA1 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1E4 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h48 & _q_io_enq_bits_ingress_id_T_577 ? 10'hD9 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h8F & _q_io_enq_bits_ingress_id_T_577 ? 10'h1AE : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h1A & _q_io_enq_bits_ingress_id_T_577 ? 10'h4F : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hBC & _q_io_enq_bits_ingress_id_T_577 ? 10'h235 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h86 & _q_io_enq_bits_ingress_id_T_577 ? 10'h193 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h4A & _q_io_enq_bits_ingress_id_T_577 ? 10'hDF : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h91 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1B4 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h90 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1B1 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h71 & _q_io_enq_bits_ingress_id_T_577 ? 10'h154 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h32 & _q_io_enq_bits_ingress_id_T_577 ? 10'h97 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h78 & _q_io_enq_bits_ingress_id_T_577 ? 10'h169 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h1B & _q_io_enq_bits_ingress_id_T_577 ? 10'h52 : 10'h0)
    | (io_in_0_bits_flow_ingress_node == 9'hAD & _q_io_enq_bits_ingress_id_T_577 ? 10'h208 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hB6 & _q_io_enq_bits_ingress_id_T_577 ? 10'h223 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h51 & _q_io_enq_bits_ingress_id_T_577 ? 10'hF4 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hB5 & _q_io_enq_bits_ingress_id_T_577 ? 10'h220 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h4D & _q_io_enq_bits_ingress_id_T_577 ? 10'hE8 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h66 & _q_io_enq_bits_ingress_id_T_577 ? 10'h133 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h44 & _q_io_enq_bits_ingress_id_T_577 ? 10'hCD : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h74 & _q_io_enq_bits_ingress_id_T_577 ? 10'h15D : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hD & _q_io_enq_bits_ingress_id_T_577 ? 10'h28 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h8A & _q_io_enq_bits_ingress_id_T_577 ? 10'h19F : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h37 & _q_io_enq_bits_ingress_id_T_577 ? 10'hA6 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h14 & _q_io_enq_bits_ingress_id_T_577 ? 10'h3D : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h45 & _q_io_enq_bits_ingress_id_T_577 ? 10'hD0 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hB3 & _q_io_enq_bits_ingress_id_T_577 ? 10'h21A : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h16 & _q_io_enq_bits_ingress_id_T_577 ? 10'h43 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h4C & _q_io_enq_bits_ingress_id_T_577 ? 10'hE5 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h6F & _q_io_enq_bits_ingress_id_T_577 ? 10'h14E : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hBA & _q_io_enq_bits_ingress_id_T_577 ? 10'h22F : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h49 & _q_io_enq_bits_ingress_id_T_577 ? 10'hDC : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h8B & _q_io_enq_bits_ingress_id_T_577 ? 10'h1A2 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h7A & _q_io_enq_bits_ingress_id_T_577 ? 10'h16F : 10'h0)
    | (io_in_0_bits_flow_ingress_node == 9'h36 & _q_io_enq_bits_ingress_id_T_577 ? 10'hA3 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hAE & _q_io_enq_bits_ingress_id_T_577 ? 10'h20B : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hA5 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1F0 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h64 & _q_io_enq_bits_ingress_id_T_577 ? 10'h12D : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hB2 & _q_io_enq_bits_ingress_id_T_577 ? 10'h217 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h21 & _q_io_enq_bits_ingress_id_T_577 ? 10'h64 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hBE & _q_io_enq_bits_ingress_id_T_577 ? 10'h23B : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h53 & _q_io_enq_bits_ingress_id_T_577 ? 10'hFA : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h11 & _q_io_enq_bits_ingress_id_T_577 ? 10'h34 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h6A & _q_io_enq_bits_ingress_id_T_577 ? 10'h13F : 10'h0);	// @[EgressUnit.scala:31:{39,75}, :32:27, Mux.scala:27:73]
  wire [9:0] _GEN_0 =
    (io_in_0_bits_flow_ingress_node == 9'h5E & _q_io_enq_bits_ingress_id_T_577 ? 10'h11B : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h62 & _q_io_enq_bits_ingress_id_T_577 ? 10'h127 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h88 & _q_io_enq_bits_ingress_id_T_577 ? 10'h199 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h9 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1C : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hB9 & _q_io_enq_bits_ingress_id_T_577 ? 10'h22C : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h4E & _q_io_enq_bits_ingress_id_T_577 ? 10'hEB : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h3E & _q_io_enq_bits_ingress_id_T_577 ? 10'hBB : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h31 & _q_io_enq_bits_ingress_id_T_577 ? 10'h94 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h27 & _q_io_enq_bits_ingress_id_T_577 ? 10'h76 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h77 & _q_io_enq_bits_ingress_id_T_577 ? 10'h166 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h2C & _q_io_enq_bits_ingress_id_T_577 ? 10'h85 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hE & _q_io_enq_bits_ingress_id_T_577 ? 10'h2B : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h68 & _q_io_enq_bits_ingress_id_T_577 ? 10'h139 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h7 & _q_io_enq_bits_ingress_id_T_577 ? 10'h16 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hBB & _q_io_enq_bits_ingress_id_T_577 ? 10'h232 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hAC & _q_io_enq_bits_ingress_id_T_577 ? 10'h205 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h7C & _q_io_enq_bits_ingress_id_T_577 ? 10'h175 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h57 & _q_io_enq_bits_ingress_id_T_577 ? 10'h106 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h87 & _q_io_enq_bits_ingress_id_T_577 ? 10'h196 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h3F & _q_io_enq_bits_ingress_id_T_577 ? 10'hBE : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h8D & _q_io_enq_bits_ingress_id_T_577 ? 10'h1A8 : 10'h0)
    | (io_in_0_bits_flow_ingress_node == 9'h7E & _q_io_enq_bits_ingress_id_T_577 ? 10'h17B : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hA8 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1F9 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hB0 & _q_io_enq_bits_ingress_id_T_577 ? 10'h211 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hA6 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1F3 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h23 & _q_io_enq_bits_ingress_id_T_577 ? 10'h6A : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h4F & _q_io_enq_bits_ingress_id_T_577 ? 10'hEE : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h79 & _q_io_enq_bits_ingress_id_T_577 ? 10'h16C : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h65 & _q_io_enq_bits_ingress_id_T_577 ? 10'h130 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h2D & _q_io_enq_bits_ingress_id_T_577 ? 10'h88 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hB8 & _q_io_enq_bits_ingress_id_T_577 ? 10'h229 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h6C & _q_io_enq_bits_ingress_id_T_577 ? 10'h145 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h7B & _q_io_enq_bits_ingress_id_T_577 ? 10'h172 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h9F & _q_io_enq_bits_ingress_id_T_577 ? 10'h1DE : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h39 & _q_io_enq_bits_ingress_id_T_577 ? 10'hAC : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hB4 & _q_io_enq_bits_ingress_id_T_577 ? 10'h21D : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h9B & _q_io_enq_bits_ingress_id_T_577 ? 10'h1D2 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hB & _q_io_enq_bits_ingress_id_T_577 ? 10'h22 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h6 & _q_io_enq_bits_ingress_id_T_577 ? 10'h13 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hA0 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1E1 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h13 & _q_io_enq_bits_ingress_id_T_577 ? 10'h3A : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h84 & _q_io_enq_bits_ingress_id_T_577 ? 10'h18D : 10'h0)
    | (io_in_0_bits_flow_ingress_node == 9'h2A & _q_io_enq_bits_ingress_id_T_577 ? 10'h7F : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h89 & _q_io_enq_bits_ingress_id_T_577 ? 10'h19C : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hA7 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1F6 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h81 & _q_io_enq_bits_ingress_id_T_577 ? 10'h184 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hB1 & _q_io_enq_bits_ingress_id_T_577 ? 10'h214 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h67 & _q_io_enq_bits_ingress_id_T_577 ? 10'h136 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h3D & _q_io_enq_bits_ingress_id_T_577 ? 10'hB8 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h3C & _q_io_enq_bits_ingress_id_T_577 ? 10'hB5 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h98 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1C9 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h5C & _q_io_enq_bits_ingress_id_T_577 ? 10'h115 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h3 & _q_io_enq_bits_ingress_id_T_577 ? 10'hA : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h56 & _q_io_enq_bits_ingress_id_T_577 ? 10'h103 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h46 & _q_io_enq_bits_ingress_id_T_577 ? 10'hD3 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h76 & _q_io_enq_bits_ingress_id_T_577 ? 10'h163 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h22 & _q_io_enq_bits_ingress_id_T_577 ? 10'h67 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h61 & _q_io_enq_bits_ingress_id_T_577 ? 10'h124 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h94 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1BD : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h99 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1CC : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h35 & _q_io_enq_bits_ingress_id_T_577 ? 10'hA0 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h28 & _q_io_enq_bits_ingress_id_T_577 ? 10'h79 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h9C & _q_io_enq_bits_ingress_id_T_577 ? 10'h1D5 : 10'h0)
    | (io_in_0_bits_flow_ingress_node == 9'h2 & _q_io_enq_bits_ingress_id_T_577 ? 10'h7 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h24 & _q_io_enq_bits_ingress_id_T_577 ? 10'h6D : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hAB & _q_io_enq_bits_ingress_id_T_577 ? 10'h202 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h82 & _q_io_enq_bits_ingress_id_T_577 ? 10'h187 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h97 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1C6 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h50 & _q_io_enq_bits_ingress_id_T_577 ? 10'hF1 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hC & _q_io_enq_bits_ingress_id_T_577 ? 10'h25 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h6D & _q_io_enq_bits_ingress_id_T_577 ? 10'h148 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h6E & _q_io_enq_bits_ingress_id_T_577 ? 10'h14B : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h9A & _q_io_enq_bits_ingress_id_T_577 ? 10'h1CF : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h6B & _q_io_enq_bits_ingress_id_T_577 ? 10'h142 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h1D & _q_io_enq_bits_ingress_id_T_577 ? 10'h58 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h8E & _q_io_enq_bits_ingress_id_T_577 ? 10'h1AB : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h10 & _q_io_enq_bits_ingress_id_T_577 ? 10'h31 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h4 & _q_io_enq_bits_ingress_id_T_577 ? 10'hD : 10'h0) | {1'h0, io_in_0_bits_flow_ingress_node == 9'h55 & _q_io_enq_bits_ingress_id_T_577, 1'h0, io_in_0_bits_flow_ingress_node == 9'h15 & _q_io_enq_bits_ingress_id_T_577, 1'h0, io_in_0_bits_flow_ingress_node == 9'h5 & _q_io_enq_bits_ingress_id_T_577, 1'h0, io_in_0_bits_flow_ingress_node == 9'h1 & _q_io_enq_bits_ingress_id_T_577, 1'h0, io_in_0_bits_flow_ingress_node == 9'h0 & _q_io_enq_bits_ingress_id_T_577} | (io_in_0_bits_flow_ingress_node == 9'h25 & _q_io_enq_bits_ingress_id_T_577 ? 10'h70 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h47 & _q_io_enq_bits_ingress_id_T_577 ? 10'hD6 : 10'h0)
    | (io_in_0_bits_flow_ingress_node == 9'h43 & _q_io_enq_bits_ingress_id_T_577 ? 10'hCA : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h2B & _q_io_enq_bits_ingress_id_T_577 ? 10'h82 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hC0 & _q_io_enq_bits_ingress_id_T_577 ? 10'h241 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h12 & _q_io_enq_bits_ingress_id_T_577 ? 10'h37 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h59 & _q_io_enq_bits_ingress_id_T_577 ? 10'h10C : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h93 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1BA : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h1C & _q_io_enq_bits_ingress_id_T_577 ? 10'h55 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h20 & _q_io_enq_bits_ingress_id_T_577 ? 10'h61 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h70 & _q_io_enq_bits_ingress_id_T_577 ? 10'h151 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h5B & _q_io_enq_bits_ingress_id_T_577 ? 10'h112 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h1E & _q_io_enq_bits_ingress_id_T_577 ? 10'h5B : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'hA9 & _q_io_enq_bits_ingress_id_T_577 ? 10'h1FC : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h30 & _q_io_enq_bits_ingress_id_T_577 ? 10'h91 : 10'h0) | (io_in_0_bits_flow_ingress_node == 9'h38 & _q_io_enq_bits_ingress_id_T_577 ? 10'hA9 : 10'h0);	// @[EgressUnit.scala:21:17, :31:{39,75}, :32:27, Mux.scala:27:73]
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
