@echo off
set xv_path=A:\\Downloads\\Applications\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim instruction_memory_tb_behav -key {Behavioral:sim_1:Functional:instruction_memory_tb} -tclbatch instruction_memory_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
