`timescale 1ns / 1ps

module MIPS();
wire [31:0] wPC;
wire [31:0] instr;
reg clk;

// Program counter
program_counter PC (.Enable(1'b1), .clk(clk), .PC(wPC));

// PC to Instruction memory
instruction_memory IM (.A(wPC), .RD(instr));

// Instruction memory to CPU
/*control_unit CU(
	//inputs
    .Opcode(instr[31:26]),
    //outputs
    .RegDst(RegDst),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .MemtoReg(MemtoReg),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .Branch(Branch),
    .ALUOp(ALUOp)    
);

// Instruction memory to Register
register R (
    //inputs
    .clk(clk),
    .sel_out1(instr[25:21]),
    .sel_out2(instr[20:16]),
    .WE(),
    .sel_input(),    
    .inp(),
    //outputs
    .out1(),
    .out2()    
);
*/
// Instruction memory to Sign extend

// ALU operation

// Data memory

initial begin
clk = 0;
end

always begin
#50;
clk = ~clk;
end
endmodule
