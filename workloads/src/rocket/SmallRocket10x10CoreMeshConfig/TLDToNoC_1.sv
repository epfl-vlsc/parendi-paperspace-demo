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

module TLDToNoC_1(
  input         clock,
                reset,
                io_protocol_valid,
  input  [2:0]  io_protocol_bits_opcode,
  input  [1:0]  io_protocol_bits_param,
  input  [3:0]  io_protocol_bits_size,
  input  [8:0]  io_protocol_bits_source,
  input  [2:0]  io_protocol_bits_sink,
  input         io_protocol_bits_denied,
  input  [63:0] io_protocol_bits_data,
  input         io_protocol_bits_corrupt,
                io_flit_ready,
  output        io_protocol_ready,
                io_flit_valid,
                io_flit_bits_head,
                io_flit_bits_tail,
  output [64:0] io_flit_bits_payload,
  output [7:0]  io_flit_bits_egress_id
);

  wire        _q_io_deq_valid;	// Tilelink.scala:45:17
  wire [2:0]  _q_io_deq_bits_opcode;	// Tilelink.scala:45:17
  wire [1:0]  _q_io_deq_bits_param;	// Tilelink.scala:45:17
  wire [3:0]  _q_io_deq_bits_size;	// Tilelink.scala:45:17
  wire [8:0]  _q_io_deq_bits_source;	// Tilelink.scala:45:17
  wire [2:0]  _q_io_deq_bits_sink;	// Tilelink.scala:45:17
  wire        _q_io_deq_bits_denied;	// Tilelink.scala:45:17
  wire [63:0] _q_io_deq_bits_data;	// Tilelink.scala:45:17
  wire        _q_io_deq_bits_corrupt;	// Tilelink.scala:45:17
  wire [20:0] _GEN = {17'h0, _q_io_deq_bits_size};	// Tilelink.scala:45:17, package.scala:235:71
  reg  [2:0]  head_counter;	// Edges.scala:229:27
  wire        head = head_counter == 3'h0;	// Edges.scala:229:27, :231:25
  wire [20:0] _tail_beats1_decode_T_1 = 21'h3F << _GEN;	// package.scala:235:71
  reg  [2:0]  tail_counter;	// Edges.scala:229:27
  reg         is_body;	// Tilelink.scala:59:24
  wire        _q_io_deq_ready_T_2 =
    io_flit_ready & (is_body | ~(_q_io_deq_bits_opcode[0]));	// Edges.scala:106:36, Tilelink.scala:45:17, :59:24, :61:{35,47,50}
  wire        _io_flit_bits_head_output = head & ~is_body;	// Edges.scala:231:25, Tilelink.scala:59:24, :63:{35,38}
  wire        _io_flit_bits_tail_output =
    (tail_counter == 3'h1
     | (_q_io_deq_bits_opcode[0] ? ~(_tail_beats1_decode_T_1[5:3]) : 3'h0) == 3'h0)
    & (is_body | ~(_q_io_deq_bits_opcode[0]));	// Edges.scala:106:36, :221:14, :229:27, :232:{25,33,43}, Tilelink.scala:45:17, :59:24, :61:50, :64:{35,47}, package.scala:235:{46,71,76}
  wire [7:0]  _GEN_0 =
    {1'h0,
     {1'h0,
      {1'h0,
       {1'h0,
        {1'h0,
         {1'h0,
          {1'h0, _q_io_deq_bits_source[8:2] == 7'h60}
            | {2{_q_io_deq_bits_source[8:2] == 7'h5F}}}
           | (_q_io_deq_bits_source[8:2] == 7'h5E ? 3'h5 : 3'h0)
           | {3{_q_io_deq_bits_source[8:2] == 7'h5D}}}
          | (_q_io_deq_bits_source[8:2] == 7'h5C ? 4'h9 : 4'h0)
          | (_q_io_deq_bits_source[8:2] == 7'h5B ? 4'hB : 4'h0)
          | (_q_io_deq_bits_source[8:2] == 7'h5A ? 4'hD : 4'h0)
          | {4{_q_io_deq_bits_source[8:2] == 7'h59}}}
         | (_q_io_deq_bits_source[8:2] == 7'h58 ? 5'h11 : 5'h0)
         | (_q_io_deq_bits_source[8:2] == 7'h57 ? 5'h13 : 5'h0)
         | (_q_io_deq_bits_source[8:2] == 7'h56 ? 5'h15 : 5'h0)
         | (_q_io_deq_bits_source[8:2] == 7'h55 ? 5'h17 : 5'h0)
         | (_q_io_deq_bits_source[8:2] == 7'h54 ? 5'h19 : 5'h0)
         | (_q_io_deq_bits_source[8:2] == 7'h53 ? 5'h1B : 5'h0)
         | (_q_io_deq_bits_source[8:2] == 7'h52 ? 5'h1D : 5'h0)
         | {5{_q_io_deq_bits_source[8:2] == 7'h51}}}
        | (_q_io_deq_bits_source[8:2] == 7'h50 ? 6'h21 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h4F ? 6'h23 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h4E ? 6'h25 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h4D ? 6'h27 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h4C ? 6'h29 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h4B ? 6'h2B : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h4A ? 6'h2D : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h49 ? 6'h2F : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h48 ? 6'h31 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h47 ? 6'h33 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h46 ? 6'h35 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h45 ? 6'h37 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h44 ? 6'h39 : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h43 ? 6'h3B : 6'h0)
        | (_q_io_deq_bits_source[8:2] == 7'h42 ? 6'h3D : 6'h0)
        | {6{_q_io_deq_bits_source[8:2] == 7'h41}}}
       | (_q_io_deq_bits_source[8:2] == 7'h40 ? 7'h41 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h3F ? 7'h43 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h3E ? 7'h45 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h3D ? 7'h47 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h3C ? 7'h49 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h3B ? 7'h4B : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h3A ? 7'h4D : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h39 ? 7'h4F : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h38 ? 7'h51 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h37 ? 7'h53 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h36 ? 7'h55 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h35 ? 7'h57 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h34 ? 7'h59 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h33 ? 7'h5B : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h32 ? 7'h5D : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h31 ? 7'h5F : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h30 ? 7'h61 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h2F ? 7'h63 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h2E ? 7'h65 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h2D ? 7'h67 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h2C ? 7'h69 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h2B ? 7'h6B : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h2A ? 7'h6D : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h29 ? 7'h6F : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h28 ? 7'h71 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h27 ? 7'h73 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h26 ? 7'h75 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h25 ? 7'h77 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h24 ? 7'h79 : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h23 ? 7'h7B : 7'h0)
       | (_q_io_deq_bits_source[8:2] == 7'h22 ? 7'h7D : 7'h0)
       | {7{_q_io_deq_bits_source[8:2] == 7'h21}}}
    | (_q_io_deq_bits_source[8:2] == 7'h20 ? 8'h81 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h1F ? 8'h83 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h1E ? 8'h85 : 8'h0);	// Edges.scala:221:14, :229:27, Mux.scala:27:73, Parameters.scala:54:{10,32}, Tilelink.scala:45:17
  wire [20:0] _head_beats1_decode_T_1 = 21'h3F << _GEN;	// package.scala:235:71
  wire        _T_2 = io_flit_ready & _q_io_deq_valid;	// Decoupled.scala:51:35, Tilelink.scala:45:17
  always @(posedge clock) begin
    if (reset) begin
      head_counter <= 3'h0;	// Edges.scala:229:27
      tail_counter <= 3'h0;	// Edges.scala:229:27
      is_body <= 1'h0;	// Edges.scala:221:14, Tilelink.scala:59:24
    end
    else begin
      if (_q_io_deq_ready_T_2 & _q_io_deq_valid) begin	// Decoupled.scala:51:35, Tilelink.scala:45:17, :61:35
        if (head) begin	// Edges.scala:231:25
          if (_q_io_deq_bits_opcode[0])	// Edges.scala:106:36, Tilelink.scala:45:17
            head_counter <= ~(_head_beats1_decode_T_1[5:3]);	// Edges.scala:229:27, package.scala:235:{46,71,76}
          else	// Edges.scala:106:36
            head_counter <= 3'h0;	// Edges.scala:229:27
        end
        else	// Edges.scala:231:25
          head_counter <= head_counter - 3'h1;	// Edges.scala:229:27, :230:28
        if (tail_counter == 3'h0) begin	// Edges.scala:229:27, :231:25
          if (_q_io_deq_bits_opcode[0])	// Edges.scala:106:36, Tilelink.scala:45:17
            tail_counter <= ~(_tail_beats1_decode_T_1[5:3]);	// Edges.scala:229:27, package.scala:235:{46,71,76}
          else	// Edges.scala:106:36
            tail_counter <= 3'h0;	// Edges.scala:229:27
        end
        else	// Edges.scala:231:25
          tail_counter <= tail_counter - 3'h1;	// Edges.scala:229:27, :230:28
      end
      is_body <=
        ~(_T_2 & _io_flit_bits_tail_output)
        & (_T_2 & _io_flit_bits_head_output | is_body);	// Decoupled.scala:51:35, Tilelink.scala:59:24, :63:35, :64:35, :70:{24,46,56}, :71:{24,46,56}
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
        head_counter = _RANDOM_0[2:0];	// Edges.scala:229:27
        tail_counter = _RANDOM_0[5:3];	// Edges.scala:229:27
        is_body = _RANDOM_0[6];	// Edges.scala:229:27, Tilelink.scala:59:24
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  Queue_3853 q (	// Tilelink.scala:45:17
    .clock               (clock),
    .reset               (reset),
    .io_enq_valid        (io_protocol_valid),
    .io_enq_bits_opcode  (io_protocol_bits_opcode),
    .io_enq_bits_param   (io_protocol_bits_param),
    .io_enq_bits_size    (io_protocol_bits_size),
    .io_enq_bits_source  (io_protocol_bits_source),
    .io_enq_bits_sink    (io_protocol_bits_sink),
    .io_enq_bits_denied  (io_protocol_bits_denied),
    .io_enq_bits_data    (io_protocol_bits_data),
    .io_enq_bits_corrupt (io_protocol_bits_corrupt),
    .io_deq_ready        (_q_io_deq_ready_T_2),	// Tilelink.scala:61:35
    .io_enq_ready        (io_protocol_ready),
    .io_deq_valid        (_q_io_deq_valid),
    .io_deq_bits_opcode  (_q_io_deq_bits_opcode),
    .io_deq_bits_param   (_q_io_deq_bits_param),
    .io_deq_bits_size    (_q_io_deq_bits_size),
    .io_deq_bits_source  (_q_io_deq_bits_source),
    .io_deq_bits_sink    (_q_io_deq_bits_sink),
    .io_deq_bits_denied  (_q_io_deq_bits_denied),
    .io_deq_bits_data    (_q_io_deq_bits_data),
    .io_deq_bits_corrupt (_q_io_deq_bits_corrupt)
  );
  assign io_flit_valid = _q_io_deq_valid;	// Tilelink.scala:45:17
  assign io_flit_bits_head = _io_flit_bits_head_output;	// Tilelink.scala:63:35
  assign io_flit_bits_tail = _io_flit_bits_tail_output;	// Tilelink.scala:64:35
  assign io_flit_bits_payload =
    is_body
      ? {_q_io_deq_bits_data, _q_io_deq_bits_corrupt}
      : {43'h0,
         _q_io_deq_bits_opcode,
         _q_io_deq_bits_param,
         _q_io_deq_bits_size,
         _q_io_deq_bits_source,
         _q_io_deq_bits_sink,
         _q_io_deq_bits_denied};	// Cat.scala:33:92, Tilelink.scala:45:17, :59:24, :68:33
  assign io_flit_bits_egress_id =
    _GEN_0 | (_q_io_deq_bits_source[8:2] == 7'h1D ? 8'h87 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h1C ? 8'h89 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h1B ? 8'h8B : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h1A ? 8'h8D : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h19 ? 8'h8F : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h18 ? 8'h91 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h17 ? 8'h93 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h16 ? 8'h95 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h15 ? 8'h97 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h14 ? 8'h99 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h13 ? 8'h9B : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h12 ? 8'h9D : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h11 ? 8'h9F : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h10 ? 8'hA1 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'hF ? 8'hA3 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'hE ? 8'hA5 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'hD ? 8'hA7 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'hC ? 8'hA9 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'hB ? 8'hAB : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'hA ? 8'hAD : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h9 ? 8'hAF : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h8 ? 8'hB1 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h7 ? 8'hB3 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h6 ? 8'hB5 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h5 ? 8'hB7 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h4 ? 8'hB9 : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h3 ? 8'hBB : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h2 ? 8'hBD : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h1 ? 8'hBF : 8'h0)
    | (_q_io_deq_bits_source[8:2] == 7'h0 ? 8'hC1 : 8'h0);	// Mux.scala:27:73, Parameters.scala:54:{10,32}, Tilelink.scala:45:17
endmodule

