`timescale 1ns / 1ps

module InstructionMemory(
    input CLK,
    input [31:0] Address,
    output reg [31:0] Instr
    );
    
reg [31:0] ROM [0:2147483648];

initial 
    begin
        ROM[0] = 32'b00100000000100000000000000000101; //addi $s0 $zero 0x5
        ROM[1] = 32'b00100000000100010000000000000011; //addi $s1 $zero 0x3
        ROM[2] = 32'b00000010000100011001000000100000; //add $s2 $s0 $s1
    end
    
always @(posedge CLK)
    begin
        Instr <= ROM[Address];
    end
    
endmodule
