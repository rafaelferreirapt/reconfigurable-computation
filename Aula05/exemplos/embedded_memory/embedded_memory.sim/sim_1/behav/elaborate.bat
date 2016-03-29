@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto 608928ec5efa421ba410f612b13597d2 -m64 --debug typical --relax -L work -L secureip --snapshot IGCD_sim_behav work.IGCD_sim -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
