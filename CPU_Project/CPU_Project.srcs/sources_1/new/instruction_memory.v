`timescale 1ns / 1ps

module instruction_memory(A, RD);
    input [31:0] A;
    output wire [31:0] RD;
    
    reg [31:0] Instr [0:2147483648];
     
    // Instructions
    initial begin
    
        // Test0
        /*
        Instr[0] = 32'b00100000000100000000000000000001; //addi $s0 $zero 0x1
        Instr[1] = 32'b00100000000100010000000000000011; //addi $s1 $zero 0x3
        Instr[2] = 32'b00000010000100011001000000100101; //or $s2 $s0 $s1
        */

        // Test 1
        Instr[0] = 32'b00100000000100000000000000000001; //addi $s0, $zero, 0x1
        Instr[1] = 32'b00100000000100010000000000000011; //addi $s1, $zero, 0x3
        Instr[2] = 32'b00000010001100001001000000100000; //or $s2, $s1, $s0

        /*
        // Test 5
        Instr[0] = 32'b00100000000100000000000000010000; //addi $s0, $zero, 0x10
        Instr[1] = 32'b00100000000100010000000000000001; //addi $s1, $zero, 0x1
        Instr[2] = 32'b00000010000100011001000000100000; //add $s2, $s0, $s1
        */
        
     end    
     
     assign RD = Instr[A];
    
endmodule

/*
module instruction_memory_tb();
reg [31:0] A;
wire [31:0] RD;

instruction_memory test(.A(A), .RD(RD));

initial begin
A = 'd0;
#100;

A = 'd1;
#100;

A = 'd2;
#100;

A = 'd3;
#100;
end
endmodule
*/