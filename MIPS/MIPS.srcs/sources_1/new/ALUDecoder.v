`timescale 1ns / 1ps

module ALUDecoder(
    input wire [5:0] func,
    input wire [1:0] aluop,
    output reg [2:0] alucontrol
    );
    
always@(*)
    begin
        case(aluop)
            2'b00: alucontrol <= 3'b010; //add for lw/sw/addi
            2'b01: alucontrol <= 3'b110; //sub for beq
        default:
            case(func) //RType instr
                6'b100000: alucontrol<= 3'b010; //add
                6'b100010: alucontrol<= 3'b110; //sub
                6'b100100: alucontrol<= 3'b000; //and
                6'b100101: alucontrol<= 3'b001; //or
                default: alucontrol <= 3'bxxx;
            endcase
        endcase
    end
endmodule
