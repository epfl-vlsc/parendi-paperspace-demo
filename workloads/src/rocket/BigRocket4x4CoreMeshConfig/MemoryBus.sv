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

module MemoryBus(
  input         auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_ready,
                auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_valid,
  input  [2:0]  auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_bits_param,
  input  [2:0]  auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_bits_size,
  input  [3:0]  auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_bits_source,
  input         auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_bits_sink,
                auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_bits_denied,
  input  [63:0] auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_bits_data,
  input         auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_bits_corrupt,
                auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock,
                auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset,
                auto_bus_xing_in_a_valid,
  input  [2:0]  auto_bus_xing_in_a_bits_opcode,
                auto_bus_xing_in_a_bits_param,
                auto_bus_xing_in_a_bits_size,
  input  [3:0]  auto_bus_xing_in_a_bits_source,
  input  [31:0] auto_bus_xing_in_a_bits_address,
  input  [7:0]  auto_bus_xing_in_a_bits_mask,
  input  [63:0] auto_bus_xing_in_a_bits_data,
  input         auto_bus_xing_in_a_bits_corrupt,
                auto_bus_xing_in_d_ready,
  output        auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_valid,
  output [2:0]  auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_bits_opcode,
                auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_bits_param,
                auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_bits_size,
  output [3:0]  auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_bits_source,
  output [31:0] auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_bits_address,
  output [7:0]  auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_bits_mask,
  output [63:0] auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_bits_data,
  output        auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_bits_corrupt,
                auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_ready,
                auto_fixedClockNode_out_clock,
                auto_fixedClockNode_out_reset,
                auto_bus_xing_in_a_ready,
                auto_bus_xing_in_d_valid,
  output [2:0]  auto_bus_xing_in_d_bits_opcode,
  output [1:0]  auto_bus_xing_in_d_bits_param,
  output [2:0]  auto_bus_xing_in_d_bits_size,
  output [3:0]  auto_bus_xing_in_d_bits_source,
  output        auto_bus_xing_in_d_bits_denied,
  output [63:0] auto_bus_xing_in_d_bits_data,
  output        auto_bus_xing_in_d_bits_corrupt
);

  wire        _coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_a_ready;	// @[LazyModule.scala:489:27]
  wire        _coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_valid;	// @[LazyModule.scala:489:27]
  wire [2:0]  _coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_opcode;	// @[LazyModule.scala:489:27]
  wire [1:0]  _coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_param;	// @[LazyModule.scala:489:27]
  wire [2:0]  _coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_size;	// @[LazyModule.scala:489:27]
  wire [3:0]  _coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_source;	// @[LazyModule.scala:489:27]
  wire        _coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_denied;	// @[LazyModule.scala:489:27]
  wire [63:0] _coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_data;	// @[LazyModule.scala:489:27]
  wire        _coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_corrupt;	// @[LazyModule.scala:489:27]
  wire        _picker_auto_in_a_ready;	// @[ProbePicker.scala:66:28]
  wire        _picker_auto_in_d_valid;	// @[ProbePicker.scala:66:28]
  wire [2:0]  _picker_auto_in_d_bits_opcode;	// @[ProbePicker.scala:66:28]
  wire [1:0]  _picker_auto_in_d_bits_param;	// @[ProbePicker.scala:66:28]
  wire [2:0]  _picker_auto_in_d_bits_size;	// @[ProbePicker.scala:66:28]
  wire [3:0]  _picker_auto_in_d_bits_source;	// @[ProbePicker.scala:66:28]
  wire        _picker_auto_in_d_bits_denied;	// @[ProbePicker.scala:66:28]
  wire [63:0] _picker_auto_in_d_bits_data;	// @[ProbePicker.scala:66:28]
  wire        _picker_auto_in_d_bits_corrupt;	// @[ProbePicker.scala:66:28]
  wire        _picker_auto_out_a_valid;	// @[ProbePicker.scala:66:28]
  wire [2:0]  _picker_auto_out_a_bits_opcode;	// @[ProbePicker.scala:66:28]
  wire [2:0]  _picker_auto_out_a_bits_param;	// @[ProbePicker.scala:66:28]
  wire [2:0]  _picker_auto_out_a_bits_size;	// @[ProbePicker.scala:66:28]
  wire [3:0]  _picker_auto_out_a_bits_source;	// @[ProbePicker.scala:66:28]
  wire [31:0] _picker_auto_out_a_bits_address;	// @[ProbePicker.scala:66:28]
  wire [7:0]  _picker_auto_out_a_bits_mask;	// @[ProbePicker.scala:66:28]
  wire [63:0] _picker_auto_out_a_bits_data;	// @[ProbePicker.scala:66:28]
  wire        _picker_auto_out_a_bits_corrupt;	// @[ProbePicker.scala:66:28]
  wire        _picker_auto_out_d_ready;	// @[ProbePicker.scala:66:28]
  wire        _fixer_auto_out_a_valid;	// @[FIFOFixer.scala:146:27]
  wire [2:0]  _fixer_auto_out_a_bits_opcode;	// @[FIFOFixer.scala:146:27]
  wire [2:0]  _fixer_auto_out_a_bits_param;	// @[FIFOFixer.scala:146:27]
  wire [2:0]  _fixer_auto_out_a_bits_size;	// @[FIFOFixer.scala:146:27]
  wire [3:0]  _fixer_auto_out_a_bits_source;	// @[FIFOFixer.scala:146:27]
  wire [31:0] _fixer_auto_out_a_bits_address;	// @[FIFOFixer.scala:146:27]
  wire [7:0]  _fixer_auto_out_a_bits_mask;	// @[FIFOFixer.scala:146:27]
  wire [63:0] _fixer_auto_out_a_bits_data;	// @[FIFOFixer.scala:146:27]
  wire        _fixer_auto_out_a_bits_corrupt;	// @[FIFOFixer.scala:146:27]
  wire        _fixer_auto_out_d_ready;	// @[FIFOFixer.scala:146:27]
  wire        _fixedClockNode_auto_out_0_clock;	// @[ClockGroup.scala:110:107]
  wire        _fixedClockNode_auto_out_0_reset;	// @[ClockGroup.scala:110:107]
  FixedClockBroadcast_4 fixedClockNode (	// @[ClockGroup.scala:110:107]
    .auto_in_clock    (auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock),
    .auto_in_reset    (auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset),
    .auto_out_1_clock (auto_fixedClockNode_out_clock),
    .auto_out_1_reset (auto_fixedClockNode_out_reset),
    .auto_out_0_clock (_fixedClockNode_auto_out_0_clock),
    .auto_out_0_reset (_fixedClockNode_auto_out_0_reset)
  );
  TLFIFOFixer_3 fixer (	// @[FIFOFixer.scala:146:27]
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
    .auto_out_a_ready        (_picker_auto_in_a_ready),	// @[ProbePicker.scala:66:28]
    .auto_out_d_valid        (_picker_auto_in_d_valid),	// @[ProbePicker.scala:66:28]
    .auto_out_d_bits_opcode  (_picker_auto_in_d_bits_opcode),	// @[ProbePicker.scala:66:28]
    .auto_out_d_bits_param   (_picker_auto_in_d_bits_param),	// @[ProbePicker.scala:66:28]
    .auto_out_d_bits_size    (_picker_auto_in_d_bits_size),	// @[ProbePicker.scala:66:28]
    .auto_out_d_bits_source  (_picker_auto_in_d_bits_source),	// @[ProbePicker.scala:66:28]
    .auto_out_d_bits_denied  (_picker_auto_in_d_bits_denied),	// @[ProbePicker.scala:66:28]
    .auto_out_d_bits_data    (_picker_auto_in_d_bits_data),	// @[ProbePicker.scala:66:28]
    .auto_out_d_bits_corrupt (_picker_auto_in_d_bits_corrupt),	// @[ProbePicker.scala:66:28]
    .auto_in_a_ready         (auto_bus_xing_in_a_ready),
    .auto_in_d_valid         (auto_bus_xing_in_d_valid),
    .auto_in_d_bits_opcode   (auto_bus_xing_in_d_bits_opcode),
    .auto_in_d_bits_param    (auto_bus_xing_in_d_bits_param),
    .auto_in_d_bits_size     (auto_bus_xing_in_d_bits_size),
    .auto_in_d_bits_source   (auto_bus_xing_in_d_bits_source),
    .auto_in_d_bits_denied   (auto_bus_xing_in_d_bits_denied),
    .auto_in_d_bits_data     (auto_bus_xing_in_d_bits_data),
    .auto_in_d_bits_corrupt  (auto_bus_xing_in_d_bits_corrupt),
    .auto_out_a_valid        (_fixer_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_fixer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_fixer_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_fixer_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_fixer_auto_out_a_bits_source),
    .auto_out_a_bits_address (_fixer_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_fixer_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_fixer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_fixer_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_fixer_auto_out_d_ready)
  );
  ProbePicker picker (	// @[ProbePicker.scala:66:28]
    .auto_in_a_valid         (_fixer_auto_out_a_valid),	// @[FIFOFixer.scala:146:27]
    .auto_in_a_bits_opcode   (_fixer_auto_out_a_bits_opcode),	// @[FIFOFixer.scala:146:27]
    .auto_in_a_bits_param    (_fixer_auto_out_a_bits_param),	// @[FIFOFixer.scala:146:27]
    .auto_in_a_bits_size     (_fixer_auto_out_a_bits_size),	// @[FIFOFixer.scala:146:27]
    .auto_in_a_bits_source   (_fixer_auto_out_a_bits_source),	// @[FIFOFixer.scala:146:27]
    .auto_in_a_bits_address  (_fixer_auto_out_a_bits_address),	// @[FIFOFixer.scala:146:27]
    .auto_in_a_bits_mask     (_fixer_auto_out_a_bits_mask),	// @[FIFOFixer.scala:146:27]
    .auto_in_a_bits_data     (_fixer_auto_out_a_bits_data),	// @[FIFOFixer.scala:146:27]
    .auto_in_a_bits_corrupt  (_fixer_auto_out_a_bits_corrupt),	// @[FIFOFixer.scala:146:27]
    .auto_in_d_ready         (_fixer_auto_out_d_ready),	// @[FIFOFixer.scala:146:27]
    .auto_out_a_ready        (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_a_ready),	// @[LazyModule.scala:489:27]
    .auto_out_d_valid        (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_valid),	// @[LazyModule.scala:489:27]
    .auto_out_d_bits_opcode  (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_opcode),	// @[LazyModule.scala:489:27]
    .auto_out_d_bits_param   (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_param),	// @[LazyModule.scala:489:27]
    .auto_out_d_bits_size    (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_size),	// @[LazyModule.scala:489:27]
    .auto_out_d_bits_source  (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_source),	// @[LazyModule.scala:489:27]
    .auto_out_d_bits_denied  (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_denied),	// @[LazyModule.scala:489:27]
    .auto_out_d_bits_data    (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_data),	// @[LazyModule.scala:489:27]
    .auto_out_d_bits_corrupt (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_corrupt),	// @[LazyModule.scala:489:27]
    .auto_in_a_ready         (_picker_auto_in_a_ready),
    .auto_in_d_valid         (_picker_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_picker_auto_in_d_bits_opcode),
    .auto_in_d_bits_param    (_picker_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_picker_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_picker_auto_in_d_bits_source),
    .auto_in_d_bits_denied   (_picker_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_picker_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_picker_auto_in_d_bits_corrupt),
    .auto_out_a_valid        (_picker_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_picker_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_picker_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_picker_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_picker_auto_out_a_bits_source),
    .auto_out_a_bits_address (_picker_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_picker_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_picker_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_picker_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_picker_auto_out_d_ready)
  );
  TLInterconnectCoupler_34 coupler_to_memory_controller_port_named_tl_mem (	// @[LazyModule.scala:489:27]
    .clock                          (_fixedClockNode_auto_out_0_clock),	// @[ClockGroup.scala:110:107]
    .reset                          (_fixedClockNode_auto_out_0_reset),	// @[ClockGroup.scala:110:107]
    .auto_buffer_out_a_ready        (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_ready),
    .auto_buffer_out_d_valid        (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_valid),
    .auto_buffer_out_d_bits_opcode  (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_bits_opcode),
    .auto_buffer_out_d_bits_param   (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_bits_param),
    .auto_buffer_out_d_bits_size    (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_bits_size),
    .auto_buffer_out_d_bits_source  (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_bits_source),
    .auto_buffer_out_d_bits_sink    (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_bits_sink),
    .auto_buffer_out_d_bits_denied  (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_bits_denied),
    .auto_buffer_out_d_bits_data    (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_bits_data),
    .auto_buffer_out_d_bits_corrupt (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_bits_corrupt),
    .auto_tl_in_a_valid             (_picker_auto_out_a_valid),	// @[ProbePicker.scala:66:28]
    .auto_tl_in_a_bits_opcode       (_picker_auto_out_a_bits_opcode),	// @[ProbePicker.scala:66:28]
    .auto_tl_in_a_bits_param        (_picker_auto_out_a_bits_param),	// @[ProbePicker.scala:66:28]
    .auto_tl_in_a_bits_size         (_picker_auto_out_a_bits_size),	// @[ProbePicker.scala:66:28]
    .auto_tl_in_a_bits_source       (_picker_auto_out_a_bits_source),	// @[ProbePicker.scala:66:28]
    .auto_tl_in_a_bits_address      (_picker_auto_out_a_bits_address),	// @[ProbePicker.scala:66:28]
    .auto_tl_in_a_bits_mask         (_picker_auto_out_a_bits_mask),	// @[ProbePicker.scala:66:28]
    .auto_tl_in_a_bits_data         (_picker_auto_out_a_bits_data),	// @[ProbePicker.scala:66:28]
    .auto_tl_in_a_bits_corrupt      (_picker_auto_out_a_bits_corrupt),	// @[ProbePicker.scala:66:28]
    .auto_tl_in_d_ready             (_picker_auto_out_d_ready),	// @[ProbePicker.scala:66:28]
    .auto_buffer_out_a_valid        (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_valid),
    .auto_buffer_out_a_bits_opcode  (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_bits_opcode),
    .auto_buffer_out_a_bits_param   (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_bits_param),
    .auto_buffer_out_a_bits_size    (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_bits_size),
    .auto_buffer_out_a_bits_source  (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_bits_source),
    .auto_buffer_out_a_bits_address (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_bits_address),
    .auto_buffer_out_a_bits_mask    (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_bits_mask),
    .auto_buffer_out_a_bits_data    (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_bits_data),
    .auto_buffer_out_a_bits_corrupt (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_a_bits_corrupt),
    .auto_buffer_out_d_ready        (auto_coupler_to_memory_controller_port_named_tl_mem_buffer_out_d_ready),
    .auto_tl_in_a_ready             (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_a_ready),
    .auto_tl_in_d_valid             (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode       (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_param        (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_param),
    .auto_tl_in_d_bits_size         (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source       (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_denied       (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_denied),
    .auto_tl_in_d_bits_data         (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_data),
    .auto_tl_in_d_bits_corrupt      (_coupler_to_memory_controller_port_named_tl_mem_auto_tl_in_d_bits_corrupt)
  );
endmodule

