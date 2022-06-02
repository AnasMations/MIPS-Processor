`timescale 1ns / 1ps

module ProgramCounter(
    input CLK,
    input reset,
    input [31:0] PCin,
    output reg [31:0] PCout
    );
    
always @(posedge CLK, posedge reset)
    begin
        if(reset)
            PCout <= 0;
        else
            PCout <= PCout + 1;
    end
endmodule
