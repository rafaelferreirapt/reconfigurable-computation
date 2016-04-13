
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
  set seg [ create_bd_port -dir O -from 6 -to 0 seg ]

  # Create instance: EightDisplayControl_0, and set properties
  set EightDisplayControl_0 [ create_bd_cell -type ip -vlnv ua.pt:user:EightDisplayControl:1.0 EightDisplayControl_0 ]

  # Create instance: Max_circuit_0, and set properties
  set Max_circuit_0 [ create_bd_cell -type ip -vlnv ua.pt:user:Max_circuit:1.0 Max_circuit_0 ]

  # Create instance: Min_circuit_0, and set properties
  set Min_circuit_0 [ create_bd_cell -type ip -vlnv ua.pt:user:Min_circuit:1.0 Min_circuit_0 ]

  # Create instance: ROM_Reader1_0, and set properties
  set ROM_Reader1_0 [ create_bd_cell -type ip -vlnv user.org:user:ROM_Reader1:1.0 ROM_Reader1_0 ]
  set_property -dict [ list \
CONFIG.address_bits {5} \
CONFIG.data_width {16} \
 ] $ROM_Reader1_0

  # Create instance: blk_mem_gen_1, and set properties
  set blk_mem_gen_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_1 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Coe_File {../../../../../../../Projects2016/32words_16bits.coe} \
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
CONFIG.Write_Depth_A {32} \
CONFIG.Write_Width_A {16} \
CONFIG.Write_Width_B {16} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_1

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
CONFIG.DIN_FROM {15} \
CONFIG.DIN_TO {12} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {4} \
 ] $xlslice_4

  # Create instance: xlslice_5, and set properties
  set xlslice_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_5 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {11} \
CONFIG.DIN_TO {8} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {4} \
 ] $xlslice_5

  # Create instance: xlslice_6, and set properties
  set xlslice_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_6 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {7} \
CONFIG.DIN_TO {4} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {4} \
 ] $xlslice_6

  # Create instance: xlslice_7, and set properties
  set xlslice_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_7 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {3} \
CONFIG.DIN_TO {0} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {4} \
 ] $xlslice_7

  # Create port connections
  connect_bd_net -net EightDisplayControl_0_segments [get_bd_ports seg] [get_bd_pins EightDisplayControl_0/segments]
  connect_bd_net -net EightDisplayControl_0_select_display [get_bd_ports an] [get_bd_pins EightDisplayControl_0/select_display]
  connect_bd_net -net Max_circuit_0_max_value [get_bd_pins Max_circuit_0/max_value] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din] [get_bd_pins xlslice_2/Din] [get_bd_pins xlslice_3/Din]
  connect_bd_net -net Min_circuit_0_max_value [get_bd_pins Min_circuit_0/max_value] [get_bd_pins xlslice_4/Din] [get_bd_pins xlslice_5/Din] [get_bd_pins xlslice_6/Din] [get_bd_pins xlslice_7/Din]
  connect_bd_net -net ROM_Reader1_0_addr [get_bd_pins ROM_Reader1_0/addr] [get_bd_pins blk_mem_gen_1/addra]
  connect_bd_net -net ROM_Reader1_0_data_out [get_bd_pins Max_circuit_0/data_in] [get_bd_pins Min_circuit_0/data_in] [get_bd_pins ROM_Reader1_0/data_out]
  connect_bd_net -net blk_mem_gen_1_douta [get_bd_pins ROM_Reader1_0/data_in] [get_bd_pins blk_mem_gen_1/douta]
  connect_bd_net -net btnC_1 [get_bd_ports btnC] [get_bd_pins ROM_Reader1_0/rst]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins EightDisplayControl_0/clk] [get_bd_pins ROM_Reader1_0/clk] [get_bd_pins blk_mem_gen_1/clka]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins EightDisplayControl_0/rightL] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins EightDisplayControl_0/near_rightL] [get_bd_pins xlslice_1/Dout]
  connect_bd_net -net xlslice_2_Dout [get_bd_pins EightDisplayControl_0/near_leftL] [get_bd_pins xlslice_2/Dout]
  connect_bd_net -net xlslice_3_Dout [get_bd_pins EightDisplayControl_0/leftL] [get_bd_pins xlslice_3/Dout]
  connect_bd_net -net xlslice_4_Dout [get_bd_pins EightDisplayControl_0/leftR] [get_bd_pins xlslice_4/Dout]
  connect_bd_net -net xlslice_5_Dout [get_bd_pins EightDisplayControl_0/near_leftR] [get_bd_pins xlslice_5/Dout]
  connect_bd_net -net xlslice_6_Dout [get_bd_pins EightDisplayControl_0/near_rightR] [get_bd_pins xlslice_6/Dout]
  connect_bd_net -net xlslice_7_Dout [get_bd_pins EightDisplayControl_0/rightR] [get_bd_pins xlslice_7/Dout]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.8
#  -string -flagsOSRD
preplace port btnC -pg 1 -y 90 -defaultsOSRD
preplace port clk -pg 1 -y 50 -defaultsOSRD
preplace portBus an -pg 1 -y 710 -defaultsOSRD
preplace portBus seg -pg 1 -y 730 -defaultsOSRD
preplace inst Min_circuit_0 -pg 1 -lvl 2 -y 350 -defaultsOSRD
preplace inst ROM_Reader1_0 -pg 1 -lvl 1 -y 70 -defaultsOSRD
preplace inst EightDisplayControl_0 -pg 1 -lvl 4 -y 720 -defaultsOSRD
preplace inst xlslice_0 -pg 1 -lvl 3 -y 720 -defaultsOSRD
preplace inst xlslice_1 -pg 1 -lvl 3 -y 630 -defaultsOSRD
preplace inst xlslice_2 -pg 1 -lvl 3 -y 540 -defaultsOSRD
preplace inst xlslice_3 -pg 1 -lvl 3 -y 450 -defaultsOSRD
preplace inst xlslice_4 -pg 1 -lvl 3 -y 810 -defaultsOSRD
preplace inst xlslice_5 -pg 1 -lvl 3 -y 900 -defaultsOSRD
preplace inst xlslice_6 -pg 1 -lvl 3 -y 990 -defaultsOSRD
preplace inst blk_mem_gen_1 -pg 1 -lvl 2 -y 130 -defaultsOSRD
preplace inst xlslice_7 -pg 1 -lvl 3 -y 1080 -defaultsOSRD
preplace inst Max_circuit_0 -pg 1 -lvl 2 -y 260 -defaultsOSRD
preplace netloc xlslice_4_Dout 1 3 1 NJ
preplace netloc Min_circuit_0_max_value 1 2 1 570
preplace netloc xlslice_3_Dout 1 3 1 NJ
preplace netloc xlslice_1_Dout 1 3 1 NJ
preplace netloc blk_mem_gen_1_douta 1 0 2 30 150 NJ
preplace netloc xlslice_5_Dout 1 3 1 NJ
preplace netloc xlslice_7_Dout 1 3 1 NJ
preplace netloc btnC_1 1 0 1 NJ
preplace netloc Max_circuit_0_max_value 1 2 1 580
preplace netloc clk_1 1 0 4 20 140 300 40 NJ 40 810
preplace netloc xlslice_2_Dout 1 3 1 NJ
preplace netloc ROM_Reader1_0_addr 1 1 1 310
preplace netloc ROM_Reader1_0_data_out 1 1 1 290
preplace netloc EightDisplayControl_0_select_display 1 4 1 NJ
preplace netloc EightDisplayControl_0_segments 1 4 1 NJ
preplace netloc xlslice_6_Dout 1 3 1 NJ
preplace netloc xlslice_0_Dout 1 3 1 NJ
levelinfo -pg 1 0 160 440 680 950 1110 -top 0 -bot 1130
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


