module SignExtend(in,out);
input [15:0] in;
output [31:0] out;
reg  [31:0] out;

	always @(*)
	begin
	
	 out[15:0] = in[15:0];

	if(in[15:15]==1)out= 32'hffff0000+in;
	if(in[15:15]==0)out = 32'h00000000+in;
	end

endmodule

//module SignExtendShift(in,out);
//input [15:0] in;
//output [31:0] out;

//        assign out[31:16] = in[15];
//        assign out[15:0] = in[15:0];

//	assign out = out << 2;


//endmodule


