`timescale 1ns / 1ps

module instruction_memory(A, RD);
    input [31:0] A;
    output wire [31:0] RD;
    
    reg [31:0] Instr [0:2147483648];
     
    // Storing random values in memory for testing
    initial begin
        Instr[0] = 'ha;
        Instr[1] = 'hb;
        Instr[2] = 'hc;
        Instr[3] = 'hd;
     end    
     
     assign RD = Instr[A];
    
endmodule


module instruction_memory_tb();
reg [31:0] A;
wire [31:0] RD;

instruction_memory test(A, RD);

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