@echo off
set xv_path=D:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 265f73a1814c4e649f7ce751b2fd564c -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot for_example_behav xil_defaultlib.for_example -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
