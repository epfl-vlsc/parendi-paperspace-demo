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

module TLAToNoC(
  input         clock,
                reset,
                io_protocol_valid,
  input  [2:0]  io_protocol_bits_opcode,
                io_protocol_bits_param,
  input  [3:0]  io_protocol_bits_size,
  input  [9:0]  io_protocol_bits_source,
  input  [31:0] io_protocol_bits_address,
  input  [7:0]  io_protocol_bits_mask,
  input  [63:0] io_protocol_bits_data,
  input         io_protocol_bits_corrupt,
                io_flit_ready,
  output        io_protocol_ready,
                io_flit_valid,
                io_flit_bits_head,
                io_flit_bits_tail,
  output [72:0] io_flit_bits_payload,
  output [8:0]  io_flit_bits_egress_id
);

  wire        has_body;	// @[Tilelink.scala:135:45]
  wire        _q_io_deq_valid;	// @[Tilelink.scala:45:17]
  wire [2:0]  _q_io_deq_bits_opcode;	// @[Tilelink.scala:45:17]
  wire [2:0]  _q_io_deq_bits_param;	// @[Tilelink.scala:45:17]
  wire [3:0]  _q_io_deq_bits_size;	// @[Tilelink.scala:45:17]
  wire [9:0]  _q_io_deq_bits_source;	// @[Tilelink.scala:45:17]
  wire [31:0] _q_io_deq_bits_address;	// @[Tilelink.scala:45:17]
  wire [7:0]  _q_io_deq_bits_mask;	// @[Tilelink.scala:45:17]
  wire [63:0] _q_io_deq_bits_data;	// @[Tilelink.scala:45:17]
  wire        _q_io_deq_bits_corrupt;	// @[Tilelink.scala:45:17]
  wire [26:0] _GEN = {23'h0, _q_io_deq_bits_size};	// @[Tilelink.scala:45:17, package.scala:235:71]
  reg  [8:0]  head_counter;	// @[Edges.scala:229:27]
  wire        head = head_counter == 9'h0;	// @[Edges.scala:229:27, :231:25]
  wire [26:0] _tail_beats1_decode_T_1 = 27'hFFF << _GEN;	// @[package.scala:235:71]
  reg  [8:0]  tail_counter;	// @[Edges.scala:229:27]
  reg         is_body;	// @[Tilelink.scala:59:24]
  wire        _q_io_deq_ready_T_2 = io_flit_ready & (is_body | ~has_body);	// @[Tilelink.scala:59:24, :61:{35,47,50}, :135:45]
  wire        _io_flit_bits_head_output = head & ~is_body;	// @[Edges.scala:231:25, Tilelink.scala:59:24, :63:{35,38}]
  wire        _io_flit_bits_tail_output = (tail_counter == 9'h1 | (_q_io_deq_bits_opcode[2] ? 9'h0 : ~(_tail_beats1_decode_T_1[11:3])) == 9'h0) & (is_body | ~has_body);	// @[Edges.scala:92:37, :221:14, :229:27, :232:{25,33,43}, Tilelink.scala:45:17, :59:24, :61:50, :64:{35,47}, :135:45, package.scala:235:{46,71,76}]
  assign has_body = ~(_q_io_deq_bits_opcode[2]) | _q_io_deq_bits_mask != 8'hFF;	// @[Edges.scala:92:{28,37}, Tilelink.scala:45:17, :135:{45,49,69}]
  wire [26:0] _head_beats1_decode_T_1 = 27'hFFF << _GEN;	// @[package.scala:235:71]
  wire        _T_2 = io_flit_ready & _q_io_deq_valid;	// @[Decoupled.scala:51:35, Tilelink.scala:45:17]
  always @(posedge clock) begin
    if (reset) begin
      head_counter <= 9'h0;	// @[Edges.scala:229:27]
      tail_counter <= 9'h0;	// @[Edges.scala:229:27]
      is_body <= 1'h0;	// @[Edges.scala:92:28, Tilelink.scala:59:24]
    end
    else begin
      if (_q_io_deq_ready_T_2 & _q_io_deq_valid) begin	// @[Decoupled.scala:51:35, Tilelink.scala:45:17, :61:35]
        if (head) begin	// @[Edges.scala:231:25]
          if (_q_io_deq_bits_opcode[2])	// @[Edges.scala:92:37, Tilelink.scala:45:17]
            head_counter <= 9'h0;	// @[Edges.scala:229:27]
          else	// @[Edges.scala:92:37]
            head_counter <= ~(_head_beats1_decode_T_1[11:3]);	// @[Edges.scala:229:27, package.scala:235:{46,71,76}]
        end
        else	// @[Edges.scala:231:25]
          head_counter <= head_counter - 9'h1;	// @[Edges.scala:229:27, :230:28]
        if (tail_counter == 9'h0) begin	// @[Edges.scala:229:27, :231:25]
          if (_q_io_deq_bits_opcode[2])	// @[Edges.scala:92:37, Tilelink.scala:45:17]
            tail_counter <= 9'h0;	// @[Edges.scala:229:27]
          else	// @[Edges.scala:92:37]
            tail_counter <= ~(_tail_beats1_decode_T_1[11:3]);	// @[Edges.scala:229:27, package.scala:235:{46,71,76}]
        end
        else	// @[Edges.scala:231:25]
          tail_counter <= tail_counter - 9'h1;	// @[Edges.scala:229:27, :230:28]
      end
      is_body <= ~(_T_2 & _io_flit_bits_tail_output) & (_T_2 & _io_flit_bits_head_output | is_body);	// @[Decoupled.scala:51:35, Tilelink.scala:59:24, :63:35, :64:35, :70:{24,46,56}, :71:{24,46,56}]
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
        head_counter = _RANDOM_0[8:0];	// @[Edges.scala:229:27]
        tail_counter = _RANDOM_0[17:9];	// @[Edges.scala:229:27]
        is_body = _RANDOM_0[18];	// @[Edges.scala:229:27, Tilelink.scala:59:24]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  Queue_5967 q (	// @[Tilelink.scala:45:17]
    .clock               (clock),
    .reset               (reset),
    .io_enq_valid        (io_protocol_valid),
    .io_enq_bits_opcode  (io_protocol_bits_opcode),
    .io_enq_bits_param   (io_protocol_bits_param),
    .io_enq_bits_size    (io_protocol_bits_size),
    .io_enq_bits_source  (io_protocol_bits_source),
    .io_enq_bits_address (io_protocol_bits_address),
    .io_enq_bits_mask    (io_protocol_bits_mask),
    .io_enq_bits_data    (io_protocol_bits_data),
    .io_enq_bits_corrupt (io_protocol_bits_corrupt),
    .io_deq_ready        (_q_io_deq_ready_T_2),	// @[Tilelink.scala:61:35]
    .io_enq_ready        (io_protocol_ready),
    .io_deq_valid        (_q_io_deq_valid),
    .io_deq_bits_opcode  (_q_io_deq_bits_opcode),
    .io_deq_bits_param   (_q_io_deq_bits_param),
    .io_deq_bits_size    (_q_io_deq_bits_size),
    .io_deq_bits_source  (_q_io_deq_bits_source),
    .io_deq_bits_address (_q_io_deq_bits_address),
    .io_deq_bits_mask    (_q_io_deq_bits_mask),
    .io_deq_bits_data    (_q_io_deq_bits_data),
    .io_deq_bits_corrupt (_q_io_deq_bits_corrupt)
  );
  assign io_flit_valid = _q_io_deq_valid;	// @[Tilelink.scala:45:17]
  assign io_flit_bits_head = _io_flit_bits_head_output;	// @[Tilelink.scala:63:35]
  assign io_flit_bits_tail = _io_flit_bits_tail_output;	// @[Tilelink.scala:64:35]
  assign io_flit_bits_payload = is_body ? {_q_io_deq_bits_mask, _q_io_deq_bits_data, _q_io_deq_bits_corrupt} : {21'h0, _q_io_deq_bits_opcode, _q_io_deq_bits_param, _q_io_deq_bits_size, _q_io_deq_bits_source, _q_io_deq_bits_address};	// @[Cat.scala:33:92, Tilelink.scala:45:17, :59:24, :68:33]
  assign io_flit_bits_egress_id = (_q_io_deq_bits_address[31:30] == 2'h0 ? 9'h14C : 9'h0) | (_q_io_deq_bits_address[31:30] == 2'h2 ? 9'h14F : 9'h0) | (_q_io_deq_bits_address[31:30] == 2'h1 ? 9'h152 : 9'h0);	// @[Edges.scala:229:27, Mux.scala:27:73, Parameters.scala:137:{31,45,65}, Tilelink.scala:45:17]
endmodule

