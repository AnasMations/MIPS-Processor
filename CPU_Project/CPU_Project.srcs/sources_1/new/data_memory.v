`timescale 1ns / 1ps

module data_memory(RD, A, WD, WE, clk);
    input [31:0] A, WD;
    input clk, WE;
    output reg [31:0] RD;
    
    reg [31:0] Memo[(2**32)-1:0];
    
    always @(posedge clk) 
    begin
        if(WE == 1) begin
            Memo[A] = WD; 
        end
        
        RD = Memo[A];
    end

endmodule
