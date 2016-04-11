
################################################################
# This is a generated script based on design: BD_counter_display
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
# source BD_counter_display_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a100tcsg324-1

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name BD_counter_display

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
  set btnL [ create_bd_port -dir I btnL ]
  set clk [ create_bd_port -dir I clk ]
  set seg [ create_bd_port -dir O -from 6 -to 0 seg ]
  set sw [ create_bd_port -dir I -from 15 -to 0 sw ]

  # Create instance: BinToBCD16_0, and set properties
  set BinToBCD16_0 [ create_bd_cell -type ip -vlnv ua.pt:user:BinToBCD16:1.0 BinToBCD16_0 ]

  # Create instance: DC32_0, and set properties
  set DC32_0 [ create_bd_cell -type ip -vlnv ua.pt:user:DC32:1.0 DC32_0 ]

  # Create instance: MyC_0, and set properties
  set MyC_0 [ create_bd_cell -type ip -vlnv ua.pt:user:MyC:1.0 MyC_0 ]

  # Create instance: My_Conc_0, and set properties
  set My_Conc_0 [ create_bd_cell -type ip -vlnv ua.pt:user:My_Conc:1.0 My_Conc_0 ]

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {4} \
CONFIG.IN1_WIDTH {4} \
CONFIG.IN2_WIDTH {4} \
CONFIG.IN3_WIDTH {4} \
CONFIG.IN4_WIDTH {4} \
CONFIG.NUM_PORTS {8} \
 ] $xlconcat_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {4} \
 ] $xlconstant_1

  # Create port connections
  connect_bd_net -net BinToBCD16_0_BCD0 [get_bd_pins BinToBCD16_0/BCD0] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net BinToBCD16_0_BCD1 [get_bd_pins BinToBCD16_0/BCD1] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net BinToBCD16_0_BCD2 [get_bd_pins BinToBCD16_0/BCD2] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net BinToBCD16_0_BCD3 [get_bd_pins BinToBCD16_0/BCD3] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net BinToBCD16_0_BCD4 [get_bd_pins BinToBCD16_0/BCD4] [get_bd_pins xlconcat_0/In4]
  connect_bd_net -net DC32_0_segments [get_bd_ports seg] [get_bd_pins DC32_0/segments]
  connect_bd_net -net DC32_0_select_display [get_bd_ports an] [get_bd_pins DC32_0/select_display]
  connect_bd_net -net MyC_0_data_out [get_bd_pins MyC_0/data_out] [get_bd_pins My_Conc_0/in1]
  connect_bd_net -net My_Conc_0_out32 [get_bd_pins DC32_0/data_in] [get_bd_pins My_Conc_0/out32]
  connect_bd_net -net btnC_1 [get_bd_ports btnC] [get_bd_pins BinToBCD16_0/reset] [get_bd_pins MyC_0/btnC]
  connect_bd_net -net btnL_1 [get_bd_ports btnL] [get_bd_pins My_Conc_0/sel]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins BinToBCD16_0/clk] [get_bd_pins DC32_0/clk] [get_bd_pins MyC_0/clk]
  connect_bd_net -net sw_1 [get_bd_ports sw] [get_bd_pins BinToBCD16_0/binary]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins My_Conc_0/in2] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins BinToBCD16_0/request] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins xlconcat_0/In5] [get_bd_pins xlconcat_0/In6] [get_bd_pins xlconcat_0/In7] [get_bd_pins xlconstant_1/dout]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port btnL -pg 1 -y 350 -defaultsOSRD
preplace port btnC -pg 1 -y 130 -defaultsOSRD
preplace port clk -pg 1 -y 40 -defaultsOSRD
preplace portBus sw -pg 1 -y 150 -defaultsOSRD
preplace portBus an -pg 1 -y 40 -defaultsOSRD
preplace portBus seg -pg 1 -y 60 -defaultsOSRD
preplace inst xlconstant_0 -pg 1 -lvl 1 -y 230 -defaultsOSRD
preplace inst xlconstant_1 -pg 1 -lvl 2 -y 290 -defaultsOSRD
preplace inst xlconcat_0 -pg 1 -lvl 3 -y 220 -defaultsOSRD
preplace inst DC32_0 -pg 1 -lvl 5 -y 50 -defaultsOSRD
preplace inst MyC_0 -pg 1 -lvl 3 -y 470 -defaultsOSRD
preplace inst BinToBCD16_0 -pg 1 -lvl 2 -y 140 -defaultsOSRD
preplace inst My_Conc_0 -pg 1 -lvl 4 -y 330 -defaultsOSRD
preplace netloc xlconstant_1_dout 1 2 1 480
preplace netloc BinToBCD16_0_BCD0 1 2 1 440
preplace netloc My_Conc_0_out32 1 4 1 870
preplace netloc BinToBCD16_0_BCD1 1 2 1 N
preplace netloc BinToBCD16_0_BCD2 1 2 1 430
preplace netloc btnC_1 1 0 3 NJ 130 NJ 20 420
preplace netloc btnL_1 1 0 4 NJ 350 NJ 350 NJ 350 NJ
preplace netloc BinToBCD16_0_BCD3 1 2 1 450
preplace netloc BinToBCD16_0_BCD4 1 2 1 460
preplace netloc MyC_0_data_out 1 3 1 670
preplace netloc xlconcat_0_dout 1 3 1 660
preplace netloc xlconstant_0_dout 1 1 1 NJ
preplace netloc clk_1 1 0 5 NJ 40 170 40 NJ 40 NJ 40 NJ
preplace netloc DC32_0_select_display 1 5 1 NJ
preplace netloc sw_1 1 0 2 NJ 150 NJ
preplace netloc DC32_0_segments 1 5 1 NJ
levelinfo -pg 1 -10 110 320 570 770 1000 1150 -top -180 -bot 530
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

