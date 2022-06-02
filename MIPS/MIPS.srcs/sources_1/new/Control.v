`timescale 1ns / 1ps

module Control(
    input [5:0] OPcode,
    input [5:0] func,
    output wire memtoreg,memwrite,branch,alusrc,regdst,regwrite,jump,
    output wire [2:0] alucontrol
    );
    
wire [1:0] aluop;
ControlDecoder C(OPcode,memtoreg,memwrite,branch,alusrc,regdst,regwrite,jump,aluop);
ALUDecoder A(func,aluop,alucontrol);

endmodule
