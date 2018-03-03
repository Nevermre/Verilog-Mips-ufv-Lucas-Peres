module mu2(in0, in1, sel,out);
input [31:0] in0;
input [31:0] in1;
input sel;
output [31:0] out;

assign out = (sel)? in1:in0;
 /*      
always @(*)
begin
//$monitor("%d %d %d",in0,in1,out);
end*/
endmodule
