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

module EgressUnit_130(
  input         clock,
                reset,
                io_in_0_valid,
                io_in_0_bits_head,
                io_in_0_bits_tail,
  input  [72:0] io_in_0_bits_payload,
  input  [6:0]  io_in_0_bits_flow_ingress_node,
  input  [1:0]  io_in_0_bits_flow_ingress_node_id,
  input         io_allocs_0_alloc,
                io_credit_alloc_0_alloc,
                io_credit_alloc_0_tail,
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
  wire       _q_io_enq_bits_ingress_id_T_181 = io_in_0_bits_flow_ingress_node_id == 2'h2;	// EgressUnit.scala:32:27
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
    .io_enq_bits_ingress_id
      ((io_in_0_bits_flow_ingress_node == 7'h34 & _q_io_enq_bits_ingress_id_T_181
          ? 8'h9E
          : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h3B & _q_io_enq_bits_ingress_id_T_181
            ? 8'hB3
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h1E & _q_io_enq_bits_ingress_id_T_181
            ? 8'h5C
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h33 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h9B
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h3 & _q_io_enq_bits_ingress_id_T_181
            ? 8'hB
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h20 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h62
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h5 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h11
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h2F & _q_io_enq_bits_ingress_id_T_181
            ? 8'h8F
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h23 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h6B
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h30 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h92
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'hF & _q_io_enq_bits_ingress_id_T_181
            ? 8'h2F
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h28 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h7A
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h36 & _q_io_enq_bits_ingress_id_T_181
            ? 8'hA4
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'hD & _q_io_enq_bits_ingress_id_T_181
            ? 8'h29
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h21 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h65
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h18 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h4A
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h38 & _q_io_enq_bits_ingress_id_T_181
            ? 8'hAA
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h16 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h44
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h37 & _q_io_enq_bits_ingress_id_T_181
            ? 8'hA7
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h1F & _q_io_enq_bits_ingress_id_T_181
            ? 8'h5F
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h13 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h3B
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h29 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h7D
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h8 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h1A
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h3C & _q_io_enq_bits_ingress_id_T_181
            ? 8'hB6
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h25 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h71
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h1 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h5
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h32 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h98
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h35 & _q_io_enq_bits_ingress_id_T_181
            ? 8'hA1
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h6 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h14
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h2E & _q_io_enq_bits_ingress_id_T_181
            ? 8'h8C
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h27 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h77
            : 8'h0)
       | {io_in_0_bits_flow_ingress_node == 7'h2A & _q_io_enq_bits_ingress_id_T_181,
          1'h0,
          io_in_0_bits_flow_ingress_node == 7'hA & _q_io_enq_bits_ingress_id_T_181,
          1'h0,
          io_in_0_bits_flow_ingress_node == 7'h2 & _q_io_enq_bits_ingress_id_T_181,
          1'h0,
          io_in_0_bits_flow_ingress_node == 7'h0 & _q_io_enq_bits_ingress_id_T_181,
          1'h0}
       | (io_in_0_bits_flow_ingress_node == 7'h2D & _q_io_enq_bits_ingress_id_T_181
            ? 8'h89
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h12 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h38
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h4 & _q_io_enq_bits_ingress_id_T_181
            ? 8'hE
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'hB & _q_io_enq_bits_ingress_id_T_181
            ? 8'h23
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h2B & _q_io_enq_bits_ingress_id_T_181
            ? 8'h83
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h39 & _q_io_enq_bits_ingress_id_T_181
            ? 8'hAD
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h17 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h47
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h14 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h3E
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h1B & _q_io_enq_bits_ingress_id_T_181
            ? 8'h53
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h1C & _q_io_enq_bits_ingress_id_T_181
            ? 8'h56
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h22 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h68
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h10 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h32
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h31 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h95
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h26 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h74
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h19 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h4D
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'hE & _q_io_enq_bits_ingress_id_T_181
            ? 8'h2C
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h1D & _q_io_enq_bits_ingress_id_T_181
            ? 8'h59
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'hC & _q_io_enq_bits_ingress_id_T_181
            ? 8'h26
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h11 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h35
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h3A & _q_io_enq_bits_ingress_id_T_181
            ? 8'hB0
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h1A & _q_io_enq_bits_ingress_id_T_181
            ? 8'h50
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h9 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h1D
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h7 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h17
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h24 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h6E
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h2C & _q_io_enq_bits_ingress_id_T_181
            ? 8'h86
            : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 7'h15 & _q_io_enq_bits_ingress_id_T_181
            ? 8'h41
            : 8'h0)),	// EgressUnit.scala:21:17, :31:{39,75}, :32:27, Mux.scala:27:73
    .io_deq_ready           (1'h1),
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

