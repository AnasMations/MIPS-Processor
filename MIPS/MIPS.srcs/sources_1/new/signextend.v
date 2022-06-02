`timescale 1ns / 1ps

module signextend(
    input wire[15:0] A,
    output wire [31:0] B
    );
    
assign B = {{16{A[15]}},A};
endmodule
