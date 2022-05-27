`timescale 1ns / 1ps


module mux_2x1 #(parameter width = 32) (OUT, A, B, S);
    input [width-1:0] A, B;
    input S;
    output reg [width-1:0] OUT;
    
    always @(A or B or S)
    begin
        OUT = (S==0)? A : B;
    end
endmodule
