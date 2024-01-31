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

module RotatingSingleVCAllocator_108(
  input  clock,
         reset,
         io_req_3_valid,
         io_req_3_bits_vc_sel_2_1,
         io_req_3_bits_vc_sel_2_2,
         io_req_3_bits_vc_sel_2_3,
         io_req_3_bits_vc_sel_2_4,
         io_req_3_bits_vc_sel_1_1,
         io_req_3_bits_vc_sel_1_2,
         io_req_3_bits_vc_sel_1_3,
         io_req_3_bits_vc_sel_1_4,
         io_req_3_bits_vc_sel_0_1,
         io_req_3_bits_vc_sel_0_2,
         io_req_3_bits_vc_sel_0_3,
         io_req_3_bits_vc_sel_0_4,
         io_req_2_valid,
         io_req_2_bits_vc_sel_3_0,
         io_req_2_bits_vc_sel_3_1,
         io_req_2_bits_vc_sel_3_2,
         io_req_2_bits_vc_sel_3_3,
         io_req_2_bits_vc_sel_3_4,
         io_req_2_bits_vc_sel_1_1,
         io_req_2_bits_vc_sel_1_2,
         io_req_2_bits_vc_sel_1_3,
         io_req_2_bits_vc_sel_1_4,
         io_req_2_bits_vc_sel_0_4,
         io_req_1_valid,
         io_req_1_bits_vc_sel_3_0,
         io_req_1_bits_vc_sel_3_1,
         io_req_1_bits_vc_sel_3_2,
         io_req_1_bits_vc_sel_3_3,
         io_req_1_bits_vc_sel_3_4,
         io_req_1_bits_vc_sel_2_0,
         io_req_1_bits_vc_sel_2_1,
         io_req_1_bits_vc_sel_2_2,
         io_req_1_bits_vc_sel_2_3,
         io_req_1_bits_vc_sel_2_4,
         io_req_1_bits_vc_sel_0_4,
         io_req_0_valid,
         io_req_0_bits_vc_sel_3_0,
         io_req_0_bits_vc_sel_3_1,
         io_req_0_bits_vc_sel_3_2,
         io_req_0_bits_vc_sel_3_3,
         io_req_0_bits_vc_sel_3_4,
         io_req_0_bits_vc_sel_2_0,
         io_req_0_bits_vc_sel_2_1,
         io_req_0_bits_vc_sel_2_2,
         io_req_0_bits_vc_sel_2_3,
         io_req_0_bits_vc_sel_2_4,
         io_req_0_bits_vc_sel_1_1,
         io_req_0_bits_vc_sel_1_2,
         io_req_0_bits_vc_sel_1_3,
         io_req_0_bits_vc_sel_1_4,
         io_channel_status_3_0_occupied,
         io_channel_status_3_1_occupied,
         io_channel_status_3_2_occupied,
         io_channel_status_3_3_occupied,
         io_channel_status_3_4_occupied,
         io_channel_status_2_0_occupied,
         io_channel_status_2_1_occupied,
         io_channel_status_2_2_occupied,
         io_channel_status_2_3_occupied,
         io_channel_status_2_4_occupied,
         io_channel_status_1_1_occupied,
         io_channel_status_1_2_occupied,
         io_channel_status_1_3_occupied,
         io_channel_status_1_4_occupied,
         io_channel_status_0_1_occupied,
         io_channel_status_0_2_occupied,
         io_channel_status_0_3_occupied,
         io_channel_status_0_4_occupied,
  output io_req_3_ready,
         io_req_2_ready,
         io_req_1_ready,
         io_req_0_ready,
         io_resp_3_vc_sel_2_1,
         io_resp_3_vc_sel_2_2,
         io_resp_3_vc_sel_2_3,
         io_resp_3_vc_sel_2_4,
         io_resp_3_vc_sel_1_1,
         io_resp_3_vc_sel_1_2,
         io_resp_3_vc_sel_1_3,
         io_resp_3_vc_sel_1_4,
         io_resp_3_vc_sel_0_1,
         io_resp_3_vc_sel_0_2,
         io_resp_3_vc_sel_0_3,
         io_resp_3_vc_sel_0_4,
         io_resp_2_vc_sel_3_0,
         io_resp_2_vc_sel_3_1,
         io_resp_2_vc_sel_3_2,
         io_resp_2_vc_sel_3_3,
         io_resp_2_vc_sel_3_4,
         io_resp_2_vc_sel_1_1,
         io_resp_2_vc_sel_1_2,
         io_resp_2_vc_sel_1_3,
         io_resp_2_vc_sel_1_4,
         io_resp_2_vc_sel_0_4,
         io_resp_1_vc_sel_3_0,
         io_resp_1_vc_sel_3_1,
         io_resp_1_vc_sel_3_2,
         io_resp_1_vc_sel_3_3,
         io_resp_1_vc_sel_3_4,
         io_resp_1_vc_sel_2_0,
         io_resp_1_vc_sel_2_1,
         io_resp_1_vc_sel_2_2,
         io_resp_1_vc_sel_2_3,
         io_resp_1_vc_sel_2_4,
         io_resp_1_vc_sel_0_4,
         io_resp_0_vc_sel_3_0,
         io_resp_0_vc_sel_3_1,
         io_resp_0_vc_sel_3_2,
         io_resp_0_vc_sel_3_3,
         io_resp_0_vc_sel_3_4,
         io_resp_0_vc_sel_2_0,
         io_resp_0_vc_sel_2_1,
         io_resp_0_vc_sel_2_2,
         io_resp_0_vc_sel_2_3,
         io_resp_0_vc_sel_2_4,
         io_resp_0_vc_sel_1_1,
         io_resp_0_vc_sel_1_2,
         io_resp_0_vc_sel_1_3,
         io_resp_0_vc_sel_1_4,
         io_out_allocs_3_0_alloc,
         io_out_allocs_3_1_alloc,
         io_out_allocs_3_2_alloc,
         io_out_allocs_3_3_alloc,
         io_out_allocs_3_4_alloc,
         io_out_allocs_2_0_alloc,
         io_out_allocs_2_1_alloc,
         io_out_allocs_2_2_alloc,
         io_out_allocs_2_3_alloc,
         io_out_allocs_2_4_alloc,
         io_out_allocs_1_1_alloc,
         io_out_allocs_1_2_alloc,
         io_out_allocs_1_3_alloc,
         io_out_allocs_1_4_alloc,
         io_out_allocs_0_1_alloc,
         io_out_allocs_0_2_alloc,
         io_out_allocs_0_3_alloc,
         io_out_allocs_0_4_alloc
);

  wire        in_arb_vals_3;	// @[SingleVCAllocator.scala:32:39]
  wire        in_arb_vals_2;	// @[SingleVCAllocator.scala:32:39]
  wire        in_arb_vals_1;	// @[SingleVCAllocator.scala:32:39]
  wire        in_arb_vals_0;	// @[SingleVCAllocator.scala:32:39]
  reg  [3:0]  mask;	// @[SingleVCAllocator.scala:16:21]
  wire [3:0]  _in_arb_filter_T_3 = {in_arb_vals_3, in_arb_vals_2, in_arb_vals_1, in_arb_vals_0} & ~mask;	// @[SingleVCAllocator.scala:16:21, :19:{77,84,86}, :32:39]
  wire [7:0]  in_arb_filter = _in_arb_filter_T_3[0] ? 8'h1 : _in_arb_filter_T_3[1] ? 8'h2 : _in_arb_filter_T_3[2] ? 8'h4 : _in_arb_filter_T_3[3] ? 8'h8 : in_arb_vals_0 ? 8'h10 : in_arb_vals_1 ? 8'h20 : in_arb_vals_2 ? 8'h40 : {in_arb_vals_3, 7'h0};	// @[Mux.scala:47:70, OneHot.scala:84:71, SingleVCAllocator.scala:19:84, :32:39]
  wire [3:0]  in_arb_sel = in_arb_filter[3:0] | in_arb_filter[7:4];	// @[Mux.scala:47:70, SingleVCAllocator.scala:20:{34,57,74}]
  wire        _in_alloc_T = in_arb_vals_0 | in_arb_vals_1;	// @[SingleVCAllocator.scala:32:39, package.scala:73:59]
  wire        in_arb_reqs_0_1_1 = io_req_0_bits_vc_sel_1_1 & ~io_channel_status_1_1_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_0_1_2 = io_req_0_bits_vc_sel_1_2 & ~io_channel_status_1_2_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_0_1_3 = io_req_0_bits_vc_sel_1_3 & ~io_channel_status_1_3_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_0_1_4 = io_req_0_bits_vc_sel_1_4 & ~io_channel_status_1_4_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_0_2_0 = io_req_0_bits_vc_sel_2_0 & ~io_channel_status_2_0_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_0_2_1 = io_req_0_bits_vc_sel_2_1 & ~io_channel_status_2_1_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_0_2_2 = io_req_0_bits_vc_sel_2_2 & ~io_channel_status_2_2_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_0_2_3 = io_req_0_bits_vc_sel_2_3 & ~io_channel_status_2_3_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_0_2_4 = io_req_0_bits_vc_sel_2_4 & ~io_channel_status_2_4_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_0_3_0 = io_req_0_bits_vc_sel_3_0 & ~io_channel_status_3_0_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_0_3_1 = io_req_0_bits_vc_sel_3_1 & ~io_channel_status_3_1_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_0_3_2 = io_req_0_bits_vc_sel_3_2 & ~io_channel_status_3_2_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_0_3_3 = io_req_0_bits_vc_sel_3_3 & ~io_channel_status_3_3_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_0_3_4 = io_req_0_bits_vc_sel_3_4 & ~io_channel_status_3_4_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  assign in_arb_vals_0 = io_req_0_valid & (in_arb_reqs_0_1_1 | in_arb_reqs_0_1_2 | in_arb_reqs_0_1_3 | in_arb_reqs_0_1_4 | in_arb_reqs_0_2_0 | in_arb_reqs_0_2_1 | in_arb_reqs_0_2_2 | in_arb_reqs_0_2_3 | in_arb_reqs_0_2_4 | in_arb_reqs_0_3_0 | in_arb_reqs_0_3_1 | in_arb_reqs_0_3_2 | in_arb_reqs_0_3_3 | in_arb_reqs_0_3_4);	// @[SingleVCAllocator.scala:28:61, :32:39, package.scala:73:59]
  wire        in_arb_reqs_1_0_4 = io_req_1_bits_vc_sel_0_4 & ~io_channel_status_0_4_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_1_2_0 = io_req_1_bits_vc_sel_2_0 & ~io_channel_status_2_0_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_1_2_1 = io_req_1_bits_vc_sel_2_1 & ~io_channel_status_2_1_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_1_2_2 = io_req_1_bits_vc_sel_2_2 & ~io_channel_status_2_2_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_1_2_3 = io_req_1_bits_vc_sel_2_3 & ~io_channel_status_2_3_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_1_2_4 = io_req_1_bits_vc_sel_2_4 & ~io_channel_status_2_4_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_1_3_0 = io_req_1_bits_vc_sel_3_0 & ~io_channel_status_3_0_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_1_3_1 = io_req_1_bits_vc_sel_3_1 & ~io_channel_status_3_1_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_1_3_2 = io_req_1_bits_vc_sel_3_2 & ~io_channel_status_3_2_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_1_3_3 = io_req_1_bits_vc_sel_3_3 & ~io_channel_status_3_3_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_1_3_4 = io_req_1_bits_vc_sel_3_4 & ~io_channel_status_3_4_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  assign in_arb_vals_1 = io_req_1_valid & (in_arb_reqs_1_0_4 | in_arb_reqs_1_2_0 | in_arb_reqs_1_2_1 | in_arb_reqs_1_2_2 | in_arb_reqs_1_2_3 | in_arb_reqs_1_2_4 | in_arb_reqs_1_3_0 | in_arb_reqs_1_3_1 | in_arb_reqs_1_3_2 | in_arb_reqs_1_3_3 | in_arb_reqs_1_3_4);	// @[SingleVCAllocator.scala:28:61, :32:39, package.scala:73:59]
  wire        in_arb_reqs_2_0_4 = io_req_2_bits_vc_sel_0_4 & ~io_channel_status_0_4_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_2_1_1 = io_req_2_bits_vc_sel_1_1 & ~io_channel_status_1_1_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_2_1_2 = io_req_2_bits_vc_sel_1_2 & ~io_channel_status_1_2_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_2_1_3 = io_req_2_bits_vc_sel_1_3 & ~io_channel_status_1_3_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_2_1_4 = io_req_2_bits_vc_sel_1_4 & ~io_channel_status_1_4_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_2_3_0 = io_req_2_bits_vc_sel_3_0 & ~io_channel_status_3_0_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_2_3_1 = io_req_2_bits_vc_sel_3_1 & ~io_channel_status_3_1_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_2_3_2 = io_req_2_bits_vc_sel_3_2 & ~io_channel_status_3_2_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_2_3_3 = io_req_2_bits_vc_sel_3_3 & ~io_channel_status_3_3_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_2_3_4 = io_req_2_bits_vc_sel_3_4 & ~io_channel_status_3_4_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  assign in_arb_vals_2 = io_req_2_valid & (in_arb_reqs_2_0_4 | in_arb_reqs_2_1_1 | in_arb_reqs_2_1_2 | in_arb_reqs_2_1_3 | in_arb_reqs_2_1_4 | in_arb_reqs_2_3_0 | in_arb_reqs_2_3_1 | in_arb_reqs_2_3_2 | in_arb_reqs_2_3_3 | in_arb_reqs_2_3_4);	// @[SingleVCAllocator.scala:28:61, :32:39, package.scala:73:59]
  wire        in_arb_reqs_3_0_1 = io_req_3_bits_vc_sel_0_1 & ~io_channel_status_0_1_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_3_0_2 = io_req_3_bits_vc_sel_0_2 & ~io_channel_status_0_2_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_3_0_3 = io_req_3_bits_vc_sel_0_3 & ~io_channel_status_0_3_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_3_0_4 = io_req_3_bits_vc_sel_0_4 & ~io_channel_status_0_4_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_3_1_1 = io_req_3_bits_vc_sel_1_1 & ~io_channel_status_1_1_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_3_1_2 = io_req_3_bits_vc_sel_1_2 & ~io_channel_status_1_2_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_3_1_3 = io_req_3_bits_vc_sel_1_3 & ~io_channel_status_1_3_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_3_1_4 = io_req_3_bits_vc_sel_1_4 & ~io_channel_status_1_4_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_3_2_1 = io_req_3_bits_vc_sel_2_1 & ~io_channel_status_2_1_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_3_2_2 = io_req_3_bits_vc_sel_2_2 & ~io_channel_status_2_2_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_3_2_3 = io_req_3_bits_vc_sel_2_3 & ~io_channel_status_2_3_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  wire        in_arb_reqs_3_2_4 = io_req_3_bits_vc_sel_2_4 & ~io_channel_status_2_4_occupied;	// @[SingleVCAllocator.scala:28:{61,64}]
  assign in_arb_vals_3 = io_req_3_valid & (in_arb_reqs_3_0_1 | in_arb_reqs_3_0_2 | in_arb_reqs_3_0_3 | in_arb_reqs_3_0_4 | in_arb_reqs_3_1_1 | in_arb_reqs_3_1_2 | in_arb_reqs_3_1_3 | in_arb_reqs_3_1_4 | in_arb_reqs_3_2_1 | in_arb_reqs_3_2_2 | in_arb_reqs_3_2_3 | in_arb_reqs_3_2_4);	// @[SingleVCAllocator.scala:28:61, :32:39, package.scala:73:59]
  wire        _in_vc_sel_WIRE_2 = in_arb_sel[3] & in_arb_reqs_3_0_1;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_3 = in_arb_sel[3] & in_arb_reqs_3_0_2;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_4 = in_arb_sel[3] & in_arb_reqs_3_0_3;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_5 = in_arb_sel[1] & in_arb_reqs_1_0_4 | in_arb_sel[2] & in_arb_reqs_2_0_4 | in_arb_sel[3] & in_arb_reqs_3_0_4;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_8 = in_arb_sel[0] & in_arb_reqs_0_1_1 | in_arb_sel[2] & in_arb_reqs_2_1_1 | in_arb_sel[3] & in_arb_reqs_3_1_1;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_9 = in_arb_sel[0] & in_arb_reqs_0_1_2 | in_arb_sel[2] & in_arb_reqs_2_1_2 | in_arb_sel[3] & in_arb_reqs_3_1_2;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_10 = in_arb_sel[0] & in_arb_reqs_0_1_3 | in_arb_sel[2] & in_arb_reqs_2_1_3 | in_arb_sel[3] & in_arb_reqs_3_1_3;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_11 = in_arb_sel[0] & in_arb_reqs_0_1_4 | in_arb_sel[2] & in_arb_reqs_2_1_4 | in_arb_sel[3] & in_arb_reqs_3_1_4;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_13 = in_arb_sel[0] & in_arb_reqs_0_2_0 | in_arb_sel[1] & in_arb_reqs_1_2_0;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_14 = in_arb_sel[0] & in_arb_reqs_0_2_1 | in_arb_sel[1] & in_arb_reqs_1_2_1 | in_arb_sel[3] & in_arb_reqs_3_2_1;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_15 = in_arb_sel[0] & in_arb_reqs_0_2_2 | in_arb_sel[1] & in_arb_reqs_1_2_2 | in_arb_sel[3] & in_arb_reqs_3_2_2;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_16 = in_arb_sel[0] & in_arb_reqs_0_2_3 | in_arb_sel[1] & in_arb_reqs_1_2_3 | in_arb_sel[3] & in_arb_reqs_3_2_3;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_17 = in_arb_sel[0] & in_arb_reqs_0_2_4 | in_arb_sel[1] & in_arb_reqs_1_2_4 | in_arb_sel[3] & in_arb_reqs_3_2_4;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_19 = in_arb_sel[0] & in_arb_reqs_0_3_0 | in_arb_sel[1] & in_arb_reqs_1_3_0 | in_arb_sel[2] & in_arb_reqs_2_3_0;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_20 = in_arb_sel[0] & in_arb_reqs_0_3_1 | in_arb_sel[1] & in_arb_reqs_1_3_1 | in_arb_sel[2] & in_arb_reqs_2_3_1;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_21 = in_arb_sel[0] & in_arb_reqs_0_3_2 | in_arb_sel[1] & in_arb_reqs_1_3_2 | in_arb_sel[2] & in_arb_reqs_2_3_2;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_22 = in_arb_sel[0] & in_arb_reqs_0_3_3 | in_arb_sel[1] & in_arb_reqs_1_3_3 | in_arb_sel[2] & in_arb_reqs_2_3_3;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_vc_sel_WIRE_23 = in_arb_sel[0] & in_arb_reqs_0_3_4 | in_arb_sel[1] & in_arb_reqs_1_3_4 | in_arb_sel[2] & in_arb_reqs_2_3_4;	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:20:57, :28:61]
  wire        _in_alloc_T_2 = _in_alloc_T | in_arb_vals_2 | in_arb_vals_3;	// @[SingleVCAllocator.scala:32:39, package.scala:73:59]
  reg  [19:0] in_alloc_mask;	// @[ISLIP.scala:17:25]
  wire [18:0] _GEN = {_in_vc_sel_WIRE_23, _in_vc_sel_WIRE_22, _in_vc_sel_WIRE_21, _in_vc_sel_WIRE_20, _in_vc_sel_WIRE_19, _in_vc_sel_WIRE_17, _in_vc_sel_WIRE_16, _in_vc_sel_WIRE_15, _in_vc_sel_WIRE_14, _in_vc_sel_WIRE_13, _in_vc_sel_WIRE_11, _in_vc_sel_WIRE_10, _in_vc_sel_WIRE_9, _in_vc_sel_WIRE_8, 1'h0, _in_vc_sel_WIRE_5, _in_vc_sel_WIRE_4, _in_vc_sel_WIRE_3, _in_vc_sel_WIRE_2} & ~(in_alloc_mask[19:1]);	// @[ISLIP.scala:17:25, :18:{29,31}, :33:18, Mux.scala:27:73]
  wire [39:0] _in_alloc_oh_T_78 = _GEN[0] ? 40'h2 : _GEN[1] ? 40'h4 : _GEN[2] ? 40'h8 : _GEN[3] ? 40'h10 : _GEN[5] ? 40'h40 : _GEN[6] ? 40'h80 : _GEN[7] ? 40'h100 : _GEN[8] ? 40'h200 : _GEN[9] ? 40'h400 : _GEN[10] ? 40'h800 : _GEN[11] ? 40'h1000 : _GEN[12] ? 40'h2000 : _GEN[13] ? 40'h4000 : _GEN[14] ? 40'h8000 : _GEN[15] ? 40'h10000 : _GEN[16] ? 40'h20000 : _GEN[17] ? 40'h40000 : _GEN[18] ? 40'h80000 : _in_vc_sel_WIRE_2 ? 40'h200000 : _in_vc_sel_WIRE_3 ? 40'h400000 : _in_vc_sel_WIRE_4 ? 40'h800000 : _in_vc_sel_WIRE_5 ? 40'h1000000 : _in_vc_sel_WIRE_8 ? 40'h4000000 : _in_vc_sel_WIRE_9 ? 40'h8000000 : _in_vc_sel_WIRE_10 ? 40'h10000000 : _in_vc_sel_WIRE_11 ? 40'h20000000 : _in_vc_sel_WIRE_13 ? 40'h40000000 : _in_vc_sel_WIRE_14 ? 40'h80000000 : _in_vc_sel_WIRE_15 ? 40'h100000000 : _in_vc_sel_WIRE_16 ? 40'h200000000 : _in_vc_sel_WIRE_17 ? 40'h400000000 : _in_vc_sel_WIRE_19 ? 40'h800000000 : _in_vc_sel_WIRE_20 ? 40'h1000000000 : _in_vc_sel_WIRE_21 ? 40'h2000000000 : _in_vc_sel_WIRE_22 ? 40'h4000000000 : {_in_vc_sel_WIRE_23, 39'h0};	// @[ISLIP.scala:18:29, Mux.scala:27:73, :47:70, OneHot.scala:84:71]
  wire [19:0] _in_alloc_WIRE_1 = _in_alloc_oh_T_78[19:0] | _in_alloc_oh_T_78[39:20];	// @[ISLIP.scala:20:{20,28,34}, Mux.scala:47:70]
  wire        in_alloc_3_0 = _in_alloc_T_2 & _in_alloc_WIRE_1[15];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_3_1 = _in_alloc_T_2 & _in_alloc_WIRE_1[16];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_3_2 = _in_alloc_T_2 & _in_alloc_WIRE_1[17];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_3_3 = _in_alloc_T_2 & _in_alloc_WIRE_1[18];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_3_4 = _in_alloc_T_2 & _in_alloc_WIRE_1[19];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_2_0 = _in_alloc_T_2 & _in_alloc_WIRE_1[10];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_2_1 = _in_alloc_T_2 & _in_alloc_WIRE_1[11];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_2_2 = _in_alloc_T_2 & _in_alloc_WIRE_1[12];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_2_3 = _in_alloc_T_2 & _in_alloc_WIRE_1[13];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_2_4 = _in_alloc_T_2 & _in_alloc_WIRE_1[14];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_1_1 = _in_alloc_T_2 & _in_alloc_WIRE_1[6];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_1_2 = _in_alloc_T_2 & _in_alloc_WIRE_1[7];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_1_3 = _in_alloc_T_2 & _in_alloc_WIRE_1[8];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_1_4 = _in_alloc_T_2 & _in_alloc_WIRE_1[9];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_0_1 = _in_alloc_T_2 & _in_alloc_WIRE_1[1];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_0_2 = _in_alloc_T_2 & _in_alloc_WIRE_1[2];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_0_3 = _in_alloc_T_2 & _in_alloc_WIRE_1[3];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  wire        in_alloc_0_4 = _in_alloc_T_2 & _in_alloc_WIRE_1[4];	// @[ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
  always @(posedge clock) begin
    if (reset) begin
      mask <= 4'h0;	// @[SingleVCAllocator.scala:16:21]
      in_alloc_mask <= 20'h0;	// @[ISLIP.scala:17:25]
    end
    else begin
      if (_in_alloc_T | in_arb_vals_2 | in_arb_vals_3)	// @[SingleVCAllocator.scala:32:39, package.scala:73:59]
        mask <= {1'h0, {1'h0, {1'h0, in_arb_sel[0]} | {2{in_arb_sel[1]}}} | {3{in_arb_sel[2]}}} | {4{in_arb_sel[3]}};	// @[Mux.scala:27:73, :29:36, SingleVCAllocator.scala:16:21, :20:57]
      if (in_arb_sel[0] & io_req_0_valid | in_arb_sel[1] & io_req_1_valid | in_arb_sel[2] & io_req_2_valid | in_arb_sel[3] & io_req_3_valid) begin	// @[Decoupled.scala:51:35, Mux.scala:29:36, SingleVCAllocator.scala:20:57, package.scala:73:59]
        if (_in_alloc_WIRE_1[0])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'h1;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[1])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'h3;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[2])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'h7;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[3])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'hF;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[4])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'h1F;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[5])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'h3F;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[6])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'h7F;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[7])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'hFF;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[8])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'h1FF;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[9])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'h3FF;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[10])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'h7FF;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[11])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'hFFF;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[12])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'h1FFF;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[13])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'h3FFF;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[14])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'h7FFF;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[15])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'hFFFF;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[16])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'h1FFFF;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[17])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'h3FFFF;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else if (_in_alloc_WIRE_1[18])	// @[ISLIP.scala:20:28, :23:14]
          in_alloc_mask <= 20'h7FFFF;	// @[ISLIP.scala:17:25, Mux.scala:101:16]
        else	// @[ISLIP.scala:23:14]
          in_alloc_mask <= {20{_in_alloc_WIRE_1[19]}};	// @[ISLIP.scala:17:25, :20:28, :23:14, Mux.scala:101:16]
      end
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    wire  [1:0]  _GEN_0 = {1'h0, _in_alloc_T_2 & _in_alloc_WIRE_1[0]};	// @[Bitwise.scala:51:90, ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
    wire  [1:0]  _GEN_1 = {1'h0, in_alloc_0_1};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_2 = {1'h0, in_alloc_0_3};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_3 = {1'h0, in_alloc_0_4};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_4 = {1'h0, in_alloc_0_2};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_5 = {1'h0, _in_alloc_T_2 & _in_alloc_WIRE_1[5]};	// @[Bitwise.scala:51:90, ISLIP.scala:20:28, :33:40, SingleVCAllocator.scala:41:18, package.scala:73:59]
    wire  [1:0]  _GEN_6 = {1'h0, in_alloc_1_1};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_7 = {1'h0, in_alloc_1_3};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_8 = {1'h0, in_alloc_1_4};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_9 = {1'h0, in_alloc_1_2};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_10 = {1'h0, in_alloc_2_0};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_11 = {1'h0, in_alloc_2_1};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_12 = {1'h0, in_alloc_2_3};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_13 = {1'h0, in_alloc_2_4};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_14 = {1'h0, in_alloc_2_2};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_15 = {1'h0, in_alloc_3_0};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_16 = {1'h0, in_alloc_3_1};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_17 = {1'h0, in_alloc_3_3};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_18 = {1'h0, in_alloc_3_4};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [1:0]  _GEN_19 = {1'h0, in_alloc_3_2};	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:41:18]
    wire  [4:0]  _T_61 = {1'h0, {1'h0, {1'h0, _GEN_0 + _GEN_1} + {1'h0, _GEN_4 + _GEN_2 + _GEN_3}} + {1'h0, {1'h0, _GEN_5 + _GEN_6} + {1'h0, _GEN_9 + _GEN_7 + _GEN_8}}} + {1'h0, {1'h0, {1'h0, _GEN_10 + _GEN_11} + {1'h0, _GEN_14 + _GEN_12 + _GEN_13}} + {1'h0, {1'h0, _GEN_15 + _GEN_16} + {1'h0, _GEN_19 + _GEN_17 + _GEN_18}}};	// @[Bitwise.scala:51:90]
    wire  [4:0]  _T_124 = {1'h0, {1'h0, {1'h0, _GEN_0 + _GEN_1} + {1'h0, _GEN_4 + _GEN_2 + _GEN_3}} + {1'h0, {1'h0, _GEN_5 + _GEN_6} + {1'h0, _GEN_9 + _GEN_7 + _GEN_8}}} + {1'h0, {1'h0, {1'h0, _GEN_10 + _GEN_11} + {1'h0, _GEN_14 + _GEN_12 + _GEN_13}} + {1'h0, {1'h0, _GEN_15 + _GEN_16} + {1'h0, _GEN_19 + _GEN_17 + _GEN_18}}};	// @[Bitwise.scala:51:90]
    wire  [4:0]  _T_187 = {1'h0, {1'h0, {1'h0, _GEN_0 + _GEN_1} + {1'h0, _GEN_4 + _GEN_2 + _GEN_3}} + {1'h0, {1'h0, _GEN_5 + _GEN_6} + {1'h0, _GEN_9 + _GEN_7 + _GEN_8}}} + {1'h0, {1'h0, {1'h0, _GEN_10 + _GEN_11} + {1'h0, _GEN_14 + _GEN_12 + _GEN_13}} + {1'h0, {1'h0, _GEN_15 + _GEN_16} + {1'h0, _GEN_19 + _GEN_17 + _GEN_18}}};	// @[Bitwise.scala:51:90]
    wire  [4:0]  _T_250 = {1'h0, {1'h0, {1'h0, _GEN_0 + _GEN_1} + {1'h0, _GEN_4 + _GEN_2 + _GEN_3}} + {1'h0, {1'h0, _GEN_5 + _GEN_6} + {1'h0, _GEN_9 + _GEN_7 + _GEN_8}}} + {1'h0, {1'h0, {1'h0, _GEN_10 + _GEN_11} + {1'h0, _GEN_14 + _GEN_12 + _GEN_13}} + {1'h0, {1'h0, _GEN_15 + _GEN_16} + {1'h0, _GEN_19 + _GEN_17 + _GEN_18}}};	// @[Bitwise.scala:51:90]
    always @(posedge clock) begin	// @[SingleVCAllocator.scala:53:11]
      if (~reset & (|(_T_61[4:1]))) begin	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:53:{11,47}]
        if (`ASSERT_VERBOSE_COND_)	// @[SingleVCAllocator.scala:53:11]
          $error("Assertion failed\n    at SingleVCAllocator.scala:53 assert(PopCount(io.resp(i).vc_sel.asUInt) <= 1.U)\n");	// @[SingleVCAllocator.scala:53:11]
        if (`STOP_COND_)	// @[SingleVCAllocator.scala:53:11]
          $fatal;	// @[SingleVCAllocator.scala:53:11]
      end
      if (~reset & (|(_T_124[4:1]))) begin	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:53:{11,47}]
        if (`ASSERT_VERBOSE_COND_)	// @[SingleVCAllocator.scala:53:11]
          $error("Assertion failed\n    at SingleVCAllocator.scala:53 assert(PopCount(io.resp(i).vc_sel.asUInt) <= 1.U)\n");	// @[SingleVCAllocator.scala:53:11]
        if (`STOP_COND_)	// @[SingleVCAllocator.scala:53:11]
          $fatal;	// @[SingleVCAllocator.scala:53:11]
      end
      if (~reset & (|(_T_187[4:1]))) begin	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:53:{11,47}]
        if (`ASSERT_VERBOSE_COND_)	// @[SingleVCAllocator.scala:53:11]
          $error("Assertion failed\n    at SingleVCAllocator.scala:53 assert(PopCount(io.resp(i).vc_sel.asUInt) <= 1.U)\n");	// @[SingleVCAllocator.scala:53:11]
        if (`STOP_COND_)	// @[SingleVCAllocator.scala:53:11]
          $fatal;	// @[SingleVCAllocator.scala:53:11]
      end
      if (~reset & (|(_T_250[4:1]))) begin	// @[Bitwise.scala:51:90, SingleVCAllocator.scala:53:{11,47}]
        if (`ASSERT_VERBOSE_COND_)	// @[SingleVCAllocator.scala:53:11]
          $error("Assertion failed\n    at SingleVCAllocator.scala:53 assert(PopCount(io.resp(i).vc_sel.asUInt) <= 1.U)\n");	// @[SingleVCAllocator.scala:53:11]
        if (`STOP_COND_)	// @[SingleVCAllocator.scala:53:11]
          $fatal;	// @[SingleVCAllocator.scala:53:11]
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
        mask = _RANDOM_0[3:0];	// @[SingleVCAllocator.scala:16:21]
        in_alloc_mask = _RANDOM_0[23:4];	// @[ISLIP.scala:17:25, SingleVCAllocator.scala:16:21]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_req_3_ready = in_arb_sel[3];	// @[Mux.scala:29:36, SingleVCAllocator.scala:20:57]
  assign io_req_2_ready = in_arb_sel[2];	// @[Mux.scala:29:36, SingleVCAllocator.scala:20:57]
  assign io_req_1_ready = in_arb_sel[1];	// @[Mux.scala:29:36, SingleVCAllocator.scala:20:57]
  assign io_req_0_ready = in_arb_sel[0];	// @[Mux.scala:29:36, SingleVCAllocator.scala:20:57]
  assign io_resp_3_vc_sel_2_1 = in_alloc_2_1;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_3_vc_sel_2_2 = in_alloc_2_2;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_3_vc_sel_2_3 = in_alloc_2_3;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_3_vc_sel_2_4 = in_alloc_2_4;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_3_vc_sel_1_1 = in_alloc_1_1;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_3_vc_sel_1_2 = in_alloc_1_2;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_3_vc_sel_1_3 = in_alloc_1_3;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_3_vc_sel_1_4 = in_alloc_1_4;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_3_vc_sel_0_1 = in_alloc_0_1;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_3_vc_sel_0_2 = in_alloc_0_2;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_3_vc_sel_0_3 = in_alloc_0_3;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_3_vc_sel_0_4 = in_alloc_0_4;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_2_vc_sel_3_0 = in_alloc_3_0;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_2_vc_sel_3_1 = in_alloc_3_1;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_2_vc_sel_3_2 = in_alloc_3_2;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_2_vc_sel_3_3 = in_alloc_3_3;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_2_vc_sel_3_4 = in_alloc_3_4;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_2_vc_sel_1_1 = in_alloc_1_1;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_2_vc_sel_1_2 = in_alloc_1_2;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_2_vc_sel_1_3 = in_alloc_1_3;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_2_vc_sel_1_4 = in_alloc_1_4;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_2_vc_sel_0_4 = in_alloc_0_4;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_1_vc_sel_3_0 = in_alloc_3_0;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_1_vc_sel_3_1 = in_alloc_3_1;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_1_vc_sel_3_2 = in_alloc_3_2;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_1_vc_sel_3_3 = in_alloc_3_3;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_1_vc_sel_3_4 = in_alloc_3_4;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_1_vc_sel_2_0 = in_alloc_2_0;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_1_vc_sel_2_1 = in_alloc_2_1;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_1_vc_sel_2_2 = in_alloc_2_2;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_1_vc_sel_2_3 = in_alloc_2_3;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_1_vc_sel_2_4 = in_alloc_2_4;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_1_vc_sel_0_4 = in_alloc_0_4;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_0_vc_sel_3_0 = in_alloc_3_0;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_0_vc_sel_3_1 = in_alloc_3_1;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_0_vc_sel_3_2 = in_alloc_3_2;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_0_vc_sel_3_3 = in_alloc_3_3;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_0_vc_sel_3_4 = in_alloc_3_4;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_0_vc_sel_2_0 = in_alloc_2_0;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_0_vc_sel_2_1 = in_alloc_2_1;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_0_vc_sel_2_2 = in_alloc_2_2;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_0_vc_sel_2_3 = in_alloc_2_3;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_0_vc_sel_2_4 = in_alloc_2_4;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_0_vc_sel_1_1 = in_alloc_1_1;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_0_vc_sel_1_2 = in_alloc_1_2;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_0_vc_sel_1_3 = in_alloc_1_3;	// @[SingleVCAllocator.scala:41:18]
  assign io_resp_0_vc_sel_1_4 = in_alloc_1_4;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_3_0_alloc = in_alloc_3_0;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_3_1_alloc = in_alloc_3_1;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_3_2_alloc = in_alloc_3_2;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_3_3_alloc = in_alloc_3_3;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_3_4_alloc = in_alloc_3_4;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_2_0_alloc = in_alloc_2_0;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_2_1_alloc = in_alloc_2_1;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_2_2_alloc = in_alloc_2_2;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_2_3_alloc = in_alloc_2_3;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_2_4_alloc = in_alloc_2_4;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_1_1_alloc = in_alloc_1_1;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_1_2_alloc = in_alloc_1_2;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_1_3_alloc = in_alloc_1_3;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_1_4_alloc = in_alloc_1_4;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_0_1_alloc = in_alloc_0_1;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_0_2_alloc = in_alloc_0_2;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_0_3_alloc = in_alloc_0_3;	// @[SingleVCAllocator.scala:41:18]
  assign io_out_allocs_0_4_alloc = in_alloc_0_4;	// @[SingleVCAllocator.scala:41:18]
endmodule

