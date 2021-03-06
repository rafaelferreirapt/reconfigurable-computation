# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Rodrigo/Projetos Triviais/first_trivial/first_trivial.cache/wt} [current_project]
set_property parent.project_path {Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Rodrigo/Projetos Triviais/first_trivial/first_trivial.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_vhdl -library xil_defaultlib {{Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Rodrigo/Projetos Triviais/first_trivial/first_trivial.srcs/sources_1/new/my.vhd}}
read_xdc Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Rodrigo/Nexys4_Master.xdc
set_property used_in_implementation false [get_files Z:/Desktop/StudyWorkTeam/4ano/2Semestre/CR/Rodrigo/Nexys4_Master.xdc]

synth_design -top my -part xc7a100tcsg324-1
write_checkpoint -noxdef my.dcp
catch { report_utilization -file my_utilization_synth.rpt -pb my_utilization_synth.pb }
