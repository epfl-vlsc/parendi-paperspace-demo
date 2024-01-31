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

module Queue_18(
  input         clock,
                reset,
                io_enq_valid,
  input  [63:0] io_enq_bits_data,
  input         io_deq_ready,
  output        io_enq_ready,
                io_deq_valid,
  output [63:0] io_deq_bits_data
);

  wire [63:0] _ram_data_ext_R0_data;	// @[Decoupled.scala:273:95]
  reg  [1:0]  enq_ptr_value;	// @[Counter.scala:61:40]
  reg  [1:0]  deq_ptr_value;	// @[Counter.scala:61:40]
  reg         maybe_full;	// @[Decoupled.scala:276:27]
  wire        ptr_match = enq_ptr_value == deq_ptr_value;	// @[Counter.scala:61:40, Decoupled.scala:277:33]
  wire        empty = ptr_match & ~maybe_full;	// @[Decoupled.scala:276:27, :277:33, :278:{25,28}]
  wire        full = ptr_match & maybe_full;	// @[Decoupled.scala:276:27, :277:33, :279:24]
  wire        _io_deq_valid_output = io_enq_valid | ~empty;	// @[Decoupled.scala:278:25, :302:{16,19}, :314:{24,39}]
  wire        do_deq = ~empty & io_deq_ready & _io_deq_valid_output;	// @[Decoupled.scala:278:25, :281:27, :302:16, :314:{24,39}, :315:17, :317:14]
  wire        do_enq = ~(empty & io_deq_ready) & ~full & io_enq_valid;	// @[Decoupled.scala:278:25, :279:24, :280:27, :303:19, :315:17, :318:{26,35}]
  always @(posedge clock) begin
    if (reset) begin
      enq_ptr_value <= 2'h0;	// @[Counter.scala:61:40]
      deq_ptr_value <= 2'h0;	// @[Counter.scala:61:40]
      maybe_full <= 1'h0;	// @[Decoupled.scala:276:27]
    end
    else begin
      if (do_enq) begin	// @[Decoupled.scala:280:27, :315:17, :318:{26,35}]
        if (enq_ptr_value == 2'h2)	// @[Counter.scala:61:40, :73:24]
          enq_ptr_value <= 2'h0;	// @[Counter.scala:61:40]
        else	// @[Counter.scala:73:24]
          enq_ptr_value <= enq_ptr_value + 2'h1;	// @[Counter.scala:61:40, :77:24]
      end
      if (do_deq) begin	// @[Decoupled.scala:281:27, :315:17, :317:14]
        if (deq_ptr_value == 2'h2)	// @[Counter.scala:61:40, :73:24]
          deq_ptr_value <= 2'h0;	// @[Counter.scala:61:40]
        else	// @[Counter.scala:73:24]
          deq_ptr_value <= deq_ptr_value + 2'h1;	// @[Counter.scala:61:40, :77:24]
      end
      if (do_enq != do_deq)	// @[Decoupled.scala:280:27, :281:27, :293:15, :315:17, :317:14, :318:{26,35}]
        maybe_full <= do_enq;	// @[Decoupled.scala:276:27, :280:27, :315:17, :318:{26,35}]
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
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
        enq_ptr_value = _RANDOM_0[1:0];	// @[Counter.scala:61:40]
        deq_ptr_value = _RANDOM_0[3:2];	// @[Counter.scala:61:40]
        maybe_full = _RANDOM_0[4];	// @[Counter.scala:61:40, Decoupled.scala:276:27]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  ram_data_combMem ram_data_ext (	// @[Decoupled.scala:273:95]
    .R0_addr (deq_ptr_value),	// @[Counter.scala:61:40]
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .W0_addr (enq_ptr_value),	// @[Counter.scala:61:40]
    .W0_en   (do_enq),	// @[Decoupled.scala:280:27, :315:17, :318:{26,35}]
    .W0_clk  (clock),
    .W0_data (io_enq_bits_data),
    .R0_data (_ram_data_ext_R0_data)
  );
  assign io_enq_ready = ~full;	// @[Decoupled.scala:279:24, :303:19]
  assign io_deq_valid = _io_deq_valid_output;	// @[Decoupled.scala:302:16, :314:{24,39}]
  assign io_deq_bits_data = empty ? io_enq_bits_data : _ram_data_ext_R0_data;	// @[Decoupled.scala:273:95, :278:25, :310:17, :315:17, :316:19]
endmodule

