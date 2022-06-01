`timescale 1ns / 1ps

module program_counter(Enable, clk, PC);
    input Enable;
    input clk;
    output [31:0] PC;
    
    reg [31:0] Counter;
    
    //ALU add_one(.op1(PC0), .op2('b1), .OpCode(4'b1001), .Cin(0), .result(PC1), .cflag, .zflag, .oflag, .clk(clk));
    initial begin
        Counter = 32'b0;
    end
    
    always @(posedge clk) 
    begin
        Counter <= Counter + 32'b1;;
    end
       
    assign PC = Counter;
    
endmodule

/*
module program_counter_tb();
reg [31:0] PC0;
reg clk;
wire [31:0] PC1;

program_counter PC(PC0, PC1, clk);

initial begin
clk = 1'b0;

PC0 = 'd0;
#100;

PC0 = 'd1;
#100;

PC0 = 'd2;
#100;

PC0 = 'd3;
#100;

PC0 = 'd4;
#100;
end

always begin
#10
clk = ~clk;
end
endmodule
*/