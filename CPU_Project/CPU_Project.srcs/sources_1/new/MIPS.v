`timescale 1ns / 1ps

module MIPS();
wire [31:0] wPC;
wire [31:0] instr;
wire wMemtoReg, wMemWrite, wBranch, wJump, wALUSrc, wRegDst, wRegWrite;
wire [1:0] wALUOp;
wire [2:0] wALUoperation;
wire [4:0] wM1;
wire [31:0] wRegData1, wRegData2;
wire [31:0] wSignExtendOut;
wire [31:0] wALUresult;
wire [31:0] wM2;
wire [31:0] wReadData;
wire [31:0] wM3;
reg clk;

// Program counter
program_counter PC (.Enable(1'b1), .clk(clk), .PC(wPC));

// PC to Instruction memory
instruction_memory IM (.A(wPC), .RD(instr));

// Instruction memory to CPU
control_unit CU(
	//inputs
    .OpCode(instr[31:26]),
    //outputs  
    .MemtoReg(wMemtoReg), 
    .MemWrite(wMemWrite), 
    .Branch(wBranch), 
    .Jump(wJump), 
    .ALUSrc(wALUSrc), 
    .RegDst(wRegDst), 
    .RegWrite(wRegWrite),
    .ALUOp(wALUOp)  
);

ALU_decoder ALUD(
    //inputs
    .func(instr[5:0]),
    .ALUOp(wALUOp),
    //outputs
    .ALUcontrol(wALUoperation)
);

//MUX between instr and reg
mux_2x1 # (.width(5)) M1 (.OUT(wM1), .A(instr[20:16]), .B(instr[15:11]), .sel(wRegDst));

// Instruction memory to Register
register R (
    //inputs
    .clk(clk),
    .sel_out1(instr[25:21]),
    .sel_out2(instr[20:16]),
    .WE(wRegWrite),
    .sel_input(wM1),    
    .inp(wM3),
    //outputs
    .out1(wRegData1),
    .out2(wRegData2)    
);

// Instruction memory to Sign extend
sign_extend SE (
    .A(instr[15:0]),
    .B(wSignExtendOut)
);

//MUX between reg and ALU
mux_2x1 # (.width(32)) M2 (.OUT(wM2), .A(wRegData2), .B(wSignExtendOut), .sel(wALUSrc));

// ALU operation
ALU A (
    //inputs
    .op1(wRegData1),
    .op2(wM2),
    .OpCode(wALUoperation),
    .Cin(1'b0),
    .clk(clk),
    //outputs
    .result(wALUresult),
    .cflag(wC), 
    .zflag(wZ), 
    .oflag(wO)
);

// Data memory
data_memory DM (
    //inputs
    .clk(clk),
    .A(wALUresult),
    .WD(wRegData2),
    .WE(wMemWrite),
    //outputs
    .RD(wReadData)    
);

//MUX between data memory and ALU
mux_2x1 # (.width(32)) M3 (.OUT(wM3), .A(wALUresult), .B(wReadData), .sel(wMemtoReg));

initial begin
clk = 0;
end

always begin
#50;
clk = ~clk;
end
endmodule