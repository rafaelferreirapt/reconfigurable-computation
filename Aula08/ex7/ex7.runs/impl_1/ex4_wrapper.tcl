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
  set_property webtalk.parent_dir /media/psf/Home/Development/ect_ua/reconfigurable-computation/Aula08/ex7/ex7.cache/wt [current_project]
  set_property parent.project_path /media/psf/Home/Development/ect_ua/reconfigurable-computation/Aula08/ex7/ex7.xpr [current_project]
  set_property ip_repo_paths {
  /media/psf/Home/Development/ect_ua/reconfigurable-computation/Aula08/ex7/ex7.cache/ip
  /media/psf/Home/Development/ect_ua/reconfigurable-computation/Aula08/Projects2016/UserDefinedRepository
  /home/cr_user_repository
} [current_project]
  set_property ip_output_repo /media/psf/Home/Development/ect_ua/reconfigurable-computation/Aula08/ex7/ex7.cache/ip [current_project]
  add_files -quiet /media/psf/Home/Development/ect_ua/reconfigurable-computation/Aula08/ex7/ex7.runs/synth_1/ex4_wrapper.dcp
  read_xdc -ref ex4_smart_mux_0_0 -cells U0 /media/psf/Home/Development/ect_ua/reconfigurable-computation/Aula08/ex7/ex7.srcs/sources_1/bd/ex4/ip/ex4_smart_mux_0_0/constrs_1/imports/xdc/Nexys4_Master.xdc
  set_property processing_order EARLY [get_files /media/psf/Home/Development/ect_ua/reconfigurable-computation/Aula08/ex7/ex7.srcs/sources_1/bd/ex4/ip/ex4_smart_mux_0_0/constrs_1/imports/xdc/Nexys4_Master.xdc]
  read_xdc /media/psf/Home/Development/ect_ua/reconfigurable-computation/Aula08/ex7/ex7.srcs/constrs_1/imports/xdc/Nexys4_Master.xdc
  link_design -top ex4_wrapper -part xc7a100tcsg324-1
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
  write_checkpoint -force ex4_wrapper_opt.dcp
  report_drc -file ex4_wrapper_drc_opted.rpt
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
  catch {write_hwdef -file ex4_wrapper.hwdef}
  place_design 
  write_checkpoint -force ex4_wrapper_placed.dcp
  report_io -file ex4_wrapper_io_placed.rpt
  report_utilization -file ex4_wrapper_utilization_placed.rpt -pb ex4_wrapper_utilization_placed.pb
  report_control_sets -verbose -file ex4_wrapper_control_sets_placed.rpt
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
  write_checkpoint -force ex4_wrapper_routed.dcp
  report_drc -file ex4_wrapper_drc_routed.rpt -pb ex4_wrapper_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file ex4_wrapper_timing_summary_routed.rpt -rpx ex4_wrapper_timing_summary_routed.rpx
  report_power -file ex4_wrapper_power_routed.rpt -pb ex4_wrapper_power_summary_routed.pb
  report_route_status -file ex4_wrapper_route_status.rpt -pb ex4_wrapper_route_status.pb
  report_clock_utilization -file ex4_wrapper_clock_utilization_routed.rpt
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
  catch { write_mem_info -force ex4_wrapper.mmi }
  write_bitstream -force ex4_wrapper.bit 
  catch { write_sysdef -hwdef ex4_wrapper.hwdef -bitfile ex4_wrapper.bit -meminfo ex4_wrapper.mmi -file ex4_wrapper.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

