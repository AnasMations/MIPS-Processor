`timescale 1ns / 1ps

module MIPS();
wire [31:0] wPC;
reg [31:0] wPCPlus;
wire [31:0] instr;
reg clk;

//assign wPC = 32'b00000000000000000000000000000000;

// Program counter
program_counter PC (.PC0(wPC), .PC1(wPCPlus), .clk(clk));
assign wPC = wPCPlus;

// PC to Instruction memory
instruction_memory IM (.A(wPCPlus), .RD(instr));

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

// Increment PC
//ALU PC_add_one(.op1(wPCPlus), .op2(32'b00000000000000000000000000000001), .OpCode(3'b010), .Cin(1'b0), .result(wPCPlus), .cflag(wC), .zflag(wZ), .oflag(wO), .clk(clk));

initial begin
clk = 0;
end

always begin
#50;
clk = ~clk;
end
endmodule
