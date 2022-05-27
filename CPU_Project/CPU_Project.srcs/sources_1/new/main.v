`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// University: Nile University
// Engineers: Anas Sayed, Ahmed Taha, Adel Samir, Pasant
// 
// Create Date: 03/25/2022 08:00:07 AM
// Project Name: CPU
// 
//////////////////////////////////////////////////////////////////////////////////

module ALU_tb();
reg [31:0] op1;
reg [31:0] op2;
reg [3:0] OpCode;
reg Cin;

wire [31:0] result;
wire cflag, zflag, oflag;

reg clk;

ALU test(op1, op2, OpCode, Cin, result, cflag, zflag, oflag, clk);

initial begin
    clk=1'b0; //clock start

    //test case 1 (Or)
    op1=32'b00110011001100110011001100110011;
    op2=32'b11001100110011001100110011001100;
    OpCode=4'b1111;
    Cin=1'b0;
    #100;
    
    //test case 2 (And)
    op1=32'b00110011001100110011001100110011;
    op2=32'b11001100110011001100110011001100;
    OpCode=4'b0000;
    Cin=1'b0;
    #100;
    
    //test case 3 (Addition)
    op1=32'b00000000000000001111111111111111;
    op2=32'b00000000000000000000000000000001;
    OpCode=4'b1001;
    Cin=1'b1;
    #100;
    
    //test case 4 (Subtraction)
    op1=32'b00000000000000000000000000001000;
    op2=32'b00000000000000000000000000000001;
    OpCode=4'b0110;
    Cin=1'b0;
    #100;
    
    //test case 5 (Addition)
    op1=32'b11110000111100001111000011110001;
    op2=32'b00001111000011110000111100001111;
    OpCode=4'b1001;
    Cin=1'b0;
    #100;
    
    //test case 6 (Subtraction)
    op1=32'b00110011001100110011001100110011;
    op2=32'b01001100110011001100110011001100;
    OpCode=4'b0110;
    Cin=1'b1;
    #100;
end

always begin
#1;
clk = ~clk;
end
endmodule