`timescale 1ns / 1ps


module control_unit(MemtoReg, MemWrite, Branch, Jump, ALUControl, ALUSrc, RegDst, RegWrite, Op, Funct);
    output wire MemtoReg, MemWrite, Branch, Jump, ALUSrc, RegDst, RegWrite;
    output wire [2:0]ALUControl;
    input [5:0] Op, Funct;
    reg [9:0]ControlSignals;
    assign {MemtoReg, MemWrite, Branch, Jump, ALUControl, ALUSrc, RegDst, RegWrite} = ControlSignals;
    
    always@(Op, Funct)
    begin
        if (Op == 6'b000000) begin
            case(Funct)
            6'b100000 | 6'b100001 : ControlSignals <= 10'b0000010011; //ADD
            6'b100010 | 6'b100011 : ControlSignals <= 10'b0000110011; //SUBTRACT
            6'b100100 : ControlSignals <= 10'b0000000011;             //AND
            6'b100101 : ControlSignals <= 10'b0000001011;             //OR
            endcase
        end
        else if (Op == 6'b100011) begin                        //LW
            ControlSignals <= 10'b1000010101;
        end
        else if (Op == 6'b101011) begin                        //SW 
            ControlSignals <= 10'b1100010100;       
        end
        else if (Op == 6'b000010) begin                        //JUMP to Target
            ControlSignals <= 10'b1001010100;       
        end
        else if (Op == 6'b000010) begin                        //Branch
            ControlSignals <= 10'b1010110000;       
        end
    end 
       
endmodule
