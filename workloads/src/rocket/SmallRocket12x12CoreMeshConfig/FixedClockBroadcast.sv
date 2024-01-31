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

module FixedClockBroadcast(
  input  auto_in_clock,
         auto_in_reset,
  output auto_out_142_clock,
         auto_out_142_reset,
         auto_out_141_clock,
         auto_out_141_reset,
         auto_out_140_clock,
         auto_out_140_reset,
         auto_out_139_clock,
         auto_out_139_reset,
         auto_out_138_clock,
         auto_out_138_reset,
         auto_out_137_clock,
         auto_out_137_reset,
         auto_out_136_clock,
         auto_out_136_reset,
         auto_out_135_clock,
         auto_out_135_reset,
         auto_out_134_clock,
         auto_out_134_reset,
         auto_out_133_clock,
         auto_out_133_reset,
         auto_out_132_clock,
         auto_out_132_reset,
         auto_out_131_clock,
         auto_out_131_reset,
         auto_out_130_clock,
         auto_out_130_reset,
         auto_out_129_clock,
         auto_out_129_reset,
         auto_out_128_clock,
         auto_out_128_reset,
         auto_out_127_clock,
         auto_out_127_reset,
         auto_out_126_clock,
         auto_out_126_reset,
         auto_out_125_clock,
         auto_out_125_reset,
         auto_out_124_clock,
         auto_out_124_reset,
         auto_out_123_clock,
         auto_out_123_reset,
         auto_out_122_clock,
         auto_out_122_reset,
         auto_out_121_clock,
         auto_out_121_reset,
         auto_out_120_clock,
         auto_out_120_reset,
         auto_out_119_clock,
         auto_out_119_reset,
         auto_out_118_clock,
         auto_out_118_reset,
         auto_out_117_clock,
         auto_out_117_reset,
         auto_out_116_clock,
         auto_out_116_reset,
         auto_out_115_clock,
         auto_out_115_reset,
         auto_out_114_clock,
         auto_out_114_reset,
         auto_out_113_clock,
         auto_out_113_reset,
         auto_out_112_clock,
         auto_out_112_reset,
         auto_out_111_clock,
         auto_out_111_reset,
         auto_out_110_clock,
         auto_out_110_reset,
         auto_out_109_clock,
         auto_out_109_reset,
         auto_out_108_clock,
         auto_out_108_reset,
         auto_out_107_clock,
         auto_out_107_reset,
         auto_out_106_clock,
         auto_out_106_reset,
         auto_out_105_clock,
         auto_out_105_reset,
         auto_out_104_clock,
         auto_out_104_reset,
         auto_out_103_clock,
         auto_out_103_reset,
         auto_out_102_clock,
         auto_out_102_reset,
         auto_out_101_clock,
         auto_out_101_reset,
         auto_out_100_clock,
         auto_out_100_reset,
         auto_out_99_clock,
         auto_out_99_reset,
         auto_out_98_clock,
         auto_out_98_reset,
         auto_out_97_clock,
         auto_out_97_reset,
         auto_out_96_clock,
         auto_out_96_reset,
         auto_out_95_clock,
         auto_out_95_reset,
         auto_out_94_clock,
         auto_out_94_reset,
         auto_out_93_clock,
         auto_out_93_reset,
         auto_out_92_clock,
         auto_out_92_reset,
         auto_out_91_clock,
         auto_out_91_reset,
         auto_out_90_clock,
         auto_out_90_reset,
         auto_out_89_clock,
         auto_out_89_reset,
         auto_out_88_clock,
         auto_out_88_reset,
         auto_out_87_clock,
         auto_out_87_reset,
         auto_out_86_clock,
         auto_out_86_reset,
         auto_out_85_clock,
         auto_out_85_reset,
         auto_out_84_clock,
         auto_out_84_reset,
         auto_out_83_clock,
         auto_out_83_reset,
         auto_out_82_clock,
         auto_out_82_reset,
         auto_out_81_clock,
         auto_out_81_reset,
         auto_out_80_clock,
         auto_out_80_reset,
         auto_out_79_clock,
         auto_out_79_reset,
         auto_out_78_clock,
         auto_out_78_reset,
         auto_out_77_clock,
         auto_out_77_reset,
         auto_out_76_clock,
         auto_out_76_reset,
         auto_out_75_clock,
         auto_out_75_reset,
         auto_out_74_clock,
         auto_out_74_reset,
         auto_out_73_clock,
         auto_out_73_reset,
         auto_out_72_clock,
         auto_out_72_reset,
         auto_out_71_clock,
         auto_out_71_reset,
         auto_out_70_clock,
         auto_out_70_reset,
         auto_out_69_clock,
         auto_out_69_reset,
         auto_out_68_clock,
         auto_out_68_reset,
         auto_out_67_clock,
         auto_out_67_reset,
         auto_out_66_clock,
         auto_out_66_reset,
         auto_out_65_clock,
         auto_out_65_reset,
         auto_out_64_clock,
         auto_out_64_reset,
         auto_out_63_clock,
         auto_out_63_reset,
         auto_out_62_clock,
         auto_out_62_reset,
         auto_out_61_clock,
         auto_out_61_reset,
         auto_out_60_clock,
         auto_out_60_reset,
         auto_out_59_clock,
         auto_out_59_reset,
         auto_out_58_clock,
         auto_out_58_reset,
         auto_out_57_clock,
         auto_out_57_reset,
         auto_out_56_clock,
         auto_out_56_reset,
         auto_out_55_clock,
         auto_out_55_reset,
         auto_out_54_clock,
         auto_out_54_reset,
         auto_out_53_clock,
         auto_out_53_reset,
         auto_out_52_clock,
         auto_out_52_reset,
         auto_out_51_clock,
         auto_out_51_reset,
         auto_out_50_clock,
         auto_out_50_reset,
         auto_out_49_clock,
         auto_out_49_reset,
         auto_out_48_clock,
         auto_out_48_reset,
         auto_out_47_clock,
         auto_out_47_reset,
         auto_out_46_clock,
         auto_out_46_reset,
         auto_out_45_clock,
         auto_out_45_reset,
         auto_out_44_clock,
         auto_out_44_reset,
         auto_out_43_clock,
         auto_out_43_reset,
         auto_out_42_clock,
         auto_out_42_reset,
         auto_out_41_clock,
         auto_out_41_reset,
         auto_out_40_clock,
         auto_out_40_reset,
         auto_out_39_clock,
         auto_out_39_reset,
         auto_out_38_clock,
         auto_out_38_reset,
         auto_out_37_clock,
         auto_out_37_reset,
         auto_out_36_clock,
         auto_out_36_reset,
         auto_out_35_clock,
         auto_out_35_reset,
         auto_out_34_clock,
         auto_out_34_reset,
         auto_out_33_clock,
         auto_out_33_reset,
         auto_out_32_clock,
         auto_out_32_reset,
         auto_out_31_clock,
         auto_out_31_reset,
         auto_out_30_clock,
         auto_out_30_reset,
         auto_out_29_clock,
         auto_out_29_reset,
         auto_out_28_clock,
         auto_out_28_reset,
         auto_out_27_clock,
         auto_out_27_reset,
         auto_out_26_clock,
         auto_out_26_reset,
         auto_out_25_clock,
         auto_out_25_reset,
         auto_out_24_clock,
         auto_out_24_reset,
         auto_out_23_clock,
         auto_out_23_reset,
         auto_out_22_clock,
         auto_out_22_reset,
         auto_out_21_clock,
         auto_out_21_reset,
         auto_out_20_clock,
         auto_out_20_reset,
         auto_out_19_clock,
         auto_out_19_reset,
         auto_out_18_clock,
         auto_out_18_reset,
         auto_out_17_clock,
         auto_out_17_reset,
         auto_out_16_clock,
         auto_out_16_reset,
         auto_out_15_clock,
         auto_out_15_reset,
         auto_out_14_clock,
         auto_out_14_reset,
         auto_out_13_clock,
         auto_out_13_reset,
         auto_out_12_clock,
         auto_out_12_reset,
         auto_out_11_clock,
         auto_out_11_reset,
         auto_out_10_clock,
         auto_out_10_reset,
         auto_out_9_clock,
         auto_out_9_reset,
         auto_out_8_clock,
         auto_out_8_reset,
         auto_out_7_clock,
         auto_out_7_reset,
         auto_out_6_clock,
         auto_out_6_reset,
         auto_out_5_clock,
         auto_out_5_reset,
         auto_out_4_clock,
         auto_out_4_reset,
         auto_out_3_clock,
         auto_out_3_reset,
         auto_out_2_clock,
         auto_out_2_reset,
         auto_out_0_clock,
         auto_out_0_reset
);

  assign auto_out_142_clock = auto_in_clock;
  assign auto_out_142_reset = auto_in_reset;
  assign auto_out_141_clock = auto_in_clock;
  assign auto_out_141_reset = auto_in_reset;
  assign auto_out_140_clock = auto_in_clock;
  assign auto_out_140_reset = auto_in_reset;
  assign auto_out_139_clock = auto_in_clock;
  assign auto_out_139_reset = auto_in_reset;
  assign auto_out_138_clock = auto_in_clock;
  assign auto_out_138_reset = auto_in_reset;
  assign auto_out_137_clock = auto_in_clock;
  assign auto_out_137_reset = auto_in_reset;
  assign auto_out_136_clock = auto_in_clock;
  assign auto_out_136_reset = auto_in_reset;
  assign auto_out_135_clock = auto_in_clock;
  assign auto_out_135_reset = auto_in_reset;
  assign auto_out_134_clock = auto_in_clock;
  assign auto_out_134_reset = auto_in_reset;
  assign auto_out_133_clock = auto_in_clock;
  assign auto_out_133_reset = auto_in_reset;
  assign auto_out_132_clock = auto_in_clock;
  assign auto_out_132_reset = auto_in_reset;
  assign auto_out_131_clock = auto_in_clock;
  assign auto_out_131_reset = auto_in_reset;
  assign auto_out_130_clock = auto_in_clock;
  assign auto_out_130_reset = auto_in_reset;
  assign auto_out_129_clock = auto_in_clock;
  assign auto_out_129_reset = auto_in_reset;
  assign auto_out_128_clock = auto_in_clock;
  assign auto_out_128_reset = auto_in_reset;
  assign auto_out_127_clock = auto_in_clock;
  assign auto_out_127_reset = auto_in_reset;
  assign auto_out_126_clock = auto_in_clock;
  assign auto_out_126_reset = auto_in_reset;
  assign auto_out_125_clock = auto_in_clock;
  assign auto_out_125_reset = auto_in_reset;
  assign auto_out_124_clock = auto_in_clock;
  assign auto_out_124_reset = auto_in_reset;
  assign auto_out_123_clock = auto_in_clock;
  assign auto_out_123_reset = auto_in_reset;
  assign auto_out_122_clock = auto_in_clock;
  assign auto_out_122_reset = auto_in_reset;
  assign auto_out_121_clock = auto_in_clock;
  assign auto_out_121_reset = auto_in_reset;
  assign auto_out_120_clock = auto_in_clock;
  assign auto_out_120_reset = auto_in_reset;
  assign auto_out_119_clock = auto_in_clock;
  assign auto_out_119_reset = auto_in_reset;
  assign auto_out_118_clock = auto_in_clock;
  assign auto_out_118_reset = auto_in_reset;
  assign auto_out_117_clock = auto_in_clock;
  assign auto_out_117_reset = auto_in_reset;
  assign auto_out_116_clock = auto_in_clock;
  assign auto_out_116_reset = auto_in_reset;
  assign auto_out_115_clock = auto_in_clock;
  assign auto_out_115_reset = auto_in_reset;
  assign auto_out_114_clock = auto_in_clock;
  assign auto_out_114_reset = auto_in_reset;
  assign auto_out_113_clock = auto_in_clock;
  assign auto_out_113_reset = auto_in_reset;
  assign auto_out_112_clock = auto_in_clock;
  assign auto_out_112_reset = auto_in_reset;
  assign auto_out_111_clock = auto_in_clock;
  assign auto_out_111_reset = auto_in_reset;
  assign auto_out_110_clock = auto_in_clock;
  assign auto_out_110_reset = auto_in_reset;
  assign auto_out_109_clock = auto_in_clock;
  assign auto_out_109_reset = auto_in_reset;
  assign auto_out_108_clock = auto_in_clock;
  assign auto_out_108_reset = auto_in_reset;
  assign auto_out_107_clock = auto_in_clock;
  assign auto_out_107_reset = auto_in_reset;
  assign auto_out_106_clock = auto_in_clock;
  assign auto_out_106_reset = auto_in_reset;
  assign auto_out_105_clock = auto_in_clock;
  assign auto_out_105_reset = auto_in_reset;
  assign auto_out_104_clock = auto_in_clock;
  assign auto_out_104_reset = auto_in_reset;
  assign auto_out_103_clock = auto_in_clock;
  assign auto_out_103_reset = auto_in_reset;
  assign auto_out_102_clock = auto_in_clock;
  assign auto_out_102_reset = auto_in_reset;
  assign auto_out_101_clock = auto_in_clock;
  assign auto_out_101_reset = auto_in_reset;
  assign auto_out_100_clock = auto_in_clock;
  assign auto_out_100_reset = auto_in_reset;
  assign auto_out_99_clock = auto_in_clock;
  assign auto_out_99_reset = auto_in_reset;
  assign auto_out_98_clock = auto_in_clock;
  assign auto_out_98_reset = auto_in_reset;
  assign auto_out_97_clock = auto_in_clock;
  assign auto_out_97_reset = auto_in_reset;
  assign auto_out_96_clock = auto_in_clock;
  assign auto_out_96_reset = auto_in_reset;
  assign auto_out_95_clock = auto_in_clock;
  assign auto_out_95_reset = auto_in_reset;
  assign auto_out_94_clock = auto_in_clock;
  assign auto_out_94_reset = auto_in_reset;
  assign auto_out_93_clock = auto_in_clock;
  assign auto_out_93_reset = auto_in_reset;
  assign auto_out_92_clock = auto_in_clock;
  assign auto_out_92_reset = auto_in_reset;
  assign auto_out_91_clock = auto_in_clock;
  assign auto_out_91_reset = auto_in_reset;
  assign auto_out_90_clock = auto_in_clock;
  assign auto_out_90_reset = auto_in_reset;
  assign auto_out_89_clock = auto_in_clock;
  assign auto_out_89_reset = auto_in_reset;
  assign auto_out_88_clock = auto_in_clock;
  assign auto_out_88_reset = auto_in_reset;
  assign auto_out_87_clock = auto_in_clock;
  assign auto_out_87_reset = auto_in_reset;
  assign auto_out_86_clock = auto_in_clock;
  assign auto_out_86_reset = auto_in_reset;
  assign auto_out_85_clock = auto_in_clock;
  assign auto_out_85_reset = auto_in_reset;
  assign auto_out_84_clock = auto_in_clock;
  assign auto_out_84_reset = auto_in_reset;
  assign auto_out_83_clock = auto_in_clock;
  assign auto_out_83_reset = auto_in_reset;
  assign auto_out_82_clock = auto_in_clock;
  assign auto_out_82_reset = auto_in_reset;
  assign auto_out_81_clock = auto_in_clock;
  assign auto_out_81_reset = auto_in_reset;
  assign auto_out_80_clock = auto_in_clock;
  assign auto_out_80_reset = auto_in_reset;
  assign auto_out_79_clock = auto_in_clock;
  assign auto_out_79_reset = auto_in_reset;
  assign auto_out_78_clock = auto_in_clock;
  assign auto_out_78_reset = auto_in_reset;
  assign auto_out_77_clock = auto_in_clock;
  assign auto_out_77_reset = auto_in_reset;
  assign auto_out_76_clock = auto_in_clock;
  assign auto_out_76_reset = auto_in_reset;
  assign auto_out_75_clock = auto_in_clock;
  assign auto_out_75_reset = auto_in_reset;
  assign auto_out_74_clock = auto_in_clock;
  assign auto_out_74_reset = auto_in_reset;
  assign auto_out_73_clock = auto_in_clock;
  assign auto_out_73_reset = auto_in_reset;
  assign auto_out_72_clock = auto_in_clock;
  assign auto_out_72_reset = auto_in_reset;
  assign auto_out_71_clock = auto_in_clock;
  assign auto_out_71_reset = auto_in_reset;
  assign auto_out_70_clock = auto_in_clock;
  assign auto_out_70_reset = auto_in_reset;
  assign auto_out_69_clock = auto_in_clock;
  assign auto_out_69_reset = auto_in_reset;
  assign auto_out_68_clock = auto_in_clock;
  assign auto_out_68_reset = auto_in_reset;
  assign auto_out_67_clock = auto_in_clock;
  assign auto_out_67_reset = auto_in_reset;
  assign auto_out_66_clock = auto_in_clock;
  assign auto_out_66_reset = auto_in_reset;
  assign auto_out_65_clock = auto_in_clock;
  assign auto_out_65_reset = auto_in_reset;
  assign auto_out_64_clock = auto_in_clock;
  assign auto_out_64_reset = auto_in_reset;
  assign auto_out_63_clock = auto_in_clock;
  assign auto_out_63_reset = auto_in_reset;
  assign auto_out_62_clock = auto_in_clock;
  assign auto_out_62_reset = auto_in_reset;
  assign auto_out_61_clock = auto_in_clock;
  assign auto_out_61_reset = auto_in_reset;
  assign auto_out_60_clock = auto_in_clock;
  assign auto_out_60_reset = auto_in_reset;
  assign auto_out_59_clock = auto_in_clock;
  assign auto_out_59_reset = auto_in_reset;
  assign auto_out_58_clock = auto_in_clock;
  assign auto_out_58_reset = auto_in_reset;
  assign auto_out_57_clock = auto_in_clock;
  assign auto_out_57_reset = auto_in_reset;
  assign auto_out_56_clock = auto_in_clock;
  assign auto_out_56_reset = auto_in_reset;
  assign auto_out_55_clock = auto_in_clock;
  assign auto_out_55_reset = auto_in_reset;
  assign auto_out_54_clock = auto_in_clock;
  assign auto_out_54_reset = auto_in_reset;
  assign auto_out_53_clock = auto_in_clock;
  assign auto_out_53_reset = auto_in_reset;
  assign auto_out_52_clock = auto_in_clock;
  assign auto_out_52_reset = auto_in_reset;
  assign auto_out_51_clock = auto_in_clock;
  assign auto_out_51_reset = auto_in_reset;
  assign auto_out_50_clock = auto_in_clock;
  assign auto_out_50_reset = auto_in_reset;
  assign auto_out_49_clock = auto_in_clock;
  assign auto_out_49_reset = auto_in_reset;
  assign auto_out_48_clock = auto_in_clock;
  assign auto_out_48_reset = auto_in_reset;
  assign auto_out_47_clock = auto_in_clock;
  assign auto_out_47_reset = auto_in_reset;
  assign auto_out_46_clock = auto_in_clock;
  assign auto_out_46_reset = auto_in_reset;
  assign auto_out_45_clock = auto_in_clock;
  assign auto_out_45_reset = auto_in_reset;
  assign auto_out_44_clock = auto_in_clock;
  assign auto_out_44_reset = auto_in_reset;
  assign auto_out_43_clock = auto_in_clock;
  assign auto_out_43_reset = auto_in_reset;
  assign auto_out_42_clock = auto_in_clock;
  assign auto_out_42_reset = auto_in_reset;
  assign auto_out_41_clock = auto_in_clock;
  assign auto_out_41_reset = auto_in_reset;
  assign auto_out_40_clock = auto_in_clock;
  assign auto_out_40_reset = auto_in_reset;
  assign auto_out_39_clock = auto_in_clock;
  assign auto_out_39_reset = auto_in_reset;
  assign auto_out_38_clock = auto_in_clock;
  assign auto_out_38_reset = auto_in_reset;
  assign auto_out_37_clock = auto_in_clock;
  assign auto_out_37_reset = auto_in_reset;
  assign auto_out_36_clock = auto_in_clock;
  assign auto_out_36_reset = auto_in_reset;
  assign auto_out_35_clock = auto_in_clock;
  assign auto_out_35_reset = auto_in_reset;
  assign auto_out_34_clock = auto_in_clock;
  assign auto_out_34_reset = auto_in_reset;
  assign auto_out_33_clock = auto_in_clock;
  assign auto_out_33_reset = auto_in_reset;
  assign auto_out_32_clock = auto_in_clock;
  assign auto_out_32_reset = auto_in_reset;
  assign auto_out_31_clock = auto_in_clock;
  assign auto_out_31_reset = auto_in_reset;
  assign auto_out_30_clock = auto_in_clock;
  assign auto_out_30_reset = auto_in_reset;
  assign auto_out_29_clock = auto_in_clock;
  assign auto_out_29_reset = auto_in_reset;
  assign auto_out_28_clock = auto_in_clock;
  assign auto_out_28_reset = auto_in_reset;
  assign auto_out_27_clock = auto_in_clock;
  assign auto_out_27_reset = auto_in_reset;
  assign auto_out_26_clock = auto_in_clock;
  assign auto_out_26_reset = auto_in_reset;
  assign auto_out_25_clock = auto_in_clock;
  assign auto_out_25_reset = auto_in_reset;
  assign auto_out_24_clock = auto_in_clock;
  assign auto_out_24_reset = auto_in_reset;
  assign auto_out_23_clock = auto_in_clock;
  assign auto_out_23_reset = auto_in_reset;
  assign auto_out_22_clock = auto_in_clock;
  assign auto_out_22_reset = auto_in_reset;
  assign auto_out_21_clock = auto_in_clock;
  assign auto_out_21_reset = auto_in_reset;
  assign auto_out_20_clock = auto_in_clock;
  assign auto_out_20_reset = auto_in_reset;
  assign auto_out_19_clock = auto_in_clock;
  assign auto_out_19_reset = auto_in_reset;
  assign auto_out_18_clock = auto_in_clock;
  assign auto_out_18_reset = auto_in_reset;
  assign auto_out_17_clock = auto_in_clock;
  assign auto_out_17_reset = auto_in_reset;
  assign auto_out_16_clock = auto_in_clock;
  assign auto_out_16_reset = auto_in_reset;
  assign auto_out_15_clock = auto_in_clock;
  assign auto_out_15_reset = auto_in_reset;
  assign auto_out_14_clock = auto_in_clock;
  assign auto_out_14_reset = auto_in_reset;
  assign auto_out_13_clock = auto_in_clock;
  assign auto_out_13_reset = auto_in_reset;
  assign auto_out_12_clock = auto_in_clock;
  assign auto_out_12_reset = auto_in_reset;
  assign auto_out_11_clock = auto_in_clock;
  assign auto_out_11_reset = auto_in_reset;
  assign auto_out_10_clock = auto_in_clock;
  assign auto_out_10_reset = auto_in_reset;
  assign auto_out_9_clock = auto_in_clock;
  assign auto_out_9_reset = auto_in_reset;
  assign auto_out_8_clock = auto_in_clock;
  assign auto_out_8_reset = auto_in_reset;
  assign auto_out_7_clock = auto_in_clock;
  assign auto_out_7_reset = auto_in_reset;
  assign auto_out_6_clock = auto_in_clock;
  assign auto_out_6_reset = auto_in_reset;
  assign auto_out_5_clock = auto_in_clock;
  assign auto_out_5_reset = auto_in_reset;
  assign auto_out_4_clock = auto_in_clock;
  assign auto_out_4_reset = auto_in_reset;
  assign auto_out_3_clock = auto_in_clock;
  assign auto_out_3_reset = auto_in_reset;
  assign auto_out_2_clock = auto_in_clock;
  assign auto_out_2_reset = auto_in_reset;
  assign auto_out_0_clock = auto_in_clock;
  assign auto_out_0_reset = auto_in_reset;
endmodule

