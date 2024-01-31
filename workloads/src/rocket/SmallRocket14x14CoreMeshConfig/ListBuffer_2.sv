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

module ListBuffer_2(
  input         clock,
                reset,
                io_push_valid,
  input  [4:0]  io_push_bits_index,
  input         io_push_bits_data_prio_0,
                io_push_bits_data_prio_2,
                io_push_bits_data_control,
  input  [2:0]  io_push_bits_data_opcode,
                io_push_bits_data_param,
                io_push_bits_data_size,
  input  [9:0]  io_push_bits_data_source,
  input  [3:0]  io_push_bits_data_tag,
  input  [5:0]  io_push_bits_data_offset,
                io_push_bits_data_put,
  input         io_pop_valid,
  input  [4:0]  io_pop_bits,
  output        io_push_ready,
  output [20:0] io_valid,
  output        io_data_prio_0,
                io_data_prio_1,
                io_data_prio_2,
                io_data_control,
  output [2:0]  io_data_opcode,
                io_data_param,
                io_data_size,
  output [9:0]  io_data_source,
  output [3:0]  io_data_tag,
  output [5:0]  io_data_offset,
                io_data_put
);

  wire [38:0] _data_ext_R0_data;	// @[ListBuffer.scala:51:18]
  wire [5:0]  _next_ext_R0_data;	// @[ListBuffer.scala:50:18]
  wire [5:0]  _tail_ext_R0_data;	// @[ListBuffer.scala:48:18]
  wire [5:0]  _tail_ext_R1_data;	// @[ListBuffer.scala:48:18]
  wire [5:0]  _head_ext_R0_data;	// @[ListBuffer.scala:47:18]
  reg  [20:0] valid;	// @[ListBuffer.scala:46:22]
  reg  [32:0] used;	// @[ListBuffer.scala:49:22]
  wire [32:0] _freeOH_T_22 = ~used;	// @[ListBuffer.scala:49:22, :53:25]
  wire [32:0] _freeOH_T_3 = _freeOH_T_22 | {_freeOH_T_22[31:0], 1'h0};	// @[ListBuffer.scala:53:25, package.scala:245:{43,53}]
  wire [32:0] _freeOH_T_6 = _freeOH_T_3 | {_freeOH_T_3[30:0], 2'h0};	// @[package.scala:245:{43,48,53}]
  wire [32:0] _freeOH_T_9 = _freeOH_T_6 | {_freeOH_T_6[28:0], 4'h0};	// @[package.scala:245:{43,48,53}]
  wire [32:0] _freeOH_T_12 = _freeOH_T_9 | {_freeOH_T_9[24:0], 8'h0};	// @[package.scala:245:{43,48,53}]
  wire [32:0] _freeOH_T_15 = _freeOH_T_12 | {_freeOH_T_12[16:0], 16'h0};	// @[package.scala:245:{43,48,53}]
  wire [33:0] freeOH = {~(_freeOH_T_15 | {_freeOH_T_15[0], 32'h0}), 1'h1} & {1'h0, _freeOH_T_22};	// @[ListBuffer.scala:53:{16,25,32,38}, package.scala:245:{43,48,53}]
  wire [14:0] _GEN = freeOH[31:17] | freeOH[15:1];	// @[ListBuffer.scala:53:38, OneHot.scala:30:18, :31:18, :32:28]
  wire [6:0]  _GEN_0 = _GEN[14:8] | _GEN[6:0];	// @[OneHot.scala:30:18, :31:18, :32:28]
  wire [2:0]  _GEN_1 = _GEN_0[6:4] | _GEN_0[2:0];	// @[OneHot.scala:30:18, :31:18, :32:28]
  wire [5:0]  data_MPORT_addr = {|(freeOH[33:32]), |(freeOH[31:16]), |(_GEN[14:7]), |(_GEN_0[6:3]), |(_GEN_1[2:1]), _GEN_1[2] | _GEN_1[0]};	// @[Cat.scala:33:92, ListBuffer.scala:53:38, OneHot.scala:30:18, :31:18, :32:{14,28}]
  wire [20:0] _push_valid_T = valid >> io_push_bits_index;	// @[ListBuffer.scala:46:22, :62:25]
  wire        _io_push_ready_output = used != 33'h1FFFFFFFF;	// @[ListBuffer.scala:49:22, :53:25, :64:26]
  wire        data_MPORT_en = _io_push_ready_output & io_push_valid;	// @[Decoupled.scala:51:35, ListBuffer.scala:64:26]
  wire [31:0] _valid_clr_T = 32'h1 << io_pop_bits;	// @[OneHot.scala:64:12]
  wire [31:0] _valid_set_T = 32'h1 << io_push_bits_index;	// @[OneHot.scala:64:12]
  wire [63:0] _used_clr_T = 64'h1 << _head_ext_R0_data;	// @[ListBuffer.scala:47:18, OneHot.scala:64:12]
  always @(posedge clock) begin
    if (reset) begin
      valid <= 21'h0;	// @[ListBuffer.scala:46:22]
      used <= 33'h0;	// @[ListBuffer.scala:49:22]
    end
    else begin
      valid <= valid & ~(io_pop_valid & _head_ext_R0_data == _tail_ext_R0_data ? _valid_clr_T[20:0] : 21'h0) | (data_MPORT_en ? _valid_set_T[20:0] : 21'h0);	// @[Decoupled.scala:51:35, ListBuffer.scala:46:22, :47:18, :48:18, :56:30, :57:30, :65:23, :66:15, :87:22, :89:{20,48}, :90:17, :98:{21,23,35}, OneHot.scala:64:{12,27}]
      used <= used & ~(io_pop_valid ? _used_clr_T[32:0] : 33'h0) | (data_MPORT_en ? freeOH[32:0] : 33'h0);	// @[Decoupled.scala:51:35, ListBuffer.scala:49:22, :53:38, :58:30, :59:30, :65:23, :67:14, :87:22, :88:14, :97:{21,23,35}, OneHot.scala:64:{12,27}]
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    wire  [20:0] _T_2 = valid >> io_pop_bits;	// @[ListBuffer.scala:46:22, :85:37]
    always @(posedge clock) begin	// @[ListBuffer.scala:85:10]
      if (~reset & ~(~io_pop_valid | _T_2[0])) begin	// @[ListBuffer.scala:85:{10,11,24,37}]
        if (`ASSERT_VERBOSE_COND_)	// @[ListBuffer.scala:85:10]
          $error("Assertion failed\n    at ListBuffer.scala:85 assert (!io.pop.fire || (io.valid)(io.pop.bits))\n");	// @[ListBuffer.scala:85:10]
        if (`STOP_COND_)	// @[ListBuffer.scala:85:10]
          $fatal;	// @[ListBuffer.scala:85:10]
      end
    end // always @(posedge)
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
        valid = _RANDOM_0[20:0];	// @[ListBuffer.scala:46:22]
        used = {_RANDOM_0[31:21], _RANDOM_1[21:0]};	// @[ListBuffer.scala:46:22, :49:22]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  head_combMem_0 head_ext (	// @[ListBuffer.scala:47:18]
    .R0_addr (io_pop_bits),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .W0_addr (io_push_bits_index),
    .W0_en   (data_MPORT_en & ~(_push_valid_T[0])),	// @[Decoupled.scala:51:35, ListBuffer.scala:47:18, :62:25, :65:23, :69:23]
    .W0_clk  (clock),
    .W0_data (data_MPORT_addr),	// @[Cat.scala:33:92]
    .W1_addr (io_pop_bits),
    .W1_en   (io_pop_valid),
    .W1_clk  (clock),
    .W1_data (data_MPORT_en & _push_valid_T[0] & _tail_ext_R1_data == _head_ext_R0_data ? data_MPORT_addr : _next_ext_R0_data),	// @[Cat.scala:33:92, Decoupled.scala:51:35, ListBuffer.scala:47:18, :48:18, :50:18, :62:25, :92:{32,60,73}]
    .R0_data (_head_ext_R0_data)
  );
  tail_combMem_0 tail_ext (	// @[ListBuffer.scala:48:18]
    .R0_addr (io_pop_bits),
    .R0_en   (io_pop_valid),
    .R0_clk  (clock),
    .R1_addr (io_push_bits_index),
    .R1_en   (1'h1),
    .R1_clk  (clock),
    .W0_addr (io_push_bits_index),
    .W0_en   (data_MPORT_en),	// @[Decoupled.scala:51:35]
    .W0_clk  (clock),
    .W0_data (data_MPORT_addr),	// @[Cat.scala:33:92]
    .R0_data (_tail_ext_R0_data),
    .R1_data (_tail_ext_R1_data)
  );
  next_combMem_0 next_ext (	// @[ListBuffer.scala:50:18]
    .R0_addr (_head_ext_R0_data),	// @[ListBuffer.scala:47:18]
    .R0_en   (io_pop_valid),
    .R0_clk  (clock),
    .W0_addr (_tail_ext_R1_data),	// @[ListBuffer.scala:48:18]
    .W0_en   (data_MPORT_en & _push_valid_T[0]),	// @[Decoupled.scala:51:35, ListBuffer.scala:50:18, :62:25, :65:23, :69:23]
    .W0_clk  (clock),
    .W0_data (data_MPORT_addr),	// @[Cat.scala:33:92]
    .R0_data (_next_ext_R0_data)
  );
  data_combMem data_ext (	// @[ListBuffer.scala:51:18]
    .R0_addr (_head_ext_R0_data),	// @[ListBuffer.scala:47:18]
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .W0_addr (data_MPORT_addr),	// @[Cat.scala:33:92]
    .W0_en   (data_MPORT_en),	// @[Decoupled.scala:51:35]
    .W0_clk  (clock),
    .W0_data ({io_push_bits_data_put, io_push_bits_data_offset, io_push_bits_data_tag, io_push_bits_data_source, io_push_bits_data_size, io_push_bits_data_param, io_push_bits_data_opcode, io_push_bits_data_control, io_push_bits_data_prio_2, 1'h0, io_push_bits_data_prio_0}),	// @[ListBuffer.scala:51:18]
    .R0_data (_data_ext_R0_data)
  );
  assign io_push_ready = _io_push_ready_output;	// @[ListBuffer.scala:64:26]
  assign io_valid = valid;	// @[ListBuffer.scala:46:22]
  assign io_data_prio_0 = _data_ext_R0_data[0];	// @[ListBuffer.scala:51:18]
  assign io_data_prio_1 = _data_ext_R0_data[1];	// @[ListBuffer.scala:51:18]
  assign io_data_prio_2 = _data_ext_R0_data[2];	// @[ListBuffer.scala:51:18]
  assign io_data_control = _data_ext_R0_data[3];	// @[ListBuffer.scala:51:18]
  assign io_data_opcode = _data_ext_R0_data[6:4];	// @[ListBuffer.scala:51:18]
  assign io_data_param = _data_ext_R0_data[9:7];	// @[ListBuffer.scala:51:18]
  assign io_data_size = _data_ext_R0_data[12:10];	// @[ListBuffer.scala:51:18]
  assign io_data_source = _data_ext_R0_data[22:13];	// @[ListBuffer.scala:51:18]
  assign io_data_tag = _data_ext_R0_data[26:23];	// @[ListBuffer.scala:51:18]
  assign io_data_offset = _data_ext_R0_data[32:27];	// @[ListBuffer.scala:51:18]
  assign io_data_put = _data_ext_R0_data[38:33];	// @[ListBuffer.scala:51:18]
endmodule

