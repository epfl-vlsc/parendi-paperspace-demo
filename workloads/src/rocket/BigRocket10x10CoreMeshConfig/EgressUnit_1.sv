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

module EgressUnit_1(
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
  wire       _q_io_enq_bits_ingress_id_T_7 = io_in_0_bits_flow_ingress_node_id == 2'h1;	// @[EgressUnit.scala:32:27]
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
    .io_enq_bits_ingress_id ((io_in_0_bits_flow_ingress_node == 8'h61 & _q_io_enq_bits_ingress_id_T_7 ? 9'h124 : 9'h0) | (io_in_0_bits_flow_ingress_node == 8'h63 & _q_io_enq_bits_ingress_id_T_7 ? 9'h126 : 9'h0) | (io_in_0_bits_flow_ingress_node == 8'h62 & _q_io_enq_bits_ingress_id_T_7 ? 9'h128 : 9'h0)),	// @[EgressUnit.scala:31:{39,75}, :32:27, Mux.scala:27:73]
    .io_deq_ready           (io_out_ready),
    .io_enq_ready           (_q_io_enq_ready),
    .io_deq_valid           (io_out_valid),
    .io_deq_bits_head       (io_out_bits_head),
    .io_deq_bits_tail       (io_out_bits_tail),
    .io_deq_bits_payload    (io_out_bits_payload),
    .io_count               (_q_io_count)
  );
  assign io_credit_available_0 = _q_io_count == 2'h0;	// @[EgressUnit.scala:22:17, :40:40]
  assign io_channel_status_0_occupied = ~channel_empty;	// @[EgressUnit.scala:20:30, :41:36]
endmodule

