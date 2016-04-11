proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.cache/wt [current_project]
  set_property parent.project_path K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.xpr [current_project]
  set_property ip_repo_paths k:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.cache/ip [current_project]
  set_property ip_output_repo k:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.cache/ip [current_project]
  add_files -quiet K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/synth_1/Multiplier_ROM.dcp
  add_files -quiet K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1.dcp
  set_property netlist_only true [get_files K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1.dcp]
  add_files -quiet K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/dist_mem_gen_0_synth_1/dist_mem_gen_0.dcp
  set_property netlist_only true [get_files K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/dist_mem_gen_0_synth_1/dist_mem_gen_0.dcp]
  add_files -quiet K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_0_synth_1/blk_mem_gen_0.dcp
  set_property netlist_only true [get_files K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_0_synth_1/blk_mem_gen_0.dcp]
  read_xdc -mode out_of_context -ref blk_mem_gen_1 k:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_ooc.xdc
  set_property processing_order EARLY [get_files k:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_ooc.xdc]
  read_xdc -mode out_of_context -ref dist_mem_gen_0 -cells U0 k:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.srcs/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0_ooc.xdc
  set_property processing_order EARLY [get_files k:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.srcs/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_gen_0 -cells U0 k:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc
  set_property processing_order EARLY [get_files k:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc]
  read_xdc K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.srcs/constrs_1/new/Nex4.xdc
  link_design -top Multiplier_ROM -part xc7a100tcsg324-3
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force Multiplier_ROM_opt.dcp
  report_drc -file Multiplier_ROM_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file Multiplier_ROM.hwdef}
  place_design 
  write_checkpoint -force Multiplier_ROM_placed.dcp
  report_io -file Multiplier_ROM_io_placed.rpt
  report_utilization -file Multiplier_ROM_utilization_placed.rpt -pb Multiplier_ROM_utilization_placed.pb
  report_control_sets -verbose -file Multiplier_ROM_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Multiplier_ROM_routed.dcp
  report_drc -file Multiplier_ROM_drc_routed.rpt -pb Multiplier_ROM_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file Multiplier_ROM_timing_summary_routed.rpt -rpx Multiplier_ROM_timing_summary_routed.rpx
  report_power -file Multiplier_ROM_power_routed.rpt -pb Multiplier_ROM_power_summary_routed.pb
  report_route_status -file Multiplier_ROM_route_status.rpt -pb Multiplier_ROM_route_status.pb
  report_clock_utilization -file Multiplier_ROM_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force Multiplier_ROM.mmi }
  write_bitstream -force Multiplier_ROM.bit 
  catch { write_sysdef -hwdef Multiplier_ROM.hwdef -bitfile Multiplier_ROM.bit -meminfo Multiplier_ROM.mmi -file Multiplier_ROM.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

