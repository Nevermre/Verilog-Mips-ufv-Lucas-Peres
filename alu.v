module ALU(funct2,in1,in2,result,clk,zero);
input clk;
input [2:0] funct2;
input [31:0] in1;
input [31:0] in2;
output [31:0] result;
output zero;
reg zero;
reg [31:0] result;
 	//A signal that decides whether we write into file (if 1 -> write)

wire [31:0] sum;
wire [31:0] diff;
wire [31:0] product;
wire [31:0] sum_or;

thirtytwobitadder ADD(in1,in2,carryout,sum,1'b0);
thirtytwobitsubtractor SUBTRACT(in1,in2,carry,diff,1'b0);
AND prod(in1,in2,product);
OR orop(in1,in2,sum_or);

always @(*)
begin    

if(diff==0)zero=1;
else zero=0;
   //$monitor("%d  %d  %d   ",in1,in2,result);

        if(funct2==3'b000)	result=sum;
        
        if(funct2==3'b001)
        begin
        	result=diff; 
        
        end
        if(funct2==3'b010)result=product;
        if(funct2==3'b011)result=sum_or;
         if(funct2==3'b100)  
		begin
			if(in1<in2)result=1;
			else result=0;
		end  

end

endmodule
