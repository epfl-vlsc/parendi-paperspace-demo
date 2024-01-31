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

module TLCFromNoC_1(
  input         clock,
                reset,
                io_protocol_ready,
                io_flit_valid,
                io_flit_bits_head,
                io_flit_bits_tail,
  input  [64:0] io_flit_bits_payload,
  output        io_protocol_valid,
  output [2:0]  io_protocol_bits_opcode,
                io_protocol_bits_param,
  output [3:0]  io_protocol_bits_size,
  output [5:0]  io_protocol_bits_source,
  output [31:0] io_protocol_bits_address,
  output [63:0] io_protocol_bits_data,
  output        io_protocol_bits_corrupt,
                io_flit_ready
);

  reg         is_const;	// @[Tilelink.scala:85:25]
  reg  [47:0] const_reg;	// @[Tilelink.scala:86:22]
  wire [47:0] _GEN = io_flit_bits_head ? io_flit_bits_payload[47:0] : const_reg;	// @[Tilelink.scala:86:22, :87:18]
  wire        _io_flit_ready_output = is_const & ~io_flit_bits_tail | io_protocol_ready;	// @[Tilelink.scala:85:25, :88:{30,33,53}]
  wire        _T_11 = _io_flit_ready_output & io_flit_valid;	// @[Decoupled.scala:51:35, Tilelink.scala:88:53]
  wire        _T_10 = _T_11 & io_flit_bits_head;	// @[Decoupled.scala:51:35, Tilelink.scala:101:24]
  always @(posedge clock) begin
    if (reset)
      is_const <= 1'h1;	// @[Tilelink.scala:85:25]
    else
      is_const <= _T_11 & io_flit_bits_tail | ~_T_10 & is_const;	// @[Decoupled.scala:51:35, Tilelink.scala:85:25, :101:{24,46,57}, :102:{24,46,57}]
    if (_T_10)	// @[Tilelink.scala:101:24]
      const_reg <= io_flit_bits_payload[47:0];	// @[Tilelink.scala:86:22]
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    logic [31:0] _RANDOM_1;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        _RANDOM_1 = `RANDOM;
        is_const = _RANDOM_0[0];	// @[Tilelink.scala:85:25]
        const_reg = {_RANDOM_0[31:1], _RANDOM_1[16:0]};	// @[Tilelink.scala:85:25, :86:22]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_protocol_valid = (~is_const | io_flit_bits_tail) & io_flit_valid;	// @[Tilelink.scala:85:25, :89:{25,35,57}]
  assign io_protocol_bits_opcode = _GEN[47:45];	// @[Tilelink.scala:87:18, :94:22, :95:13]
  assign io_protocol_bits_param = _GEN[44:42];	// @[Tilelink.scala:87:18, :94:22, :95:13]
  assign io_protocol_bits_size = _GEN[41:38];	// @[Tilelink.scala:87:18, :94:22, :95:13]
  assign io_protocol_bits_source = _GEN[37:32];	// @[Tilelink.scala:87:18, :94:22, :95:13]
  assign io_protocol_bits_address = _GEN[31:0];	// @[Tilelink.scala:87:18, :94:22]
  assign io_protocol_bits_data = io_flit_bits_payload[64:1];	// @[Tilelink.scala:95:13]
  assign io_protocol_bits_corrupt = io_flit_bits_payload[0];	// @[Tilelink.scala:94:22]
  assign io_flit_ready = _io_flit_ready_output;	// @[Tilelink.scala:88:53]
endmodule

