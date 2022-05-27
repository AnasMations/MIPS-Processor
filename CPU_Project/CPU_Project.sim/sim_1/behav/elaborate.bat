@echo off
set xv_path=A:\\Downloads\\Applications\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto fa3af2a67d7a482ea249b8e79fe7e766 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot MIPS_behav xil_defaultlib.MIPS xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
