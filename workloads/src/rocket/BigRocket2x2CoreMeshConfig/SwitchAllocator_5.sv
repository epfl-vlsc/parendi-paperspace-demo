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

module SwitchAllocator_5(
  input  clock,
         reset,
         io_req_1_0_valid,
         io_req_1_0_bits_vc_sel_2_0,
         io_req_1_0_bits_vc_sel_2_1,
         io_req_1_0_bits_vc_sel_2_2,
         io_req_1_0_bits_vc_sel_2_3,
         io_req_1_0_bits_vc_sel_2_4,
         io_req_1_0_bits_vc_sel_1_0,
         io_req_1_0_bits_vc_sel_1_1,
         io_req_1_0_bits_vc_sel_1_2,
         io_req_1_0_bits_vc_sel_1_3,
         io_req_1_0_bits_vc_sel_1_4,
         io_req_1_0_bits_vc_sel_0_1,
         io_req_1_0_bits_vc_sel_0_2,
         io_req_1_0_bits_vc_sel_0_3,
         io_req_1_0_bits_vc_sel_0_4,
         io_req_1_0_bits_tail,
         io_req_0_0_valid,
         io_req_0_0_bits_vc_sel_2_0,
         io_req_0_0_bits_vc_sel_2_1,
         io_req_0_0_bits_vc_sel_2_2,
         io_req_0_0_bits_vc_sel_2_3,
         io_req_0_0_bits_vc_sel_2_4,
         io_req_0_0_bits_vc_sel_1_0,
         io_req_0_0_bits_vc_sel_1_1,
         io_req_0_0_bits_vc_sel_1_2,
         io_req_0_0_bits_vc_sel_1_3,
         io_req_0_0_bits_vc_sel_1_4,
         io_req_0_0_bits_vc_sel_0_1,
         io_req_0_0_bits_vc_sel_0_2,
         io_req_0_0_bits_vc_sel_0_3,
         io_req_0_0_bits_vc_sel_0_4,
         io_req_0_0_bits_tail,
  output io_req_1_0_ready,
         io_req_0_0_ready,
         io_credit_alloc_2_0_alloc,
         io_credit_alloc_2_1_alloc,
         io_credit_alloc_2_2_alloc,
         io_credit_alloc_2_3_alloc,
         io_credit_alloc_2_4_alloc,
         io_credit_alloc_1_1_alloc,
         io_credit_alloc_1_2_alloc,
         io_credit_alloc_1_3_alloc,
         io_credit_alloc_1_4_alloc,
         io_credit_alloc_0_4_alloc,
         io_switch_sel_2_0_1_0,
         io_switch_sel_2_0_0_0,
         io_switch_sel_1_0_1_0,
         io_switch_sel_1_0_0_0,
         io_switch_sel_0_0_1_0,
         io_switch_sel_0_0_0_0
);

  wire       _arbs_2_io_in_0_ready;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_2_io_in_1_ready;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_2_io_out_0_valid;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_2_io_out_0_bits_vc_sel_2_0;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_2_io_out_0_bits_vc_sel_2_1;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_2_io_out_0_bits_vc_sel_2_2;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_2_io_out_0_bits_vc_sel_2_3;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_2_io_out_0_bits_vc_sel_2_4;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_2_io_out_0_bits_vc_sel_1_1;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_2_io_out_0_bits_vc_sel_1_2;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_2_io_out_0_bits_vc_sel_1_3;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_2_io_out_0_bits_vc_sel_1_4;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_2_io_out_0_bits_vc_sel_0_4;	// @[SwitchAllocator.scala:83:45]
  wire [1:0] _arbs_2_io_chosen_oh_0;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_1_io_in_0_ready;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_1_io_in_1_ready;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_1_io_out_0_valid;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_1_io_out_0_bits_vc_sel_2_0;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_1_io_out_0_bits_vc_sel_2_1;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_1_io_out_0_bits_vc_sel_2_2;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_1_io_out_0_bits_vc_sel_2_3;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_1_io_out_0_bits_vc_sel_2_4;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_1_io_out_0_bits_vc_sel_1_1;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_1_io_out_0_bits_vc_sel_1_2;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_1_io_out_0_bits_vc_sel_1_3;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_1_io_out_0_bits_vc_sel_1_4;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_1_io_out_0_bits_vc_sel_0_4;	// @[SwitchAllocator.scala:83:45]
  wire [1:0] _arbs_1_io_chosen_oh_0;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_0_io_in_0_ready;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_0_io_in_1_ready;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_0_io_out_0_valid;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_0_io_out_0_bits_vc_sel_2_0;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_0_io_out_0_bits_vc_sel_2_1;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_0_io_out_0_bits_vc_sel_2_2;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_0_io_out_0_bits_vc_sel_2_3;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_0_io_out_0_bits_vc_sel_2_4;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_0_io_out_0_bits_vc_sel_1_1;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_0_io_out_0_bits_vc_sel_1_2;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_0_io_out_0_bits_vc_sel_1_3;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_0_io_out_0_bits_vc_sel_1_4;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_0_io_out_0_bits_vc_sel_0_4;	// @[SwitchAllocator.scala:83:45]
  wire [1:0] _arbs_0_io_chosen_oh_0;	// @[SwitchAllocator.scala:83:45]
  wire       _arbs_0_io_in_0_valid_T_4 = io_req_0_0_valid & (io_req_0_0_bits_vc_sel_0_1 | io_req_0_0_bits_vc_sel_0_2 | io_req_0_0_bits_vc_sel_0_3 | io_req_0_0_bits_vc_sel_0_4);	// @[SwitchAllocator.scala:95:{37,65}]
  wire       _arbs_1_io_in_0_valid_T_4 = io_req_0_0_valid & (io_req_0_0_bits_vc_sel_1_0 | io_req_0_0_bits_vc_sel_1_1 | io_req_0_0_bits_vc_sel_1_2 | io_req_0_0_bits_vc_sel_1_3 | io_req_0_0_bits_vc_sel_1_4);	// @[SwitchAllocator.scala:95:{37,65}]
  wire       _arbs_2_io_in_0_valid_T_4 = io_req_0_0_valid & (io_req_0_0_bits_vc_sel_2_0 | io_req_0_0_bits_vc_sel_2_1 | io_req_0_0_bits_vc_sel_2_2 | io_req_0_0_bits_vc_sel_2_3 | io_req_0_0_bits_vc_sel_2_4);	// @[SwitchAllocator.scala:95:{37,65}]
  wire       _arbs_0_io_in_1_valid_T_4 = io_req_1_0_valid & (io_req_1_0_bits_vc_sel_0_1 | io_req_1_0_bits_vc_sel_0_2 | io_req_1_0_bits_vc_sel_0_3 | io_req_1_0_bits_vc_sel_0_4);	// @[SwitchAllocator.scala:95:{37,65}]
  wire       _arbs_1_io_in_1_valid_T_4 = io_req_1_0_valid & (io_req_1_0_bits_vc_sel_1_0 | io_req_1_0_bits_vc_sel_1_1 | io_req_1_0_bits_vc_sel_1_2 | io_req_1_0_bits_vc_sel_1_3 | io_req_1_0_bits_vc_sel_1_4);	// @[SwitchAllocator.scala:95:{37,65}]
  wire       _arbs_2_io_in_1_valid_T_4 = io_req_1_0_valid & (io_req_1_0_bits_vc_sel_2_0 | io_req_1_0_bits_vc_sel_2_1 | io_req_1_0_bits_vc_sel_2_2 | io_req_1_0_bits_vc_sel_2_3 | io_req_1_0_bits_vc_sel_2_4);	// @[SwitchAllocator.scala:95:{37,65}]
  SwitchArbiter_27 arbs_0 (	// @[SwitchAllocator.scala:83:45]
    .clock                    (clock),
    .reset                    (reset),
    .io_in_0_valid            (_arbs_0_io_in_0_valid_T_4),	// @[SwitchAllocator.scala:95:37]
    .io_in_0_bits_vc_sel_2_0  (io_req_0_0_bits_vc_sel_2_0),
    .io_in_0_bits_vc_sel_2_1  (io_req_0_0_bits_vc_sel_2_1),
    .io_in_0_bits_vc_sel_2_2  (io_req_0_0_bits_vc_sel_2_2),
    .io_in_0_bits_vc_sel_2_3  (io_req_0_0_bits_vc_sel_2_3),
    .io_in_0_bits_vc_sel_2_4  (io_req_0_0_bits_vc_sel_2_4),
    .io_in_0_bits_vc_sel_1_1  (io_req_0_0_bits_vc_sel_1_1),
    .io_in_0_bits_vc_sel_1_2  (io_req_0_0_bits_vc_sel_1_2),
    .io_in_0_bits_vc_sel_1_3  (io_req_0_0_bits_vc_sel_1_3),
    .io_in_0_bits_vc_sel_1_4  (io_req_0_0_bits_vc_sel_1_4),
    .io_in_0_bits_vc_sel_0_4  (io_req_0_0_bits_vc_sel_0_4),
    .io_in_0_bits_tail        (io_req_0_0_bits_tail),
    .io_in_1_valid            (_arbs_0_io_in_1_valid_T_4),	// @[SwitchAllocator.scala:95:37]
    .io_in_1_bits_vc_sel_2_0  (io_req_1_0_bits_vc_sel_2_0),
    .io_in_1_bits_vc_sel_2_1  (io_req_1_0_bits_vc_sel_2_1),
    .io_in_1_bits_vc_sel_2_2  (io_req_1_0_bits_vc_sel_2_2),
    .io_in_1_bits_vc_sel_2_3  (io_req_1_0_bits_vc_sel_2_3),
    .io_in_1_bits_vc_sel_2_4  (io_req_1_0_bits_vc_sel_2_4),
    .io_in_1_bits_vc_sel_1_1  (io_req_1_0_bits_vc_sel_1_1),
    .io_in_1_bits_vc_sel_1_2  (io_req_1_0_bits_vc_sel_1_2),
    .io_in_1_bits_vc_sel_1_3  (io_req_1_0_bits_vc_sel_1_3),
    .io_in_1_bits_vc_sel_1_4  (io_req_1_0_bits_vc_sel_1_4),
    .io_in_1_bits_vc_sel_0_4  (io_req_1_0_bits_vc_sel_0_4),
    .io_in_1_bits_tail        (io_req_1_0_bits_tail),
    .io_in_0_ready            (_arbs_0_io_in_0_ready),
    .io_in_1_ready            (_arbs_0_io_in_1_ready),
    .io_out_0_valid           (_arbs_0_io_out_0_valid),
    .io_out_0_bits_vc_sel_2_0 (_arbs_0_io_out_0_bits_vc_sel_2_0),
    .io_out_0_bits_vc_sel_2_1 (_arbs_0_io_out_0_bits_vc_sel_2_1),
    .io_out_0_bits_vc_sel_2_2 (_arbs_0_io_out_0_bits_vc_sel_2_2),
    .io_out_0_bits_vc_sel_2_3 (_arbs_0_io_out_0_bits_vc_sel_2_3),
    .io_out_0_bits_vc_sel_2_4 (_arbs_0_io_out_0_bits_vc_sel_2_4),
    .io_out_0_bits_vc_sel_1_1 (_arbs_0_io_out_0_bits_vc_sel_1_1),
    .io_out_0_bits_vc_sel_1_2 (_arbs_0_io_out_0_bits_vc_sel_1_2),
    .io_out_0_bits_vc_sel_1_3 (_arbs_0_io_out_0_bits_vc_sel_1_3),
    .io_out_0_bits_vc_sel_1_4 (_arbs_0_io_out_0_bits_vc_sel_1_4),
    .io_out_0_bits_vc_sel_0_4 (_arbs_0_io_out_0_bits_vc_sel_0_4),
    .io_chosen_oh_0           (_arbs_0_io_chosen_oh_0)
  );
  SwitchArbiter_27 arbs_1 (	// @[SwitchAllocator.scala:83:45]
    .clock                    (clock),
    .reset                    (reset),
    .io_in_0_valid            (_arbs_1_io_in_0_valid_T_4),	// @[SwitchAllocator.scala:95:37]
    .io_in_0_bits_vc_sel_2_0  (io_req_0_0_bits_vc_sel_2_0),
    .io_in_0_bits_vc_sel_2_1  (io_req_0_0_bits_vc_sel_2_1),
    .io_in_0_bits_vc_sel_2_2  (io_req_0_0_bits_vc_sel_2_2),
    .io_in_0_bits_vc_sel_2_3  (io_req_0_0_bits_vc_sel_2_3),
    .io_in_0_bits_vc_sel_2_4  (io_req_0_0_bits_vc_sel_2_4),
    .io_in_0_bits_vc_sel_1_1  (io_req_0_0_bits_vc_sel_1_1),
    .io_in_0_bits_vc_sel_1_2  (io_req_0_0_bits_vc_sel_1_2),
    .io_in_0_bits_vc_sel_1_3  (io_req_0_0_bits_vc_sel_1_3),
    .io_in_0_bits_vc_sel_1_4  (io_req_0_0_bits_vc_sel_1_4),
    .io_in_0_bits_vc_sel_0_4  (io_req_0_0_bits_vc_sel_0_4),
    .io_in_0_bits_tail        (io_req_0_0_bits_tail),
    .io_in_1_valid            (_arbs_1_io_in_1_valid_T_4),	// @[SwitchAllocator.scala:95:37]
    .io_in_1_bits_vc_sel_2_0  (io_req_1_0_bits_vc_sel_2_0),
    .io_in_1_bits_vc_sel_2_1  (io_req_1_0_bits_vc_sel_2_1),
    .io_in_1_bits_vc_sel_2_2  (io_req_1_0_bits_vc_sel_2_2),
    .io_in_1_bits_vc_sel_2_3  (io_req_1_0_bits_vc_sel_2_3),
    .io_in_1_bits_vc_sel_2_4  (io_req_1_0_bits_vc_sel_2_4),
    .io_in_1_bits_vc_sel_1_1  (io_req_1_0_bits_vc_sel_1_1),
    .io_in_1_bits_vc_sel_1_2  (io_req_1_0_bits_vc_sel_1_2),
    .io_in_1_bits_vc_sel_1_3  (io_req_1_0_bits_vc_sel_1_3),
    .io_in_1_bits_vc_sel_1_4  (io_req_1_0_bits_vc_sel_1_4),
    .io_in_1_bits_vc_sel_0_4  (io_req_1_0_bits_vc_sel_0_4),
    .io_in_1_bits_tail        (io_req_1_0_bits_tail),
    .io_in_0_ready            (_arbs_1_io_in_0_ready),
    .io_in_1_ready            (_arbs_1_io_in_1_ready),
    .io_out_0_valid           (_arbs_1_io_out_0_valid),
    .io_out_0_bits_vc_sel_2_0 (_arbs_1_io_out_0_bits_vc_sel_2_0),
    .io_out_0_bits_vc_sel_2_1 (_arbs_1_io_out_0_bits_vc_sel_2_1),
    .io_out_0_bits_vc_sel_2_2 (_arbs_1_io_out_0_bits_vc_sel_2_2),
    .io_out_0_bits_vc_sel_2_3 (_arbs_1_io_out_0_bits_vc_sel_2_3),
    .io_out_0_bits_vc_sel_2_4 (_arbs_1_io_out_0_bits_vc_sel_2_4),
    .io_out_0_bits_vc_sel_1_1 (_arbs_1_io_out_0_bits_vc_sel_1_1),
    .io_out_0_bits_vc_sel_1_2 (_arbs_1_io_out_0_bits_vc_sel_1_2),
    .io_out_0_bits_vc_sel_1_3 (_arbs_1_io_out_0_bits_vc_sel_1_3),
    .io_out_0_bits_vc_sel_1_4 (_arbs_1_io_out_0_bits_vc_sel_1_4),
    .io_out_0_bits_vc_sel_0_4 (_arbs_1_io_out_0_bits_vc_sel_0_4),
    .io_chosen_oh_0           (_arbs_1_io_chosen_oh_0)
  );
  SwitchArbiter_27 arbs_2 (	// @[SwitchAllocator.scala:83:45]
    .clock                    (clock),
    .reset                    (reset),
    .io_in_0_valid            (_arbs_2_io_in_0_valid_T_4),	// @[SwitchAllocator.scala:95:37]
    .io_in_0_bits_vc_sel_2_0  (io_req_0_0_bits_vc_sel_2_0),
    .io_in_0_bits_vc_sel_2_1  (io_req_0_0_bits_vc_sel_2_1),
    .io_in_0_bits_vc_sel_2_2  (io_req_0_0_bits_vc_sel_2_2),
    .io_in_0_bits_vc_sel_2_3  (io_req_0_0_bits_vc_sel_2_3),
    .io_in_0_bits_vc_sel_2_4  (io_req_0_0_bits_vc_sel_2_4),
    .io_in_0_bits_vc_sel_1_1  (io_req_0_0_bits_vc_sel_1_1),
    .io_in_0_bits_vc_sel_1_2  (io_req_0_0_bits_vc_sel_1_2),
    .io_in_0_bits_vc_sel_1_3  (io_req_0_0_bits_vc_sel_1_3),
    .io_in_0_bits_vc_sel_1_4  (io_req_0_0_bits_vc_sel_1_4),
    .io_in_0_bits_vc_sel_0_4  (io_req_0_0_bits_vc_sel_0_4),
    .io_in_0_bits_tail        (io_req_0_0_bits_tail),
    .io_in_1_valid            (_arbs_2_io_in_1_valid_T_4),	// @[SwitchAllocator.scala:95:37]
    .io_in_1_bits_vc_sel_2_0  (io_req_1_0_bits_vc_sel_2_0),
    .io_in_1_bits_vc_sel_2_1  (io_req_1_0_bits_vc_sel_2_1),
    .io_in_1_bits_vc_sel_2_2  (io_req_1_0_bits_vc_sel_2_2),
    .io_in_1_bits_vc_sel_2_3  (io_req_1_0_bits_vc_sel_2_3),
    .io_in_1_bits_vc_sel_2_4  (io_req_1_0_bits_vc_sel_2_4),
    .io_in_1_bits_vc_sel_1_1  (io_req_1_0_bits_vc_sel_1_1),
    .io_in_1_bits_vc_sel_1_2  (io_req_1_0_bits_vc_sel_1_2),
    .io_in_1_bits_vc_sel_1_3  (io_req_1_0_bits_vc_sel_1_3),
    .io_in_1_bits_vc_sel_1_4  (io_req_1_0_bits_vc_sel_1_4),
    .io_in_1_bits_vc_sel_0_4  (io_req_1_0_bits_vc_sel_0_4),
    .io_in_1_bits_tail        (io_req_1_0_bits_tail),
    .io_in_0_ready            (_arbs_2_io_in_0_ready),
    .io_in_1_ready            (_arbs_2_io_in_1_ready),
    .io_out_0_valid           (_arbs_2_io_out_0_valid),
    .io_out_0_bits_vc_sel_2_0 (_arbs_2_io_out_0_bits_vc_sel_2_0),
    .io_out_0_bits_vc_sel_2_1 (_arbs_2_io_out_0_bits_vc_sel_2_1),
    .io_out_0_bits_vc_sel_2_2 (_arbs_2_io_out_0_bits_vc_sel_2_2),
    .io_out_0_bits_vc_sel_2_3 (_arbs_2_io_out_0_bits_vc_sel_2_3),
    .io_out_0_bits_vc_sel_2_4 (_arbs_2_io_out_0_bits_vc_sel_2_4),
    .io_out_0_bits_vc_sel_1_1 (_arbs_2_io_out_0_bits_vc_sel_1_1),
    .io_out_0_bits_vc_sel_1_2 (_arbs_2_io_out_0_bits_vc_sel_1_2),
    .io_out_0_bits_vc_sel_1_3 (_arbs_2_io_out_0_bits_vc_sel_1_3),
    .io_out_0_bits_vc_sel_1_4 (_arbs_2_io_out_0_bits_vc_sel_1_4),
    .io_out_0_bits_vc_sel_0_4 (_arbs_2_io_out_0_bits_vc_sel_0_4),
    .io_chosen_oh_0           (_arbs_2_io_chosen_oh_0)
  );
  assign io_req_1_0_ready = _arbs_0_io_in_1_ready & _arbs_0_io_in_1_valid_T_4 | _arbs_1_io_in_1_ready & _arbs_1_io_in_1_valid_T_4 | _arbs_2_io_in_1_ready & _arbs_2_io_in_1_valid_T_4;	// @[Decoupled.scala:51:35, SwitchAllocator.scala:83:45, :95:37, :99:30]
  assign io_req_0_0_ready = _arbs_0_io_in_0_ready & _arbs_0_io_in_0_valid_T_4 | _arbs_1_io_in_0_ready & _arbs_1_io_in_0_valid_T_4 | _arbs_2_io_in_0_ready & _arbs_2_io_in_0_valid_T_4;	// @[Decoupled.scala:51:35, SwitchAllocator.scala:83:45, :95:37, :99:30]
  assign io_credit_alloc_2_0_alloc = _arbs_2_io_out_0_valid & _arbs_2_io_out_0_bits_vc_sel_2_0;	// @[SwitchAllocator.scala:83:45, :120:33]
  assign io_credit_alloc_2_1_alloc = _arbs_2_io_out_0_valid & _arbs_2_io_out_0_bits_vc_sel_2_1;	// @[SwitchAllocator.scala:83:45, :120:33]
  assign io_credit_alloc_2_2_alloc = _arbs_2_io_out_0_valid & _arbs_2_io_out_0_bits_vc_sel_2_2;	// @[SwitchAllocator.scala:83:45, :120:33]
  assign io_credit_alloc_2_3_alloc = _arbs_2_io_out_0_valid & _arbs_2_io_out_0_bits_vc_sel_2_3;	// @[SwitchAllocator.scala:83:45, :120:33]
  assign io_credit_alloc_2_4_alloc = _arbs_2_io_out_0_valid & _arbs_2_io_out_0_bits_vc_sel_2_4;	// @[SwitchAllocator.scala:83:45, :120:33]
  assign io_credit_alloc_1_1_alloc = _arbs_1_io_out_0_valid & _arbs_1_io_out_0_bits_vc_sel_1_1;	// @[SwitchAllocator.scala:83:45, :120:33]
  assign io_credit_alloc_1_2_alloc = _arbs_1_io_out_0_valid & _arbs_1_io_out_0_bits_vc_sel_1_2;	// @[SwitchAllocator.scala:83:45, :120:33]
  assign io_credit_alloc_1_3_alloc = _arbs_1_io_out_0_valid & _arbs_1_io_out_0_bits_vc_sel_1_3;	// @[SwitchAllocator.scala:83:45, :120:33]
  assign io_credit_alloc_1_4_alloc = _arbs_1_io_out_0_valid & _arbs_1_io_out_0_bits_vc_sel_1_4;	// @[SwitchAllocator.scala:83:45, :120:33]
  assign io_credit_alloc_0_4_alloc = _arbs_0_io_out_0_valid & _arbs_0_io_out_0_bits_vc_sel_0_4;	// @[SwitchAllocator.scala:83:45, :120:33]
  assign io_switch_sel_2_0_1_0 = _arbs_2_io_in_1_valid_T_4 & _arbs_2_io_chosen_oh_0[1] & _arbs_2_io_out_0_valid;	// @[SwitchAllocator.scala:83:45, :95:37, :108:{91,97}]
  assign io_switch_sel_2_0_0_0 = _arbs_2_io_in_0_valid_T_4 & _arbs_2_io_chosen_oh_0[0] & _arbs_2_io_out_0_valid;	// @[SwitchAllocator.scala:83:45, :95:37, :108:{91,97}]
  assign io_switch_sel_1_0_1_0 = _arbs_1_io_in_1_valid_T_4 & _arbs_1_io_chosen_oh_0[1] & _arbs_1_io_out_0_valid;	// @[SwitchAllocator.scala:83:45, :95:37, :108:{91,97}]
  assign io_switch_sel_1_0_0_0 = _arbs_1_io_in_0_valid_T_4 & _arbs_1_io_chosen_oh_0[0] & _arbs_1_io_out_0_valid;	// @[SwitchAllocator.scala:83:45, :95:37, :108:{91,97}]
  assign io_switch_sel_0_0_1_0 = _arbs_0_io_in_1_valid_T_4 & _arbs_0_io_chosen_oh_0[1] & _arbs_0_io_out_0_valid;	// @[SwitchAllocator.scala:83:45, :95:37, :108:{91,97}]
  assign io_switch_sel_0_0_0_0 = _arbs_0_io_in_0_valid_T_4 & _arbs_0_io_chosen_oh_0[0] & _arbs_0_io_out_0_valid;	// @[SwitchAllocator.scala:83:45, :95:37, :108:{91,97}]
endmodule

