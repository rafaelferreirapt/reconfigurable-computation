@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 46b5a8de90af4686b9a4c717536e6d21 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot ex2_behav xil_defaultlib.ex2 -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
