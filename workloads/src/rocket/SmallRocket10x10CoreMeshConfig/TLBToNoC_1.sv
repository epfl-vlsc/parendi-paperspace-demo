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

module TLBToNoC_1(
  input         clock,
                reset,
                io_protocol_valid,
  input  [2:0]  io_protocol_bits_opcode,
  input  [1:0]  io_protocol_bits_param,
  input  [3:0]  io_protocol_bits_size,
  input  [8:0]  io_protocol_bits_source,
  input  [31:0] io_protocol_bits_address,
  input  [7:0]  io_protocol_bits_mask,
  input         io_flit_ready,
  output        io_protocol_ready,
                io_flit_valid,
                io_flit_bits_head,
                io_flit_bits_tail,
  output [72:0] io_flit_bits_payload,
  output [7:0]  io_flit_bits_egress_id
);

  wire        _q_io_deq_valid;	// Tilelink.scala:45:17
  wire [2:0]  _q_io_deq_bits_opcode;	// Tilelink.scala:45:17
  wire [1:0]  _q_io_deq_bits_param;	// Tilelink.scala:45:17
  wire [3:0]  _q_io_deq_bits_size;	// Tilelink.scala:45:17
  wire [8:0]  _q_io_deq_bits_source;	// Tilelink.scala:45:17
  wire [31:0] _q_io_deq_bits_address;	// Tilelink.scala:45:17
  wire [7:0]  _q_io_deq_bits_mask;	// Tilelink.scala:45:17
  wire [63:0] _q_io_deq_bits_data;	// Tilelink.scala:45:17
  wire        _q_io_deq_bits_corrupt;	// Tilelink.scala:45:17
  reg         is_body;	// Tilelink.scala:59:24
  wire        _io_flit_bits_tail_output = is_body | (&_q_io_deq_bits_mask);	// Tilelink.scala:45:17, :59:24, :64:47, :152:70
  wire [7:0]  _GEN =
    {_q_io_deq_bits_source[8:2] == 7'h20,
     {_q_io_deq_bits_source[8:2] == 7'h40,
      {_q_io_deq_bits_source[8:2] == 7'h50,
       {_q_io_deq_bits_source[8:2] == 7'h58,
        {_q_io_deq_bits_source[8:2] == 7'h5C,
         {_q_io_deq_bits_source[8:2] == 7'h5E, _q_io_deq_bits_source[8:2] == 7'h5F, 1'h0}
           | (_q_io_deq_bits_source[8:2] == 7'h5D ? 3'h6 : 3'h0)}
          | (_q_io_deq_bits_source[8:2] == 7'h5B ? 4'hA : 4'h0)
          | (_q_io_deq_bits_source[8:2] == 7'h5A ? 4'hC : 4'h0)
          | (_q_io_deq_bits_source[8:2] == 7'h59 ? 4'hE : 4'h0)}
         | (_q_io_deq_bits_source[8:2] == 7'h57 ? 5'h12 : 5'h0)
         | (_q_io_deq_bits_source[8:2] == 7'h56 ? 5'h14 : 5'h0)
         | (_q_io_deq_bits_source[8:2] == 7'h55 ? 5'h16 : 5'h0)
         | (_q_io_deq_bits_source[8:2] == 7'h54 ? 5'h18 : 5'h0)
         | (_q_io_deq_bits_source[8:2] == 7'h53 ? 5'h1A : 5'h0)
         | (_q_io_deq_bits_source[8:2] == 7'h52 ? 5'h1C : 5'h0)
         | (_q_io_deq_bits_source[8:2] == 7'h51 ? 5'h1E : 5'h0)}
        | (_q_io_deq_bits_source[8:2] == 7'h4F ? 6'h22 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h4E ? 6'h24 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h4D ? 6'h26 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h4C ? 6'h28 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h4B ? 6'h2A : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h4A ? 6'h2C : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h49 ? 6'h2E : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h48 ? 6'h30 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h47 ? 6'h32 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h46 ? 6'h34 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h45 ? 6'h36 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h44 ? 6'h38 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h43 ? 6'h3A : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h42 ? 6'h3C : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h41 ? 6'h3E : 6'h0)}
       | (_q_io_deq_bits_source[8:2] == 7'h3F ? 7'h42 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h3E ? 7'h44 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h3D ? 7'h46 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h3C ? 7'h48 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h3B ? 7'h4A : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h3A ? 7'h4C : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h39 ? 7'h4E : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h38 ? 7'h50 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h37 ? 7'h52 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h36 ? 7'h54 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h35 ? 7'h56 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h34 ? 7'h58 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h33 ? 7'h5A : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h32 ? 7'h5C : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h31 ? 7'h5E : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h30 ? 7'h60 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h2F ? 7'h62 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h2E ? 7'h64 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h2D ? 7'h66 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h2C ? 7'h68 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h2B ? 7'h6A : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h2A ? 7'h6C : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h29 ? 7'h6E : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h28 ? 7'h70 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h27 ? 7'h72 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h26 ? 7'h74 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h25 ? 7'h76 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h24 ? 7'h78 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h23 ? 7'h7A : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h22 ? 7'h7C : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h21 ? 7'h7E : 7'h0)}
    | (_q_io_deq_bits_source[8:2] == 7'h1F ? 8'h82 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h1E ? 8'h84 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h1D ? 8'h86 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h1C ? 8'h88 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h1B ? 8'h8A : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h1A ? 8'h8C : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h19 ? 8'h8E : 8'h0);	// Edges.scala:229:27, Mux.scala:27:73, Parameters.scala:54:{10,32}, Tilelink.scala:45:17
  wire        _T_2 = io_flit_ready & _q_io_deq_valid;	// Decoupled.scala:51:35, Tilelink.scala:45:17
  always @(posedge clock) begin
    if (reset)
      is_body <= 1'h0;	// Tilelink.scala:59:24
    else
      is_body <= ~(_T_2 & _io_flit_bits_tail_output) & (_T_2 & ~is_body | is_body);	// Decoupled.scala:51:35, Tilelink.scala:59:24, :63:38, :64:47, :70:{24,46,56}, :71:{24,46,56}
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
        is_body = _RANDOM_0[6];	// Tilelink.scala:59:24
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  Queue_3852 q (	// Tilelink.scala:45:17
    .clock               (clock),
    .reset               (reset),
    .io_enq_valid        (io_protocol_valid),
    .io_enq_bits_opcode  (io_protocol_bits_opcode),
    .io_enq_bits_param   (io_protocol_bits_param),
    .io_enq_bits_size    (io_protocol_bits_size),
    .io_enq_bits_source  (io_protocol_bits_source),
    .io_enq_bits_address (io_protocol_bits_address),
    .io_enq_bits_mask    (io_protocol_bits_mask),
    .io_deq_ready        (io_flit_ready & (is_body | (&_q_io_deq_bits_mask))),	// Tilelink.scala:45:17, :59:24, :61:{35,47}, :152:70
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
  assign io_flit_valid = _q_io_deq_valid;	// Tilelink.scala:45:17
  assign io_flit_bits_head = ~is_body;	// Tilelink.scala:59:24, :63:38
  assign io_flit_bits_tail = _io_flit_bits_tail_output;	// Tilelink.scala:64:47
  assign io_flit_bits_payload =
    is_body
      ? {_q_io_deq_bits_mask, _q_io_deq_bits_data, _q_io_deq_bits_corrupt}
      : {23'h0,
         _q_io_deq_bits_opcode,
         _q_io_deq_bits_param,
         _q_io_deq_bits_size,
         _q_io_deq_bits_source,
         _q_io_deq_bits_address};	// Cat.scala:33:92, Tilelink.scala:45:17, :59:24, :68:33
  assign io_flit_bits_egress_id =
    _GEN | (_q_io_deq_bits_source[8:2] == 7'h18 ? 8'h90 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h17 ? 8'h92 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h16 ? 8'h94 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h15 ? 8'h96 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h14 ? 8'h98 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h13 ? 8'h9A : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h12 ? 8'h9C : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h11 ? 8'h9E : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h10 ? 8'hA0 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'hF ? 8'hA2 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'hE ? 8'hA4 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'hD ? 8'hA6 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'hC ? 8'hA8 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'hB ? 8'hAA : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'hA ? 8'hAC : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h9 ? 8'hAE : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h8 ? 8'hB0 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h7 ? 8'hB2 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h6 ? 8'hB4 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h5 ? 8'hB6 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h4 ? 8'hB8 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h3 ? 8'hBA : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h2 ? 8'hBC : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h1 ? 8'hBE : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h0 ? 8'hC0 : 8'h0);	// Mux.scala:27:73, Parameters.scala:54:{10,32}, Tilelink.scala:45:17
endmodule

