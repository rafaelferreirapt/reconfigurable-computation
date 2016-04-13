
################################################################
# This is a generated script based on design: ex4
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source ex4_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a100tcsg324-1

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name ex4

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set an [ create_bd_port -dir O -from 7 -to 0 an ]
  set btnC [ create_bd_port -dir I btnC ]
  set clk [ create_bd_port -dir I clk ]
  set led [ create_bd_port -dir O -from 15 -to 0 led ]
  set seg [ create_bd_port -dir O -from 6 -to 0 seg ]

  # Create instance: BinToBCD16_0, and set properties
  set BinToBCD16_0 [ create_bd_cell -type ip -vlnv ua.pt:user:BinToBCD16:1.0 BinToBCD16_0 ]

  # Create instance: EightDisplayControl_0, and set properties
  set EightDisplayControl_0 [ create_bd_cell -type ip -vlnv ua.pt:user:EightDisplayControl:1.0 EightDisplayControl_0 ]

  # Create instance: ROM_Reader1_0, and set properties
  set ROM_Reader1_0 [ create_bd_cell -type ip -vlnv user.org:user:ROM_Reader1:1.0 ROM_Reader1_0 ]
  set_property -dict [ list \
CONFIG.address_bits {3} \
CONFIG.data_width {16} \
 ] $ROM_Reader1_0

  # Create instance: blk_mem_gen_1, and set properties
  set blk_mem_gen_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_1 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Coe_File {../../../../imports/Projects2016/8words_16bits.coe} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_A {Always_Enabled} \
CONFIG.Load_Init_File {true} \
CONFIG.Memory_Type {Single_Port_ROM} \
CONFIG.Port_A_Write_Rate {0} \
CONFIG.Read_Width_A {16} \
CONFIG.Read_Width_B {16} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Depth_A {8} \
CONFIG.Write_Width_A {16} \
CONFIG.Write_Width_B {16} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_1

  # Create instance: c_addsub_0, and set properties
  set c_addsub_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_0 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {5} \
CONFIG.B_Constant {false} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {00000} \
CONFIG.B_Width {5} \
CONFIG.CE {false} \
CONFIG.Latency {1} \
CONFIG.Latency_Configuration {Automatic} \
CONFIG.Out_Width {6} \
 ] $c_addsub_0

  # Create instance: c_addsub_1, and set properties
  set c_addsub_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_1 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {5} \
CONFIG.B_Constant {false} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {00000} \
CONFIG.B_Width {5} \
CONFIG.CE {false} \
CONFIG.Latency {1} \
CONFIG.Latency_Configuration {Automatic} \
CONFIG.Out_Width {6} \
 ] $c_addsub_1

  # Create instance: c_addsub_2, and set properties
  set c_addsub_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_2 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {5} \
CONFIG.B_Constant {false} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {00000} \
CONFIG.B_Width {5} \
CONFIG.CE {false} \
CONFIG.Latency {1} \
CONFIG.Latency_Configuration {Automatic} \
CONFIG.Out_Width {6} \
 ] $c_addsub_2

  # Create instance: c_addsub_3, and set properties
  set c_addsub_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_3 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {5} \
CONFIG.B_Constant {false} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {00000} \
CONFIG.B_Width {5} \
CONFIG.CE {false} \
CONFIG.Latency {1} \
CONFIG.Latency_Configuration {Automatic} \
CONFIG.Out_Width {6} \
 ] $c_addsub_3

  # Create instance: c_addsub_4, and set properties
  set c_addsub_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_4 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {6} \
CONFIG.B_Constant {false} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {000000} \
CONFIG.B_Width {6} \
CONFIG.CE {false} \
CONFIG.Latency {1} \
CONFIG.Latency_Configuration {Automatic} \
CONFIG.Out_Width {7} \
 ] $c_addsub_4

  # Create instance: c_addsub_5, and set properties
  set c_addsub_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_5 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {6} \
CONFIG.B_Constant {false} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {000000} \
CONFIG.B_Width {6} \
CONFIG.CE {false} \
CONFIG.Latency {1} \
CONFIG.Latency_Configuration {Automatic} \
CONFIG.Out_Width {7} \
 ] $c_addsub_5

  # Create instance: c_addsub_6, and set properties
  set c_addsub_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_6 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {7} \
CONFIG.B_Constant {false} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0000000} \
CONFIG.B_Width {7} \
CONFIG.CE {false} \
CONFIG.Latency {1} \
CONFIG.Latency_Configuration {Automatic} \
CONFIG.Out_Width {8} \
 ] $c_addsub_6

  # Create instance: hw_0, and set properties
  set hw_0 [ create_bd_cell -type ip -vlnv user.org:user:hw:1.0 hw_0 ]

  # Create instance: hw_1, and set properties
  set hw_1 [ create_bd_cell -type ip -vlnv user.org:user:hw:1.0 hw_1 ]

  # Create instance: hw_2, and set properties
  set hw_2 [ create_bd_cell -type ip -vlnv user.org:user:hw:1.0 hw_2 ]

  # Create instance: hw_3, and set properties
  set hw_3 [ create_bd_cell -type ip -vlnv user.org:user:hw:1.0 hw_3 ]

  # Create instance: hw_4, and set properties
  set hw_4 [ create_bd_cell -type ip -vlnv user.org:user:hw:1.0 hw_4 ]

  # Create instance: hw_5, and set properties
  set hw_5 [ create_bd_cell -type ip -vlnv user.org:user:hw:1.0 hw_5 ]

  # Create instance: hw_6, and set properties
  set hw_6 [ create_bd_cell -type ip -vlnv user.org:user:hw:1.0 hw_6 ]

  # Create instance: hw_7, and set properties
  set hw_7 [ create_bd_cell -type ip -vlnv user.org:user:hw:1.0 hw_7 ]

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {8} \
CONFIG.IN1_WIDTH {8} \
 ] $xlconcat_0

  # Create instance: xlconstant_8, and set properties
  set xlconstant_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_8 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {8} \
 ] $xlconstant_8

  # Create instance: xlconstant_9, and set properties
  set xlconstant_9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_9 ]

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {3} \
CONFIG.DIN_TO {0} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {4} \
 ] $xlslice_0

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {7} \
CONFIG.DIN_TO {4} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {4} \
 ] $xlslice_1

  # Create instance: xlslice_2, and set properties
  set xlslice_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_2 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {11} \
CONFIG.DIN_TO {8} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {4} \
 ] $xlslice_2

  # Create instance: xlslice_3, and set properties
  set xlslice_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_3 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DIN_TO {12} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {4} \
 ] $xlslice_3

  # Create instance: xlslice_4, and set properties
  set xlslice_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_4 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {111} \
CONFIG.DIN_TO {96} \
CONFIG.DIN_WIDTH {128} \
CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_4

  # Create instance: xlslice_5, and set properties
  set xlslice_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_5 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {31} \
CONFIG.DIN_TO {16} \
CONFIG.DIN_WIDTH {128} \
CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_5

  # Create instance: xlslice_6, and set properties
  set xlslice_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_6 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DIN_TO {0} \
CONFIG.DIN_WIDTH {128} \
CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_6

  # Create instance: xlslice_7, and set properties
  set xlslice_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_7 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {47} \
CONFIG.DIN_TO {32} \
CONFIG.DIN_WIDTH {128} \
CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_7

  # Create instance: xlslice_8, and set properties
  set xlslice_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_8 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {63} \
CONFIG.DIN_TO {48} \
CONFIG.DIN_WIDTH {128} \
CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_8

  # Create instance: xlslice_9, and set properties
  set xlslice_9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_9 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {95} \
CONFIG.DIN_TO {80} \
CONFIG.DIN_WIDTH {128} \
CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_9

  # Create instance: xlslice_10, and set properties
  set xlslice_10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_10 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {79} \
CONFIG.DIN_TO {64} \
CONFIG.DIN_WIDTH {128} \
CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_10

  # Create instance: xlslice_11, and set properties
  set xlslice_11 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_11 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {127} \
CONFIG.DIN_TO {112} \
CONFIG.DIN_WIDTH {128} \
CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_11

  # Create port connections
  connect_bd_net -net BinToBCD16_0_BCD0 [get_bd_pins BinToBCD16_0/BCD0] [get_bd_pins EightDisplayControl_0/rightL]
  connect_bd_net -net BinToBCD16_0_BCD1 [get_bd_pins BinToBCD16_0/BCD1] [get_bd_pins EightDisplayControl_0/near_rightL]
  connect_bd_net -net BinToBCD16_0_BCD2 [get_bd_pins BinToBCD16_0/BCD2] [get_bd_pins EightDisplayControl_0/near_leftL]
  connect_bd_net -net BinToBCD16_0_BCD3 [get_bd_pins BinToBCD16_0/BCD3] [get_bd_pins EightDisplayControl_0/leftL]
  connect_bd_net -net EightDisplayControl_0_segments [get_bd_ports seg] [get_bd_pins EightDisplayControl_0/segments]
  connect_bd_net -net EightDisplayControl_0_select_display [get_bd_ports an] [get_bd_pins EightDisplayControl_0/select_display]
  connect_bd_net -net ROM_Reader1_0_addr [get_bd_pins ROM_Reader1_0/addr] [get_bd_pins blk_mem_gen_1/addra]
  connect_bd_net -net ROM_Reader1_0_data_out [get_bd_pins ROM_Reader1_0/data_out] [get_bd_pins xlslice_10/Din] [get_bd_pins xlslice_11/Din] [get_bd_pins xlslice_4/Din] [get_bd_pins xlslice_5/Din] [get_bd_pins xlslice_6/Din] [get_bd_pins xlslice_7/Din] [get_bd_pins xlslice_8/Din] [get_bd_pins xlslice_9/Din]
  connect_bd_net -net blk_mem_gen_1_douta [get_bd_pins ROM_Reader1_0/data_in] [get_bd_pins blk_mem_gen_1/douta]
  connect_bd_net -net btnC_1 [get_bd_ports btnC] [get_bd_pins ROM_Reader1_0/rst]
  connect_bd_net -net c_addsub_0_S [get_bd_pins c_addsub_0/S] [get_bd_pins c_addsub_5/A]
  connect_bd_net -net c_addsub_1_S [get_bd_pins c_addsub_1/S] [get_bd_pins c_addsub_4/B]
  connect_bd_net -net c_addsub_2_S [get_bd_pins c_addsub_2/S] [get_bd_pins c_addsub_4/A]
  connect_bd_net -net c_addsub_3_S [get_bd_pins c_addsub_3/S] [get_bd_pins c_addsub_5/B]
  connect_bd_net -net c_addsub_4_S [get_bd_pins c_addsub_4/S] [get_bd_pins c_addsub_6/B]
  connect_bd_net -net c_addsub_5_S [get_bd_pins c_addsub_5/S] [get_bd_pins c_addsub_6/A]
  connect_bd_net -net c_addsub_6_S [get_bd_pins c_addsub_6/S] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins BinToBCD16_0/clk] [get_bd_pins EightDisplayControl_0/clk] [get_bd_pins ROM_Reader1_0/clk] [get_bd_pins blk_mem_gen_1/clka] [get_bd_pins c_addsub_0/CLK] [get_bd_pins c_addsub_1/CLK] [get_bd_pins c_addsub_2/CLK] [get_bd_pins c_addsub_3/CLK] [get_bd_pins c_addsub_4/CLK] [get_bd_pins c_addsub_5/CLK] [get_bd_pins c_addsub_6/CLK]
  connect_bd_net -net hw_0_out_data [get_bd_pins c_addsub_0/A] [get_bd_pins hw_0/out_data]
  connect_bd_net -net hw_1_out_data [get_bd_pins c_addsub_0/B] [get_bd_pins hw_1/out_data]
  connect_bd_net -net hw_2_out_data [get_bd_pins c_addsub_1/A] [get_bd_pins hw_2/out_data]
  connect_bd_net -net hw_3_out_data [get_bd_pins c_addsub_1/B] [get_bd_pins hw_3/out_data]
  connect_bd_net -net hw_4_out_data [get_bd_pins c_addsub_2/A] [get_bd_pins hw_4/out_data]
  connect_bd_net -net hw_5_out_data [get_bd_pins c_addsub_2/B] [get_bd_pins hw_5/out_data]
  connect_bd_net -net hw_6_out_data [get_bd_pins c_addsub_3/A] [get_bd_pins hw_6/out_data]
  connect_bd_net -net hw_7_out_data [get_bd_pins c_addsub_3/B] [get_bd_pins hw_7/out_data]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins BinToBCD16_0/binary] [get_bd_pins xlconcat_0/dout] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din] [get_bd_pins xlslice_2/Din] [get_bd_pins xlslice_3/Din]
  connect_bd_net -net xlconstant_8_dout [get_bd_pins xlconcat_0/In1] [get_bd_pins xlconstant_8/dout]
  connect_bd_net -net xlconstant_9_dout [get_bd_pins BinToBCD16_0/request] [get_bd_pins xlconstant_9/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins EightDisplayControl_0/rightR] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_10_Dout [get_bd_pins hw_2/in_data] [get_bd_pins xlslice_10/Dout]
  connect_bd_net -net xlslice_11_Dout [get_bd_pins hw_5/in_data] [get_bd_pins xlslice_11/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins EightDisplayControl_0/near_rightR] [get_bd_pins xlslice_1/Dout]
  connect_bd_net -net xlslice_2_Dout [get_bd_pins EightDisplayControl_0/near_leftR] [get_bd_pins xlslice_2/Dout]
  connect_bd_net -net xlslice_3_Dout [get_bd_pins EightDisplayControl_0/leftR] [get_bd_pins xlslice_3/Dout]
  connect_bd_net -net xlslice_4_Dout [get_bd_pins hw_4/in_data] [get_bd_pins xlslice_4/Dout]
  connect_bd_net -net xlslice_5_Dout [get_bd_pins hw_1/in_data] [get_bd_pins xlslice_5/Dout]
  connect_bd_net -net xlslice_6_Dout [get_bd_ports led] [get_bd_pins hw_0/in_data] [get_bd_pins xlslice_6/Dout]
  connect_bd_net -net xlslice_7_Dout [get_bd_pins hw_6/in_data] [get_bd_pins xlslice_7/Dout]
  connect_bd_net -net xlslice_8_Dout [get_bd_pins hw_7/in_data] [get_bd_pins xlslice_8/Dout]
  connect_bd_net -net xlslice_9_Dout [get_bd_pins hw_3/in_data] [get_bd_pins xlslice_9/Dout]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.8
#  -string -flagsOSRD
preplace port btnC -pg 1 -y 230 -defaultsOSRD
preplace port clk -pg 1 -y 190 -defaultsOSRD
preplace portBus an -pg 1 -y 290 -defaultsOSRD
preplace portBus led -pg 1 -lvl 2:20 -defaultsOSRD -top
preplace portBus seg -pg 1 -y 310 -defaultsOSRD
preplace inst ROM_Reader1_0 -pg 1 -lvl 1 -y 210 -defaultsOSRD
preplace inst EightDisplayControl_0 -pg 1 -lvl 7 -y 300 -defaultsOSRD
preplace inst hw_0 -pg 1 -lvl 3 -y 50 -defaultsOSRD
preplace inst xlslice_0 -pg 1 -lvl 6 -y 520 -defaultsOSRD
preplace inst hw_1 -pg 1 -lvl 3 -y 140 -defaultsOSRD
preplace inst xlslice_1 -pg 1 -lvl 6 -y 430 -defaultsOSRD
preplace inst hw_2 -pg 1 -lvl 3 -y 590 -defaultsOSRD
preplace inst xlslice_2 -pg 1 -lvl 6 -y 340 -defaultsOSRD
preplace inst hw_3 -pg 1 -lvl 3 -y 680 -defaultsOSRD
preplace inst xlslice_3 -pg 1 -lvl 6 -y 250 -defaultsOSRD
preplace inst hw_4 -pg 1 -lvl 3 -y 770 -defaultsOSRD
preplace inst xlslice_10 -pg 1 -lvl 2 -y 590 -defaultsOSRD
preplace inst xlslice_4 -pg 1 -lvl 2 -y 770 -defaultsOSRD
preplace inst xlconcat_0 -pg 1 -lvl 7 -y 650 -defaultsOSRD
preplace inst c_addsub_0 -pg 1 -lvl 4 -y 140 -defaultsOSRD
preplace inst hw_5 -pg 1 -lvl 3 -y 860 -defaultsOSRD
preplace inst xlslice_11 -pg 1 -lvl 2 -y 860 -defaultsOSRD
preplace inst xlslice_5 -pg 1 -lvl 2 -y 140 -defaultsOSRD
preplace inst c_addsub_1 -pg 1 -lvl 4 -y 640 -defaultsOSRD
preplace inst hw_6 -pg 1 -lvl 3 -y 410 -defaultsOSRD
preplace inst xlslice_6 -pg 1 -lvl 2 -y 50 -defaultsOSRD
preplace inst c_addsub_2 -pg 1 -lvl 4 -y 790 -defaultsOSRD
preplace inst hw_7 -pg 1 -lvl 3 -y 500 -defaultsOSRD
preplace inst blk_mem_gen_1 -pg 1 -lvl 2 -y 270 -defaultsOSRD
preplace inst xlslice_7 -pg 1 -lvl 2 -y 410 -defaultsOSRD
preplace inst BinToBCD16_0 -pg 1 -lvl 6 -y 100 -defaultsOSRD
preplace inst c_addsub_3 -pg 1 -lvl 4 -y 500 -defaultsOSRD
preplace inst xlslice_8 -pg 1 -lvl 2 -y 500 -defaultsOSRD
preplace inst c_addsub_4 -pg 1 -lvl 5 -y 640 -defaultsOSRD
preplace inst xlslice_9 -pg 1 -lvl 2 -y 680 -defaultsOSRD
preplace inst xlconstant_8 -pg 1 -lvl 6 -y 750 -defaultsOSRD
preplace inst c_addsub_5 -pg 1 -lvl 5 -y 500 -defaultsOSRD
preplace inst xlconstant_9 -pg 1 -lvl 5 -y 130 -defaultsOSRD
preplace inst c_addsub_6 -pg 1 -lvl 6 -y 640 -defaultsOSRD
preplace netloc xlslice_9_Dout 1 2 1 NJ
preplace netloc xlslice_4_Dout 1 2 1 NJ
preplace netloc blk_mem_gen_1_douta 1 0 2 20 290 NJ
preplace netloc xlslice_3_Dout 1 6 1 NJ
preplace netloc xlslice_1_Dout 1 6 1 NJ
preplace netloc BinToBCD16_0_BCD0 1 6 1 1420
preplace netloc c_addsub_5_S 1 5 1 1170
preplace netloc hw_7_out_data 1 3 1 NJ
preplace netloc hw_3_out_data 1 3 1 NJ
preplace netloc BinToBCD16_0_BCD1 1 6 1 1430
preplace netloc xlslice_5_Dout 1 2 1 N
preplace netloc xlslice_7_Dout 1 2 1 NJ
preplace netloc btnC_1 1 0 1 NJ
preplace netloc BinToBCD16_0_BCD2 1 6 1 1450
preplace netloc c_addsub_3_S 1 4 1 N
preplace netloc BinToBCD16_0_BCD3 1 6 1 1460
preplace netloc xlconstant_8_dout 1 6 1 1440
preplace netloc c_addsub_1_S 1 4 1 N
preplace netloc hw_6_out_data 1 3 1 NJ
preplace netloc xlslice_10_Dout 1 2 1 NJ
preplace netloc xlconcat_0_dout 1 5 3 1190 570 NJ 570 1740
preplace netloc hw_2_out_data 1 3 1 NJ
preplace netloc hw_1_out_data 1 3 1 NJ
preplace netloc clk_1 1 0 7 20 140 300 360 NJ 360 780 570 970 570 1180 200 1440
preplace netloc ROM_Reader1_0_addr 1 1 1 290
preplace netloc xlslice_2_Dout 1 6 1 NJ
preplace netloc xlconstant_9_dout 1 5 1 N
preplace netloc xlslice_11_Dout 1 2 1 NJ
preplace netloc c_addsub_6_S 1 6 1 N
preplace netloc ROM_Reader1_0_data_out 1 1 1 310
preplace netloc xlslice_8_Dout 1 2 1 NJ
preplace netloc EightDisplayControl_0_select_display 1 7 1 NJ
preplace netloc hw_4_out_data 1 3 1 NJ
preplace netloc hw_0_out_data 1 3 1 NJ
preplace netloc EightDisplayControl_0_segments 1 7 1 NJ
preplace netloc xlslice_6_Dout 1 2 1 NJ
preplace netloc xlslice_0_Dout 1 6 1 NJ
preplace netloc c_addsub_4_S 1 5 1 N
preplace netloc c_addsub_0_S 1 4 1 970
preplace netloc c_addsub_2_S 1 4 1 980
preplace netloc hw_5_out_data 1 3 1 NJ
levelinfo -pg 1 0 160 420 650 880 1080 1300 1600 1760 -top -120 -bot 910
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


