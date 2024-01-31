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

module PMPChecker_2(
  input  [1:0]  io_prv,
  input         io_pmp_0_cfg_l,
  input  [1:0]  io_pmp_0_cfg_a,
  input         io_pmp_0_cfg_x,
  input  [29:0] io_pmp_0_addr,
  input  [31:0] io_pmp_0_mask,
  input         io_pmp_1_cfg_l,
  input  [1:0]  io_pmp_1_cfg_a,
  input         io_pmp_1_cfg_x,
  input  [29:0] io_pmp_1_addr,
  input  [31:0] io_pmp_1_mask,
  input         io_pmp_2_cfg_l,
  input  [1:0]  io_pmp_2_cfg_a,
  input         io_pmp_2_cfg_x,
  input  [29:0] io_pmp_2_addr,
  input  [31:0] io_pmp_2_mask,
  input         io_pmp_3_cfg_l,
  input  [1:0]  io_pmp_3_cfg_a,
  input         io_pmp_3_cfg_x,
  input  [29:0] io_pmp_3_addr,
  input  [31:0] io_pmp_3_mask,
  input         io_pmp_4_cfg_l,
  input  [1:0]  io_pmp_4_cfg_a,
  input         io_pmp_4_cfg_x,
  input  [29:0] io_pmp_4_addr,
  input  [31:0] io_pmp_4_mask,
  input         io_pmp_5_cfg_l,
  input  [1:0]  io_pmp_5_cfg_a,
  input         io_pmp_5_cfg_x,
  input  [29:0] io_pmp_5_addr,
  input  [31:0] io_pmp_5_mask,
  input         io_pmp_6_cfg_l,
  input  [1:0]  io_pmp_6_cfg_a,
  input         io_pmp_6_cfg_x,
  input  [29:0] io_pmp_6_addr,
  input  [31:0] io_pmp_6_mask,
  input         io_pmp_7_cfg_l,
  input  [1:0]  io_pmp_7_cfg_a,
  input         io_pmp_7_cfg_x,
  input  [29:0] io_pmp_7_addr,
  input  [31:0] io_pmp_7_mask,
                io_addr,
  output        io_x
);

  assign io_x =
    (io_pmp_0_cfg_a[1]
       ? ((io_addr ^ {io_pmp_0_addr, 2'h0}) & ~io_pmp_0_mask) == 32'h0
       : io_pmp_0_cfg_a[0] & io_addr < {io_pmp_0_addr, 2'h0})
      ? io_pmp_0_cfg_x | io_prv[1] & ~io_pmp_0_cfg_l
      : (io_pmp_1_cfg_a[1]
           ? ((io_addr ^ {io_pmp_1_addr, 2'h0}) & ~io_pmp_1_mask) == 32'h0
           : io_pmp_1_cfg_a[0] & io_addr >= {io_pmp_0_addr, 2'h0}
             & io_addr < {io_pmp_1_addr, 2'h0})
          ? io_pmp_1_cfg_x | io_prv[1] & ~io_pmp_1_cfg_l
          : (io_pmp_2_cfg_a[1]
               ? ((io_addr ^ {io_pmp_2_addr, 2'h0}) & ~io_pmp_2_mask) == 32'h0
               : io_pmp_2_cfg_a[0] & io_addr >= {io_pmp_1_addr, 2'h0}
                 & io_addr < {io_pmp_2_addr, 2'h0})
              ? io_pmp_2_cfg_x | io_prv[1] & ~io_pmp_2_cfg_l
              : (io_pmp_3_cfg_a[1]
                   ? ((io_addr ^ {io_pmp_3_addr, 2'h0}) & ~io_pmp_3_mask) == 32'h0
                   : io_pmp_3_cfg_a[0] & io_addr >= {io_pmp_2_addr, 2'h0}
                     & io_addr < {io_pmp_3_addr, 2'h0})
                  ? io_pmp_3_cfg_x | io_prv[1] & ~io_pmp_3_cfg_l
                  : (io_pmp_4_cfg_a[1]
                       ? ((io_addr ^ {io_pmp_4_addr, 2'h0}) & ~io_pmp_4_mask) == 32'h0
                       : io_pmp_4_cfg_a[0] & io_addr >= {io_pmp_3_addr, 2'h0}
                         & io_addr < {io_pmp_4_addr, 2'h0})
                      ? io_pmp_4_cfg_x | io_prv[1] & ~io_pmp_4_cfg_l
                      : (io_pmp_5_cfg_a[1]
                           ? ((io_addr ^ {io_pmp_5_addr, 2'h0}) & ~io_pmp_5_mask) == 32'h0
                           : io_pmp_5_cfg_a[0] & io_addr >= {io_pmp_4_addr, 2'h0}
                             & io_addr < {io_pmp_5_addr, 2'h0})
                          ? io_pmp_5_cfg_x | io_prv[1] & ~io_pmp_5_cfg_l
                          : (io_pmp_6_cfg_a[1]
                               ? ((io_addr ^ {io_pmp_6_addr, 2'h0})
                                  & ~io_pmp_6_mask) == 32'h0
                               : io_pmp_6_cfg_a[0] & io_addr >= {io_pmp_5_addr, 2'h0}
                                 & io_addr < {io_pmp_6_addr, 2'h0})
                              ? io_pmp_6_cfg_x | io_prv[1] & ~io_pmp_6_cfg_l
                              : (io_pmp_7_cfg_a[1]
                                   ? ((io_addr ^ {io_pmp_7_addr, 2'h0})
                                      & ~io_pmp_7_mask) == 32'h0
                                   : io_pmp_7_cfg_a[0] & io_addr >= {io_pmp_6_addr, 2'h0}
                                     & io_addr < {io_pmp_7_addr, 2'h0})
                                  ? io_pmp_7_cfg_x | io_prv[1] & ~io_pmp_7_cfg_l
                                  : io_prv[1];	// PMP.scala:45:20, :46:26, :60:36, :63:{47,52,54,58}, :77:9, :132:{8,61}, :155:56, :163:{26,29}, :183:40, :184:8
endmodule

