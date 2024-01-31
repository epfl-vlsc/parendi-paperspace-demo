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

module EgressUnit_236(
  input         clock,
                reset,
                io_in_0_valid,
                io_in_0_bits_head,
                io_in_0_bits_tail,
  input  [72:0] io_in_0_bits_payload,
  input  [7:0]  io_in_0_bits_flow_ingress_node,
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

  wire       _q_io_enq_ready;	// EgressUnit.scala:22:17
  wire [1:0] _q_io_count;	// EgressUnit.scala:22:17
  reg        channel_empty;	// EgressUnit.scala:20:30
  wire       _q_io_enq_bits_ingress_id_T_352 = io_in_0_bits_flow_ingress_node_id == 2'h0;	// EgressUnit.scala:31:39, :32:27
  wire [8:0] _GEN =
    (io_in_0_bits_flow_ingress_node == 8'h26 & _q_io_enq_bits_ingress_id_T_352
       ? 9'h72
       : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h9 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h1B
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h6C & _q_io_enq_bits_ingress_id_T_352
         ? 9'h144
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h69 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h13B
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h19 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h4B
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h6 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h12
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h2F & _q_io_enq_bits_ingress_id_T_352
         ? 9'h8D
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h45 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hCF
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h42 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hC6
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h44 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hCC
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h6B & _q_io_enq_bits_ingress_id_T_352
         ? 9'h141
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h31 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h93
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h39 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hAB
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h17 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h45
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h5F & _q_io_enq_bits_ingress_id_T_352
         ? 9'h11D
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h8 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h18
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'hA & _q_io_enq_bits_ingress_id_T_352
         ? 9'h1E
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h14 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h3C
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h71 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h153
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h25 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h6F
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h67 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h135
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h36 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hA2
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h72 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h156
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h52 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hF6
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h4F & _q_io_enq_bits_ingress_id_T_352
         ? 9'hED
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h3E & _q_io_enq_bits_ingress_id_T_352
         ? 9'hBA
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h10 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h30
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h64 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h12C
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h50 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hF0
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h1C & _q_io_enq_bits_ingress_id_T_352
         ? 9'h54
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h6E & _q_io_enq_bits_ingress_id_T_352
         ? 9'h14A
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h1A & _q_io_enq_bits_ingress_id_T_352
         ? 9'h4E
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h2D & _q_io_enq_bits_ingress_id_T_352
         ? 9'h87
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h4C & _q_io_enq_bits_ingress_id_T_352
         ? 9'hE4
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h28 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h78
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h57 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h105
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h16 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h42
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'hB & _q_io_enq_bits_ingress_id_T_352
         ? 9'h21
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h4B & _q_io_enq_bits_ingress_id_T_352
         ? 9'hE1
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h61 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h123
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h5C & _q_io_enq_bits_ingress_id_T_352
         ? 9'h114
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h75 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h15F
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h2C & _q_io_enq_bits_ingress_id_T_352
         ? 9'h84
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h56 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h102
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h4 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hC
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'hE & _q_io_enq_bits_ingress_id_T_352
         ? 9'h2A
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h74 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h15C
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h5B & _q_io_enq_bits_ingress_id_T_352
         ? 9'h111
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h47 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hD5
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h21 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h63
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'hF & _q_io_enq_bits_ingress_id_T_352
         ? 9'h2D
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h6A & _q_io_enq_bits_ingress_id_T_352
         ? 9'h13E
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h43 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hC9
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h46 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hD2
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h1B & _q_io_enq_bits_ingress_id_T_352
         ? 9'h51
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h3F & _q_io_enq_bits_ingress_id_T_352
         ? 9'hBD
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h70 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h150
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h60 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h120
         : 9'h0);	// EgressUnit.scala:31:{39,75}, :32:27, Mux.scala:27:73
  wire [8:0] _GEN_0 =
    (io_in_0_bits_flow_ingress_node == 8'h5 & _q_io_enq_bits_ingress_id_T_352
       ? 9'hF
       : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h2 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h6
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h32 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h96
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h13 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h39
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h49 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hDB
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h66 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h132
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h29 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h7B
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h73 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h159
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h41 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hC3
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h62 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h126
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h38 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hA8
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h63 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h129
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h58 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h108
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h6D & _q_io_enq_bits_ingress_id_T_352
         ? 9'h147
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h68 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h138
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h27 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h75
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h5E & _q_io_enq_bits_ingress_id_T_352
         ? 9'h11A
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h2A & _q_io_enq_bits_ingress_id_T_352
         ? 9'h7E
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h2B & _q_io_enq_bits_ingress_id_T_352
         ? 9'h81
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h20 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h60
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h35 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h9F
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h5D & _q_io_enq_bits_ingress_id_T_352
         ? 9'h117
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h18 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h48
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h1E & _q_io_enq_bits_ingress_id_T_352
         ? 9'h5A
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h33 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h99
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h4A & _q_io_enq_bits_ingress_id_T_352
         ? 9'hDE
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'hC & _q_io_enq_bits_ingress_id_T_352
         ? 9'h24
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'hD & _q_io_enq_bits_ingress_id_T_352
         ? 9'h27
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h53 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hF9
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h55 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hFF
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h11 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h33
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h51 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hF3
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h3A & _q_io_enq_bits_ingress_id_T_352
         ? 9'hAE
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h6F & _q_io_enq_bits_ingress_id_T_352
         ? 9'h14D
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h59 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h10B
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h22 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h66
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h2E & _q_io_enq_bits_ingress_id_T_352
         ? 9'h8A
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h1D & _q_io_enq_bits_ingress_id_T_352
         ? 9'h57
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h3D & _q_io_enq_bits_ingress_id_T_352
         ? 9'hB7
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h5A & _q_io_enq_bits_ingress_id_T_352
         ? 9'h10E
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h1F & _q_io_enq_bits_ingress_id_T_352
         ? 9'h5D
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h3C & _q_io_enq_bits_ingress_id_T_352
         ? 9'hB4
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h23 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h69
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h15 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h3F
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h30 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h90
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h54 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hFC
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h24 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h6C
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h48 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hD8
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h4D & _q_io_enq_bits_ingress_id_T_352
         ? 9'hE7
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h34 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h9C
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h1 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h3
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h3 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h9
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h37 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hA5
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h4E & _q_io_enq_bits_ingress_id_T_352
         ? 9'hEA
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h40 & _q_io_enq_bits_ingress_id_T_352
         ? 9'hC0
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h3B & _q_io_enq_bits_ingress_id_T_352
         ? 9'hB1
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h65 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h12F
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h12 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h36
         : 9'h0)
    | (io_in_0_bits_flow_ingress_node == 8'h7 & _q_io_enq_bits_ingress_id_T_352
         ? 9'h15
         : 9'h0);	// EgressUnit.scala:31:{39,75}, :32:27, Mux.scala:27:73
  always @(posedge clock) begin
    if (reset)
      channel_empty <= 1'h1;	// EgressUnit.scala:20:30
    else
      channel_empty <=
        ~io_allocs_0_alloc
        & (io_credit_alloc_0_alloc & io_credit_alloc_0_tail | channel_empty);	// EgressUnit.scala:20:30, :44:{34,62}, :45:19, :49:29, :50:19
  end // always @(posedge)
  `ifndef SYNTHESIS
    always @(posedge clock) begin	// EgressUnit.scala:38:9
      if (~reset & io_in_0_valid & ~_q_io_enq_ready) begin	// EgressUnit.scala:22:17, :38:{9,30}
        if (`ASSERT_VERBOSE_COND_)	// EgressUnit.scala:38:9
          $error("Assertion failed\n    at EgressUnit.scala:38 assert(!(q.io.enq.valid && !q.io.enq.ready))\n");	// EgressUnit.scala:38:9
        if (`STOP_COND_)	// EgressUnit.scala:38:9
          $fatal;	// EgressUnit.scala:38:9
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
        channel_empty = _RANDOM_0[0];	// EgressUnit.scala:20:30
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  Queue_17 q (	// EgressUnit.scala:22:17
    .clock                  (clock),
    .reset                  (reset),
    .io_enq_valid           (io_in_0_valid),
    .io_enq_bits_head       (io_in_0_bits_head),
    .io_enq_bits_tail       (io_in_0_bits_tail),
    .io_enq_bits_payload    (io_in_0_bits_payload),
    .io_enq_bits_ingress_id (_GEN | _GEN_0),	// Mux.scala:27:73
    .io_deq_ready           (io_out_ready),
    .io_enq_ready           (_q_io_enq_ready),
    .io_deq_valid           (io_out_valid),
    .io_deq_bits_head       (io_out_bits_head),
    .io_deq_bits_tail       (io_out_bits_tail),
    .io_deq_bits_payload    (io_out_bits_payload),
    .io_count               (_q_io_count)
  );
  assign io_credit_available_0 = _q_io_count == 2'h0;	// EgressUnit.scala:22:17, :31:39, :40:40
  assign io_channel_status_0_occupied = ~channel_empty;	// EgressUnit.scala:20:30, :41:36
endmodule

