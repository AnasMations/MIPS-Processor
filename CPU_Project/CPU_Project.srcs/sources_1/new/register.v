`timescale 1ns / 1ps

module register(
input [31:0] inp, //WD: 32-bit input value
input [4:0] sel_input, //S3: 5-bit selector of input
input [4:0] sel_out1, //S1: 5-bit selector of first output
input [4:0] sel_out2, //S2: 5-bit selector of second output
input WE, //Write enable
input clk, //Clk: Clock (make the register work at the positive edge of the clock)
output reg [31:0] out1, //RD1: 32-bit first output
output reg [31:0] out2 //RD2: 32-bit second output
    );

reg [31:0] regFiles [0:31];

integer i;
initial begin
    for(i=0; i<32;i=i+1) begin
        regFiles[i] = 32'b0;
    end
end

always@(posedge clk) begin

    out1 = regFiles[sel_out1];
    out2 = regFiles[sel_out2];
    
    if(WE) begin //Write 
        regFiles[sel_input] = inp;
    end
end

endmodule

/*
module register_tb();
reg [31:0] inp;
reg [4:0] sel_input;
reg [4:0] sel_out1;
reg [4:0] sel_out2;
reg WE;
reg clk;
wire [31:0] out1;
wire [31:0] out2;

register r(inp, sel_input, sel_out1, sel_out2, WE, clk, out1, out2);

initial begin
//Initialize everything with 0
inp = 'h0;
sel_input = 2'b0;
sel_out1 = 2'b0;
sel_out2 = 2'b0;
WE = 1'b0;
clk = 1'b0;
#100;

//Store input b in register[0]
WE = 1'b1;
inp = 'hb;
sel_input = 2'b00;
#100;

//Store input 8 in register[1]
inp = 'h8;
sel_input = 2'b01;
#100;

//Read value stored in register[0] and register[1]
WE = 1'b0;
sel_out1 = 2'b00;
sel_out2 = 2'b01;
end

always begin
#10
clk = ~clk;
end
endmodule
*/