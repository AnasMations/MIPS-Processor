`timescale 1ns / 1ps

module MIPS();
wire [31:0] wPC, wPCPlus;
wire [31:0] instr;
reg clk;

assign wPC = 32'b00000000000000000000000000000000;

// Program counter
program_counter PC (.PC0(wPC), .PC1(wPCPlus), .clk(clk));

// PC to Instruction memory
instruction_memory IM (.A(wPCPlus), .RD(instr));

// Instruction memory to CPU

// Instruction memory to Register

// Instruction memory to Sign extend

// ALU operation

// Data memory

// Increment PC
ALU PC_add_one(.op1(wPC), .op2(32'b00000000000000000000000000000001), .OpCode(3'b010), .Cin(1'b0), .result(wPCPlus), .cflag(wC), .zflag(wZ), .oflag(wO), .clk(clk));

initial begin
clk = 1;
end

always begin
#50;
clk = ~clk;
end
endmodule
