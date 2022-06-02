`timescale 1ns / 1ps

module MIPS( );
    reg CLK; //Clock cycles
    reg reset; //To reset the PC with 0 in the first Cycle
    wire [31:0] PCin; //PC input
    wire [31:0] PCout; //PC output
    wire [31:0] instruction; //Current instruction
    wire memtoreg,memwrite,branch,alusrc,regdst,regwrite,jump; //Control signals
    wire [2:0] alucontrol; //ALU OpCode + - & |
    wire [4:0] WriteReg; //Address of the Reg that we will write in
    wire[31:0] WriteDataReg; //Data we will write in address 'WriteReg'
    wire[31:0] ReadData1; //Data of Reg 1
    wire[31:0] ReadData2; //Data of Reg 2
    wire[31:0] SignExtend; //Sign extended constant
    wire[31:0] ALU_B; //(ReadData2 or SignExtend) Output data of mux between RegFiles and ALU
    wire[31:0] ALUOut; //ALU result
    wire cflag, zflag, oflag; //ALU flags
    wire [31:0] ReadData; //Output data of data memory
    
//Program Counter
ProgramCounter pc(
    //inputs
    .CLK(CLK),
    .reset(reset), //To reset PCout at first cycle
    .PCin(PCin),
    //outputs
    .PCout(PCout)
);

//Instruction Memory
InstructionMemory instrmem(
    //inputs
    .CLK(CLK),
    .Address(PCout),
    //outputs
    .Instr(instruction)
);

//Control Unit
Control Controller
( 
    //inputs
    .OPcode(instruction[31:26]),
    .func(instruction[5:0]),
    //outputs
    .memtoreg(memtoreg),
    .memwrite(memwrite),
    .branch(branch),
    .alusrc(alusrc),
    .regdst(regdst),
    .regwrite(regwrite),
    .jump(jump),
    .alucontrol(alucontrol)
);


//MUX between instr and reg
MUX mux1
(
    .A(instruction[20:16]),
    .B(instruction[15:11]),
    .sel(regdst),
    .out(WriteReg)
);

//Register File
RegisterFile regfile
(
    //inputs
    .CLK(CLK),
    .WE3(regwrite),
    .RA1(instruction[25:21]),
    .RA2(instruction[20:16]),
    .WA3(WriteReg),
    .WD3(WriteDataReg),
    //outputs
    .RD1(ReadData1),
    .RD2(ReadData2)
);

//Sign Extend
signextend sign_extend
(
    //inputs
    .A(instruction[15:0]),
    //outputs
    .B(SignExtend)
);

//MUX between reg and ALU
MUX #(.DATA_WIDTH(31)) mux2
(
    .A(ReadData2),
    .B(SignExtend),
    .sel(alusrc),
    .out(ALU_B)
);

//ALU
ALU mainALU
(
    //inputs
    .op1(ReadData1),
    .op2(ALU_B),
    .OpCode(alucontrol),
    .Cin(1'b0),
    //outputs
    .result(ALUOut),
    .cflag(cflag),
    .zflag(zflag),
    .oflag(oflag)
);

//DataMemory
DataMemory datamemory
(
    //inputs
     .CLK(CLK),
     .WE(memwrite),
     .WD(ReadData2),
     .A(ALUOut),
    //outputs
    .RD(ReadData)
);

//MUX after DataMemory
MUX #(.DATA_WIDTH(31)) mux4
(
    .A(ALUOut),
    .B(ReadData),
    .sel(memtoreg),
    .out(WriteDataReg)
);

assign PCin = PCout;

initial
begin
    CLK = 0;
    reset = 1;
    #50 
    reset = 0;
    #50
    CLK = 1;
    forever #50 CLK = ~CLK;
end  

endmodule
