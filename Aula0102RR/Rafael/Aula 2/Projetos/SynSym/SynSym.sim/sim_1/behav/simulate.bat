@echo off
set xv_path=C:\\Xilinx\\Vivado\\Vivado\\2014.4\\bin
call %xv_path%/xsim for_example_behav -key {Behavioral:sim_1:Functional:for_example} -tclbatch for_example.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
