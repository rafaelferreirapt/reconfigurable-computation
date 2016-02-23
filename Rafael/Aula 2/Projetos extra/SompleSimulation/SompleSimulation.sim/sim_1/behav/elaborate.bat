@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 15b979657b5f4e508b03c4f304b4b6a2 -m64 --debug typical --relax --mt 2 -L work -L secureip --snapshot for_example_behav work.for_example -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
