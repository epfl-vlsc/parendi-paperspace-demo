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

module EgressUnit_162(
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

  wire       _q_io_enq_ready;	// @[EgressUnit.scala:22:17]
  wire [1:0] _q_io_count;	// @[EgressUnit.scala:22:17]
  reg        channel_empty;	// @[EgressUnit.scala:20:30]
  wire       _q_io_enq_bits_ingress_id_T_232 = io_in_0_bits_flow_ingress_node_id == 2'h0;	// @[EgressUnit.scala:31:39, :32:27]
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
    .io_enq_bits_ingress_id
      ((io_in_0_bits_flow_ingress_node == 8'h30 & _q_io_enq_bits_ingress_id_T_232 ? 8'h90 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h48 & _q_io_enq_bits_ingress_id_T_232 ? 8'hD8 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h4C & _q_io_enq_bits_ingress_id_T_232 ? 8'hE4 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'hD & _q_io_enq_bits_ingress_id_T_232 ? 8'h27 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h37 & _q_io_enq_bits_ingress_id_T_232 ? 8'hA5 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h19 & _q_io_enq_bits_ingress_id_T_232 ? 8'h4B : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h42 & _q_io_enq_bits_ingress_id_T_232 ? 8'hC6 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h6 & _q_io_enq_bits_ingress_id_T_232 ? 8'h12 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h2 & _q_io_enq_bits_ingress_id_T_232 ? 8'h6 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h2E & _q_io_enq_bits_ingress_id_T_232 ? 8'h8A : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h4D & _q_io_enq_bits_ingress_id_T_232 ? 8'hE7 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h24 & _q_io_enq_bits_ingress_id_T_232 ? 8'h6C : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'hF & _q_io_enq_bits_ingress_id_T_232 ? 8'h2D : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h9 & _q_io_enq_bits_ingress_id_T_232 ? 8'h1B : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h16 & _q_io_enq_bits_ingress_id_T_232 ? 8'h42 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'hA & _q_io_enq_bits_ingress_id_T_232 ? 8'h1E : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h1 & _q_io_enq_bits_ingress_id_T_232 ? 8'h3 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h2C & _q_io_enq_bits_ingress_id_T_232 ? 8'h84 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h17 & _q_io_enq_bits_ingress_id_T_232 ? 8'h45 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h39 & _q_io_enq_bits_ingress_id_T_232 ? 8'hAB : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h22 & _q_io_enq_bits_ingress_id_T_232 ? 8'h66 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h1E & _q_io_enq_bits_ingress_id_T_232 ? 8'h5A : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 8'h34 & _q_io_enq_bits_ingress_id_T_232 ? 8'h9C : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h26 & _q_io_enq_bits_ingress_id_T_232 ? 8'h72 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h2A & _q_io_enq_bits_ingress_id_T_232 ? 8'h7E : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h3A & _q_io_enq_bits_ingress_id_T_232 ? 8'hAE : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h47 & _q_io_enq_bits_ingress_id_T_232 ? 8'hD5 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h36 & _q_io_enq_bits_ingress_id_T_232 ? 8'hA2 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h2F & _q_io_enq_bits_ingress_id_T_232 ? 8'h8D : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h7 & _q_io_enq_bits_ingress_id_T_232 ? 8'h15 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h44 & _q_io_enq_bits_ingress_id_T_232 ? 8'hCC : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h32 & _q_io_enq_bits_ingress_id_T_232 ? 8'h96 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h4 & _q_io_enq_bits_ingress_id_T_232 ? 8'hC : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h28 & _q_io_enq_bits_ingress_id_T_232 ? 8'h78 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h33 & _q_io_enq_bits_ingress_id_T_232 ? 8'h99 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h1B & _q_io_enq_bits_ingress_id_T_232 ? 8'h51 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h13 & _q_io_enq_bits_ingress_id_T_232 ? 8'h39 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h2D & _q_io_enq_bits_ingress_id_T_232 ? 8'h87 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'hB & _q_io_enq_bits_ingress_id_T_232 ? 8'h21 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h18 & _q_io_enq_bits_ingress_id_T_232 ? 8'h48 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h3E & _q_io_enq_bits_ingress_id_T_232 ? 8'hBA : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h5 & _q_io_enq_bits_ingress_id_T_232 ? 8'hF : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h35 & _q_io_enq_bits_ingress_id_T_232 ? 8'h9F : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h3D & _q_io_enq_bits_ingress_id_T_232 ? 8'hB7 : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 8'h8 & _q_io_enq_bits_ingress_id_T_232 ? 8'h18 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h10 & _q_io_enq_bits_ingress_id_T_232 ? 8'h30 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'hC & _q_io_enq_bits_ingress_id_T_232 ? 8'h24 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h21 & _q_io_enq_bits_ingress_id_T_232 ? 8'h63 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h23 & _q_io_enq_bits_ingress_id_T_232 ? 8'h69 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h3B & _q_io_enq_bits_ingress_id_T_232 ? 8'hB1 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h4B & _q_io_enq_bits_ingress_id_T_232 ? 8'hE1 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h3 & _q_io_enq_bits_ingress_id_T_232 ? 8'h9 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h38 & _q_io_enq_bits_ingress_id_T_232 ? 8'hA8 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h4A & _q_io_enq_bits_ingress_id_T_232 ? 8'hDE : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h31 & _q_io_enq_bits_ingress_id_T_232 ? 8'h93 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h12 & _q_io_enq_bits_ingress_id_T_232 ? 8'h36 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h20 & _q_io_enq_bits_ingress_id_T_232 ? 8'h60 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'hE & _q_io_enq_bits_ingress_id_T_232 ? 8'h2A : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h46 & _q_io_enq_bits_ingress_id_T_232 ? 8'hD2 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h41 & _q_io_enq_bits_ingress_id_T_232 ? 8'hC3 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h25 & _q_io_enq_bits_ingress_id_T_232 ? 8'h6F : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h1D & _q_io_enq_bits_ingress_id_T_232 ? 8'h57 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h49 & _q_io_enq_bits_ingress_id_T_232 ? 8'hDB : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h1F & _q_io_enq_bits_ingress_id_T_232 ? 8'h5D : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h43 & _q_io_enq_bits_ingress_id_T_232 ? 8'hC9 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h3C & _q_io_enq_bits_ingress_id_T_232 ? 8'hB4 : 8'h0)
       | (io_in_0_bits_flow_ingress_node == 8'h3F & _q_io_enq_bits_ingress_id_T_232 ? 8'hBD : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h15 & _q_io_enq_bits_ingress_id_T_232 ? 8'h3F : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h1C & _q_io_enq_bits_ingress_id_T_232 ? 8'h54 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h40 & _q_io_enq_bits_ingress_id_T_232 ? 8'hC0 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h1A & _q_io_enq_bits_ingress_id_T_232 ? 8'h4E : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h29 & _q_io_enq_bits_ingress_id_T_232 ? 8'h7B : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h27 & _q_io_enq_bits_ingress_id_T_232 ? 8'h75 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h2B & _q_io_enq_bits_ingress_id_T_232 ? 8'h81 : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h14 & _q_io_enq_bits_ingress_id_T_232 ? 8'h3C : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h45 & _q_io_enq_bits_ingress_id_T_232 ? 8'hCF : 8'h0) | (io_in_0_bits_flow_ingress_node == 8'h11 & _q_io_enq_bits_ingress_id_T_232 ? 8'h33 : 8'h0)),	// @[EgressUnit.scala:31:{39,75}, :32:27, Mux.scala:27:73]
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

