# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-3

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.cache/wt [current_project]
set_property parent.project_path K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.xpr [current_project]
set_property default_lib work [current_project]
set_property target_language VHDL [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_ip K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1.xci
set_property used_in_implementation false [get_files -all k:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1.dcp]
set_property is_locked true [get_files K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1.xci]

synth_design -top blk_mem_gen_1 -part xc7a100tcsg324-3 -mode out_of_context
rename_ref -prefix_all blk_mem_gen_1_
write_checkpoint -noxdef blk_mem_gen_1.dcp
catch { report_utilization -file blk_mem_gen_1_utilization_synth.rpt -pb blk_mem_gen_1_utilization_synth.pb }
if { [catch {
  write_verilog -force -mode synth_stub K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}
if { [catch {
  write_vhdl -force -mode synth_stub K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}
if { [catch {
  write_verilog -force -mode funcsim K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}
if { [catch {
  write_vhdl -force -mode funcsim K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}
add_files K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1_stub.v -of_objects [get_files K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1.xci]
add_files K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1_stub.vhdl -of_objects [get_files K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1.xci]
add_files K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1_sim_netlist.v -of_objects [get_files K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1.xci]
add_files K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1_sim_netlist.vhdl -of_objects [get_files K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1.xci]
add_files K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1.dcp -of_objects [get_files K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1.xci]

if {[file isdir K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.ip_user_files/ip/blk_mem_gen_1]} {
  catch { 
    file copy -force K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1_sim_netlist.v K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.ip_user_files/ip/blk_mem_gen_1
  }
}

if {[file isdir K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.ip_user_files/ip/blk_mem_gen_1]} {
  catch { 
    file copy -force K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1_sim_netlist.vhdl K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.ip_user_files/ip/blk_mem_gen_1
  }
}

if {[file isdir K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.ip_user_files/ip/blk_mem_gen_1]} {
  catch { 
    file copy -force K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1_stub.v K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.ip_user_files/ip/blk_mem_gen_1
  }
}

if {[file isdir K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.ip_user_files/ip/blk_mem_gen_1]} {
  catch { 
    file copy -force K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1_stub.vhdl K:/MostFrequentlyNeeded___2014/Education2011/2015_2016/SecondSemester/CR/AulasTeoricas/Aula7_4April2016/Exemplos2016/ROM_multiplier/ROM_multiplier.ip_user_files/ip/blk_mem_gen_1
  }
}
