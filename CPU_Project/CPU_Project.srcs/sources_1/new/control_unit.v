`timescale 1ns / 1ps

module control_unit(
input wire [5:0] OpCode,
output wire MemtoReg, 
output wire MemWrite, 
output wire Branch, 
output wire Jump, 
output wire ALUSrc, 
output wire RegDst, 
output wire RegWrite,
output wire [1:0] ALUOp
);

reg [9:0] ControlSignals;
assign {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, Jump, ALUOp} = ControlSignals;

always@(OpCode) 
begin
    case(OpCode)
        6'b000000: ControlSignals <= 9'b110000010; //RType
        6'b100011: ControlSignals <= 9'b101001000; //LW
        6'b001001: ControlSignals <= 9'b101000000; //li 
        6'b101011: ControlSignals <= 9'b001010000; //SW
        6'b000100: ControlSignals <= 9'b000100001; //BEQ
        6'b001000: ControlSignals <= 9'b101000000; //ADDI
        6'b000010: ControlSignals <= 9'b000000100; //J
        default:   ControlSignals <= 9'bxxxxxxxxx; //illegal op
    endcase
end 
       
endmodule