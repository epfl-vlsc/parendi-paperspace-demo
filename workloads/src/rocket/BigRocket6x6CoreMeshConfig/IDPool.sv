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

module IDPool(
  input        clock,
               reset,
               io_free_valid,
  input  [2:0] io_free_bits,
  input        io_alloc_ready,
  output       io_alloc_valid,
  output [2:0] io_alloc_bits
);

  reg  [7:0] bitmap;	// @[IDPool.scala:18:23]
  reg  [2:0] select;	// @[IDPool.scala:19:23]
  reg        valid;	// @[IDPool.scala:20:23]
  wire [7:0] taken = io_alloc_ready ? 8'h1 << select : 8'h0;	// @[IDPool.scala:19:23, :25:19, OneHot.scala:64:12]
  wire [7:0] _GEN = {5'h0, io_free_bits};	// @[OneHot.scala:64:12]
  reg        REG;	// @[IDPool.scala:51:36]
  wire [7:0] bitmap1 = bitmap & ~taken | (io_free_valid ? 8'h1 << _GEN : 8'h0);	// @[IDPool.scala:18:23, :25:19, :26:19, :27:{25,27,35}, OneHot.scala:64:12]
  always @(posedge clock) begin
    if (reset) begin
      bitmap <= 8'hFF;	// @[IDPool.scala:18:{23,55}]
      select <= 3'h0;	// @[IDPool.scala:19:23]
      valid <= 1'h1;	// @[IDPool.scala:20:23]
    end
    else begin
      if (io_alloc_ready | io_free_valid) begin	// @[IDPool.scala:33:24]
        bitmap <= bitmap1;	// @[IDPool.scala:18:23, :27:35]
        valid <= (|bitmap) & ~({1'h0, {1'h0, {1'h0, bitmap[0]} + {1'h0, bitmap[1]}} + {1'h0, {1'h0, bitmap[2]} + {1'h0, bitmap[3]}}} + {1'h0, {1'h0, {1'h0, bitmap[4]} + {1'h0, bitmap[5]}} + {1'h0, {1'h0, bitmap[6]} + {1'h0, bitmap[7]}}} == 4'h1 & io_alloc_ready) | io_free_valid;	// @[Bitwise.scala:51:90, :53:100, IDPool.scala:18:23, :20:23, :29:{28,32,35,55,64}, :30:17]
      end
      if (io_alloc_ready | ~valid & io_free_valid) begin	// @[IDPool.scala:20:23, :39:{24,28,44}]
        if (bitmap1[0])	// @[IDPool.scala:27:35, OneHot.scala:47:45]
          select <= 3'h0;	// @[IDPool.scala:19:23]
        else if (bitmap1[1])	// @[IDPool.scala:27:35, OneHot.scala:47:45]
          select <= 3'h1;	// @[IDPool.scala:19:23, Mux.scala:47:70]
        else if (bitmap1[2])	// @[IDPool.scala:27:35, OneHot.scala:47:45]
          select <= 3'h2;	// @[IDPool.scala:19:23, Mux.scala:47:70]
        else if (bitmap1[3])	// @[IDPool.scala:27:35, OneHot.scala:47:45]
          select <= 3'h3;	// @[IDPool.scala:19:23, Mux.scala:47:70]
        else if (bitmap1[4])	// @[IDPool.scala:27:35, OneHot.scala:47:45]
          select <= 3'h4;	// @[IDPool.scala:19:23, Mux.scala:47:70]
        else if (bitmap1[5])	// @[IDPool.scala:27:35, OneHot.scala:47:45]
          select <= 3'h5;	// @[IDPool.scala:19:23, Mux.scala:47:70]
        else	// @[OneHot.scala:47:45]
          select <= {2'h3, ~(bitmap1[6])};	// @[IDPool.scala:19:23, :27:35, Mux.scala:47:70, OneHot.scala:47:45]
      end
    end
    REG <= io_alloc_ready | ~valid & io_free_valid;	// @[IDPool.scala:20:23, :39:28, :51:{36,52,72}]
  end // always @(posedge)
  `ifndef SYNTHESIS
    wire  [7:0]  _T_7 = (bitmap & ~taken) >> _GEN;	// @[IDPool.scala:18:23, :25:19, :27:27, :44:{38,47}, OneHot.scala:64:12]
    always @(posedge clock) begin	// @[IDPool.scala:44:10]
      if (~reset & ~(~io_free_valid | ~(_T_7[0]))) begin	// @[IDPool.scala:44:{10,11,26,29,47}]
        if (`ASSERT_VERBOSE_COND_)	// @[IDPool.scala:44:10]
          $error("Assertion failed\n    at IDPool.scala:44 assert (!io.free.valid || !(bitmap & ~taken)(io.free.bits))\n");	// @[IDPool.scala:44:10]
        if (`STOP_COND_)	// @[IDPool.scala:44:10]
          $fatal;	// @[IDPool.scala:44:10]
      end
      if (~reset & valid != (|bitmap)) begin	// @[IDPool.scala:18:23, :20:23, :29:28, :48:{12,19}]
        if (`ASSERT_VERBOSE_COND_)	// @[IDPool.scala:48:12]
          $error("Assertion failed\n    at IDPool.scala:48 assert (valid === bitmap.orR)\n");	// @[IDPool.scala:48:12]
        if (`STOP_COND_)	// @[IDPool.scala:48:12]
          $fatal;	// @[IDPool.scala:48:12]
      end
      if (valid & REG & ~reset & select != (bitmap[0] ? 3'h0 : bitmap[1] ? 3'h1 : bitmap[2] ? 3'h2 : bitmap[3] ? 3'h3 : bitmap[4] ? 3'h4 : bitmap[5] ? 3'h5 : {2'h3, ~(bitmap[6])})) begin	// @[Bitwise.scala:53:100, IDPool.scala:18:23, :19:23, :20:23, :51:36, :52:{14,22}, Mux.scala:47:70]
        if (`ASSERT_VERBOSE_COND_)	// @[IDPool.scala:52:14]
          $error("Assertion failed\n    at IDPool.scala:52 assert (select === PriorityEncoder(bitmap))\n");	// @[IDPool.scala:52:14]
        if (`STOP_COND_)	// @[IDPool.scala:52:14]
          $fatal;	// @[IDPool.scala:52:14]
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
        bitmap = _RANDOM_0[7:0];	// @[IDPool.scala:18:23]
        select = _RANDOM_0[10:8];	// @[IDPool.scala:18:23, :19:23]
        valid = _RANDOM_0[11];	// @[IDPool.scala:18:23, :20:23]
        REG = _RANDOM_0[12];	// @[IDPool.scala:18:23, :51:36]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_alloc_valid = valid;	// @[IDPool.scala:20:23]
  assign io_alloc_bits = select;	// @[IDPool.scala:19:23]
endmodule

