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
  set_param gui.test TreeTableDev
  debug::add_scope template.lib 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir I:/SDR_P/1/SynSym/SynSym.cache/wt [current_project]
  set_property parent.project_path I:/SDR_P/1/SynSym/SynSym.xpr [current_project]
  set_property ip_repo_paths i:/SDR_P/1/SynSym/SynSym.cache/ip [current_project]
  set_property ip_output_repo i:/SDR_P/1/SynSym/SynSym.cache/ip [current_project]
  add_files -quiet I:/SDR_P/1/SynSym/SynSym.runs/synth_1/Counter.dcp
  read_xdc I:/SDR_P/1/SynSym/SynSym.srcs/constrs_1/imports/new/SDR_const.xdc
  link_design -top Counter -part xc7a100tcsg324-3
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
  write_checkpoint -force Counter_opt.dcp
  catch {report_drc -file Counter_drc_opted.rpt}
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
  place_design 
  write_checkpoint -force Counter_placed.dcp
  catch { report_io -file Counter_io_placed.rpt }
  catch { report_clock_utilization -file Counter_clock_utilization_placed.rpt }
  catch { report_utilization -file Counter_utilization_placed.rpt -pb Counter_utilization_placed.pb }
  catch { report_control_sets -verbose -file Counter_control_sets_placed.rpt }
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
  write_checkpoint -force Counter_routed.dcp
  catch { report_drc -file Counter_drc_routed.rpt -pb Counter_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file Counter_timing_summary_routed.rpt -rpx Counter_timing_summary_routed.rpx }
  catch { report_power -file Counter_power_routed.rpt -pb Counter_power_summary_routed.pb }
  catch { report_route_status -file Counter_route_status.rpt -pb Counter_route_status.pb }
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
  write_bitstream -force Counter.bit 
  if { [file exists I:/SDR_P/1/SynSym/SynSym.runs/synth_1/Counter.hwdef] } {
    catch { write_sysdef -hwdef I:/SDR_P/1/SynSym/SynSym.runs/synth_1/Counter.hwdef -bitfile Counter.bit -meminfo Counter.mmi -file Counter.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

