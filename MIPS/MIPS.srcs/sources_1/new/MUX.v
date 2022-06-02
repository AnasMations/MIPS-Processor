`timescale 1ns / 1ps

module MUX #(parameter DATA_WIDTH = 32)
(
    input [DATA_WIDTH:0]A,
    input [DATA_WIDTH:0]B,
    input sel,
    output reg [DATA_WIDTH:0]out
);
    
always@(*)
begin
    case(sel)
        0: out <= A;
        1: out <= B;
    endcase
end

endmodule
