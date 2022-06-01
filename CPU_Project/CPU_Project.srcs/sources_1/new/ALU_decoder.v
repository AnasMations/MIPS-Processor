`timescale 1ns / 1ps

module ALU_decoder(
input wire [5:0] func,
input wire [1:0] ALUOp,
output reg [2:0] ALUcontrol
);

always@(*)
    begin
        case(ALUOp)
            2'b00: ALUcontrol <= 3'b000; //add for lw/sw/addi
            2'b01: ALUcontrol <= 3'b010; //sub for beq
        default:
            case(func) //RType instr
                6'b100000: ALUcontrol<= 3'b000; //add
                6'b100010: ALUcontrol<= 3'b010; //sub
                6'b100100: ALUcontrol<= 3'b100; //and
                6'b100101: ALUcontrol<= 3'b101; //or
                default: ALUcontrol <= 3'bxxx;
            endcase
        endcase
    end

endmodule
