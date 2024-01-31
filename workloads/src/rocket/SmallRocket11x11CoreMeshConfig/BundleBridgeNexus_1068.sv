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

module BundleBridgeNexus_1068(
  output [6:0] auto_out_117,
               auto_out_116,
               auto_out_115,
               auto_out_114,
               auto_out_113,
               auto_out_112,
               auto_out_111,
               auto_out_110,
               auto_out_109,
               auto_out_108,
               auto_out_107,
               auto_out_106,
               auto_out_105,
               auto_out_104,
               auto_out_103,
               auto_out_102,
               auto_out_101,
               auto_out_100,
               auto_out_99,
               auto_out_98,
               auto_out_97,
               auto_out_96,
               auto_out_95,
               auto_out_94,
               auto_out_93,
               auto_out_92,
               auto_out_91,
               auto_out_90,
               auto_out_89,
               auto_out_88,
               auto_out_87,
               auto_out_86,
               auto_out_85,
               auto_out_84,
               auto_out_83,
               auto_out_82,
               auto_out_81,
               auto_out_80,
               auto_out_79,
               auto_out_78,
               auto_out_77,
               auto_out_76,
               auto_out_75,
               auto_out_74,
               auto_out_73,
               auto_out_72,
               auto_out_71,
               auto_out_70,
               auto_out_69,
               auto_out_68,
               auto_out_67,
               auto_out_66,
               auto_out_65,
               auto_out_64,
               auto_out_63,
               auto_out_62,
               auto_out_61,
               auto_out_60,
               auto_out_59,
               auto_out_58,
               auto_out_57,
               auto_out_56,
               auto_out_55,
               auto_out_54,
               auto_out_53,
               auto_out_52,
               auto_out_51,
               auto_out_50,
               auto_out_49,
               auto_out_48,
               auto_out_47,
               auto_out_46,
               auto_out_45,
               auto_out_44,
               auto_out_43,
               auto_out_42,
               auto_out_41,
               auto_out_40,
               auto_out_39,
               auto_out_38,
               auto_out_37,
               auto_out_36,
               auto_out_35,
               auto_out_34,
               auto_out_33,
               auto_out_32,
               auto_out_31,
               auto_out_30,
               auto_out_29,
               auto_out_28,
               auto_out_27,
               auto_out_26,
               auto_out_25,
               auto_out_24,
               auto_out_23,
               auto_out_22,
               auto_out_21,
               auto_out_20,
               auto_out_19,
               auto_out_18,
               auto_out_17,
               auto_out_16,
               auto_out_15,
               auto_out_14,
               auto_out_13,
               auto_out_12,
               auto_out_11,
               auto_out_10,
               auto_out_9,
               auto_out_8,
               auto_out_7,
               auto_out_6,
               auto_out_5,
               auto_out_4,
               auto_out_3,
               auto_out_2,
               auto_out_1,
               auto_out_0
);

  wire [6:0] outputs_0 = 7'h0;	// HasTiles.scala:159:32
  wire [6:0] outputs_1 = 7'h1;	// HasTiles.scala:159:32
  wire [6:0] outputs_2 = 7'h2;	// HasTiles.scala:159:32
  wire [6:0] outputs_3 = 7'h3;	// HasTiles.scala:159:32
  wire [6:0] outputs_4 = 7'h4;	// HasTiles.scala:159:32
  wire [6:0] outputs_5 = 7'h5;	// HasTiles.scala:159:32
  wire [6:0] outputs_6 = 7'h6;	// HasTiles.scala:159:32
  wire [6:0] outputs_7 = 7'h7;	// HasTiles.scala:159:32
  wire [6:0] outputs_8 = 7'h8;	// HasTiles.scala:159:32
  wire [6:0] outputs_9 = 7'h9;	// HasTiles.scala:159:32
  wire [6:0] outputs_10 = 7'hA;	// HasTiles.scala:159:32
  wire [6:0] outputs_11 = 7'hB;	// HasTiles.scala:159:32
  wire [6:0] outputs_12 = 7'hC;	// HasTiles.scala:159:32
  wire [6:0] outputs_13 = 7'hD;	// HasTiles.scala:159:32
  wire [6:0] outputs_14 = 7'hE;	// HasTiles.scala:159:32
  wire [6:0] outputs_15 = 7'hF;	// HasTiles.scala:159:32
  wire [6:0] outputs_16 = 7'h10;	// HasTiles.scala:159:32
  wire [6:0] outputs_17 = 7'h11;	// HasTiles.scala:159:32
  wire [6:0] outputs_18 = 7'h12;	// HasTiles.scala:159:32
  wire [6:0] outputs_19 = 7'h13;	// HasTiles.scala:159:32
  wire [6:0] outputs_20 = 7'h14;	// HasTiles.scala:159:32
  wire [6:0] outputs_21 = 7'h15;	// HasTiles.scala:159:32
  wire [6:0] outputs_22 = 7'h16;	// HasTiles.scala:159:32
  wire [6:0] outputs_23 = 7'h17;	// HasTiles.scala:159:32
  wire [6:0] outputs_24 = 7'h18;	// HasTiles.scala:159:32
  wire [6:0] outputs_25 = 7'h19;	// HasTiles.scala:159:32
  wire [6:0] outputs_26 = 7'h1A;	// HasTiles.scala:159:32
  wire [6:0] outputs_27 = 7'h1B;	// HasTiles.scala:159:32
  wire [6:0] outputs_28 = 7'h1C;	// HasTiles.scala:159:32
  wire [6:0] outputs_29 = 7'h1D;	// HasTiles.scala:159:32
  wire [6:0] outputs_30 = 7'h1E;	// HasTiles.scala:159:32
  wire [6:0] outputs_31 = 7'h1F;	// HasTiles.scala:159:32
  wire [6:0] outputs_32 = 7'h20;	// HasTiles.scala:159:32
  wire [6:0] outputs_33 = 7'h21;	// HasTiles.scala:159:32
  wire [6:0] outputs_34 = 7'h22;	// HasTiles.scala:159:32
  wire [6:0] outputs_35 = 7'h23;	// HasTiles.scala:159:32
  wire [6:0] outputs_36 = 7'h24;	// HasTiles.scala:159:32
  wire [6:0] outputs_37 = 7'h25;	// HasTiles.scala:159:32
  wire [6:0] outputs_38 = 7'h26;	// HasTiles.scala:159:32
  wire [6:0] outputs_39 = 7'h27;	// HasTiles.scala:159:32
  wire [6:0] outputs_40 = 7'h28;	// HasTiles.scala:159:32
  wire [6:0] outputs_41 = 7'h29;	// HasTiles.scala:159:32
  wire [6:0] outputs_42 = 7'h2A;	// HasTiles.scala:159:32
  wire [6:0] outputs_43 = 7'h2B;	// HasTiles.scala:159:32
  wire [6:0] outputs_44 = 7'h2C;	// HasTiles.scala:159:32
  wire [6:0] outputs_45 = 7'h2D;	// HasTiles.scala:159:32
  wire [6:0] outputs_46 = 7'h2E;	// HasTiles.scala:159:32
  wire [6:0] outputs_47 = 7'h2F;	// HasTiles.scala:159:32
  wire [6:0] outputs_48 = 7'h30;	// HasTiles.scala:159:32
  wire [6:0] outputs_49 = 7'h31;	// HasTiles.scala:159:32
  wire [6:0] outputs_50 = 7'h32;	// HasTiles.scala:159:32
  wire [6:0] outputs_51 = 7'h33;	// HasTiles.scala:159:32
  wire [6:0] outputs_52 = 7'h34;	// HasTiles.scala:159:32
  wire [6:0] outputs_53 = 7'h35;	// HasTiles.scala:159:32
  wire [6:0] outputs_54 = 7'h36;	// HasTiles.scala:159:32
  wire [6:0] outputs_55 = 7'h37;	// HasTiles.scala:159:32
  wire [6:0] outputs_56 = 7'h38;	// HasTiles.scala:159:32
  wire [6:0] outputs_57 = 7'h39;	// HasTiles.scala:159:32
  wire [6:0] outputs_58 = 7'h3A;	// HasTiles.scala:159:32
  wire [6:0] outputs_59 = 7'h3B;	// HasTiles.scala:159:32
  wire [6:0] outputs_60 = 7'h3C;	// HasTiles.scala:159:32
  wire [6:0] outputs_61 = 7'h3D;	// HasTiles.scala:159:32
  wire [6:0] outputs_62 = 7'h3E;	// HasTiles.scala:159:32
  wire [6:0] outputs_63 = 7'h3F;	// HasTiles.scala:159:32
  wire [6:0] outputs_64 = 7'h40;	// HasTiles.scala:159:32
  wire [6:0] outputs_65 = 7'h41;	// HasTiles.scala:159:32
  wire [6:0] outputs_66 = 7'h42;	// HasTiles.scala:159:32
  wire [6:0] outputs_67 = 7'h43;	// HasTiles.scala:159:32
  wire [6:0] outputs_68 = 7'h44;	// HasTiles.scala:159:32
  wire [6:0] outputs_69 = 7'h45;	// HasTiles.scala:159:32
  wire [6:0] outputs_70 = 7'h46;	// HasTiles.scala:159:32
  wire [6:0] outputs_71 = 7'h47;	// HasTiles.scala:159:32
  wire [6:0] outputs_72 = 7'h48;	// HasTiles.scala:159:32
  wire [6:0] outputs_73 = 7'h49;	// HasTiles.scala:159:32
  wire [6:0] outputs_74 = 7'h4A;	// HasTiles.scala:159:32
  wire [6:0] outputs_75 = 7'h4B;	// HasTiles.scala:159:32
  wire [6:0] outputs_76 = 7'h4C;	// HasTiles.scala:159:32
  wire [6:0] outputs_77 = 7'h4D;	// HasTiles.scala:159:32
  wire [6:0] outputs_78 = 7'h4E;	// HasTiles.scala:159:32
  wire [6:0] outputs_79 = 7'h4F;	// HasTiles.scala:159:32
  wire [6:0] outputs_80 = 7'h50;	// HasTiles.scala:159:32
  wire [6:0] outputs_81 = 7'h51;	// HasTiles.scala:159:32
  wire [6:0] outputs_82 = 7'h52;	// HasTiles.scala:159:32
  wire [6:0] outputs_83 = 7'h53;	// HasTiles.scala:159:32
  wire [6:0] outputs_84 = 7'h54;	// HasTiles.scala:159:32
  wire [6:0] outputs_85 = 7'h55;	// HasTiles.scala:159:32
  wire [6:0] outputs_86 = 7'h56;	// HasTiles.scala:159:32
  wire [6:0] outputs_87 = 7'h57;	// HasTiles.scala:159:32
  wire [6:0] outputs_88 = 7'h58;	// HasTiles.scala:159:32
  wire [6:0] outputs_89 = 7'h59;	// HasTiles.scala:159:32
  wire [6:0] outputs_90 = 7'h5A;	// HasTiles.scala:159:32
  wire [6:0] outputs_91 = 7'h5B;	// HasTiles.scala:159:32
  wire [6:0] outputs_92 = 7'h5C;	// HasTiles.scala:159:32
  wire [6:0] outputs_93 = 7'h5D;	// HasTiles.scala:159:32
  wire [6:0] outputs_94 = 7'h5E;	// HasTiles.scala:159:32
  wire [6:0] outputs_95 = 7'h5F;	// HasTiles.scala:159:32
  wire [6:0] outputs_96 = 7'h60;	// HasTiles.scala:159:32
  wire [6:0] outputs_97 = 7'h61;	// HasTiles.scala:159:32
  wire [6:0] outputs_98 = 7'h62;	// HasTiles.scala:159:32
  wire [6:0] outputs_99 = 7'h63;	// HasTiles.scala:159:32
  wire [6:0] outputs_100 = 7'h64;	// HasTiles.scala:159:32
  wire [6:0] outputs_101 = 7'h65;	// HasTiles.scala:159:32
  wire [6:0] outputs_102 = 7'h66;	// HasTiles.scala:159:32
  wire [6:0] outputs_103 = 7'h67;	// HasTiles.scala:159:32
  wire [6:0] outputs_104 = 7'h68;	// HasTiles.scala:159:32
  wire [6:0] outputs_105 = 7'h69;	// HasTiles.scala:159:32
  wire [6:0] outputs_106 = 7'h6A;	// HasTiles.scala:159:32
  wire [6:0] outputs_107 = 7'h6B;	// HasTiles.scala:159:32
  wire [6:0] outputs_108 = 7'h6C;	// HasTiles.scala:159:32
  wire [6:0] outputs_109 = 7'h6D;	// HasTiles.scala:159:32
  wire [6:0] outputs_110 = 7'h6E;	// HasTiles.scala:159:32
  wire [6:0] outputs_111 = 7'h6F;	// HasTiles.scala:159:32
  wire [6:0] outputs_112 = 7'h70;	// HasTiles.scala:159:32
  wire [6:0] outputs_113 = 7'h71;	// HasTiles.scala:159:32
  wire [6:0] outputs_114 = 7'h72;	// HasTiles.scala:159:32
  wire [6:0] outputs_115 = 7'h73;	// HasTiles.scala:159:32
  wire [6:0] outputs_116 = 7'h74;	// HasTiles.scala:159:32
  wire [6:0] outputs_117 = 7'h75;	// HasTiles.scala:159:32
  assign auto_out_117 = outputs_117;	// HasTiles.scala:159:32
  assign auto_out_116 = outputs_116;	// HasTiles.scala:159:32
  assign auto_out_115 = outputs_115;	// HasTiles.scala:159:32
  assign auto_out_114 = outputs_114;	// HasTiles.scala:159:32
  assign auto_out_113 = outputs_113;	// HasTiles.scala:159:32
  assign auto_out_112 = outputs_112;	// HasTiles.scala:159:32
  assign auto_out_111 = outputs_111;	// HasTiles.scala:159:32
  assign auto_out_110 = outputs_110;	// HasTiles.scala:159:32
  assign auto_out_109 = outputs_109;	// HasTiles.scala:159:32
  assign auto_out_108 = outputs_108;	// HasTiles.scala:159:32
  assign auto_out_107 = outputs_107;	// HasTiles.scala:159:32
  assign auto_out_106 = outputs_106;	// HasTiles.scala:159:32
  assign auto_out_105 = outputs_105;	// HasTiles.scala:159:32
  assign auto_out_104 = outputs_104;	// HasTiles.scala:159:32
  assign auto_out_103 = outputs_103;	// HasTiles.scala:159:32
  assign auto_out_102 = outputs_102;	// HasTiles.scala:159:32
  assign auto_out_101 = outputs_101;	// HasTiles.scala:159:32
  assign auto_out_100 = outputs_100;	// HasTiles.scala:159:32
  assign auto_out_99 = outputs_99;	// HasTiles.scala:159:32
  assign auto_out_98 = outputs_98;	// HasTiles.scala:159:32
  assign auto_out_97 = outputs_97;	// HasTiles.scala:159:32
  assign auto_out_96 = outputs_96;	// HasTiles.scala:159:32
  assign auto_out_95 = outputs_95;	// HasTiles.scala:159:32
  assign auto_out_94 = outputs_94;	// HasTiles.scala:159:32
  assign auto_out_93 = outputs_93;	// HasTiles.scala:159:32
  assign auto_out_92 = outputs_92;	// HasTiles.scala:159:32
  assign auto_out_91 = outputs_91;	// HasTiles.scala:159:32
  assign auto_out_90 = outputs_90;	// HasTiles.scala:159:32
  assign auto_out_89 = outputs_89;	// HasTiles.scala:159:32
  assign auto_out_88 = outputs_88;	// HasTiles.scala:159:32
  assign auto_out_87 = outputs_87;	// HasTiles.scala:159:32
  assign auto_out_86 = outputs_86;	// HasTiles.scala:159:32
  assign auto_out_85 = outputs_85;	// HasTiles.scala:159:32
  assign auto_out_84 = outputs_84;	// HasTiles.scala:159:32
  assign auto_out_83 = outputs_83;	// HasTiles.scala:159:32
  assign auto_out_82 = outputs_82;	// HasTiles.scala:159:32
  assign auto_out_81 = outputs_81;	// HasTiles.scala:159:32
  assign auto_out_80 = outputs_80;	// HasTiles.scala:159:32
  assign auto_out_79 = outputs_79;	// HasTiles.scala:159:32
  assign auto_out_78 = outputs_78;	// HasTiles.scala:159:32
  assign auto_out_77 = outputs_77;	// HasTiles.scala:159:32
  assign auto_out_76 = outputs_76;	// HasTiles.scala:159:32
  assign auto_out_75 = outputs_75;	// HasTiles.scala:159:32
  assign auto_out_74 = outputs_74;	// HasTiles.scala:159:32
  assign auto_out_73 = outputs_73;	// HasTiles.scala:159:32
  assign auto_out_72 = outputs_72;	// HasTiles.scala:159:32
  assign auto_out_71 = outputs_71;	// HasTiles.scala:159:32
  assign auto_out_70 = outputs_70;	// HasTiles.scala:159:32
  assign auto_out_69 = outputs_69;	// HasTiles.scala:159:32
  assign auto_out_68 = outputs_68;	// HasTiles.scala:159:32
  assign auto_out_67 = outputs_67;	// HasTiles.scala:159:32
  assign auto_out_66 = outputs_66;	// HasTiles.scala:159:32
  assign auto_out_65 = outputs_65;	// HasTiles.scala:159:32
  assign auto_out_64 = outputs_64;	// HasTiles.scala:159:32
  assign auto_out_63 = outputs_63;	// HasTiles.scala:159:32
  assign auto_out_62 = outputs_62;	// HasTiles.scala:159:32
  assign auto_out_61 = outputs_61;	// HasTiles.scala:159:32
  assign auto_out_60 = outputs_60;	// HasTiles.scala:159:32
  assign auto_out_59 = outputs_59;	// HasTiles.scala:159:32
  assign auto_out_58 = outputs_58;	// HasTiles.scala:159:32
  assign auto_out_57 = outputs_57;	// HasTiles.scala:159:32
  assign auto_out_56 = outputs_56;	// HasTiles.scala:159:32
  assign auto_out_55 = outputs_55;	// HasTiles.scala:159:32
  assign auto_out_54 = outputs_54;	// HasTiles.scala:159:32
  assign auto_out_53 = outputs_53;	// HasTiles.scala:159:32
  assign auto_out_52 = outputs_52;	// HasTiles.scala:159:32
  assign auto_out_51 = outputs_51;	// HasTiles.scala:159:32
  assign auto_out_50 = outputs_50;	// HasTiles.scala:159:32
  assign auto_out_49 = outputs_49;	// HasTiles.scala:159:32
  assign auto_out_48 = outputs_48;	// HasTiles.scala:159:32
  assign auto_out_47 = outputs_47;	// HasTiles.scala:159:32
  assign auto_out_46 = outputs_46;	// HasTiles.scala:159:32
  assign auto_out_45 = outputs_45;	// HasTiles.scala:159:32
  assign auto_out_44 = outputs_44;	// HasTiles.scala:159:32
  assign auto_out_43 = outputs_43;	// HasTiles.scala:159:32
  assign auto_out_42 = outputs_42;	// HasTiles.scala:159:32
  assign auto_out_41 = outputs_41;	// HasTiles.scala:159:32
  assign auto_out_40 = outputs_40;	// HasTiles.scala:159:32
  assign auto_out_39 = outputs_39;	// HasTiles.scala:159:32
  assign auto_out_38 = outputs_38;	// HasTiles.scala:159:32
  assign auto_out_37 = outputs_37;	// HasTiles.scala:159:32
  assign auto_out_36 = outputs_36;	// HasTiles.scala:159:32
  assign auto_out_35 = outputs_35;	// HasTiles.scala:159:32
  assign auto_out_34 = outputs_34;	// HasTiles.scala:159:32
  assign auto_out_33 = outputs_33;	// HasTiles.scala:159:32
  assign auto_out_32 = outputs_32;	// HasTiles.scala:159:32
  assign auto_out_31 = outputs_31;	// HasTiles.scala:159:32
  assign auto_out_30 = outputs_30;	// HasTiles.scala:159:32
  assign auto_out_29 = outputs_29;	// HasTiles.scala:159:32
  assign auto_out_28 = outputs_28;	// HasTiles.scala:159:32
  assign auto_out_27 = outputs_27;	// HasTiles.scala:159:32
  assign auto_out_26 = outputs_26;	// HasTiles.scala:159:32
  assign auto_out_25 = outputs_25;	// HasTiles.scala:159:32
  assign auto_out_24 = outputs_24;	// HasTiles.scala:159:32
  assign auto_out_23 = outputs_23;	// HasTiles.scala:159:32
  assign auto_out_22 = outputs_22;	// HasTiles.scala:159:32
  assign auto_out_21 = outputs_21;	// HasTiles.scala:159:32
  assign auto_out_20 = outputs_20;	// HasTiles.scala:159:32
  assign auto_out_19 = outputs_19;	// HasTiles.scala:159:32
  assign auto_out_18 = outputs_18;	// HasTiles.scala:159:32
  assign auto_out_17 = outputs_17;	// HasTiles.scala:159:32
  assign auto_out_16 = outputs_16;	// HasTiles.scala:159:32
  assign auto_out_15 = outputs_15;	// HasTiles.scala:159:32
  assign auto_out_14 = outputs_14;	// HasTiles.scala:159:32
  assign auto_out_13 = outputs_13;	// HasTiles.scala:159:32
  assign auto_out_12 = outputs_12;	// HasTiles.scala:159:32
  assign auto_out_11 = outputs_11;	// HasTiles.scala:159:32
  assign auto_out_10 = outputs_10;	// HasTiles.scala:159:32
  assign auto_out_9 = outputs_9;	// HasTiles.scala:159:32
  assign auto_out_8 = outputs_8;	// HasTiles.scala:159:32
  assign auto_out_7 = outputs_7;	// HasTiles.scala:159:32
  assign auto_out_6 = outputs_6;	// HasTiles.scala:159:32
  assign auto_out_5 = outputs_5;	// HasTiles.scala:159:32
  assign auto_out_4 = outputs_4;	// HasTiles.scala:159:32
  assign auto_out_3 = outputs_3;	// HasTiles.scala:159:32
  assign auto_out_2 = outputs_2;	// HasTiles.scala:159:32
  assign auto_out_1 = outputs_1;	// HasTiles.scala:159:32
  assign auto_out_0 = outputs_0;	// HasTiles.scala:159:32
endmodule
