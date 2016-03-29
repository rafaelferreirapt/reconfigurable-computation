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
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir Y:/Development/ect_ua/reconfigurable-computation/Aula05/exercicio54/exercicio54.cache/wt [current_project]
  set_property parent.project_path Y:/Development/ect_ua/reconfigurable-computation/Aula05/exercicio54/exercicio54.xpr [current_project]
  set_property ip_repo_paths y:/Development/ect_ua/reconfigurable-computation/Aula05/exercicio54/exercicio54.cache/ip [current_project]
  set_property ip_output_repo y:/Development/ect_ua/reconfigurable-computation/Aula05/exercicio54/exercicio54.cache/ip [current_project]
  add_files -quiet Y:/Development/ect_ua/reconfigurable-computation/Aula05/exercicio54/exercicio54.runs/synth_1/Ex54_aula5.dcp
  add_files -quiet Y:/Development/ect_ua/reconfigurable-computation/Aula05/exercicio54/exercicio54.runs/dist_mem_gen_0_synth_1/dist_mem_gen_0.dcp
  set_property netlist_only true [get_files Y:/Development/ect_ua/reconfigurable-computation/Aula05/exercicio54/exercicio54.runs/dist_mem_gen_0_synth_1/dist_mem_gen_0.dcp]
  read_xdc -mode out_of_context -ref dist_mem_gen_0 -cells U0 y:/Development/ect_ua/reconfigurable-computation/Aula05/exercicio54/exercicio54.srcs/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0_ooc.xdc
  set_property processing_order EARLY [get_files y:/Development/ect_ua/reconfigurable-computation/Aula05/exercicio54/exercicio54.srcs/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0_ooc.xdc]
  read_xdc Y:/Development/ect_ua/reconfigurable-computation/Aula05/exercicio54/exercicio54.srcs/constrs_1/imports/xdc/Nexys4_Master.xdc
  link_design -top Ex54_aula5 -part xc7a100tcsg324-3
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
  write_checkpoint -force Ex54_aula5_opt.dcp
  report_drc -file Ex54_aula5_drc_opted.rpt
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
  catch {write_hwdef -file Ex54_aula5.hwdef}
  place_design 
  write_checkpoint -force Ex54_aula5_placed.dcp
  report_io -file Ex54_aula5_io_placed.rpt
  report_utilization -file Ex54_aula5_utilization_placed.rpt -pb Ex54_aula5_utilization_placed.pb
  report_control_sets -verbose -file Ex54_aula5_control_sets_placed.rpt
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
  write_checkpoint -force Ex54_aula5_routed.dcp
  report_drc -file Ex54_aula5_drc_routed.rpt -pb Ex54_aula5_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file Ex54_aula5_timing_summary_routed.rpt -rpx Ex54_aula5_timing_summary_routed.rpx
  report_power -file Ex54_aula5_power_routed.rpt -pb Ex54_aula5_power_summary_routed.pb
  report_route_status -file Ex54_aula5_route_status.rpt -pb Ex54_aula5_route_status.pb
  report_clock_utilization -file Ex54_aula5_clock_utilization_routed.rpt
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
  catch { write_mem_info -force Ex54_aula5.mmi }
  write_bitstream -force Ex54_aula5.bit 
  catch { write_sysdef -hwdef Ex54_aula5.hwdef -bitfile Ex54_aula5.bit -meminfo Ex54_aula5.mmi -file Ex54_aula5.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}
