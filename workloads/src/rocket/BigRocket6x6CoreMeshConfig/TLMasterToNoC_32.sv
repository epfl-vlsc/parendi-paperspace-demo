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

module TLMasterToNoC_32(
  input         clock,
                reset,
                io_tilelink_a_valid,
  input  [2:0]  io_tilelink_a_bits_opcode,
                io_tilelink_a_bits_param,
  input  [3:0]  io_tilelink_a_bits_size,
  input  [7:0]  io_tilelink_a_bits_source,
  input  [31:0] io_tilelink_a_bits_address,
  input  [7:0]  io_tilelink_a_bits_mask,
  input  [63:0] io_tilelink_a_bits_data,
  input         io_tilelink_a_bits_corrupt,
                io_tilelink_b_ready,
                io_tilelink_c_valid,
  input  [2:0]  io_tilelink_c_bits_opcode,
                io_tilelink_c_bits_param,
  input  [3:0]  io_tilelink_c_bits_size,
  input  [7:0]  io_tilelink_c_bits_source,
  input  [31:0] io_tilelink_c_bits_address,
  input  [63:0] io_tilelink_c_bits_data,
  input         io_tilelink_c_bits_corrupt,
                io_tilelink_d_ready,
                io_tilelink_e_valid,
  input  [2:0]  io_tilelink_e_bits_sink,
  input         io_flits_a_ready,
                io_flits_b_valid,
                io_flits_b_bits_head,
                io_flits_b_bits_tail,
  input  [72:0] io_flits_b_bits_payload,
  input         io_flits_c_ready,
                io_flits_d_valid,
                io_flits_d_bits_head,
                io_flits_d_bits_tail,
  input  [72:0] io_flits_d_bits_payload,
  input         io_flits_e_ready,
  output        io_tilelink_a_ready,
                io_tilelink_b_valid,
  output [2:0]  io_tilelink_b_bits_opcode,
  output [1:0]  io_tilelink_b_bits_param,
  output [3:0]  io_tilelink_b_bits_size,
  output [7:0]  io_tilelink_b_bits_source,
  output [31:0] io_tilelink_b_bits_address,
  output [7:0]  io_tilelink_b_bits_mask,
  output [63:0] io_tilelink_b_bits_data,
  output        io_tilelink_b_bits_corrupt,
                io_tilelink_c_ready,
                io_tilelink_d_valid,
  output [2:0]  io_tilelink_d_bits_opcode,
  output [1:0]  io_tilelink_d_bits_param,
  output [3:0]  io_tilelink_d_bits_size,
  output [7:0]  io_tilelink_d_bits_source,
  output [2:0]  io_tilelink_d_bits_sink,
  output        io_tilelink_d_bits_denied,
  output [63:0] io_tilelink_d_bits_data,
  output        io_tilelink_d_bits_corrupt,
                io_tilelink_e_ready,
                io_flits_a_valid,
                io_flits_a_bits_head,
                io_flits_a_bits_tail,
  output [72:0] io_flits_a_bits_payload,
  output [6:0]  io_flits_a_bits_egress_id,
  output        io_flits_b_ready,
                io_flits_c_valid,
                io_flits_c_bits_head,
                io_flits_c_bits_tail,
  output [72:0] io_flits_c_bits_payload,
  output        io_flits_d_ready,
                io_flits_e_valid,
                io_flits_e_bits_head,
  output [72:0] io_flits_e_bits_payload
);

  wire [2:0]  _e_io_flit_bits_payload;	// @[Tilelink.scala:225:17]
  wire [7:0]  _d_io_protocol_bits_source;	// @[Tilelink.scala:224:17]
  wire [64:0] _c_io_flit_bits_payload;	// @[Tilelink.scala:223:17]
  wire [7:0]  _b_io_protocol_bits_source;	// @[Tilelink.scala:222:17]
  TLAToNoC a (	// @[Tilelink.scala:221:17]
    .clock                    (clock),
    .reset                    (reset),
    .io_protocol_valid        (io_tilelink_a_valid),
    .io_protocol_bits_opcode  (io_tilelink_a_bits_opcode),
    .io_protocol_bits_param   (io_tilelink_a_bits_param),
    .io_protocol_bits_size    (io_tilelink_a_bits_size),
    .io_protocol_bits_source  (io_tilelink_a_bits_source),
    .io_protocol_bits_address (io_tilelink_a_bits_address),
    .io_protocol_bits_mask    (io_tilelink_a_bits_mask),
    .io_protocol_bits_data    (io_tilelink_a_bits_data),
    .io_protocol_bits_corrupt (io_tilelink_a_bits_corrupt),
    .io_flit_ready            (io_flits_a_ready),
    .io_protocol_ready        (io_tilelink_a_ready),
    .io_flit_valid            (io_flits_a_valid),
    .io_flit_bits_head        (io_flits_a_bits_head),
    .io_flit_bits_tail        (io_flits_a_bits_tail),
    .io_flit_bits_payload     (io_flits_a_bits_payload),
    .io_flit_bits_egress_id   (io_flits_a_bits_egress_id)
  );
  TLBFromNoC b (	// @[Tilelink.scala:222:17]
    .clock                    (clock),
    .reset                    (reset),
    .io_protocol_ready        (io_tilelink_b_ready),
    .io_flit_valid            (io_flits_b_valid),
    .io_flit_bits_head        (io_flits_b_bits_head),
    .io_flit_bits_tail        (io_flits_b_bits_tail),
    .io_flit_bits_payload     (io_flits_b_bits_payload),
    .io_protocol_valid        (io_tilelink_b_valid),
    .io_protocol_bits_opcode  (io_tilelink_b_bits_opcode),
    .io_protocol_bits_param   (io_tilelink_b_bits_param),
    .io_protocol_bits_size    (io_tilelink_b_bits_size),
    .io_protocol_bits_source  (_b_io_protocol_bits_source),
    .io_protocol_bits_address (io_tilelink_b_bits_address),
    .io_protocol_bits_mask    (io_tilelink_b_bits_mask),
    .io_protocol_bits_data    (io_tilelink_b_bits_data),
    .io_protocol_bits_corrupt (io_tilelink_b_bits_corrupt),
    .io_flit_ready            (io_flits_b_ready)
  );
  TLCToNoC c (	// @[Tilelink.scala:223:17]
    .clock                    (clock),
    .reset                    (reset),
    .io_protocol_valid        (io_tilelink_c_valid),
    .io_protocol_bits_opcode  (io_tilelink_c_bits_opcode),
    .io_protocol_bits_param   (io_tilelink_c_bits_param),
    .io_protocol_bits_size    (io_tilelink_c_bits_size),
    .io_protocol_bits_source  (io_tilelink_c_bits_source),
    .io_protocol_bits_address (io_tilelink_c_bits_address),
    .io_protocol_bits_data    (io_tilelink_c_bits_data),
    .io_protocol_bits_corrupt (io_tilelink_c_bits_corrupt),
    .io_flit_ready            (io_flits_c_ready),
    .io_protocol_ready        (io_tilelink_c_ready),
    .io_flit_valid            (io_flits_c_valid),
    .io_flit_bits_head        (io_flits_c_bits_head),
    .io_flit_bits_tail        (io_flits_c_bits_tail),
    .io_flit_bits_payload     (_c_io_flit_bits_payload)
  );
  TLDFromNoC d (	// @[Tilelink.scala:224:17]
    .clock                    (clock),
    .reset                    (reset),
    .io_protocol_ready        (io_tilelink_d_ready),
    .io_flit_valid            (io_flits_d_valid),
    .io_flit_bits_head        (io_flits_d_bits_head),
    .io_flit_bits_tail        (io_flits_d_bits_tail),
    .io_flit_bits_payload     (io_flits_d_bits_payload[64:0]),	// @[Tilelink.scala:239:14]
    .io_protocol_valid        (io_tilelink_d_valid),
    .io_protocol_bits_opcode  (io_tilelink_d_bits_opcode),
    .io_protocol_bits_param   (io_tilelink_d_bits_param),
    .io_protocol_bits_size    (io_tilelink_d_bits_size),
    .io_protocol_bits_source  (_d_io_protocol_bits_source),
    .io_protocol_bits_sink    (io_tilelink_d_bits_sink),
    .io_protocol_bits_denied  (io_tilelink_d_bits_denied),
    .io_protocol_bits_data    (io_tilelink_d_bits_data),
    .io_protocol_bits_corrupt (io_tilelink_d_bits_corrupt),
    .io_flit_ready            (io_flits_d_ready)
  );
  TLEToNoC e (	// @[Tilelink.scala:225:17]
    .clock                 (clock),
    .reset                 (reset),
    .io_protocol_valid     (io_tilelink_e_valid),
    .io_protocol_bits_sink (io_tilelink_e_bits_sink),
    .io_flit_ready         (io_flits_e_ready),
    .io_protocol_ready     (io_tilelink_e_ready),
    .io_flit_valid         (io_flits_e_valid),
    .io_flit_bits_head     (io_flits_e_bits_head),
    .io_flit_bits_payload  (_e_io_flit_bits_payload)
  );
  assign io_tilelink_b_bits_source = {6'h0, _b_io_protocol_bits_source[1:0]};	// @[Tilelink.scala:219:67, :222:17, :229:29]
  assign io_tilelink_d_bits_source = {6'h0, _d_io_protocol_bits_source[1:0]};	// @[Tilelink.scala:219:67, :224:17, :229:29, :233:29]
  assign io_flits_c_bits_payload = {8'h0, _c_io_flit_bits_payload};	// @[Tilelink.scala:223:17, :238:14]
  assign io_flits_e_bits_payload = {70'h0, _e_io_flit_bits_payload};	// @[Tilelink.scala:225:17, :240:14]
endmodule

