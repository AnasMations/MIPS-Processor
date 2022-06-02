//Full adder
module FullAdder(input A, B, Bin, output Res, Bout);
assign Res = (A^B)^Bin;
assign Bout = ((A^B) & Bin) | (A & B);
endmodule

//Addition module
module addition(
input [31:0] op1,
input [31:0] op2,
input Cin,
output [32:0] result
);
wire [32:0] carry;
assign carry[0]=Cin;
genvar i;
generate
    for (i=0; i<=31; i=i+1) begin
        FullAdder FA(op1[i], op2[i], carry[i], result[i], carry[i+1]);
    end 
endgenerate
assign result[32]=carry[32];
endmodule

//Full Subtractor
module FullSubtractor(input A, B, Bin, output Res, Bout);
assign Res = A^B^Bin;
assign Bout = ~A & (B^Bin) | B & Bin;
endmodule

//subtraction module
module subtraction(
input [31:0] op1,
input [31:0] op2,
input Cin,
output [32:0] result
);
wire [32:0] carry;
assign carry[0]=Cin;
genvar i;
generate
    for (i=0; i<=31; i=i+1) begin
        FullSubtractor FS(op1[i], op2[i], carry[i], result[i], carry[i+1]);
    end 
endgenerate
assign result[32]=carry[32];
endmodule

//and module
module anding(
input [31:0] op1,
input [31:0] op2,
output [32:0] result
);
genvar i;
generate
    for (i=0; i<=31; i=i+1) begin
        assign result[i] = op1[i] & op2[i];
    end 
endgenerate
assign result[32]=0;
endmodule

//or module
module oring(
input [31:0] op1,
input [31:0] op2,
output [32:0] result
);
genvar i;
generate
    for (i=0; i<=31; i=i+1) begin
        assign result[i] = op1[i] | op2[i];
    end 
endgenerate
assign result[32]=1'b0;
endmodule