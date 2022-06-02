@echo off
set xv_path=A:\\Downloads\\Applications\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 695d555af1b0463fa0b1bd0b892a438e -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot MIPS_behav xil_defaultlib.MIPS xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
