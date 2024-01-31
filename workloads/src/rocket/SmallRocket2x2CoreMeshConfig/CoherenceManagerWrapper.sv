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

module CoherenceManagerWrapper(
  input         auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_ready,
                auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_valid,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_param,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_size,
  input  [3:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_source,
  input         auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_denied,
  input  [63:0] auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_data,
  input         auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_corrupt,
                auto_coherent_jbar_in_a_valid,
  input  [2:0]  auto_coherent_jbar_in_a_bits_opcode,
                auto_coherent_jbar_in_a_bits_param,
                auto_coherent_jbar_in_a_bits_size,
  input  [1:0]  auto_coherent_jbar_in_a_bits_source,
  input  [31:0] auto_coherent_jbar_in_a_bits_address,
  input  [7:0]  auto_coherent_jbar_in_a_bits_mask,
  input  [63:0] auto_coherent_jbar_in_a_bits_data,
  input         auto_coherent_jbar_in_a_bits_corrupt,
                auto_coherent_jbar_in_b_ready,
                auto_coherent_jbar_in_c_valid,
  input  [2:0]  auto_coherent_jbar_in_c_bits_opcode,
                auto_coherent_jbar_in_c_bits_param,
                auto_coherent_jbar_in_c_bits_size,
  input  [1:0]  auto_coherent_jbar_in_c_bits_source,
  input  [31:0] auto_coherent_jbar_in_c_bits_address,
  input  [63:0] auto_coherent_jbar_in_c_bits_data,
  input         auto_coherent_jbar_in_c_bits_corrupt,
                auto_coherent_jbar_in_d_ready,
                auto_coherent_jbar_in_e_valid,
  input  [2:0]  auto_coherent_jbar_in_e_bits_sink,
  input         auto_l2_ctl_in_a_valid,
  input  [2:0]  auto_l2_ctl_in_a_bits_opcode,
  input  [1:0]  auto_l2_ctl_in_a_bits_size,
  input  [5:0]  auto_l2_ctl_in_a_bits_source,
  input  [25:0] auto_l2_ctl_in_a_bits_address,
  input  [7:0]  auto_l2_ctl_in_a_bits_mask,
  input  [63:0] auto_l2_ctl_in_a_bits_data,
  input         auto_l2_ctl_in_d_ready,
                auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock,
                auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset,
  output        auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid,
  output [2:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode,
                auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param,
                auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size,
  output [3:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source,
  output [31:0] auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address,
  output [7:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask,
  output [63:0] auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data,
  output        auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_corrupt,
                auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready,
                auto_coherent_jbar_in_a_ready,
                auto_coherent_jbar_in_b_valid,
  output [1:0]  auto_coherent_jbar_in_b_bits_param,
  output [31:0] auto_coherent_jbar_in_b_bits_address,
  output        auto_coherent_jbar_in_c_ready,
                auto_coherent_jbar_in_d_valid,
  output [2:0]  auto_coherent_jbar_in_d_bits_opcode,
  output [1:0]  auto_coherent_jbar_in_d_bits_param,
  output [2:0]  auto_coherent_jbar_in_d_bits_size,
  output [1:0]  auto_coherent_jbar_in_d_bits_source,
  output [2:0]  auto_coherent_jbar_in_d_bits_sink,
  output        auto_coherent_jbar_in_d_bits_denied,
  output [63:0] auto_coherent_jbar_in_d_bits_data,
  output        auto_coherent_jbar_in_d_bits_corrupt,
                auto_l2_ctl_in_a_ready,
                auto_l2_ctl_in_d_valid,
  output [2:0]  auto_l2_ctl_in_d_bits_opcode,
  output [1:0]  auto_l2_ctl_in_d_bits_size,
  output [5:0]  auto_l2_ctl_in_d_bits_source,
  output [63:0] auto_l2_ctl_in_d_bits_data
);

  wire        _binder_auto_in_a_ready;	// BankBinder.scala:68:28
  wire        _binder_auto_in_d_valid;	// BankBinder.scala:68:28
  wire [2:0]  _binder_auto_in_d_bits_opcode;	// BankBinder.scala:68:28
  wire [1:0]  _binder_auto_in_d_bits_param;	// BankBinder.scala:68:28
  wire [2:0]  _binder_auto_in_d_bits_size;	// BankBinder.scala:68:28
  wire [3:0]  _binder_auto_in_d_bits_source;	// BankBinder.scala:68:28
  wire        _binder_auto_in_d_bits_denied;	// BankBinder.scala:68:28
  wire [63:0] _binder_auto_in_d_bits_data;	// BankBinder.scala:68:28
  wire        _binder_auto_in_d_bits_corrupt;	// BankBinder.scala:68:28
  wire        _cork_auto_in_a_ready;	// Configs.scala:105:26
  wire        _cork_auto_in_c_ready;	// Configs.scala:105:26
  wire        _cork_auto_in_d_valid;	// Configs.scala:105:26
  wire [2:0]  _cork_auto_in_d_bits_opcode;	// Configs.scala:105:26
  wire [1:0]  _cork_auto_in_d_bits_param;	// Configs.scala:105:26
  wire [2:0]  _cork_auto_in_d_bits_size;	// Configs.scala:105:26
  wire [2:0]  _cork_auto_in_d_bits_source;	// Configs.scala:105:26
  wire [2:0]  _cork_auto_in_d_bits_sink;	// Configs.scala:105:26
  wire        _cork_auto_in_d_bits_denied;	// Configs.scala:105:26
  wire [63:0] _cork_auto_in_d_bits_data;	// Configs.scala:105:26
  wire        _cork_auto_in_d_bits_corrupt;	// Configs.scala:105:26
  wire        _cork_auto_out_a_valid;	// Configs.scala:105:26
  wire [2:0]  _cork_auto_out_a_bits_opcode;	// Configs.scala:105:26
  wire [2:0]  _cork_auto_out_a_bits_param;	// Configs.scala:105:26
  wire [2:0]  _cork_auto_out_a_bits_size;	// Configs.scala:105:26
  wire [3:0]  _cork_auto_out_a_bits_source;	// Configs.scala:105:26
  wire [31:0] _cork_auto_out_a_bits_address;	// Configs.scala:105:26
  wire [7:0]  _cork_auto_out_a_bits_mask;	// Configs.scala:105:26
  wire [63:0] _cork_auto_out_a_bits_data;	// Configs.scala:105:26
  wire        _cork_auto_out_a_bits_corrupt;	// Configs.scala:105:26
  wire        _cork_auto_out_d_ready;	// Configs.scala:105:26
  wire        _InclusiveCache_inner_TLBuffer_auto_out_a_valid;	// Parameters.scala:56:69
  wire [2:0]  _InclusiveCache_inner_TLBuffer_auto_out_a_bits_opcode;	// Parameters.scala:56:69
  wire [2:0]  _InclusiveCache_inner_TLBuffer_auto_out_a_bits_param;	// Parameters.scala:56:69
  wire [2:0]  _InclusiveCache_inner_TLBuffer_auto_out_a_bits_size;	// Parameters.scala:56:69
  wire [1:0]  _InclusiveCache_inner_TLBuffer_auto_out_a_bits_source;	// Parameters.scala:56:69
  wire [31:0] _InclusiveCache_inner_TLBuffer_auto_out_a_bits_address;	// Parameters.scala:56:69
  wire [7:0]  _InclusiveCache_inner_TLBuffer_auto_out_a_bits_mask;	// Parameters.scala:56:69
  wire [63:0] _InclusiveCache_inner_TLBuffer_auto_out_a_bits_data;	// Parameters.scala:56:69
  wire        _InclusiveCache_inner_TLBuffer_auto_out_a_bits_corrupt;	// Parameters.scala:56:69
  wire        _InclusiveCache_inner_TLBuffer_auto_out_b_ready;	// Parameters.scala:56:69
  wire        _InclusiveCache_inner_TLBuffer_auto_out_c_valid;	// Parameters.scala:56:69
  wire [2:0]  _InclusiveCache_inner_TLBuffer_auto_out_c_bits_opcode;	// Parameters.scala:56:69
  wire [2:0]  _InclusiveCache_inner_TLBuffer_auto_out_c_bits_param;	// Parameters.scala:56:69
  wire [2:0]  _InclusiveCache_inner_TLBuffer_auto_out_c_bits_size;	// Parameters.scala:56:69
  wire [1:0]  _InclusiveCache_inner_TLBuffer_auto_out_c_bits_source;	// Parameters.scala:56:69
  wire [31:0] _InclusiveCache_inner_TLBuffer_auto_out_c_bits_address;	// Parameters.scala:56:69
  wire [63:0] _InclusiveCache_inner_TLBuffer_auto_out_c_bits_data;	// Parameters.scala:56:69
  wire        _InclusiveCache_inner_TLBuffer_auto_out_c_bits_corrupt;	// Parameters.scala:56:69
  wire        _InclusiveCache_inner_TLBuffer_auto_out_d_ready;	// Parameters.scala:56:69
  wire        _InclusiveCache_inner_TLBuffer_auto_out_e_valid;	// Parameters.scala:56:69
  wire [2:0]  _InclusiveCache_inner_TLBuffer_auto_out_e_bits_sink;	// Parameters.scala:56:69
  wire        _l2_auto_in_a_ready;	// Configs.scala:76:24
  wire        _l2_auto_in_b_valid;	// Configs.scala:76:24
  wire [1:0]  _l2_auto_in_b_bits_param;	// Configs.scala:76:24
  wire [31:0] _l2_auto_in_b_bits_address;	// Configs.scala:76:24
  wire        _l2_auto_in_c_ready;	// Configs.scala:76:24
  wire        _l2_auto_in_d_valid;	// Configs.scala:76:24
  wire [2:0]  _l2_auto_in_d_bits_opcode;	// Configs.scala:76:24
  wire [1:0]  _l2_auto_in_d_bits_param;	// Configs.scala:76:24
  wire [2:0]  _l2_auto_in_d_bits_size;	// Configs.scala:76:24
  wire [1:0]  _l2_auto_in_d_bits_source;	// Configs.scala:76:24
  wire [2:0]  _l2_auto_in_d_bits_sink;	// Configs.scala:76:24
  wire        _l2_auto_in_d_bits_denied;	// Configs.scala:76:24
  wire [63:0] _l2_auto_in_d_bits_data;	// Configs.scala:76:24
  wire        _l2_auto_in_d_bits_corrupt;	// Configs.scala:76:24
  wire        _l2_auto_out_a_valid;	// Configs.scala:76:24
  wire [2:0]  _l2_auto_out_a_bits_opcode;	// Configs.scala:76:24
  wire [2:0]  _l2_auto_out_a_bits_param;	// Configs.scala:76:24
  wire [2:0]  _l2_auto_out_a_bits_size;	// Configs.scala:76:24
  wire [2:0]  _l2_auto_out_a_bits_source;	// Configs.scala:76:24
  wire [31:0] _l2_auto_out_a_bits_address;	// Configs.scala:76:24
  wire [7:0]  _l2_auto_out_a_bits_mask;	// Configs.scala:76:24
  wire [63:0] _l2_auto_out_a_bits_data;	// Configs.scala:76:24
  wire        _l2_auto_out_a_bits_corrupt;	// Configs.scala:76:24
  wire        _l2_auto_out_c_valid;	// Configs.scala:76:24
  wire [2:0]  _l2_auto_out_c_bits_opcode;	// Configs.scala:76:24
  wire [2:0]  _l2_auto_out_c_bits_size;	// Configs.scala:76:24
  wire [2:0]  _l2_auto_out_c_bits_source;	// Configs.scala:76:24
  wire [31:0] _l2_auto_out_c_bits_address;	// Configs.scala:76:24
  wire [63:0] _l2_auto_out_c_bits_data;	// Configs.scala:76:24
  wire        _l2_auto_out_c_bits_corrupt;	// Configs.scala:76:24
  wire        _l2_auto_out_d_ready;	// Configs.scala:76:24
  wire        _l2_auto_out_e_valid;	// Configs.scala:76:24
  wire [2:0]  _l2_auto_out_e_bits_sink;	// Configs.scala:76:24
  InclusiveCache l2 (	// Configs.scala:76:24
    .clock
      (auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock),
    .reset
      (auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset),
    .auto_ctl_in_a_valid        (auto_l2_ctl_in_a_valid),
    .auto_ctl_in_a_bits_opcode  (auto_l2_ctl_in_a_bits_opcode),
    .auto_ctl_in_a_bits_size    (auto_l2_ctl_in_a_bits_size),
    .auto_ctl_in_a_bits_source  (auto_l2_ctl_in_a_bits_source),
    .auto_ctl_in_a_bits_address (auto_l2_ctl_in_a_bits_address),
    .auto_ctl_in_a_bits_mask    (auto_l2_ctl_in_a_bits_mask),
    .auto_ctl_in_a_bits_data    (auto_l2_ctl_in_a_bits_data),
    .auto_ctl_in_d_ready        (auto_l2_ctl_in_d_ready),
    .auto_in_a_valid            (_InclusiveCache_inner_TLBuffer_auto_out_a_valid),	// Parameters.scala:56:69
    .auto_in_a_bits_opcode      (_InclusiveCache_inner_TLBuffer_auto_out_a_bits_opcode),	// Parameters.scala:56:69
    .auto_in_a_bits_param       (_InclusiveCache_inner_TLBuffer_auto_out_a_bits_param),	// Parameters.scala:56:69
    .auto_in_a_bits_size        (_InclusiveCache_inner_TLBuffer_auto_out_a_bits_size),	// Parameters.scala:56:69
    .auto_in_a_bits_source      (_InclusiveCache_inner_TLBuffer_auto_out_a_bits_source),	// Parameters.scala:56:69
    .auto_in_a_bits_address     (_InclusiveCache_inner_TLBuffer_auto_out_a_bits_address),	// Parameters.scala:56:69
    .auto_in_a_bits_mask        (_InclusiveCache_inner_TLBuffer_auto_out_a_bits_mask),	// Parameters.scala:56:69
    .auto_in_a_bits_data        (_InclusiveCache_inner_TLBuffer_auto_out_a_bits_data),	// Parameters.scala:56:69
    .auto_in_a_bits_corrupt     (_InclusiveCache_inner_TLBuffer_auto_out_a_bits_corrupt),	// Parameters.scala:56:69
    .auto_in_b_ready            (_InclusiveCache_inner_TLBuffer_auto_out_b_ready),	// Parameters.scala:56:69
    .auto_in_c_valid            (_InclusiveCache_inner_TLBuffer_auto_out_c_valid),	// Parameters.scala:56:69
    .auto_in_c_bits_opcode      (_InclusiveCache_inner_TLBuffer_auto_out_c_bits_opcode),	// Parameters.scala:56:69
    .auto_in_c_bits_param       (_InclusiveCache_inner_TLBuffer_auto_out_c_bits_param),	// Parameters.scala:56:69
    .auto_in_c_bits_size        (_InclusiveCache_inner_TLBuffer_auto_out_c_bits_size),	// Parameters.scala:56:69
    .auto_in_c_bits_source      (_InclusiveCache_inner_TLBuffer_auto_out_c_bits_source),	// Parameters.scala:56:69
    .auto_in_c_bits_address     (_InclusiveCache_inner_TLBuffer_auto_out_c_bits_address),	// Parameters.scala:56:69
    .auto_in_c_bits_data        (_InclusiveCache_inner_TLBuffer_auto_out_c_bits_data),	// Parameters.scala:56:69
    .auto_in_c_bits_corrupt     (_InclusiveCache_inner_TLBuffer_auto_out_c_bits_corrupt),	// Parameters.scala:56:69
    .auto_in_d_ready            (_InclusiveCache_inner_TLBuffer_auto_out_d_ready),	// Parameters.scala:56:69
    .auto_in_e_valid            (_InclusiveCache_inner_TLBuffer_auto_out_e_valid),	// Parameters.scala:56:69
    .auto_in_e_bits_sink        (_InclusiveCache_inner_TLBuffer_auto_out_e_bits_sink),	// Parameters.scala:56:69
    .auto_out_a_ready           (_cork_auto_in_a_ready),	// Configs.scala:105:26
    .auto_out_c_ready           (_cork_auto_in_c_ready),	// Configs.scala:105:26
    .auto_out_d_valid           (_cork_auto_in_d_valid),	// Configs.scala:105:26
    .auto_out_d_bits_opcode     (_cork_auto_in_d_bits_opcode),	// Configs.scala:105:26
    .auto_out_d_bits_param      (_cork_auto_in_d_bits_param),	// Configs.scala:105:26
    .auto_out_d_bits_size       (_cork_auto_in_d_bits_size),	// Configs.scala:105:26
    .auto_out_d_bits_source     (_cork_auto_in_d_bits_source),	// Configs.scala:105:26
    .auto_out_d_bits_sink       (_cork_auto_in_d_bits_sink),	// Configs.scala:105:26
    .auto_out_d_bits_denied     (_cork_auto_in_d_bits_denied),	// Configs.scala:105:26
    .auto_out_d_bits_data       (_cork_auto_in_d_bits_data),	// Configs.scala:105:26
    .auto_out_d_bits_corrupt    (_cork_auto_in_d_bits_corrupt),	// Configs.scala:105:26
    .auto_ctl_in_a_ready        (auto_l2_ctl_in_a_ready),
    .auto_ctl_in_d_valid        (auto_l2_ctl_in_d_valid),
    .auto_ctl_in_d_bits_opcode  (auto_l2_ctl_in_d_bits_opcode),
    .auto_ctl_in_d_bits_size    (auto_l2_ctl_in_d_bits_size),
    .auto_ctl_in_d_bits_source  (auto_l2_ctl_in_d_bits_source),
    .auto_ctl_in_d_bits_data    (auto_l2_ctl_in_d_bits_data),
    .auto_in_a_ready            (_l2_auto_in_a_ready),
    .auto_in_b_valid            (_l2_auto_in_b_valid),
    .auto_in_b_bits_param       (_l2_auto_in_b_bits_param),
    .auto_in_b_bits_address     (_l2_auto_in_b_bits_address),
    .auto_in_c_ready            (_l2_auto_in_c_ready),
    .auto_in_d_valid            (_l2_auto_in_d_valid),
    .auto_in_d_bits_opcode      (_l2_auto_in_d_bits_opcode),
    .auto_in_d_bits_param       (_l2_auto_in_d_bits_param),
    .auto_in_d_bits_size        (_l2_auto_in_d_bits_size),
    .auto_in_d_bits_source      (_l2_auto_in_d_bits_source),
    .auto_in_d_bits_sink        (_l2_auto_in_d_bits_sink),
    .auto_in_d_bits_denied      (_l2_auto_in_d_bits_denied),
    .auto_in_d_bits_data        (_l2_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt     (_l2_auto_in_d_bits_corrupt),
    .auto_out_a_valid           (_l2_auto_out_a_valid),
    .auto_out_a_bits_opcode     (_l2_auto_out_a_bits_opcode),
    .auto_out_a_bits_param      (_l2_auto_out_a_bits_param),
    .auto_out_a_bits_size       (_l2_auto_out_a_bits_size),
    .auto_out_a_bits_source     (_l2_auto_out_a_bits_source),
    .auto_out_a_bits_address    (_l2_auto_out_a_bits_address),
    .auto_out_a_bits_mask       (_l2_auto_out_a_bits_mask),
    .auto_out_a_bits_data       (_l2_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt    (_l2_auto_out_a_bits_corrupt),
    .auto_out_c_valid           (_l2_auto_out_c_valid),
    .auto_out_c_bits_opcode     (_l2_auto_out_c_bits_opcode),
    .auto_out_c_bits_size       (_l2_auto_out_c_bits_size),
    .auto_out_c_bits_source     (_l2_auto_out_c_bits_source),
    .auto_out_c_bits_address    (_l2_auto_out_c_bits_address),
    .auto_out_c_bits_data       (_l2_auto_out_c_bits_data),
    .auto_out_c_bits_corrupt    (_l2_auto_out_c_bits_corrupt),
    .auto_out_d_ready           (_l2_auto_out_d_ready),
    .auto_out_e_valid           (_l2_auto_out_e_valid),
    .auto_out_e_bits_sink       (_l2_auto_out_e_bits_sink)
  );
  TLBuffer_10 InclusiveCache_inner_TLBuffer (	// Parameters.scala:56:69
    .clock
      (auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock),
    .reset
      (auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset),
    .auto_in_a_valid         (auto_coherent_jbar_in_a_valid),
    .auto_in_a_bits_opcode   (auto_coherent_jbar_in_a_bits_opcode),
    .auto_in_a_bits_param    (auto_coherent_jbar_in_a_bits_param),
    .auto_in_a_bits_size     (auto_coherent_jbar_in_a_bits_size),
    .auto_in_a_bits_source   (auto_coherent_jbar_in_a_bits_source),
    .auto_in_a_bits_address  (auto_coherent_jbar_in_a_bits_address),
    .auto_in_a_bits_mask     (auto_coherent_jbar_in_a_bits_mask),
    .auto_in_a_bits_data     (auto_coherent_jbar_in_a_bits_data),
    .auto_in_a_bits_corrupt  (auto_coherent_jbar_in_a_bits_corrupt),
    .auto_in_b_ready         (auto_coherent_jbar_in_b_ready),
    .auto_in_c_valid         (auto_coherent_jbar_in_c_valid),
    .auto_in_c_bits_opcode   (auto_coherent_jbar_in_c_bits_opcode),
    .auto_in_c_bits_param    (auto_coherent_jbar_in_c_bits_param),
    .auto_in_c_bits_size     (auto_coherent_jbar_in_c_bits_size),
    .auto_in_c_bits_source   (auto_coherent_jbar_in_c_bits_source),
    .auto_in_c_bits_address  (auto_coherent_jbar_in_c_bits_address),
    .auto_in_c_bits_data     (auto_coherent_jbar_in_c_bits_data),
    .auto_in_c_bits_corrupt  (auto_coherent_jbar_in_c_bits_corrupt),
    .auto_in_d_ready         (auto_coherent_jbar_in_d_ready),
    .auto_in_e_valid         (auto_coherent_jbar_in_e_valid),
    .auto_in_e_bits_sink     (auto_coherent_jbar_in_e_bits_sink),
    .auto_out_a_ready        (_l2_auto_in_a_ready),	// Configs.scala:76:24
    .auto_out_b_valid        (_l2_auto_in_b_valid),	// Configs.scala:76:24
    .auto_out_b_bits_param   (_l2_auto_in_b_bits_param),	// Configs.scala:76:24
    .auto_out_b_bits_address (_l2_auto_in_b_bits_address),	// Configs.scala:76:24
    .auto_out_c_ready        (_l2_auto_in_c_ready),	// Configs.scala:76:24
    .auto_out_d_valid        (_l2_auto_in_d_valid),	// Configs.scala:76:24
    .auto_out_d_bits_opcode  (_l2_auto_in_d_bits_opcode),	// Configs.scala:76:24
    .auto_out_d_bits_param   (_l2_auto_in_d_bits_param),	// Configs.scala:76:24
    .auto_out_d_bits_size    (_l2_auto_in_d_bits_size),	// Configs.scala:76:24
    .auto_out_d_bits_source  (_l2_auto_in_d_bits_source),	// Configs.scala:76:24
    .auto_out_d_bits_sink    (_l2_auto_in_d_bits_sink),	// Configs.scala:76:24
    .auto_out_d_bits_denied  (_l2_auto_in_d_bits_denied),	// Configs.scala:76:24
    .auto_out_d_bits_data    (_l2_auto_in_d_bits_data),	// Configs.scala:76:24
    .auto_out_d_bits_corrupt (_l2_auto_in_d_bits_corrupt),	// Configs.scala:76:24
    .auto_in_a_ready         (auto_coherent_jbar_in_a_ready),
    .auto_in_b_valid         (auto_coherent_jbar_in_b_valid),
    .auto_in_b_bits_param    (auto_coherent_jbar_in_b_bits_param),
    .auto_in_b_bits_address  (auto_coherent_jbar_in_b_bits_address),
    .auto_in_c_ready         (auto_coherent_jbar_in_c_ready),
    .auto_in_d_valid         (auto_coherent_jbar_in_d_valid),
    .auto_in_d_bits_opcode   (auto_coherent_jbar_in_d_bits_opcode),
    .auto_in_d_bits_param    (auto_coherent_jbar_in_d_bits_param),
    .auto_in_d_bits_size     (auto_coherent_jbar_in_d_bits_size),
    .auto_in_d_bits_source   (auto_coherent_jbar_in_d_bits_source),
    .auto_in_d_bits_sink     (auto_coherent_jbar_in_d_bits_sink),
    .auto_in_d_bits_denied   (auto_coherent_jbar_in_d_bits_denied),
    .auto_in_d_bits_data     (auto_coherent_jbar_in_d_bits_data),
    .auto_in_d_bits_corrupt  (auto_coherent_jbar_in_d_bits_corrupt),
    .auto_out_a_valid        (_InclusiveCache_inner_TLBuffer_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_InclusiveCache_inner_TLBuffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_InclusiveCache_inner_TLBuffer_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_InclusiveCache_inner_TLBuffer_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_InclusiveCache_inner_TLBuffer_auto_out_a_bits_source),
    .auto_out_a_bits_address (_InclusiveCache_inner_TLBuffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_InclusiveCache_inner_TLBuffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_InclusiveCache_inner_TLBuffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_InclusiveCache_inner_TLBuffer_auto_out_a_bits_corrupt),
    .auto_out_b_ready        (_InclusiveCache_inner_TLBuffer_auto_out_b_ready),
    .auto_out_c_valid        (_InclusiveCache_inner_TLBuffer_auto_out_c_valid),
    .auto_out_c_bits_opcode  (_InclusiveCache_inner_TLBuffer_auto_out_c_bits_opcode),
    .auto_out_c_bits_param   (_InclusiveCache_inner_TLBuffer_auto_out_c_bits_param),
    .auto_out_c_bits_size    (_InclusiveCache_inner_TLBuffer_auto_out_c_bits_size),
    .auto_out_c_bits_source  (_InclusiveCache_inner_TLBuffer_auto_out_c_bits_source),
    .auto_out_c_bits_address (_InclusiveCache_inner_TLBuffer_auto_out_c_bits_address),
    .auto_out_c_bits_data    (_InclusiveCache_inner_TLBuffer_auto_out_c_bits_data),
    .auto_out_c_bits_corrupt (_InclusiveCache_inner_TLBuffer_auto_out_c_bits_corrupt),
    .auto_out_d_ready        (_InclusiveCache_inner_TLBuffer_auto_out_d_ready),
    .auto_out_e_valid        (_InclusiveCache_inner_TLBuffer_auto_out_e_valid),
    .auto_out_e_bits_sink    (_InclusiveCache_inner_TLBuffer_auto_out_e_bits_sink)
  );
  TLCacheCork cork (	// Configs.scala:105:26
    .clock
      (auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock),
    .reset
      (auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset),
    .auto_in_a_valid         (_l2_auto_out_a_valid),	// Configs.scala:76:24
    .auto_in_a_bits_opcode   (_l2_auto_out_a_bits_opcode),	// Configs.scala:76:24
    .auto_in_a_bits_param    (_l2_auto_out_a_bits_param),	// Configs.scala:76:24
    .auto_in_a_bits_size     (_l2_auto_out_a_bits_size),	// Configs.scala:76:24
    .auto_in_a_bits_source   (_l2_auto_out_a_bits_source),	// Configs.scala:76:24
    .auto_in_a_bits_address  (_l2_auto_out_a_bits_address),	// Configs.scala:76:24
    .auto_in_a_bits_mask     (_l2_auto_out_a_bits_mask),	// Configs.scala:76:24
    .auto_in_a_bits_data     (_l2_auto_out_a_bits_data),	// Configs.scala:76:24
    .auto_in_a_bits_corrupt  (_l2_auto_out_a_bits_corrupt),	// Configs.scala:76:24
    .auto_in_c_valid         (_l2_auto_out_c_valid),	// Configs.scala:76:24
    .auto_in_c_bits_opcode   (_l2_auto_out_c_bits_opcode),	// Configs.scala:76:24
    .auto_in_c_bits_size     (_l2_auto_out_c_bits_size),	// Configs.scala:76:24
    .auto_in_c_bits_source   (_l2_auto_out_c_bits_source),	// Configs.scala:76:24
    .auto_in_c_bits_address  (_l2_auto_out_c_bits_address),	// Configs.scala:76:24
    .auto_in_c_bits_data     (_l2_auto_out_c_bits_data),	// Configs.scala:76:24
    .auto_in_c_bits_corrupt  (_l2_auto_out_c_bits_corrupt),	// Configs.scala:76:24
    .auto_in_d_ready         (_l2_auto_out_d_ready),	// Configs.scala:76:24
    .auto_in_e_valid         (_l2_auto_out_e_valid),	// Configs.scala:76:24
    .auto_in_e_bits_sink     (_l2_auto_out_e_bits_sink),	// Configs.scala:76:24
    .auto_out_a_ready        (_binder_auto_in_a_ready),	// BankBinder.scala:68:28
    .auto_out_d_valid        (_binder_auto_in_d_valid),	// BankBinder.scala:68:28
    .auto_out_d_bits_opcode  (_binder_auto_in_d_bits_opcode),	// BankBinder.scala:68:28
    .auto_out_d_bits_param   (_binder_auto_in_d_bits_param),	// BankBinder.scala:68:28
    .auto_out_d_bits_size    (_binder_auto_in_d_bits_size),	// BankBinder.scala:68:28
    .auto_out_d_bits_source  (_binder_auto_in_d_bits_source),	// BankBinder.scala:68:28
    .auto_out_d_bits_denied  (_binder_auto_in_d_bits_denied),	// BankBinder.scala:68:28
    .auto_out_d_bits_data    (_binder_auto_in_d_bits_data),	// BankBinder.scala:68:28
    .auto_out_d_bits_corrupt (_binder_auto_in_d_bits_corrupt),	// BankBinder.scala:68:28
    .auto_in_a_ready         (_cork_auto_in_a_ready),
    .auto_in_c_ready         (_cork_auto_in_c_ready),
    .auto_in_d_valid         (_cork_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_cork_auto_in_d_bits_opcode),
    .auto_in_d_bits_param    (_cork_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_cork_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_cork_auto_in_d_bits_source),
    .auto_in_d_bits_sink     (_cork_auto_in_d_bits_sink),
    .auto_in_d_bits_denied   (_cork_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_cork_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_cork_auto_in_d_bits_corrupt),
    .auto_out_a_valid        (_cork_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_cork_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_cork_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_cork_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_cork_auto_out_a_bits_source),
    .auto_out_a_bits_address (_cork_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_cork_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_cork_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_cork_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_cork_auto_out_d_ready)
  );
  ProbePicker binder (	// BankBinder.scala:68:28
    .auto_in_a_valid         (_cork_auto_out_a_valid),	// Configs.scala:105:26
    .auto_in_a_bits_opcode   (_cork_auto_out_a_bits_opcode),	// Configs.scala:105:26
    .auto_in_a_bits_param    (_cork_auto_out_a_bits_param),	// Configs.scala:105:26
    .auto_in_a_bits_size     (_cork_auto_out_a_bits_size),	// Configs.scala:105:26
    .auto_in_a_bits_source   (_cork_auto_out_a_bits_source),	// Configs.scala:105:26
    .auto_in_a_bits_address  (_cork_auto_out_a_bits_address),	// Configs.scala:105:26
    .auto_in_a_bits_mask     (_cork_auto_out_a_bits_mask),	// Configs.scala:105:26
    .auto_in_a_bits_data     (_cork_auto_out_a_bits_data),	// Configs.scala:105:26
    .auto_in_a_bits_corrupt  (_cork_auto_out_a_bits_corrupt),	// Configs.scala:105:26
    .auto_in_d_ready         (_cork_auto_out_d_ready),	// Configs.scala:105:26
    .auto_out_a_ready
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_ready),
    .auto_out_d_valid
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_valid),
    .auto_out_d_bits_opcode
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_opcode),
    .auto_out_d_bits_param
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_param),
    .auto_out_d_bits_size
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_size),
    .auto_out_d_bits_source
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_source),
    .auto_out_d_bits_denied
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_denied),
    .auto_out_d_bits_data
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_data),
    .auto_out_d_bits_corrupt
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_corrupt),
    .auto_in_a_ready         (_binder_auto_in_a_ready),
    .auto_in_d_valid         (_binder_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_binder_auto_in_d_bits_opcode),
    .auto_in_d_bits_param    (_binder_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_binder_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_binder_auto_in_d_bits_source),
    .auto_in_d_bits_denied   (_binder_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_binder_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_binder_auto_in_d_bits_corrupt),
    .auto_out_a_valid
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid),
    .auto_out_a_bits_opcode
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode),
    .auto_out_a_bits_param
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param),
    .auto_out_a_bits_size
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size),
    .auto_out_a_bits_source
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source),
    .auto_out_a_bits_address
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address),
    .auto_out_a_bits_mask
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask),
    .auto_out_a_bits_data
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data),
    .auto_out_a_bits_corrupt
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_corrupt),
    .auto_out_d_ready
      (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready)
  );
endmodule

