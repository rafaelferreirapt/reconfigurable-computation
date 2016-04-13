
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
  set clk [ create_bd_port -dir I clk ]
  set led [ create_bd_port -dir O -from 15 -to 0 led ]
  set seg [ create_bd_port -dir O -from 6 -to 0 seg ]

  # Create instance: BinToBCD16_0, and set properties
  set BinToBCD16_0 [ create_bd_cell -type ip -vlnv ua.pt:user:BinToBCD16:1.0 BinToBCD16_0 ]

  # Create instance: EightDisplayControl_0, and set properties
  set EightDisplayControl_0 [ create_bd_cell -type ip -vlnv ua.pt:user:EightDisplayControl:1.0 EightDisplayControl_0 ]

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
CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Depth_A {8} \
CONFIG.Write_Width_A {16} \
CONFIG.Write_Width_B {16} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_1

  # Create instance: blk_mem_gen_2, and set properties
  set blk_mem_gen_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_2 ]
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
CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Depth_A {8} \
CONFIG.Write_Width_A {16} \
CONFIG.Write_Width_B {16} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_2

  # Create instance: blk_mem_gen_3, and set properties
  set blk_mem_gen_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_3 ]
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
CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Depth_A {8} \
CONFIG.Write_Width_A {16} \
CONFIG.Write_Width_B {16} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_3

  # Create instance: blk_mem_gen_4, and set properties
  set blk_mem_gen_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_4 ]
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
CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Depth_A {8} \
CONFIG.Write_Width_A {16} \
CONFIG.Write_Width_B {16} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_4

  # Create instance: blk_mem_gen_5, and set properties
  set blk_mem_gen_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_5 ]
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
CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Depth_A {8} \
CONFIG.Write_Width_A {16} \
CONFIG.Write_Width_B {16} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_5

  # Create instance: blk_mem_gen_6, and set properties
  set blk_mem_gen_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_6 ]
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
CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Depth_A {8} \
CONFIG.Write_Width_A {16} \
CONFIG.Write_Width_B {16} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_6

  # Create instance: blk_mem_gen_7, and set properties
  set blk_mem_gen_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_7 ]
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
CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Depth_A {8} \
CONFIG.Write_Width_A {16} \
CONFIG.Write_Width_B {16} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_7

  # Create instance: blk_mem_gen_8, and set properties
  set blk_mem_gen_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_8 ]
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
CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Depth_A {8} \
CONFIG.Write_Width_A {16} \
CONFIG.Write_Width_B {16} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_8

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

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {3} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {2} \
CONFIG.CONST_WIDTH {3} \
 ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {1} \
CONFIG.CONST_WIDTH {3} \
 ] $xlconstant_2

  # Create instance: xlconstant_3, and set properties
  set xlconstant_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_3 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {3} \
CONFIG.CONST_WIDTH {3} \
 ] $xlconstant_3

  # Create instance: xlconstant_4, and set properties
  set xlconstant_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_4 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {4} \
CONFIG.CONST_WIDTH {3} \
 ] $xlconstant_4

  # Create instance: xlconstant_5, and set properties
  set xlconstant_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_5 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {5} \
CONFIG.CONST_WIDTH {3} \
 ] $xlconstant_5

  # Create instance: xlconstant_6, and set properties
  set xlconstant_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_6 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {6} \
CONFIG.CONST_WIDTH {3} \
 ] $xlconstant_6

  # Create instance: xlconstant_7, and set properties
  set xlconstant_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_7 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {7} \
CONFIG.CONST_WIDTH {3} \
 ] $xlconstant_7

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

  # Create port connections
  connect_bd_net -net BinToBCD16_0_BCD0 [get_bd_pins BinToBCD16_0/BCD0] [get_bd_pins EightDisplayControl_0/rightL]
  connect_bd_net -net BinToBCD16_0_BCD1 [get_bd_pins BinToBCD16_0/BCD1] [get_bd_pins EightDisplayControl_0/near_rightL]
  connect_bd_net -net BinToBCD16_0_BCD2 [get_bd_pins BinToBCD16_0/BCD2] [get_bd_pins EightDisplayControl_0/near_leftL]
  connect_bd_net -net BinToBCD16_0_BCD3 [get_bd_pins BinToBCD16_0/BCD3] [get_bd_pins EightDisplayControl_0/leftL]
  connect_bd_net -net EightDisplayControl_0_segments [get_bd_ports seg] [get_bd_pins EightDisplayControl_0/segments]
  connect_bd_net -net EightDisplayControl_0_select_display [get_bd_ports an] [get_bd_pins EightDisplayControl_0/select_display]
  connect_bd_net -net blk_mem_gen_1_douta [get_bd_pins blk_mem_gen_1/douta] [get_bd_pins hw_0/in_data]
  connect_bd_net -net blk_mem_gen_2_douta [get_bd_pins blk_mem_gen_2/douta] [get_bd_pins hw_6/in_data]
  connect_bd_net -net blk_mem_gen_3_douta [get_bd_pins blk_mem_gen_3/douta] [get_bd_pins hw_1/in_data]
  connect_bd_net -net blk_mem_gen_4_douta [get_bd_pins blk_mem_gen_4/douta] [get_bd_pins hw_7/in_data]
  connect_bd_net -net blk_mem_gen_5_douta [get_bd_pins blk_mem_gen_5/douta] [get_bd_pins hw_4/in_data]
  connect_bd_net -net blk_mem_gen_6_douta [get_bd_pins blk_mem_gen_6/douta] [get_bd_pins hw_5/in_data]
  connect_bd_net -net blk_mem_gen_7_douta [get_bd_pins blk_mem_gen_7/douta] [get_bd_pins hw_2/in_data]
  connect_bd_net -net blk_mem_gen_8_douta [get_bd_pins blk_mem_gen_8/douta] [get_bd_pins hw_3/in_data]
  connect_bd_net -net c_addsub_0_S [get_bd_pins c_addsub_0/S] [get_bd_pins c_addsub_5/A]
  connect_bd_net -net c_addsub_1_S [get_bd_pins c_addsub_1/S] [get_bd_pins c_addsub_4/B]
  connect_bd_net -net c_addsub_2_S [get_bd_pins c_addsub_2/S] [get_bd_pins c_addsub_4/A]
  connect_bd_net -net c_addsub_3_S [get_bd_pins c_addsub_3/S] [get_bd_pins c_addsub_5/B]
  connect_bd_net -net c_addsub_4_S [get_bd_pins c_addsub_4/S] [get_bd_pins c_addsub_6/B]
  connect_bd_net -net c_addsub_5_S [get_bd_pins c_addsub_5/S] [get_bd_pins c_addsub_6/A]
  connect_bd_net -net c_addsub_6_S [get_bd_pins c_addsub_6/S] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins BinToBCD16_0/clk] [get_bd_pins EightDisplayControl_0/clk] [get_bd_pins blk_mem_gen_1/clka] [get_bd_pins blk_mem_gen_2/clka] [get_bd_pins blk_mem_gen_3/clka] [get_bd_pins blk_mem_gen_4/clka] [get_bd_pins blk_mem_gen_5/clka] [get_bd_pins blk_mem_gen_6/clka] [get_bd_pins blk_mem_gen_7/clka] [get_bd_pins blk_mem_gen_8/clka] [get_bd_pins c_addsub_0/CLK] [get_bd_pins c_addsub_1/CLK] [get_bd_pins c_addsub_2/CLK] [get_bd_pins c_addsub_3/CLK] [get_bd_pins c_addsub_4/CLK] [get_bd_pins c_addsub_5/CLK] [get_bd_pins c_addsub_6/CLK]
  connect_bd_net -net hw_0_out_data [get_bd_pins c_addsub_0/A] [get_bd_pins hw_0/out_data]
  connect_bd_net -net hw_1_out_data [get_bd_pins c_addsub_0/B] [get_bd_pins hw_1/out_data]
  connect_bd_net -net hw_2_out_data [get_bd_pins c_addsub_1/A] [get_bd_pins hw_2/out_data]
  connect_bd_net -net hw_3_out_data [get_bd_pins c_addsub_1/B] [get_bd_pins hw_3/out_data]
  connect_bd_net -net hw_4_out_data [get_bd_pins c_addsub_2/A] [get_bd_pins hw_4/out_data]
  connect_bd_net -net hw_5_out_data [get_bd_pins c_addsub_2/B] [get_bd_pins hw_5/out_data]
  connect_bd_net -net hw_6_out_data [get_bd_pins c_addsub_3/A] [get_bd_pins hw_6/out_data]
  connect_bd_net -net hw_7_out_data [get_bd_pins c_addsub_3/B] [get_bd_pins hw_7/out_data]
  connect_bd_net -net xlconcat_0_dout [get_bd_ports led] [get_bd_pins BinToBCD16_0/binary] [get_bd_pins xlconcat_0/dout] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din] [get_bd_pins xlslice_2/Din] [get_bd_pins xlslice_3/Din]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins blk_mem_gen_1/addra] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins blk_mem_gen_3/addra] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins blk_mem_gen_2/addra] [get_bd_pins xlconstant_2/dout]
  connect_bd_net -net xlconstant_3_dout [get_bd_pins blk_mem_gen_4/addra] [get_bd_pins xlconstant_3/dout]
  connect_bd_net -net xlconstant_4_dout [get_bd_pins blk_mem_gen_5/addra] [get_bd_pins xlconstant_4/dout]
  connect_bd_net -net xlconstant_5_dout [get_bd_pins blk_mem_gen_6/addra] [get_bd_pins xlconstant_5/dout]
  connect_bd_net -net xlconstant_6_dout [get_bd_pins blk_mem_gen_7/addra] [get_bd_pins xlconstant_6/dout]
  connect_bd_net -net xlconstant_7_dout [get_bd_pins blk_mem_gen_8/addra] [get_bd_pins xlconstant_7/dout]
  connect_bd_net -net xlconstant_8_dout [get_bd_pins xlconcat_0/In1] [get_bd_pins xlconstant_8/dout]
  connect_bd_net -net xlconstant_9_dout [get_bd_pins BinToBCD16_0/request] [get_bd_pins xlconstant_9/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins EightDisplayControl_0/rightR] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins EightDisplayControl_0/near_rightR] [get_bd_pins xlslice_1/Dout]
  connect_bd_net -net xlslice_2_Dout [get_bd_pins EightDisplayControl_0/near_leftR] [get_bd_pins xlslice_2/Dout]
  connect_bd_net -net xlslice_3_Dout [get_bd_pins EightDisplayControl_0/leftR] [get_bd_pins xlslice_3/Dout]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.8
#  -string -flagsOSRD
preplace port clk -pg 1 -y 870 -defaultsOSRD
preplace portBus an -pg 1 -y 1190 -defaultsOSRD
preplace portBus led -pg 1 -y 1500 -defaultsOSRD
preplace portBus seg -pg 1 -y 1210 -defaultsOSRD
preplace inst EightDisplayControl_0 -pg 1 -lvl 5 -y 1200 -defaultsOSRD
preplace inst hw_0 -pg 1 -lvl 1 -y 1130 -defaultsOSRD
preplace inst blk_mem_gen_7 -pg 1 -lvl 2 -y 560 -defaultsOSRD
preplace inst xlslice_0 -pg 1 -lvl 4 -y 1420 -defaultsOSRD
preplace inst hw_1 -pg 1 -lvl 1 -y 1220 -defaultsOSRD
preplace inst blk_mem_gen_8 -pg 1 -lvl 2 -y 860 -defaultsOSRD
preplace inst xlslice_1 -pg 1 -lvl 4 -y 1330 -defaultsOSRD
preplace inst hw_2 -pg 1 -lvl 1 -y 640 -defaultsOSRD
preplace inst xlconstant_0 -pg 1 -lvl 1 -y 1020 -defaultsOSRD
preplace inst xlslice_2 -pg 1 -lvl 4 -y 1240 -defaultsOSRD
preplace inst hw_3 -pg 1 -lvl 1 -y 730 -defaultsOSRD
preplace inst xlconstant_1 -pg 1 -lvl 1 -y 1310 -defaultsOSRD
preplace inst xlslice_3 -pg 1 -lvl 4 -y 1150 -defaultsOSRD
preplace inst hw_4 -pg 1 -lvl 1 -y 180 -defaultsOSRD
preplace inst xlconstant_2 -pg 1 -lvl 1 -y 1490 -defaultsOSRD
preplace inst xlconcat_0 -pg 1 -lvl 5 -y 1500 -defaultsOSRD
preplace inst c_addsub_0 -pg 1 -lvl 2 -y 1190 -defaultsOSRD
preplace inst hw_5 -pg 1 -lvl 1 -y 270 -defaultsOSRD
preplace inst xlconstant_3 -pg 1 -lvl 1 -y 1780 -defaultsOSRD
preplace inst c_addsub_1 -pg 1 -lvl 2 -y 710 -defaultsOSRD
preplace inst hw_6 -pg 1 -lvl 1 -y 1600 -defaultsOSRD
preplace inst xlconstant_4 -pg 1 -lvl 1 -y 70 -defaultsOSRD
preplace inst c_addsub_2 -pg 1 -lvl 2 -y 240 -defaultsOSRD
preplace inst hw_7 -pg 1 -lvl 1 -y 1690 -defaultsOSRD
preplace inst xlconstant_5 -pg 1 -lvl 1 -y 360 -defaultsOSRD
preplace inst blk_mem_gen_1 -pg 1 -lvl 2 -y 1040 -defaultsOSRD
preplace inst BinToBCD16_0 -pg 1 -lvl 4 -y 1010 -defaultsOSRD
preplace inst c_addsub_3 -pg 1 -lvl 2 -y 1660 -defaultsOSRD
preplace inst xlconstant_6 -pg 1 -lvl 1 -y 540 -defaultsOSRD
preplace inst blk_mem_gen_2 -pg 1 -lvl 2 -y 1510 -defaultsOSRD
preplace inst c_addsub_4 -pg 1 -lvl 3 -y 710 -defaultsOSRD
preplace inst xlconstant_7 -pg 1 -lvl 1 -y 820 -defaultsOSRD
preplace inst blk_mem_gen_3 -pg 1 -lvl 2 -y 1340 -defaultsOSRD
preplace inst xlconstant_8 -pg 1 -lvl 4 -y 1510 -defaultsOSRD
preplace inst c_addsub_5 -pg 1 -lvl 3 -y 930 -defaultsOSRD
preplace inst blk_mem_gen_4 -pg 1 -lvl 2 -y 1810 -defaultsOSRD
preplace inst xlconstant_9 -pg 1 -lvl 3 -y 1040 -defaultsOSRD
preplace inst c_addsub_6 -pg 1 -lvl 4 -y 840 -defaultsOSRD
preplace inst blk_mem_gen_5 -pg 1 -lvl 2 -y 90 -defaultsOSRD
preplace inst blk_mem_gen_6 -pg 1 -lvl 2 -y 390 -defaultsOSRD
preplace netloc blk_mem_gen_8_douta 1 0 2 20 880 NJ
preplace netloc xlconstant_5_dout 1 1 1 NJ
preplace netloc xlconstant_1_dout 1 1 1 NJ
preplace netloc xlslice_3_Dout 1 4 1 NJ
preplace netloc xlslice_1_Dout 1 4 1 NJ
preplace netloc BinToBCD16_0_BCD0 1 4 1 1040
preplace netloc c_addsub_5_S 1 3 1 760
preplace netloc hw_7_out_data 1 1 1 NJ
preplace netloc hw_3_out_data 1 1 1 NJ
preplace netloc blk_mem_gen_1_douta 1 0 2 20 1070 NJ
preplace netloc xlconstant_2_dout 1 1 1 NJ
preplace netloc BinToBCD16_0_BCD1 1 4 1 1060
preplace netloc BinToBCD16_0_BCD2 1 4 1 1080
preplace netloc c_addsub_3_S 1 2 1 520
preplace netloc blk_mem_gen_2_douta 1 0 2 20 1440 NJ
preplace netloc BinToBCD16_0_BCD3 1 4 1 1090
preplace netloc xlconstant_8_dout 1 4 1 NJ
preplace netloc c_addsub_1_S 1 2 1 N
preplace netloc hw_6_out_data 1 1 1 NJ
preplace netloc xlconstant_7_dout 1 1 1 NJ
preplace netloc xlconcat_0_dout 1 3 3 760 1570 NJ 1440 1370
preplace netloc hw_2_out_data 1 1 1 NJ
preplace netloc hw_1_out_data 1 1 1 NJ
preplace netloc blk_mem_gen_7_douta 1 0 2 20 490 NJ
preplace netloc xlconstant_0_dout 1 1 1 NJ
preplace netloc clk_1 1 0 5 NJ 870 270 950 510 860 750 1560 1050
preplace netloc xlslice_2_Dout 1 4 1 NJ
preplace netloc xlconstant_9_dout 1 3 1 N
preplace netloc blk_mem_gen_4_douta 1 0 2 20 1830 NJ
preplace netloc blk_mem_gen_6_douta 1 0 2 20 410 NJ
preplace netloc xlconstant_6_dout 1 1 1 NJ
preplace netloc c_addsub_6_S 1 4 1 1070
preplace netloc blk_mem_gen_5_douta 1 0 2 20 20 NJ
preplace netloc blk_mem_gen_3_douta 1 0 2 20 1360 NJ
preplace netloc xlconstant_4_dout 1 1 1 NJ
preplace netloc EightDisplayControl_0_select_display 1 5 1 NJ
preplace netloc hw_4_out_data 1 1 1 NJ
preplace netloc hw_0_out_data 1 1 1 NJ
preplace netloc EightDisplayControl_0_segments 1 5 1 NJ
preplace netloc xlslice_0_Dout 1 4 1 NJ
preplace netloc c_addsub_4_S 1 3 1 750
preplace netloc c_addsub_0_S 1 2 1 500
preplace netloc c_addsub_2_S 1 2 1 500
preplace netloc hw_5_out_data 1 1 1 NJ
preplace netloc xlconstant_3_dout 1 1 1 NJ
levelinfo -pg 1 0 140 390 660 920 1230 1390 -top 0 -bot 1900
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


