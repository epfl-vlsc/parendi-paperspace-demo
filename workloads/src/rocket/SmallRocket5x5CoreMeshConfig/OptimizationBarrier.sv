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

module OptimizationBarrier(
  input  io_x_u,
         io_x_ae_ptw,
         io_x_ae_final,
         io_x_pf,
         io_x_gf,
         io_x_sw,
         io_x_sx,
         io_x_sr,
         io_x_pw,
         io_x_px,
         io_x_pr,
         io_x_ppp,
         io_x_pal,
         io_x_paa,
         io_x_eff,
         io_x_c,
  output io_y_u,
         io_y_ae_ptw,
         io_y_ae_final,
         io_y_pf,
         io_y_gf,
         io_y_sw,
         io_y_sx,
         io_y_sr,
         io_y_pw,
         io_y_px,
         io_y_pr,
         io_y_ppp,
         io_y_pal,
         io_y_paa,
         io_y_eff,
         io_y_c
);

  assign io_y_u = io_x_u;
  assign io_y_ae_ptw = io_x_ae_ptw;
  assign io_y_ae_final = io_x_ae_final;
  assign io_y_pf = io_x_pf;
  assign io_y_gf = io_x_gf;
  assign io_y_sw = io_x_sw;
  assign io_y_sx = io_x_sx;
  assign io_y_sr = io_x_sr;
  assign io_y_pw = io_x_pw;
  assign io_y_px = io_x_px;
  assign io_y_pr = io_x_pr;
  assign io_y_ppp = io_x_ppp;
  assign io_y_pal = io_x_pal;
  assign io_y_paa = io_x_paa;
  assign io_y_eff = io_x_eff;
  assign io_y_c = io_x_c;
endmodule

