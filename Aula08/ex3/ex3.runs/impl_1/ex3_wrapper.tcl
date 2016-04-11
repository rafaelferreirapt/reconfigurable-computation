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
  set_property webtalk.parent_dir Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Aula08/ex3/ex3.cache/wt [current_project]
  set_property parent.project_path Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Aula08/ex3/ex3.xpr [current_project]
  set_property ip_repo_paths {
  z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Aula08/ex3/ex3.cache/ip
  Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Aula08/Projects2016/UserDefinedRepository
} [current_project]
  set_property ip_output_repo z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Aula08/ex3/ex3.cache/ip [current_project]
  add_files -quiet Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Aula08/ex3/ex3.runs/synth_1/ex3_wrapper.dcp
  read_xdc Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Aula08/ex1/ex1.srcs/constrs_1/imports/Rodrigo/Nexys4_Master.xdc
  link_design -top ex3_wrapper -part xc7a100tcsg324-1
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
  write_checkpoint -force ex3_wrapper_opt.dcp
  report_drc -file ex3_wrapper_drc_opted.rpt
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
  catch {write_hwdef -file ex3_wrapper.hwdef}
  place_design 
  write_checkpoint -force ex3_wrapper_placed.dcp
  report_io -file ex3_wrapper_io_placed.rpt
  report_utilization -file ex3_wrapper_utilization_placed.rpt -pb ex3_wrapper_utilization_placed.pb
  report_control_sets -verbose -file ex3_wrapper_control_sets_placed.rpt
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
  write_checkpoint -force ex3_wrapper_routed.dcp
  report_drc -file ex3_wrapper_drc_routed.rpt -pb ex3_wrapper_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file ex3_wrapper_timing_summary_routed.rpt -rpx ex3_wrapper_timing_summary_routed.rpx
  report_power -file ex3_wrapper_power_routed.rpt -pb ex3_wrapper_power_summary_routed.pb
  report_route_status -file ex3_wrapper_route_status.rpt -pb ex3_wrapper_route_status.pb
  report_clock_utilization -file ex3_wrapper_clock_utilization_routed.rpt
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
  catch { write_mem_info -force ex3_wrapper.mmi }
  write_bitstream -force ex3_wrapper.bit 
  catch { write_sysdef -hwdef ex3_wrapper.hwdef -bitfile ex3_wrapper.bit -meminfo ex3_wrapper.mmi -file ex3_wrapper.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

