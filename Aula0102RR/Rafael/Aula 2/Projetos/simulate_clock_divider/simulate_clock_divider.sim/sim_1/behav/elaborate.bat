@echo off
set xv_path=C:\\Xilinx\\Vivado\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto 70f034ac9ad240df86f3507ef6f9a632 -m64 --debug typical --relax -L xil_defaultlib -L secureip --snapshot testbench_behav xil_defaultlib.testbench -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
