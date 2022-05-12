`timescale 1ns / 1ps

module Program_Counter(PC1, PC2, Clk);
    input [31:0] PC1;
    output reg [31:0] PC2;
    input Clk;
    always @(posedge Clk) 
    begin
        PC2 <= PC1; //Blocking and non-blocking works the same
    end
endmodule