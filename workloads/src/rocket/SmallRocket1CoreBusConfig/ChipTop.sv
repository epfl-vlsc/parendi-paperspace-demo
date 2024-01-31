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

module ChipTop(
  input         tl_mem_0_bits_a_ready,
                tl_mem_0_bits_d_valid,
  input  [2:0]  tl_mem_0_bits_d_bits_opcode,
  input  [1:0]  tl_mem_0_bits_d_bits_param,
  input  [2:0]  tl_mem_0_bits_d_bits_size,
  input  [3:0]  tl_mem_0_bits_d_bits_source,
  input         tl_mem_0_bits_d_bits_sink,
                tl_mem_0_bits_d_bits_denied,
  input  [63:0] tl_mem_0_bits_d_bits_data,
  input         tl_mem_0_bits_d_bits_corrupt,
                tl_mmio_0_bits_a_ready,
                tl_mmio_0_bits_d_valid,
  input  [2:0]  tl_mmio_0_bits_d_bits_opcode,
  input  [1:0]  tl_mmio_0_bits_d_bits_param,
  input  [2:0]  tl_mmio_0_bits_d_bits_size,
  input  [1:0]  tl_mmio_0_bits_d_bits_source,
  input         tl_mmio_0_bits_d_bits_sink,
                tl_mmio_0_bits_d_bits_denied,
  input  [63:0] tl_mmio_0_bits_d_bits_data,
  input         tl_mmio_0_bits_d_bits_corrupt,
                reset_io,
                clock_uncore_clock,
  output        tl_mem_0_clock,
                tl_mem_0_reset,
                tl_mem_0_bits_a_valid,
  output [2:0]  tl_mem_0_bits_a_bits_opcode,
                tl_mem_0_bits_a_bits_param,
                tl_mem_0_bits_a_bits_size,
  output [3:0]  tl_mem_0_bits_a_bits_source,
  output [31:0] tl_mem_0_bits_a_bits_address,
  output [7:0]  tl_mem_0_bits_a_bits_mask,
  output [63:0] tl_mem_0_bits_a_bits_data,
  output        tl_mem_0_bits_a_bits_corrupt,
                tl_mem_0_bits_d_ready,
                tl_mmio_0_clock,
                tl_mmio_0_reset,
                tl_mmio_0_bits_a_valid,
  output [2:0]  tl_mmio_0_bits_a_bits_opcode,
                tl_mmio_0_bits_a_bits_param,
                tl_mmio_0_bits_a_bits_size,
  output [1:0]  tl_mmio_0_bits_a_bits_source,
  output [30:0] tl_mmio_0_bits_a_bits_address,
  output [7:0]  tl_mmio_0_bits_a_bits_mask,
  output [63:0] tl_mmio_0_bits_a_bits_data,
  output        tl_mmio_0_bits_a_bits_corrupt,
                tl_mmio_0_bits_d_ready
);

  wire _system_auto_implicitClockGrouper_out_clock;	// @[ChipTop.scala:28:35]
  wire _system_auto_implicitClockGrouper_out_reset;	// @[ChipTop.scala:28:35]
  DigitalTop system (	// @[ChipTop.scala:28:35]
    .clock                                                                    (_system_auto_implicitClockGrouper_out_clock),	// @[ChipTop.scala:28:35]
    .reset                                                                    (_system_auto_implicitClockGrouper_out_reset),	// @[ChipTop.scala:28:35]
    .auto_prci_ctrl_domain_resetSynchronizer_in_member_allClocks_uncore_clock (clock_uncore_clock),
    .auto_prci_ctrl_domain_resetSynchronizer_in_member_allClocks_uncore_reset (reset_io),
    .mem_tl_0_a_ready                                                         (tl_mem_0_bits_a_ready),
    .mem_tl_0_d_valid                                                         (tl_mem_0_bits_d_valid),
    .mem_tl_0_d_bits_opcode                                                   (tl_mem_0_bits_d_bits_opcode),
    .mem_tl_0_d_bits_param                                                    (tl_mem_0_bits_d_bits_param),
    .mem_tl_0_d_bits_size                                                     (tl_mem_0_bits_d_bits_size),
    .mem_tl_0_d_bits_source                                                   (tl_mem_0_bits_d_bits_source),
    .mem_tl_0_d_bits_sink                                                     (tl_mem_0_bits_d_bits_sink),
    .mem_tl_0_d_bits_denied                                                   (tl_mem_0_bits_d_bits_denied),
    .mem_tl_0_d_bits_data                                                     (tl_mem_0_bits_d_bits_data),
    .mem_tl_0_d_bits_corrupt                                                  (tl_mem_0_bits_d_bits_corrupt),
    .mmio_tl_0_a_ready                                                        (tl_mmio_0_bits_a_ready),
    .mmio_tl_0_d_valid                                                        (tl_mmio_0_bits_d_valid),
    .mmio_tl_0_d_bits_opcode                                                  (tl_mmio_0_bits_d_bits_opcode),
    .mmio_tl_0_d_bits_param                                                   (tl_mmio_0_bits_d_bits_param),
    .mmio_tl_0_d_bits_size                                                    (tl_mmio_0_bits_d_bits_size),
    .mmio_tl_0_d_bits_source                                                  (tl_mmio_0_bits_d_bits_source),
    .mmio_tl_0_d_bits_sink                                                    (tl_mmio_0_bits_d_bits_sink),
    .mmio_tl_0_d_bits_denied                                                  (tl_mmio_0_bits_d_bits_denied),
    .mmio_tl_0_d_bits_data                                                    (tl_mmio_0_bits_d_bits_data),
    .mmio_tl_0_d_bits_corrupt                                                 (tl_mmio_0_bits_d_bits_corrupt),
    .auto_implicitClockGrouper_out_clock                                      (_system_auto_implicitClockGrouper_out_clock),
    .auto_implicitClockGrouper_out_reset                                      (_system_auto_implicitClockGrouper_out_reset),
    .auto_subsystem_mbus_fixedClockNode_out_clock                             (tl_mem_0_clock),
    .auto_subsystem_mbus_fixedClockNode_out_reset                             (tl_mem_0_reset),
    .auto_subsystem_sbus_fixedClockNode_out_clock                             (tl_mmio_0_clock),
    .auto_subsystem_sbus_fixedClockNode_out_reset                             (tl_mmio_0_reset),
    .mem_tl_0_a_valid                                                         (tl_mem_0_bits_a_valid),
    .mem_tl_0_a_bits_opcode                                                   (tl_mem_0_bits_a_bits_opcode),
    .mem_tl_0_a_bits_param                                                    (tl_mem_0_bits_a_bits_param),
    .mem_tl_0_a_bits_size                                                     (tl_mem_0_bits_a_bits_size),
    .mem_tl_0_a_bits_source                                                   (tl_mem_0_bits_a_bits_source),
    .mem_tl_0_a_bits_address                                                  (tl_mem_0_bits_a_bits_address),
    .mem_tl_0_a_bits_mask                                                     (tl_mem_0_bits_a_bits_mask),
    .mem_tl_0_a_bits_data                                                     (tl_mem_0_bits_a_bits_data),
    .mem_tl_0_a_bits_corrupt                                                  (tl_mem_0_bits_a_bits_corrupt),
    .mem_tl_0_d_ready                                                         (tl_mem_0_bits_d_ready),
    .mmio_tl_0_a_valid                                                        (tl_mmio_0_bits_a_valid),
    .mmio_tl_0_a_bits_opcode                                                  (tl_mmio_0_bits_a_bits_opcode),
    .mmio_tl_0_a_bits_param                                                   (tl_mmio_0_bits_a_bits_param),
    .mmio_tl_0_a_bits_size                                                    (tl_mmio_0_bits_a_bits_size),
    .mmio_tl_0_a_bits_source                                                  (tl_mmio_0_bits_a_bits_source),
    .mmio_tl_0_a_bits_address                                                 (tl_mmio_0_bits_a_bits_address),
    .mmio_tl_0_a_bits_mask                                                    (tl_mmio_0_bits_a_bits_mask),
    .mmio_tl_0_a_bits_data                                                    (tl_mmio_0_bits_a_bits_data),
    .mmio_tl_0_a_bits_corrupt                                                 (tl_mmio_0_bits_a_bits_corrupt),
    .mmio_tl_0_d_ready                                                        (tl_mmio_0_bits_d_ready)
  );
endmodule
