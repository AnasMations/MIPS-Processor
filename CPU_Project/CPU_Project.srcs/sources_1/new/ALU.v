//Arithmatic Logic Unit
module ALU(
input [31:0] op1,
input [31:0] op2,
input [3:0] OpCode,
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
    4'b0000:temp = wAnd;
    4'b1111:temp = wOr;
    4'b1001:temp = wAdd;
    4'b0110:temp = wSub;
    endcase
    
    result = {temp[31:0]};
    cflag = temp[32] ? 1'b1 : 1'b0;
    zflag = result ? 1'b0 : 1'b1;
    oflag = 1'b0; 
    
    if(op1[31]==op2[31] && (OpCode==4'b1001 || OpCode==4'b0110)) begin
        oflag = (result[31]==~op1[31]) ? 1'b1 : 1'b0; 
    end
    
end 
endmodule