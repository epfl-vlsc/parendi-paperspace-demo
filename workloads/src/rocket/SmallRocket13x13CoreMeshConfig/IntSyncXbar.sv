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

module IntSyncXbar(
  input  auto_int_in_sync_0,
  output auto_int_out_165_sync_0,
         auto_int_out_164_sync_0,
         auto_int_out_163_sync_0,
         auto_int_out_162_sync_0,
         auto_int_out_161_sync_0,
         auto_int_out_160_sync_0,
         auto_int_out_159_sync_0,
         auto_int_out_158_sync_0,
         auto_int_out_157_sync_0,
         auto_int_out_156_sync_0,
         auto_int_out_155_sync_0,
         auto_int_out_154_sync_0,
         auto_int_out_153_sync_0,
         auto_int_out_152_sync_0,
         auto_int_out_151_sync_0,
         auto_int_out_150_sync_0,
         auto_int_out_149_sync_0,
         auto_int_out_148_sync_0,
         auto_int_out_147_sync_0,
         auto_int_out_146_sync_0,
         auto_int_out_145_sync_0,
         auto_int_out_144_sync_0,
         auto_int_out_143_sync_0,
         auto_int_out_142_sync_0,
         auto_int_out_141_sync_0,
         auto_int_out_140_sync_0,
         auto_int_out_139_sync_0,
         auto_int_out_138_sync_0,
         auto_int_out_137_sync_0,
         auto_int_out_136_sync_0,
         auto_int_out_135_sync_0,
         auto_int_out_134_sync_0,
         auto_int_out_133_sync_0,
         auto_int_out_132_sync_0,
         auto_int_out_131_sync_0,
         auto_int_out_130_sync_0,
         auto_int_out_129_sync_0,
         auto_int_out_128_sync_0,
         auto_int_out_127_sync_0,
         auto_int_out_126_sync_0,
         auto_int_out_125_sync_0,
         auto_int_out_124_sync_0,
         auto_int_out_123_sync_0,
         auto_int_out_122_sync_0,
         auto_int_out_121_sync_0,
         auto_int_out_120_sync_0,
         auto_int_out_119_sync_0,
         auto_int_out_118_sync_0,
         auto_int_out_117_sync_0,
         auto_int_out_116_sync_0,
         auto_int_out_115_sync_0,
         auto_int_out_114_sync_0,
         auto_int_out_113_sync_0,
         auto_int_out_112_sync_0,
         auto_int_out_111_sync_0,
         auto_int_out_110_sync_0,
         auto_int_out_109_sync_0,
         auto_int_out_108_sync_0,
         auto_int_out_107_sync_0,
         auto_int_out_106_sync_0,
         auto_int_out_105_sync_0,
         auto_int_out_104_sync_0,
         auto_int_out_103_sync_0,
         auto_int_out_102_sync_0,
         auto_int_out_101_sync_0,
         auto_int_out_100_sync_0,
         auto_int_out_99_sync_0,
         auto_int_out_98_sync_0,
         auto_int_out_97_sync_0,
         auto_int_out_96_sync_0,
         auto_int_out_95_sync_0,
         auto_int_out_94_sync_0,
         auto_int_out_93_sync_0,
         auto_int_out_92_sync_0,
         auto_int_out_91_sync_0,
         auto_int_out_90_sync_0,
         auto_int_out_89_sync_0,
         auto_int_out_88_sync_0,
         auto_int_out_87_sync_0,
         auto_int_out_86_sync_0,
         auto_int_out_85_sync_0,
         auto_int_out_84_sync_0,
         auto_int_out_83_sync_0,
         auto_int_out_82_sync_0,
         auto_int_out_81_sync_0,
         auto_int_out_80_sync_0,
         auto_int_out_79_sync_0,
         auto_int_out_78_sync_0,
         auto_int_out_77_sync_0,
         auto_int_out_76_sync_0,
         auto_int_out_75_sync_0,
         auto_int_out_74_sync_0,
         auto_int_out_73_sync_0,
         auto_int_out_72_sync_0,
         auto_int_out_71_sync_0,
         auto_int_out_70_sync_0,
         auto_int_out_69_sync_0,
         auto_int_out_68_sync_0,
         auto_int_out_67_sync_0,
         auto_int_out_66_sync_0,
         auto_int_out_65_sync_0,
         auto_int_out_64_sync_0,
         auto_int_out_63_sync_0,
         auto_int_out_62_sync_0,
         auto_int_out_61_sync_0,
         auto_int_out_60_sync_0,
         auto_int_out_59_sync_0,
         auto_int_out_58_sync_0,
         auto_int_out_57_sync_0,
         auto_int_out_56_sync_0,
         auto_int_out_55_sync_0,
         auto_int_out_54_sync_0,
         auto_int_out_53_sync_0,
         auto_int_out_52_sync_0,
         auto_int_out_51_sync_0,
         auto_int_out_50_sync_0,
         auto_int_out_49_sync_0,
         auto_int_out_48_sync_0,
         auto_int_out_47_sync_0,
         auto_int_out_46_sync_0,
         auto_int_out_45_sync_0,
         auto_int_out_44_sync_0,
         auto_int_out_43_sync_0,
         auto_int_out_42_sync_0,
         auto_int_out_41_sync_0,
         auto_int_out_40_sync_0,
         auto_int_out_39_sync_0,
         auto_int_out_38_sync_0,
         auto_int_out_37_sync_0,
         auto_int_out_36_sync_0,
         auto_int_out_35_sync_0,
         auto_int_out_34_sync_0,
         auto_int_out_33_sync_0,
         auto_int_out_32_sync_0,
         auto_int_out_31_sync_0,
         auto_int_out_30_sync_0,
         auto_int_out_29_sync_0,
         auto_int_out_28_sync_0,
         auto_int_out_27_sync_0,
         auto_int_out_26_sync_0,
         auto_int_out_25_sync_0,
         auto_int_out_24_sync_0,
         auto_int_out_23_sync_0,
         auto_int_out_22_sync_0,
         auto_int_out_21_sync_0,
         auto_int_out_20_sync_0,
         auto_int_out_19_sync_0,
         auto_int_out_18_sync_0,
         auto_int_out_17_sync_0,
         auto_int_out_16_sync_0,
         auto_int_out_15_sync_0,
         auto_int_out_14_sync_0,
         auto_int_out_13_sync_0,
         auto_int_out_12_sync_0,
         auto_int_out_11_sync_0,
         auto_int_out_10_sync_0,
         auto_int_out_9_sync_0,
         auto_int_out_8_sync_0,
         auto_int_out_7_sync_0,
         auto_int_out_6_sync_0,
         auto_int_out_5_sync_0,
         auto_int_out_4_sync_0,
         auto_int_out_3_sync_0,
         auto_int_out_2_sync_0,
         auto_int_out_1_sync_0,
         auto_int_out_0_sync_0
);

  assign auto_int_out_165_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_164_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_163_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_162_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_161_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_160_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_159_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_158_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_157_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_156_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_155_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_154_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_153_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_152_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_151_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_150_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_149_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_148_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_147_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_146_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_145_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_144_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_143_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_142_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_141_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_140_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_139_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_138_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_137_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_136_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_135_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_134_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_133_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_132_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_131_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_130_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_129_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_128_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_127_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_126_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_125_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_124_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_123_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_122_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_121_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_120_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_119_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_118_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_117_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_116_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_115_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_114_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_113_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_112_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_111_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_110_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_109_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_108_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_107_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_106_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_105_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_104_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_103_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_102_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_101_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_100_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_99_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_98_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_97_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_96_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_95_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_94_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_93_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_92_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_91_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_90_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_89_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_88_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_87_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_86_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_85_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_84_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_83_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_82_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_81_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_80_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_79_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_78_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_77_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_76_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_75_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_74_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_73_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_72_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_71_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_70_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_69_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_68_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_67_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_66_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_65_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_64_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_63_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_62_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_61_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_60_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_59_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_58_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_57_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_56_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_55_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_54_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_53_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_52_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_51_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_50_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_49_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_48_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_47_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_46_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_45_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_44_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_43_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_42_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_41_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_40_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_39_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_38_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_37_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_36_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_35_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_34_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_33_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_32_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_31_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_30_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_29_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_28_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_27_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_26_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_25_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_24_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_23_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_22_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_21_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_20_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_19_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_18_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_17_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_16_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_15_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_14_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_13_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_12_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_11_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_10_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_9_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_8_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_7_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_6_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_5_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_4_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_3_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_2_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_1_sync_0 = auto_int_in_sync_0;
  assign auto_int_out_0_sync_0 = auto_int_in_sync_0;
endmodule

