`timescale 1ns / 1ps

module DataMemory(
    input wire CLK, 
    input wire WE,
    input wire [31:0] WD,
    input wire [31:0] A,
    output reg [31:0] RD
);

reg[31:0] Memory [31:0];

always@(posedge CLK)
    begin
        if (WE)
            begin
                Memory[A] <= WD;
            end
        RD = Memory[A];
    end
endmodule
