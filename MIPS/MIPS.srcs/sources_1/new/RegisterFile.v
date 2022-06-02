`timescale 1ns / 1ps

module RegisterFile(
    input wire CLK,
    input wire WE3,
    input wire [4:0] RA1,
    input wire[4:0] RA2,
    input wire[4:0] WA3,
    input wire[31:0] WD3,
    output [31:0] RD1,
    output [31:0] RD2
    );

reg [31:0] regFiles [0:31];

integer i;
initial 
begin
    for(i=0;i<32;i=i+1)
        begin
         regFiles[i]=32'b0;
        end
end

assign RD1 = regFiles[RA1];
assign RD2 = regFiles[RA2];

always@(posedge CLK) 
    begin
        if(WE3) begin //Write 
            regFiles[WA3] = WD3;
        end
    end
endmodule
