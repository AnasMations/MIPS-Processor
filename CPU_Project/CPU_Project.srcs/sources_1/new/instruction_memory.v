`timescale 1ns / 1ps

module instruction_memory(RD, A);
    input [31:0] A;
    output wire [31:0] RD;
    reg [7:0] Instr[2147483648:0]; 
    // Just for inserting first instruction for testing
    initial begin
        Instr[0] = 8'b00000010;
        Instr[1] = 8'b00110010;
        Instr[2] = 8'b10111000;
        Instr[3] = 8'b00100001;
     end    
     assign RD = {Instr[A], Instr[A+1], Instr[A+2], Instr[A+3]};
    
endmodule