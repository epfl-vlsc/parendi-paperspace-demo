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

module PeripheryBus(
  input         auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock,
                auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset,
                auto_bus_xing_in_a_valid,
  input  [2:0]  auto_bus_xing_in_a_bits_opcode,
                auto_bus_xing_in_a_bits_param,
                auto_bus_xing_in_a_bits_size,
  input  [5:0]  auto_bus_xing_in_a_bits_source,
  input  [14:0] auto_bus_xing_in_a_bits_address,
  input  [7:0]  auto_bus_xing_in_a_bits_mask,
  input  [63:0] auto_bus_xing_in_a_bits_data,
  input         auto_bus_xing_in_a_bits_corrupt,
                auto_bus_xing_in_d_ready,
  output        auto_bus_xing_in_a_ready,
                auto_bus_xing_in_d_valid,
  output [2:0]  auto_bus_xing_in_d_bits_opcode,
  output [1:0]  auto_bus_xing_in_d_bits_param,
  output [2:0]  auto_bus_xing_in_d_bits_size,
  output [5:0]  auto_bus_xing_in_d_bits_source,
  output        auto_bus_xing_in_d_bits_sink,
                auto_bus_xing_in_d_bits_denied,
  output [63:0] auto_bus_xing_in_d_bits_data,
  output        auto_bus_xing_in_d_bits_corrupt
);

  wire        out_woready_7;	// RegisterRouter.scala:83:24
  wire        _coupler_to_bootaddressreg_auto_fragmenter_out_a_valid;	// LazyModule.scala:489:27
  wire [2:0]  _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_opcode;	// LazyModule.scala:489:27
  wire [1:0]  _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_size;	// LazyModule.scala:489:27
  wire [9:0]  _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_source;	// LazyModule.scala:489:27
  wire [14:0] _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_address;	// LazyModule.scala:489:27
  wire [7:0]  _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask;	// LazyModule.scala:489:27
  wire [63:0] _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data;	// LazyModule.scala:489:27
  wire        _coupler_to_bootaddressreg_auto_fragmenter_out_d_ready;	// LazyModule.scala:489:27
  wire        _coupler_to_bootaddressreg_auto_tl_in_a_ready;	// LazyModule.scala:489:27
  wire        _coupler_to_bootaddressreg_auto_tl_in_d_valid;	// LazyModule.scala:489:27
  wire [2:0]  _coupler_to_bootaddressreg_auto_tl_in_d_bits_opcode;	// LazyModule.scala:489:27
  wire [2:0]  _coupler_to_bootaddressreg_auto_tl_in_d_bits_size;	// LazyModule.scala:489:27
  wire [5:0]  _coupler_to_bootaddressreg_auto_tl_in_d_bits_source;	// LazyModule.scala:489:27
  wire [63:0] _coupler_to_bootaddressreg_auto_tl_in_d_bits_data;	// LazyModule.scala:489:27
  wire        _buffer_1_auto_out_a_valid;	// Buffer.scala:69:28
  wire [2:0]  _buffer_1_auto_out_a_bits_opcode;	// Buffer.scala:69:28
  wire [2:0]  _buffer_1_auto_out_a_bits_param;	// Buffer.scala:69:28
  wire [2:0]  _buffer_1_auto_out_a_bits_size;	// Buffer.scala:69:28
  wire [5:0]  _buffer_1_auto_out_a_bits_source;	// Buffer.scala:69:28
  wire [14:0] _buffer_1_auto_out_a_bits_address;	// Buffer.scala:69:28
  wire [7:0]  _buffer_1_auto_out_a_bits_mask;	// Buffer.scala:69:28
  wire [63:0] _buffer_1_auto_out_a_bits_data;	// Buffer.scala:69:28
  wire        _buffer_1_auto_out_a_bits_corrupt;	// Buffer.scala:69:28
  wire        _buffer_1_auto_out_d_ready;	// Buffer.scala:69:28
  wire        _atomics_auto_in_a_ready;	// AtomicAutomata.scala:285:29
  wire        _atomics_auto_in_d_valid;	// AtomicAutomata.scala:285:29
  wire [2:0]  _atomics_auto_in_d_bits_opcode;	// AtomicAutomata.scala:285:29
  wire [1:0]  _atomics_auto_in_d_bits_param;	// AtomicAutomata.scala:285:29
  wire [2:0]  _atomics_auto_in_d_bits_size;	// AtomicAutomata.scala:285:29
  wire [5:0]  _atomics_auto_in_d_bits_source;	// AtomicAutomata.scala:285:29
  wire        _atomics_auto_in_d_bits_sink;	// AtomicAutomata.scala:285:29
  wire        _atomics_auto_in_d_bits_denied;	// AtomicAutomata.scala:285:29
  wire [63:0] _atomics_auto_in_d_bits_data;	// AtomicAutomata.scala:285:29
  wire        _atomics_auto_in_d_bits_corrupt;	// AtomicAutomata.scala:285:29
  wire        _atomics_auto_out_a_valid;	// AtomicAutomata.scala:285:29
  wire [2:0]  _atomics_auto_out_a_bits_opcode;	// AtomicAutomata.scala:285:29
  wire [2:0]  _atomics_auto_out_a_bits_param;	// AtomicAutomata.scala:285:29
  wire [2:0]  _atomics_auto_out_a_bits_size;	// AtomicAutomata.scala:285:29
  wire [5:0]  _atomics_auto_out_a_bits_source;	// AtomicAutomata.scala:285:29
  wire [14:0] _atomics_auto_out_a_bits_address;	// AtomicAutomata.scala:285:29
  wire [7:0]  _atomics_auto_out_a_bits_mask;	// AtomicAutomata.scala:285:29
  wire [63:0] _atomics_auto_out_a_bits_data;	// AtomicAutomata.scala:285:29
  wire        _atomics_auto_out_a_bits_corrupt;	// AtomicAutomata.scala:285:29
  wire        _atomics_auto_out_d_ready;	// AtomicAutomata.scala:285:29
  wire        _buffer_auto_in_a_ready;	// Buffer.scala:69:28
  wire        _buffer_auto_in_d_valid;	// Buffer.scala:69:28
  wire [2:0]  _buffer_auto_in_d_bits_opcode;	// Buffer.scala:69:28
  wire [1:0]  _buffer_auto_in_d_bits_param;	// Buffer.scala:69:28
  wire [2:0]  _buffer_auto_in_d_bits_size;	// Buffer.scala:69:28
  wire [5:0]  _buffer_auto_in_d_bits_source;	// Buffer.scala:69:28
  wire        _buffer_auto_in_d_bits_sink;	// Buffer.scala:69:28
  wire        _buffer_auto_in_d_bits_denied;	// Buffer.scala:69:28
  wire [63:0] _buffer_auto_in_d_bits_data;	// Buffer.scala:69:28
  wire        _buffer_auto_in_d_bits_corrupt;	// Buffer.scala:69:28
  wire        _buffer_auto_out_a_valid;	// Buffer.scala:69:28
  wire [2:0]  _buffer_auto_out_a_bits_opcode;	// Buffer.scala:69:28
  wire [2:0]  _buffer_auto_out_a_bits_param;	// Buffer.scala:69:28
  wire [2:0]  _buffer_auto_out_a_bits_size;	// Buffer.scala:69:28
  wire [5:0]  _buffer_auto_out_a_bits_source;	// Buffer.scala:69:28
  wire [14:0] _buffer_auto_out_a_bits_address;	// Buffer.scala:69:28
  wire [7:0]  _buffer_auto_out_a_bits_mask;	// Buffer.scala:69:28
  wire [63:0] _buffer_auto_out_a_bits_data;	// Buffer.scala:69:28
  wire        _buffer_auto_out_a_bits_corrupt;	// Buffer.scala:69:28
  wire        _buffer_auto_out_d_ready;	// Buffer.scala:69:28
  wire        _fixer_auto_in_a_ready;	// PeripheryBus.scala:47:33
  wire        _fixer_auto_in_d_valid;	// PeripheryBus.scala:47:33
  wire [2:0]  _fixer_auto_in_d_bits_opcode;	// PeripheryBus.scala:47:33
  wire [2:0]  _fixer_auto_in_d_bits_size;	// PeripheryBus.scala:47:33
  wire [5:0]  _fixer_auto_in_d_bits_source;	// PeripheryBus.scala:47:33
  wire [63:0] _fixer_auto_in_d_bits_data;	// PeripheryBus.scala:47:33
  wire        _fixer_auto_out_a_valid;	// PeripheryBus.scala:47:33
  wire [2:0]  _fixer_auto_out_a_bits_opcode;	// PeripheryBus.scala:47:33
  wire [2:0]  _fixer_auto_out_a_bits_size;	// PeripheryBus.scala:47:33
  wire [5:0]  _fixer_auto_out_a_bits_source;	// PeripheryBus.scala:47:33
  wire [14:0] _fixer_auto_out_a_bits_address;	// PeripheryBus.scala:47:33
  wire [7:0]  _fixer_auto_out_a_bits_mask;	// PeripheryBus.scala:47:33
  wire [63:0] _fixer_auto_out_a_bits_data;	// PeripheryBus.scala:47:33
  wire        _fixer_auto_out_d_ready;	// PeripheryBus.scala:47:33
  reg  [63:0] bootAddrReg;	// BootAddrReg.scala:32:34
  wire        out_front_bits_read =
    _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_opcode == 3'h4;	// LazyModule.scala:489:27, RegisterRouter.scala:72:36
  wire        _out_out_bits_data_T_1 =
    _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_address[11:3] == 9'h0;	// Edges.scala:192:34, LazyModule.scala:489:27, RegisterRouter.scala:73:19, :83:24
  wire        valids_0 =
    out_woready_7 & _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask[0];	// Bitwise.scala:28:17, LazyModule.scala:489:27, RegisterRouter.scala:83:24
  wire        valids_1 =
    out_woready_7 & _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask[1];	// Bitwise.scala:28:17, LazyModule.scala:489:27, RegisterRouter.scala:83:24
  wire        valids_2 =
    out_woready_7 & _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask[2];	// Bitwise.scala:28:17, LazyModule.scala:489:27, RegisterRouter.scala:83:24
  wire        valids_3 =
    out_woready_7 & _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask[3];	// Bitwise.scala:28:17, LazyModule.scala:489:27, RegisterRouter.scala:83:24
  wire        valids_4 =
    out_woready_7 & _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask[4];	// Bitwise.scala:28:17, LazyModule.scala:489:27, RegisterRouter.scala:83:24
  wire        valids_5 =
    out_woready_7 & _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask[5];	// Bitwise.scala:28:17, LazyModule.scala:489:27, RegisterRouter.scala:83:24
  wire        valids_6 =
    out_woready_7 & _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask[6];	// Bitwise.scala:28:17, LazyModule.scala:489:27, RegisterRouter.scala:83:24
  wire        valids_7 =
    out_woready_7 & _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask[7];	// Bitwise.scala:28:17, LazyModule.scala:489:27, RegisterRouter.scala:83:24
  assign out_woready_7 =
    _coupler_to_bootaddressreg_auto_fragmenter_out_a_valid
    & _coupler_to_bootaddressreg_auto_fragmenter_out_d_ready & ~out_front_bits_read
    & _out_out_bits_data_T_1;	// LazyModule.scala:489:27, RegisterRouter.scala:72:36, :83:24
  always @(posedge auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock) begin
    if (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset)
      bootAddrReg <= 64'h80000000;	// BootAddrReg.scala:32:34
    else if (valids_0 | valids_1 | valids_2 | valids_3 | valids_4 | valids_5 | valids_6
             | valids_7)	// RegField.scala:154:27, RegisterRouter.scala:83:24
      bootAddrReg <=
        {valids_7
           ? _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data[63:56]
           : bootAddrReg[63:56],
         valids_6
           ? _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data[55:48]
           : bootAddrReg[55:48],
         valids_5
           ? _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data[47:40]
           : bootAddrReg[47:40],
         valids_4
           ? _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data[39:32]
           : bootAddrReg[39:32],
         valids_3
           ? _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data[31:24]
           : bootAddrReg[31:24],
         valids_2
           ? _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data[23:16]
           : bootAddrReg[23:16],
         valids_1
           ? _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data[15:8]
           : bootAddrReg[15:8],
         valids_0
           ? _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data[7:0]
           : bootAddrReg[7:0]};	// BootAddrReg.scala:32:34, LazyModule.scala:489:27, RegField.scala:151:57, :152:31, :154:52, :158:{20,33}, RegisterRouter.scala:83:24
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
        bootAddrReg = {_RANDOM_0, _RANDOM_1};	// BootAddrReg.scala:32:34
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  TLFIFOFixer_1 fixer (	// PeripheryBus.scala:47:33
    .auto_in_a_valid         (_buffer_auto_out_a_valid),	// Buffer.scala:69:28
    .auto_in_a_bits_opcode   (_buffer_auto_out_a_bits_opcode),	// Buffer.scala:69:28
    .auto_in_a_bits_size     (_buffer_auto_out_a_bits_size),	// Buffer.scala:69:28
    .auto_in_a_bits_source   (_buffer_auto_out_a_bits_source),	// Buffer.scala:69:28
    .auto_in_a_bits_address  (_buffer_auto_out_a_bits_address),	// Buffer.scala:69:28
    .auto_in_a_bits_mask     (_buffer_auto_out_a_bits_mask),	// Buffer.scala:69:28
    .auto_in_a_bits_data     (_buffer_auto_out_a_bits_data),	// Buffer.scala:69:28
    .auto_in_d_ready         (_buffer_auto_out_d_ready),	// Buffer.scala:69:28
    .auto_out_a_ready        (_coupler_to_bootaddressreg_auto_tl_in_a_ready),	// LazyModule.scala:489:27
    .auto_out_d_valid        (_coupler_to_bootaddressreg_auto_tl_in_d_valid),	// LazyModule.scala:489:27
    .auto_out_d_bits_opcode  (_coupler_to_bootaddressreg_auto_tl_in_d_bits_opcode),	// LazyModule.scala:489:27
    .auto_out_d_bits_size    (_coupler_to_bootaddressreg_auto_tl_in_d_bits_size),	// LazyModule.scala:489:27
    .auto_out_d_bits_source  (_coupler_to_bootaddressreg_auto_tl_in_d_bits_source),	// LazyModule.scala:489:27
    .auto_out_d_bits_data    (_coupler_to_bootaddressreg_auto_tl_in_d_bits_data),	// LazyModule.scala:489:27
    .auto_in_a_ready         (_fixer_auto_in_a_ready),
    .auto_in_d_valid         (_fixer_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_fixer_auto_in_d_bits_opcode),
    .auto_in_d_bits_size     (_fixer_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_fixer_auto_in_d_bits_source),
    .auto_in_d_bits_data     (_fixer_auto_in_d_bits_data),
    .auto_out_a_valid        (_fixer_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_fixer_auto_out_a_bits_opcode),
    .auto_out_a_bits_size    (_fixer_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_fixer_auto_out_a_bits_source),
    .auto_out_a_bits_address (_fixer_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_fixer_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_fixer_auto_out_a_bits_data),
    .auto_out_d_ready        (_fixer_auto_out_d_ready)
  );
  TLBuffer_1 buffer (	// Buffer.scala:69:28
    .clock
      (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock),
    .reset
      (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset),
    .auto_in_a_valid         (_atomics_auto_out_a_valid),	// AtomicAutomata.scala:285:29
    .auto_in_a_bits_opcode   (_atomics_auto_out_a_bits_opcode),	// AtomicAutomata.scala:285:29
    .auto_in_a_bits_param    (_atomics_auto_out_a_bits_param),	// AtomicAutomata.scala:285:29
    .auto_in_a_bits_size     (_atomics_auto_out_a_bits_size),	// AtomicAutomata.scala:285:29
    .auto_in_a_bits_source   (_atomics_auto_out_a_bits_source),	// AtomicAutomata.scala:285:29
    .auto_in_a_bits_address  (_atomics_auto_out_a_bits_address),	// AtomicAutomata.scala:285:29
    .auto_in_a_bits_mask     (_atomics_auto_out_a_bits_mask),	// AtomicAutomata.scala:285:29
    .auto_in_a_bits_data     (_atomics_auto_out_a_bits_data),	// AtomicAutomata.scala:285:29
    .auto_in_a_bits_corrupt  (_atomics_auto_out_a_bits_corrupt),	// AtomicAutomata.scala:285:29
    .auto_in_d_ready         (_atomics_auto_out_d_ready),	// AtomicAutomata.scala:285:29
    .auto_out_a_ready        (_fixer_auto_in_a_ready),	// PeripheryBus.scala:47:33
    .auto_out_d_valid        (_fixer_auto_in_d_valid),	// PeripheryBus.scala:47:33
    .auto_out_d_bits_opcode  (_fixer_auto_in_d_bits_opcode),	// PeripheryBus.scala:47:33
    .auto_out_d_bits_param   (2'h0),	// LazyModule.scala:489:27
    .auto_out_d_bits_size    (_fixer_auto_in_d_bits_size),	// PeripheryBus.scala:47:33
    .auto_out_d_bits_source  (_fixer_auto_in_d_bits_source),	// PeripheryBus.scala:47:33
    .auto_out_d_bits_sink    (1'h0),	// LazyModule.scala:489:27
    .auto_out_d_bits_denied  (1'h0),	// LazyModule.scala:489:27
    .auto_out_d_bits_data    (_fixer_auto_in_d_bits_data),	// PeripheryBus.scala:47:33
    .auto_out_d_bits_corrupt (1'h0),	// LazyModule.scala:489:27
    .auto_in_a_ready         (_buffer_auto_in_a_ready),
    .auto_in_d_valid         (_buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param    (_buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink     (_buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied   (_buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_buffer_auto_in_d_bits_corrupt),
    .auto_out_a_valid        (_buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address (_buffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_buffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_buffer_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_buffer_auto_out_d_ready)
  );
  TLAtomicAutomata atomics (	// AtomicAutomata.scala:285:29
    .clock
      (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock),
    .reset
      (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset),
    .auto_in_a_valid         (_buffer_1_auto_out_a_valid),	// Buffer.scala:69:28
    .auto_in_a_bits_opcode   (_buffer_1_auto_out_a_bits_opcode),	// Buffer.scala:69:28
    .auto_in_a_bits_param    (_buffer_1_auto_out_a_bits_param),	// Buffer.scala:69:28
    .auto_in_a_bits_size     (_buffer_1_auto_out_a_bits_size),	// Buffer.scala:69:28
    .auto_in_a_bits_source   (_buffer_1_auto_out_a_bits_source),	// Buffer.scala:69:28
    .auto_in_a_bits_address  (_buffer_1_auto_out_a_bits_address),	// Buffer.scala:69:28
    .auto_in_a_bits_mask     (_buffer_1_auto_out_a_bits_mask),	// Buffer.scala:69:28
    .auto_in_a_bits_data     (_buffer_1_auto_out_a_bits_data),	// Buffer.scala:69:28
    .auto_in_a_bits_corrupt  (_buffer_1_auto_out_a_bits_corrupt),	// Buffer.scala:69:28
    .auto_in_d_ready         (_buffer_1_auto_out_d_ready),	// Buffer.scala:69:28
    .auto_out_a_ready        (_buffer_auto_in_a_ready),	// Buffer.scala:69:28
    .auto_out_d_valid        (_buffer_auto_in_d_valid),	// Buffer.scala:69:28
    .auto_out_d_bits_opcode  (_buffer_auto_in_d_bits_opcode),	// Buffer.scala:69:28
    .auto_out_d_bits_param   (_buffer_auto_in_d_bits_param),	// Buffer.scala:69:28
    .auto_out_d_bits_size    (_buffer_auto_in_d_bits_size),	// Buffer.scala:69:28
    .auto_out_d_bits_source  (_buffer_auto_in_d_bits_source),	// Buffer.scala:69:28
    .auto_out_d_bits_sink    (_buffer_auto_in_d_bits_sink),	// Buffer.scala:69:28
    .auto_out_d_bits_denied  (_buffer_auto_in_d_bits_denied),	// Buffer.scala:69:28
    .auto_out_d_bits_data    (_buffer_auto_in_d_bits_data),	// Buffer.scala:69:28
    .auto_out_d_bits_corrupt (_buffer_auto_in_d_bits_corrupt),	// Buffer.scala:69:28
    .auto_in_a_ready         (_atomics_auto_in_a_ready),
    .auto_in_d_valid         (_atomics_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_atomics_auto_in_d_bits_opcode),
    .auto_in_d_bits_param    (_atomics_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_atomics_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_atomics_auto_in_d_bits_source),
    .auto_in_d_bits_sink     (_atomics_auto_in_d_bits_sink),
    .auto_in_d_bits_denied   (_atomics_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_atomics_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_atomics_auto_in_d_bits_corrupt),
    .auto_out_a_valid        (_atomics_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_atomics_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_atomics_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_atomics_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_atomics_auto_out_a_bits_source),
    .auto_out_a_bits_address (_atomics_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_atomics_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_atomics_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_atomics_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_atomics_auto_out_d_ready)
  );
  TLBuffer_1 buffer_1 (	// Buffer.scala:69:28
    .clock
      (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock),
    .reset
      (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset),
    .auto_in_a_valid         (auto_bus_xing_in_a_valid),
    .auto_in_a_bits_opcode   (auto_bus_xing_in_a_bits_opcode),
    .auto_in_a_bits_param    (auto_bus_xing_in_a_bits_param),
    .auto_in_a_bits_size     (auto_bus_xing_in_a_bits_size),
    .auto_in_a_bits_source   (auto_bus_xing_in_a_bits_source),
    .auto_in_a_bits_address  (auto_bus_xing_in_a_bits_address),
    .auto_in_a_bits_mask     (auto_bus_xing_in_a_bits_mask),
    .auto_in_a_bits_data     (auto_bus_xing_in_a_bits_data),
    .auto_in_a_bits_corrupt  (auto_bus_xing_in_a_bits_corrupt),
    .auto_in_d_ready         (auto_bus_xing_in_d_ready),
    .auto_out_a_ready        (_atomics_auto_in_a_ready),	// AtomicAutomata.scala:285:29
    .auto_out_d_valid        (_atomics_auto_in_d_valid),	// AtomicAutomata.scala:285:29
    .auto_out_d_bits_opcode  (_atomics_auto_in_d_bits_opcode),	// AtomicAutomata.scala:285:29
    .auto_out_d_bits_param   (_atomics_auto_in_d_bits_param),	// AtomicAutomata.scala:285:29
    .auto_out_d_bits_size    (_atomics_auto_in_d_bits_size),	// AtomicAutomata.scala:285:29
    .auto_out_d_bits_source  (_atomics_auto_in_d_bits_source),	// AtomicAutomata.scala:285:29
    .auto_out_d_bits_sink    (_atomics_auto_in_d_bits_sink),	// AtomicAutomata.scala:285:29
    .auto_out_d_bits_denied  (_atomics_auto_in_d_bits_denied),	// AtomicAutomata.scala:285:29
    .auto_out_d_bits_data    (_atomics_auto_in_d_bits_data),	// AtomicAutomata.scala:285:29
    .auto_out_d_bits_corrupt (_atomics_auto_in_d_bits_corrupt),	// AtomicAutomata.scala:285:29
    .auto_in_a_ready         (auto_bus_xing_in_a_ready),
    .auto_in_d_valid         (auto_bus_xing_in_d_valid),
    .auto_in_d_bits_opcode   (auto_bus_xing_in_d_bits_opcode),
    .auto_in_d_bits_param    (auto_bus_xing_in_d_bits_param),
    .auto_in_d_bits_size     (auto_bus_xing_in_d_bits_size),
    .auto_in_d_bits_source   (auto_bus_xing_in_d_bits_source),
    .auto_in_d_bits_sink     (auto_bus_xing_in_d_bits_sink),
    .auto_in_d_bits_denied   (auto_bus_xing_in_d_bits_denied),
    .auto_in_d_bits_data     (auto_bus_xing_in_d_bits_data),
    .auto_in_d_bits_corrupt  (auto_bus_xing_in_d_bits_corrupt),
    .auto_out_a_valid        (_buffer_1_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_buffer_1_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_buffer_1_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_buffer_1_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_buffer_1_auto_out_a_bits_source),
    .auto_out_a_bits_address (_buffer_1_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_buffer_1_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_buffer_1_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_buffer_1_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_buffer_1_auto_out_d_ready)
  );
  TLInterconnectCoupler_17 coupler_to_bootaddressreg (	// LazyModule.scala:489:27
    .clock
      (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock),
    .reset
      (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset),
    .auto_fragmenter_out_a_ready
      (_coupler_to_bootaddressreg_auto_fragmenter_out_d_ready),	// LazyModule.scala:489:27
    .auto_fragmenter_out_d_valid
      (_coupler_to_bootaddressreg_auto_fragmenter_out_a_valid),	// LazyModule.scala:489:27
    .auto_fragmenter_out_d_bits_opcode  ({2'h0, out_front_bits_read}),	// LazyModule.scala:489:27, RegisterRouter.scala:72:36, :98:19
    .auto_fragmenter_out_d_bits_size
      (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_size),	// LazyModule.scala:489:27
    .auto_fragmenter_out_d_bits_source
      (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_source),	// LazyModule.scala:489:27
    .auto_fragmenter_out_d_bits_data    (_out_out_bits_data_T_1 ? bootAddrReg : 64'h0),	// BootAddrReg.scala:32:34, Bundles.scala:259:74, RegisterRouter.scala:83:24
    .auto_tl_in_a_valid                 (_fixer_auto_out_a_valid),	// PeripheryBus.scala:47:33
    .auto_tl_in_a_bits_opcode           (_fixer_auto_out_a_bits_opcode),	// PeripheryBus.scala:47:33
    .auto_tl_in_a_bits_size             (_fixer_auto_out_a_bits_size),	// PeripheryBus.scala:47:33
    .auto_tl_in_a_bits_source           (_fixer_auto_out_a_bits_source),	// PeripheryBus.scala:47:33
    .auto_tl_in_a_bits_address          (_fixer_auto_out_a_bits_address),	// PeripheryBus.scala:47:33
    .auto_tl_in_a_bits_mask             (_fixer_auto_out_a_bits_mask),	// PeripheryBus.scala:47:33
    .auto_tl_in_a_bits_data             (_fixer_auto_out_a_bits_data),	// PeripheryBus.scala:47:33
    .auto_tl_in_d_ready                 (_fixer_auto_out_d_ready),	// PeripheryBus.scala:47:33
    .auto_fragmenter_out_a_valid
      (_coupler_to_bootaddressreg_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode
      (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_size
      (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source
      (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address
      (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask
      (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data
      (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_d_ready
      (_coupler_to_bootaddressreg_auto_fragmenter_out_d_ready),
    .auto_tl_in_a_ready                 (_coupler_to_bootaddressreg_auto_tl_in_a_ready),
    .auto_tl_in_d_valid                 (_coupler_to_bootaddressreg_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode
      (_coupler_to_bootaddressreg_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size
      (_coupler_to_bootaddressreg_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source
      (_coupler_to_bootaddressreg_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data
      (_coupler_to_bootaddressreg_auto_tl_in_d_bits_data)
  );
endmodule

