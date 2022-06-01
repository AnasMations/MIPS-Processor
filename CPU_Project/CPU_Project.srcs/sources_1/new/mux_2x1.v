`timescale 1ns / 1ps


module mux_2x1 #(parameter width = 32) (OUT, A, B, sel);
    input [width-1:0] A, B;
    input sel;
    output reg [width-1:0] OUT;
    
    always @(A or B or sel)
    begin
        OUT = (sel==0)? A : B;
    end
endmodule
