module PC(pc,in,clk);
//input [6:0] in;
input [31:0] in;  //Converted to 32 bit
input clk;
//output [6:0] pc;
output [31:0] pc;
//reg [6:0] pc;
reg [31:0] pc;

initial begin
	pc=32'b00000000000000000000000000000000;
end

always @(negedge clk)
begin
	pc = in;
end

endmodule


module PC_ALU(newpc,pc,extendaddr);
input [31:0] pc;
input [31:0] extendaddr;


output [31:0] newpc;
reg [31:0] newpc;

reg [31:0] aux;
always @(*)
	begin
	if(extendaddr [31:31]==1)
	begin
	aux=~extendaddr;
	
	newpc = (pc-aux);
	end
	if(extendaddr [31:31]==0)newpc = (pc+1+(extendaddr));

end



endmodule

module pc4(pc,pc1);
  input [31:0] pc;
output [31:0] pc1;
      assign pc1 = (pc+1); 
      

 endmodule
