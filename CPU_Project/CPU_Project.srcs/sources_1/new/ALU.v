//Arithmatic Logic Unit
module ALU(
input [31:0] op1,
input [31:0] op2,
input [2:0] OpCode,
input Cin,
output reg [31:0] result,
output reg cflag, 
output reg zflag, 
output reg oflag,
input clk
);

wire [32:0] wAnd;
anding ann(op1, op2, wAnd);
wire [32:0] wOr;
oring orr(op1, op2, wOr);
wire [32:0] wAdd;
addition a(op1, op2, Cin, wAdd);
wire [32:0] wSub;
subtraction s(op1, op2, Cin, wSub);

reg [32:0] temp;

always @(posedge clk)
begin
    case(OpCode)
    3'b000:temp = wAnd;
    3'b001:temp = wOr;
    3'b010:temp = wAdd;
    3'b110:temp = wSub;
    endcase
    
    result = {temp[31:0]};
    cflag = temp[32] ? 1'b1 : 1'b0;
    zflag = result ? 1'b0 : 1'b1;
    oflag = 1'b0; 
    
    if(op1[31]==op2[31] && (OpCode==3'b010 || OpCode==3'b110)) begin
        oflag = (result[31]==~op1[31]) ? 1'b1 : 1'b0; 
    end
    
end 
endmodule