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

module TLAtomicAutomata(
  input         clock,
                reset,
                auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
                auto_in_a_bits_size,
  input  [9:0]  auto_in_a_bits_source,
  input  [14:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
                auto_in_d_ready,
                auto_out_a_ready,
                auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [2:0]  auto_out_d_bits_size,
  input  [9:0]  auto_out_d_bits_source,
  input         auto_out_d_bits_sink,
                auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt,
  output        auto_in_a_ready,
                auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [2:0]  auto_in_d_bits_size,
  output [9:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
                auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
                auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
                auto_out_a_bits_param,
                auto_out_a_bits_size,
  output [9:0]  auto_out_a_bits_source,
  output [14:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
                auto_out_d_ready
);

  wire            out_1_ready;	// @[Arbiter.scala:124:31]
  reg  [1:0]      cam_s_0_state;	// @[AtomicAutomata.scala:78:28]
  reg  [2:0]      cam_a_0_bits_opcode;	// @[AtomicAutomata.scala:79:24]
  reg  [2:0]      cam_a_0_bits_param;	// @[AtomicAutomata.scala:79:24]
  reg  [2:0]      cam_a_0_bits_size;	// @[AtomicAutomata.scala:79:24]
  reg  [9:0]      cam_a_0_bits_source;	// @[AtomicAutomata.scala:79:24]
  reg  [14:0]     cam_a_0_bits_address;	// @[AtomicAutomata.scala:79:24]
  reg  [7:0]      cam_a_0_bits_mask;	// @[AtomicAutomata.scala:79:24]
  reg  [63:0]     cam_a_0_bits_data;	// @[AtomicAutomata.scala:79:24]
  reg             cam_a_0_bits_corrupt;	// @[AtomicAutomata.scala:79:24]
  reg             cam_a_0_fifoId;	// @[AtomicAutomata.scala:79:24]
  reg  [3:0]      cam_a_0_lut;	// @[AtomicAutomata.scala:79:24]
  reg  [63:0]     cam_d_0_data;	// @[AtomicAutomata.scala:80:24]
  reg             cam_d_0_denied;	// @[AtomicAutomata.scala:80:24]
  reg             cam_d_0_corrupt;	// @[AtomicAutomata.scala:80:24]
  wire            cam_free_0 = cam_s_0_state == 2'h0;	// @[AtomicAutomata.scala:78:28, :82:44, Bundles.scala:259:74]
  wire            winnerQual_0 = cam_s_0_state == 2'h2;	// @[AtomicAutomata.scala:78:28, :83:44]
  wire            _GEN = auto_in_a_bits_opcode == 3'h3 | auto_in_a_bits_opcode == 3'h2;	// @[AtomicAutomata.scala:92:47, :93:47, :94:{32,63}, Mux.scala:81:61]
  wire [3:0]      _logic_out_T = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[0], cam_d_0_data[0]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_2 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[1], cam_d_0_data[1]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_4 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[2], cam_d_0_data[2]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_6 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[3], cam_d_0_data[3]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_8 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[4], cam_d_0_data[4]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_10 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[5], cam_d_0_data[5]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_12 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[6], cam_d_0_data[6]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_14 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[7], cam_d_0_data[7]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_16 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[8], cam_d_0_data[8]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_18 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[9], cam_d_0_data[9]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_20 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[10], cam_d_0_data[10]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_22 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[11], cam_d_0_data[11]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_24 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[12], cam_d_0_data[12]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_26 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[13], cam_d_0_data[13]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_28 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[14], cam_d_0_data[14]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_30 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[15], cam_d_0_data[15]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_32 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[16], cam_d_0_data[16]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_34 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[17], cam_d_0_data[17]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_36 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[18], cam_d_0_data[18]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_38 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[19], cam_d_0_data[19]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_40 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[20], cam_d_0_data[20]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_42 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[21], cam_d_0_data[21]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_44 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[22], cam_d_0_data[22]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_46 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[23], cam_d_0_data[23]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_48 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[24], cam_d_0_data[24]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_50 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[25], cam_d_0_data[25]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_52 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[26], cam_d_0_data[26]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_54 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[27], cam_d_0_data[27]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_56 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[28], cam_d_0_data[28]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_58 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[29], cam_d_0_data[29]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_60 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[30], cam_d_0_data[30]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_62 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[31], cam_d_0_data[31]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_64 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[32], cam_d_0_data[32]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_66 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[33], cam_d_0_data[33]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_68 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[34], cam_d_0_data[34]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_70 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[35], cam_d_0_data[35]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_72 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[36], cam_d_0_data[36]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_74 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[37], cam_d_0_data[37]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_76 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[38], cam_d_0_data[38]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_78 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[39], cam_d_0_data[39]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_80 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[40], cam_d_0_data[40]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_82 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[41], cam_d_0_data[41]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_84 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[42], cam_d_0_data[42]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_86 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[43], cam_d_0_data[43]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_88 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[44], cam_d_0_data[44]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_90 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[45], cam_d_0_data[45]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_92 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[46], cam_d_0_data[46]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_94 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[47], cam_d_0_data[47]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_96 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[48], cam_d_0_data[48]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_98 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[49], cam_d_0_data[49]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_100 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[50], cam_d_0_data[50]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_102 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[51], cam_d_0_data[51]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_104 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[52], cam_d_0_data[52]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_106 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[53], cam_d_0_data[53]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_108 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[54], cam_d_0_data[54]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_110 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[55], cam_d_0_data[55]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_112 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[56], cam_d_0_data[56]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_114 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[57], cam_d_0_data[57]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_116 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[58], cam_d_0_data[58]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_118 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[59], cam_d_0_data[59]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_120 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[60], cam_d_0_data[60]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_122 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[61], cam_d_0_data[61]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_124 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[62], cam_d_0_data[62]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [3:0]      _logic_out_T_126 = cam_a_0_lut >> {2'h0, cam_a_0_bits_data[63], cam_d_0_data[63]};	// @[AtomicAutomata.scala:79:24, :80:24, :115:{63,73}, :116:57, Bundles.scala:259:74]
  wire [6:0]      _GEN_0 = ~(cam_a_0_bits_mask[6:0]) | cam_a_0_bits_mask[7:1];	// @[AtomicAutomata.scala:79:24, :123:{25,31,39}]
  wire [6:0]      _GEN_1 = {cam_a_0_bits_data[55], cam_a_0_bits_data[47], cam_a_0_bits_data[39], cam_a_0_bits_data[31], cam_a_0_bits_data[23], cam_a_0_bits_data[15], cam_a_0_bits_data[7]} & ~_GEN_0;	// @[AtomicAutomata.scala:79:24, :115:63, :123:{23,31}, :127:38, Cat.scala:33:92]
  wire [6:0]      _GEN_2 = {cam_d_0_data[55], cam_d_0_data[47], cam_d_0_data[39], cam_d_0_data[31], cam_d_0_data[23], cam_d_0_data[15], cam_d_0_data[7]} & ~_GEN_0;	// @[AtomicAutomata.scala:80:24, :115:73, :123:{23,31}, :128:38, Cat.scala:33:92]
  wire [5:0]      _GEN_3 = _GEN_1[6:1] | _GEN_1[5:0];	// @[AtomicAutomata.scala:127:38, package.scala:245:{43,53}]
  wire [3:0]      _GEN_4 = _GEN_3[5:2] | _GEN_3[3:0];	// @[package.scala:245:{43,53}]
  wire            _signext_a_T_24 = _GEN_3[1] | _GEN_1[0];	// @[AtomicAutomata.scala:127:38, package.scala:245:43]
  wire [5:0]      _GEN_5 = _GEN_2[6:1] | _GEN_2[5:0];	// @[AtomicAutomata.scala:128:38, package.scala:245:{43,53}]
  wire [3:0]      _GEN_6 = _GEN_5[5:2] | _GEN_5[3:0];	// @[package.scala:245:{43,53}]
  wire            _signext_d_T_24 = _GEN_5[1] | _GEN_2[0];	// @[AtomicAutomata.scala:128:38, package.scala:245:43]
  wire [63:0]     wide_mask = {{8{cam_a_0_bits_mask[7]}}, {8{cam_a_0_bits_mask[6]}}, {8{cam_a_0_bits_mask[5]}}, {8{cam_a_0_bits_mask[4]}}, {8{cam_a_0_bits_mask[3]}}, {8{cam_a_0_bits_mask[2]}}, {8{cam_a_0_bits_mask[1]}}, {8{cam_a_0_bits_mask[0]}}};	// @[AtomicAutomata.scala:79:24, Bitwise.scala:28:17, :77:12, Cat.scala:33:92]
  wire [63:0]     a_a_ext = cam_a_0_bits_data & wide_mask | {{8{_GEN_4[3] | _signext_a_T_24}}, {8{_GEN_4[2] | _GEN_3[0]}}, {8{_GEN_4[1] | _GEN_1[0]}}, {8{_GEN_4[0]}}, {8{_signext_a_T_24}}, {8{_GEN_3[0]}}, {8{_GEN_1[0]}}, 8'h0};	// @[AtomicAutomata.scala:79:24, :127:38, :133:{28,41}, Bitwise.scala:77:12, Cat.scala:33:92, package.scala:245:43]
  wire [63:0]     a_d_ext = cam_d_0_data & wide_mask | {{8{_GEN_6[3] | _signext_d_T_24}}, {8{_GEN_6[2] | _GEN_5[0]}}, {8{_GEN_6[1] | _GEN_2[0]}}, {8{_GEN_6[0]}}, {8{_signext_d_T_24}}, {8{_GEN_5[0]}}, {8{_GEN_2[0]}}, 8'h0};	// @[AtomicAutomata.scala:80:24, :128:38, :134:{28,41}, Bitwise.scala:77:12, Cat.scala:33:92, package.scala:245:43]
  wire [63:0]     adder_out = a_a_ext + ({64{~(cam_a_0_bits_param[2])}} ^ a_d_ext);	// @[AtomicAutomata.scala:79:24, :121:39, :133:41, :134:41, :135:26, :136:33]
  wire            a_allow = ~(((&cam_s_0_state) | winnerQual_0) & ~cam_a_0_fifoId) & (~_GEN | cam_free_0);	// @[AtomicAutomata.scala:78:28, :79:24, :82:44, :83:44, :84:{49,57}, :94:{32,63}, :107:{60,96}, :151:{23,35,53}]
  wire            out_1_earlyValid = auto_in_a_valid & a_allow;	// @[AtomicAutomata.scala:151:35, :153:38]
  wire            _source_c_bits_a_mask_T = cam_a_0_bits_size > 3'h2;	// @[AtomicAutomata.scala:79:24, :93:47, Misc.scala:205:21]
  wire            source_c_bits_a_mask_size = cam_a_0_bits_size[1:0] == 2'h2;	// @[AtomicAutomata.scala:79:24, :83:44, Misc.scala:208:26, OneHot.scala:63:49]
  wire            source_c_bits_a_mask_acc = _source_c_bits_a_mask_T | source_c_bits_a_mask_size & ~(cam_a_0_bits_address[2]);	// @[AtomicAutomata.scala:79:24, Misc.scala:205:21, :208:26, :209:26, :210:20, :214:{29,38}]
  wire            source_c_bits_a_mask_acc_1 = _source_c_bits_a_mask_T | source_c_bits_a_mask_size & cam_a_0_bits_address[2];	// @[AtomicAutomata.scala:79:24, Misc.scala:205:21, :208:26, :209:26, :214:{29,38}]
  wire            source_c_bits_a_mask_size_1 = cam_a_0_bits_size[1:0] == 2'h1;	// @[AtomicAutomata.scala:79:24, :199:23, Misc.scala:208:26, OneHot.scala:63:49]
  wire            source_c_bits_a_mask_eq_2 = ~(cam_a_0_bits_address[2]) & ~(cam_a_0_bits_address[1]);	// @[AtomicAutomata.scala:79:24, Misc.scala:209:26, :210:20, :213:27]
  wire            source_c_bits_a_mask_acc_2 = source_c_bits_a_mask_acc | source_c_bits_a_mask_size_1 & source_c_bits_a_mask_eq_2;	// @[Misc.scala:208:26, :213:27, :214:{29,38}]
  wire            source_c_bits_a_mask_eq_3 = ~(cam_a_0_bits_address[2]) & cam_a_0_bits_address[1];	// @[AtomicAutomata.scala:79:24, Misc.scala:209:26, :210:20, :213:27]
  wire            source_c_bits_a_mask_acc_3 = source_c_bits_a_mask_acc | source_c_bits_a_mask_size_1 & source_c_bits_a_mask_eq_3;	// @[Misc.scala:208:26, :213:27, :214:{29,38}]
  wire            source_c_bits_a_mask_eq_4 = cam_a_0_bits_address[2] & ~(cam_a_0_bits_address[1]);	// @[AtomicAutomata.scala:79:24, Misc.scala:209:26, :210:20, :213:27]
  wire            source_c_bits_a_mask_acc_4 = source_c_bits_a_mask_acc_1 | source_c_bits_a_mask_size_1 & source_c_bits_a_mask_eq_4;	// @[Misc.scala:208:26, :213:27, :214:{29,38}]
  wire            source_c_bits_a_mask_eq_5 = cam_a_0_bits_address[2] & cam_a_0_bits_address[1];	// @[AtomicAutomata.scala:79:24, Misc.scala:209:26, :213:27]
  wire            source_c_bits_a_mask_acc_5 = source_c_bits_a_mask_acc_1 | source_c_bits_a_mask_size_1 & source_c_bits_a_mask_eq_5;	// @[Misc.scala:208:26, :213:27, :214:{29,38}]
  reg  [2:0]      beatsLeft;	// @[Arbiter.scala:88:30]
  wire            idle = beatsLeft == 3'h0;	// @[Arbiter.scala:88:30, :89:28, Misc.scala:201:34]
  wire            earlyWinner_1 = ~winnerQual_0 & out_1_earlyValid;	// @[Arbiter.scala:17:61, :98:79, AtomicAutomata.scala:83:44, :153:38]
  wire            _sink_ACancel_earlyValid_T = winnerQual_0 | out_1_earlyValid;	// @[Arbiter.scala:108:36, AtomicAutomata.scala:83:44, :153:38]
  reg             state_0;	// @[Arbiter.scala:117:26]
  reg             state_1;	// @[Arbiter.scala:117:26]
  wire            muxStateEarly_0 = idle ? winnerQual_0 : state_0;	// @[Arbiter.scala:89:28, :117:26, :118:30, AtomicAutomata.scala:83:44]
  wire            muxStateEarly_1 = idle ? earlyWinner_1 : state_1;	// @[Arbiter.scala:89:28, :98:79, :117:26, :118:30]
  assign out_1_ready = auto_out_a_ready & (idle ? ~winnerQual_0 : state_1);	// @[Arbiter.scala:17:61, :89:28, :117:26, :122:24, :124:31, AtomicAutomata.scala:83:44]
  wire            out_2_valid = idle ? _sink_ACancel_earlyValid_T : state_0 & winnerQual_0 | state_1 & out_1_earlyValid;	// @[Arbiter.scala:89:28, :108:36, :117:26, :126:29, AtomicAutomata.scala:83:44, :153:38, Mux.scala:27:73]
  reg  [2:0]      d_first_counter;	// @[Edges.scala:229:27]
  wire            d_first = d_first_counter == 3'h0;	// @[Edges.scala:229:27, :231:25, Misc.scala:201:34]
  wire            d_cam_sel_match_0 = cam_a_0_bits_source == auto_out_d_bits_source & (|cam_s_0_state);	// @[AtomicAutomata.scala:78:28, :79:24, :85:49, :206:53, :207:83]
  wire            d_ackd = auto_out_d_bits_opcode == 3'h1;	// @[AtomicAutomata.scala:215:40, Mux.scala:81:61]
  wire            d_drop = d_first & d_ackd & d_cam_sel_match_0;	// @[AtomicAutomata.scala:207:83, :215:40, :234:40, Edges.scala:231:25]
  wire            d_replace = d_first & auto_out_d_bits_opcode == 3'h0 & d_cam_sel_match_0;	// @[AtomicAutomata.scala:207:83, :216:40, :235:42, Edges.scala:231:25, Misc.scala:201:34]
  wire            x1_d_ready = auto_in_d_ready | d_drop;	// @[AtomicAutomata.scala:234:40, :238:35]
  wire [12:0]     _decode_T_1 = 13'h3F << auto_in_a_bits_size;	// @[package.scala:235:71]
  wire [12:0]     _d_first_beats1_decode_T_1 = 13'h3F << auto_out_d_bits_size;	// @[package.scala:235:71]
  wire            winnerQual_1 = ~winnerQual_0 & out_1_earlyValid;	// @[Arbiter.scala:17:61, :99:79, AtomicAutomata.scala:83:44, :153:38]
  wire [3:0][3:0] _GEN_7 = '{4'hC, 4'h8, 4'hE, 4'h6};	// @[Mux.scala:81:{58,61}]
  wire            _GEN_8 = out_1_ready & out_1_earlyValid & _GEN & cam_free_0;	// @[Arbiter.scala:124:31, AtomicAutomata.scala:79:24, :82:44, :94:{32,63}, :153:38, :176:50, :178:23, :179:24]
  wire            _T_54 = x1_d_ready & auto_out_d_valid;	// @[AtomicAutomata.scala:238:35, Decoupled.scala:51:35]
  wire            _T_55 = _T_54 & d_first;	// @[AtomicAutomata.scala:218:28, Decoupled.scala:51:35, Edges.scala:231:25]
  always @(posedge clock) begin
    if (reset) begin
      cam_s_0_state <= 2'h0;	// @[AtomicAutomata.scala:78:28, Bundles.scala:259:74]
      beatsLeft <= 3'h0;	// @[Arbiter.scala:88:30, Misc.scala:201:34]
      state_0 <= 1'h0;	// @[Arbiter.scala:117:26, AtomicAutomata.scala:77:23]
      state_1 <= 1'h0;	// @[Arbiter.scala:117:26, AtomicAutomata.scala:77:23]
      d_first_counter <= 3'h0;	// @[Edges.scala:229:27, Misc.scala:201:34]
    end
    else begin
      if (_T_55 & d_cam_sel_match_0)	// @[AtomicAutomata.scala:196:32, :207:83, :218:{28,40}, :227:23, :229:23]
        cam_s_0_state <= {d_ackd, 1'h0};	// @[AtomicAutomata.scala:77:23, :78:28, :215:40, :229:29]
      else if (auto_out_a_ready & (idle | state_0) & winnerQual_0)	// @[Arbiter.scala:89:28, :117:26, :122:24, AtomicAutomata.scala:83:44, :176:50, :196:32, :198:23, :199:23]
        cam_s_0_state <= 2'h1;	// @[AtomicAutomata.scala:78:28, :199:23]
      else if (_GEN_8)	// @[AtomicAutomata.scala:79:24, :176:50, :178:23, :179:24]
        cam_s_0_state <= 2'h3;	// @[AtomicAutomata.scala:78:28, :84:49]
      if (idle & auto_out_a_ready) begin	// @[Arbiter.scala:89:28, :90:24]
        if (winnerQual_1 & ~(auto_in_a_bits_opcode[2]))	// @[Arbiter.scala:99:79, :112:73, Edges.scala:92:{28,37}, :221:14]
          beatsLeft <= ~(_decode_T_1[5:3]);	// @[Arbiter.scala:88:30, package.scala:235:{46,71,76}]
        else	// @[Arbiter.scala:112:73, Edges.scala:221:14]
          beatsLeft <= 3'h0;	// @[Arbiter.scala:88:30, Misc.scala:201:34]
      end
      else	// @[Arbiter.scala:90:24]
        beatsLeft <= beatsLeft - {2'h0, auto_out_a_ready & out_2_valid};	// @[Arbiter.scala:88:30, :114:52, :126:29, Bundles.scala:259:74, ReadyValidCancel.scala:49:33]
      if (idle) begin	// @[Arbiter.scala:89:28]
        state_0 <= winnerQual_0;	// @[Arbiter.scala:117:26, AtomicAutomata.scala:83:44]
        state_1 <= winnerQual_1;	// @[Arbiter.scala:99:79, :117:26]
      end
      if (_T_54) begin	// @[Decoupled.scala:51:35]
        if (d_first) begin	// @[Edges.scala:231:25]
          if (auto_out_d_bits_opcode[0])	// @[Edges.scala:106:36]
            d_first_counter <= ~(_d_first_beats1_decode_T_1[5:3]);	// @[Edges.scala:229:27, package.scala:235:{46,71,76}]
          else	// @[Edges.scala:106:36]
            d_first_counter <= 3'h0;	// @[Edges.scala:229:27, Misc.scala:201:34]
        end
        else	// @[Edges.scala:231:25]
          d_first_counter <= d_first_counter - 3'h1;	// @[Edges.scala:229:27, :230:28]
      end
    end
    if (_GEN_8) begin	// @[AtomicAutomata.scala:79:24, :176:50, :178:23, :179:24]
      cam_a_0_bits_opcode <= auto_in_a_bits_opcode;	// @[AtomicAutomata.scala:79:24]
      cam_a_0_bits_param <= auto_in_a_bits_param;	// @[AtomicAutomata.scala:79:24]
      cam_a_0_bits_size <= auto_in_a_bits_size;	// @[AtomicAutomata.scala:79:24]
      cam_a_0_bits_source <= auto_in_a_bits_source;	// @[AtomicAutomata.scala:79:24]
      cam_a_0_bits_address <= auto_in_a_bits_address;	// @[AtomicAutomata.scala:79:24]
      cam_a_0_bits_mask <= auto_in_a_bits_mask;	// @[AtomicAutomata.scala:79:24]
      cam_a_0_bits_data <= auto_in_a_bits_data;	// @[AtomicAutomata.scala:79:24]
      cam_a_0_bits_corrupt <= auto_in_a_bits_corrupt;	// @[AtomicAutomata.scala:79:24]
      cam_a_0_lut <= _GEN_7[auto_in_a_bits_param[1:0]];	// @[AtomicAutomata.scala:79:24, :181:52, Mux.scala:81:{58,61}]
    end
    cam_a_0_fifoId <= ~_GEN_8 & cam_a_0_fifoId;	// @[AtomicAutomata.scala:79:24, :176:50, :178:23, :179:24]
    if (_T_55 & d_cam_sel_match_0 & d_ackd) begin	// @[AtomicAutomata.scala:80:24, :207:83, :215:40, :218:{28,40}, :220:33, :221:22]
      cam_d_0_data <= auto_out_d_bits_data;	// @[AtomicAutomata.scala:80:24]
      cam_d_0_denied <= auto_out_d_bits_denied;	// @[AtomicAutomata.scala:80:24]
      cam_d_0_corrupt <= auto_out_d_bits_corrupt;	// @[AtomicAutomata.scala:80:24]
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    always @(posedge clock) begin	// @[Arbiter.scala:106:13]
      if (~reset & ~(~winnerQual_0 | ~earlyWinner_1)) begin	// @[Arbiter.scala:98:79, :106:{13,61,64,67}, AtomicAutomata.scala:83:44]
        if (`ASSERT_VERBOSE_COND_)	// @[Arbiter.scala:106:13]
          $error("Assertion failed\n    at Arbiter.scala:106 assert((prefixOR zip earlyWinner) map { case (p,w) => !p || !w } reduce {_ && _})\n");	// @[Arbiter.scala:106:13]
        if (`STOP_COND_)	// @[Arbiter.scala:106:13]
          $fatal;	// @[Arbiter.scala:106:13]
      end
      if (~reset & ~(~_sink_ACancel_earlyValid_T | winnerQual_0 | earlyWinner_1)) begin	// @[Arbiter.scala:98:79, :108:{14,15,36,41}, AtomicAutomata.scala:83:44]
        if (`ASSERT_VERBOSE_COND_)	// @[Arbiter.scala:108:14]
          $error("Assertion failed\n    at Arbiter.scala:108 assert (!earlyValids.reduce(_||_) || earlyWinner.reduce(_||_))\n");	// @[Arbiter.scala:108:14]
        if (`STOP_COND_)	// @[Arbiter.scala:108:14]
          $fatal;	// @[Arbiter.scala:108:14]
      end
    end // always @(posedge)
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    logic [31:0] _RANDOM_1;
    logic [31:0] _RANDOM_2;
    logic [31:0] _RANDOM_3;
    logic [31:0] _RANDOM_4;
    logic [31:0] _RANDOM_5;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        _RANDOM_1 = `RANDOM;
        _RANDOM_2 = `RANDOM;
        _RANDOM_3 = `RANDOM;
        _RANDOM_4 = `RANDOM;
        _RANDOM_5 = `RANDOM;
        cam_s_0_state = _RANDOM_0[1:0];	// @[AtomicAutomata.scala:78:28]
        cam_a_0_bits_opcode = _RANDOM_0[4:2];	// @[AtomicAutomata.scala:78:28, :79:24]
        cam_a_0_bits_param = _RANDOM_0[7:5];	// @[AtomicAutomata.scala:78:28, :79:24]
        cam_a_0_bits_size = _RANDOM_0[10:8];	// @[AtomicAutomata.scala:78:28, :79:24]
        cam_a_0_bits_source = _RANDOM_0[20:11];	// @[AtomicAutomata.scala:78:28, :79:24]
        cam_a_0_bits_address = {_RANDOM_0[31:21], _RANDOM_1[3:0]};	// @[AtomicAutomata.scala:78:28, :79:24]
        cam_a_0_bits_mask = _RANDOM_1[11:4];	// @[AtomicAutomata.scala:79:24]
        cam_a_0_bits_data = {_RANDOM_1[31:12], _RANDOM_2, _RANDOM_3[11:0]};	// @[AtomicAutomata.scala:79:24]
        cam_a_0_bits_corrupt = _RANDOM_3[12];	// @[AtomicAutomata.scala:79:24]
        cam_a_0_fifoId = _RANDOM_3[13];	// @[AtomicAutomata.scala:79:24]
        cam_a_0_lut = _RANDOM_3[17:14];	// @[AtomicAutomata.scala:79:24]
        cam_d_0_data = {_RANDOM_3[31:18], _RANDOM_4, _RANDOM_5[17:0]};	// @[AtomicAutomata.scala:79:24, :80:24]
        cam_d_0_denied = _RANDOM_5[18];	// @[AtomicAutomata.scala:80:24]
        cam_d_0_corrupt = _RANDOM_5[19];	// @[AtomicAutomata.scala:80:24]
        beatsLeft = _RANDOM_5[22:20];	// @[Arbiter.scala:88:30, AtomicAutomata.scala:80:24]
        state_0 = _RANDOM_5[23];	// @[Arbiter.scala:117:26, AtomicAutomata.scala:80:24]
        state_1 = _RANDOM_5[24];	// @[Arbiter.scala:117:26, AtomicAutomata.scala:80:24]
        d_first_counter = _RANDOM_5[27:25];	// @[AtomicAutomata.scala:80:24, Edges.scala:229:27]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign auto_in_a_ready = out_1_ready & a_allow;	// @[Arbiter.scala:124:31, AtomicAutomata.scala:151:35, :152:38]
  assign auto_in_d_valid = auto_out_d_valid & ~d_drop;	// @[AtomicAutomata.scala:234:40, :237:{35,38}]
  assign auto_in_d_bits_opcode = d_replace ? 3'h1 : auto_out_d_bits_opcode;	// @[AtomicAutomata.scala:235:42, :240:19, :241:26, :242:28, Mux.scala:81:61]
  assign auto_in_d_bits_param = auto_out_d_bits_param;
  assign auto_in_d_bits_size = auto_out_d_bits_size;
  assign auto_in_d_bits_source = auto_out_d_bits_source;
  assign auto_in_d_bits_sink = auto_out_d_bits_sink;
  assign auto_in_d_bits_denied = d_replace & cam_d_0_denied | auto_out_d_bits_denied;	// @[AtomicAutomata.scala:80:24, :235:42, :240:19, :241:26, :245:29]
  assign auto_in_d_bits_data = d_replace ? cam_d_0_data : auto_out_d_bits_data;	// @[AtomicAutomata.scala:80:24, :235:42, :240:19, :241:26, :243:26]
  assign auto_in_d_bits_corrupt = d_replace ? cam_d_0_corrupt | auto_out_d_bits_denied : auto_out_d_bits_corrupt;	// @[AtomicAutomata.scala:80:24, :235:42, :240:19, :241:26, :244:{29,46}]
  assign auto_out_a_valid = out_2_valid;	// @[Arbiter.scala:126:29]
  assign auto_out_a_bits_opcode = muxStateEarly_1 ? (_GEN ? 3'h4 : auto_in_a_bits_opcode) : 3'h0;	// @[Arbiter.scala:118:30, AtomicAutomata.scala:94:{32,63}, :154:24, :155:31, :156:32, Misc.scala:201:34, Mux.scala:27:73]
  assign auto_out_a_bits_param = ~muxStateEarly_1 | _GEN ? 3'h0 : auto_in_a_bits_param;	// @[Arbiter.scala:118:30, AtomicAutomata.scala:94:{32,63}, Misc.scala:201:34, Mux.scala:27:73]
  assign auto_out_a_bits_size = (muxStateEarly_0 ? cam_a_0_bits_size : 3'h0) | (muxStateEarly_1 ? auto_in_a_bits_size : 3'h0);	// @[Arbiter.scala:118:30, AtomicAutomata.scala:79:24, Misc.scala:201:34, Mux.scala:27:73]
  assign auto_out_a_bits_source = (muxStateEarly_0 ? cam_a_0_bits_source : 10'h0) | (muxStateEarly_1 ? auto_in_a_bits_source : 10'h0);	// @[Arbiter.scala:118:30, AtomicAutomata.scala:79:24, Bundles.scala:259:74, Mux.scala:27:73]
  assign auto_out_a_bits_address = (muxStateEarly_0 ? cam_a_0_bits_address : 15'h0) | (muxStateEarly_1 ? auto_in_a_bits_address : 15'h0);	// @[Arbiter.scala:118:30, AtomicAutomata.scala:79:24, Bundles.scala:259:74, Mux.scala:27:73]
  assign auto_out_a_bits_mask = (muxStateEarly_0 ? {source_c_bits_a_mask_acc_5 | source_c_bits_a_mask_eq_5 & cam_a_0_bits_address[0], source_c_bits_a_mask_acc_5 | source_c_bits_a_mask_eq_5 & ~(cam_a_0_bits_address[0]), source_c_bits_a_mask_acc_4 | source_c_bits_a_mask_eq_4 & cam_a_0_bits_address[0], source_c_bits_a_mask_acc_4 | source_c_bits_a_mask_eq_4 & ~(cam_a_0_bits_address[0]), source_c_bits_a_mask_acc_3 | source_c_bits_a_mask_eq_3 & cam_a_0_bits_address[0], source_c_bits_a_mask_acc_3 | source_c_bits_a_mask_eq_3 & ~(cam_a_0_bits_address[0]), source_c_bits_a_mask_acc_2 | source_c_bits_a_mask_eq_2 & cam_a_0_bits_address[0], source_c_bits_a_mask_acc_2 | source_c_bits_a_mask_eq_2 & ~(cam_a_0_bits_address[0])} : 8'h0) | (muxStateEarly_1 ? auto_in_a_bits_mask : 8'h0);	// @[Arbiter.scala:118:30, AtomicAutomata.scala:79:24, Bitwise.scala:77:12, Cat.scala:33:92, Misc.scala:209:26, :210:20, :213:27, :214:29, Mux.scala:27:73]
  assign auto_out_a_bits_data = (muxStateEarly_0 ? (cam_a_0_bits_opcode[0] ? {_logic_out_T_126[0], _logic_out_T_124[0], _logic_out_T_122[0], _logic_out_T_120[0], _logic_out_T_118[0], _logic_out_T_116[0], _logic_out_T_114[0], _logic_out_T_112[0], _logic_out_T_110[0], _logic_out_T_108[0], _logic_out_T_106[0], _logic_out_T_104[0], _logic_out_T_102[0], _logic_out_T_100[0], _logic_out_T_98[0], _logic_out_T_96[0], _logic_out_T_94[0], _logic_out_T_92[0], _logic_out_T_90[0], _logic_out_T_88[0], _logic_out_T_86[0], _logic_out_T_84[0], _logic_out_T_82[0], _logic_out_T_80[0], _logic_out_T_78[0], _logic_out_T_76[0], _logic_out_T_74[0], _logic_out_T_72[0], _logic_out_T_70[0], _logic_out_T_68[0], _logic_out_T_66[0], _logic_out_T_64[0], _logic_out_T_62[0], _logic_out_T_60[0], _logic_out_T_58[0], _logic_out_T_56[0], _logic_out_T_54[0], _logic_out_T_52[0], _logic_out_T_50[0], _logic_out_T_48[0], _logic_out_T_46[0], _logic_out_T_44[0], _logic_out_T_42[0], _logic_out_T_40[0], _logic_out_T_38[0], _logic_out_T_36[0], _logic_out_T_34[0], _logic_out_T_32[0], _logic_out_T_30[0], _logic_out_T_28[0], _logic_out_T_26[0], _logic_out_T_24[0], _logic_out_T_22[0], _logic_out_T_20[0], _logic_out_T_18[0], _logic_out_T_16[0], _logic_out_T_14[0], _logic_out_T_12[0], _logic_out_T_10[0], _logic_out_T_8[0], _logic_out_T_6[0], _logic_out_T_4[0], _logic_out_T_2[0], _logic_out_T[0]} : cam_a_0_bits_param[2] ? adder_out : cam_a_0_bits_param[0] == (a_a_ext[63] == a_d_ext[63] ? ~(adder_out[63]) : cam_a_0_bits_param[1] == a_a_ext[63]) ? cam_a_0_bits_data : cam_d_0_data) : 64'h0) | (muxStateEarly_1 ? auto_in_a_bits_data : 64'h0);	// @[Arbiter.scala:118:30, AtomicAutomata.scala:79:24, :80:24, :116:57, :119:42, :120:42, :121:39, :133:41, :134:41, :136:33, :138:{38,49}, :139:{27,39,50,55,65}, :140:31, :141:{28,50}, :147:{14,34}, Bundles.scala:259:74, Cat.scala:33:92, Mux.scala:27:73]
  assign auto_out_a_bits_corrupt = muxStateEarly_0 & (cam_a_0_bits_corrupt | cam_d_0_corrupt) | muxStateEarly_1 & auto_in_a_bits_corrupt;	// @[Arbiter.scala:118:30, AtomicAutomata.scala:79:24, :80:24, :168:45, Mux.scala:27:73]
  assign auto_out_d_ready = x1_d_ready;	// @[AtomicAutomata.scala:238:35]
endmodule

