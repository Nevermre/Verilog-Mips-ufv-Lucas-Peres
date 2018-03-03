module ControleALU(funct,ALUOP,funct2);
input [1:0] ALUOP;
input [5:0] funct;
output [2:0] funct2;
reg[2:0] funct2;
always @(*)
begin  


    if(ALUOP==2)
    	begin
    	if(funct==32)funct2=0;   ///add
    	if(funct==34)funct2=1;   //sub
    	if(funct==36)funct2=2;        //and
    	if(funct==37)funct2=3;            //or
 	if(funct==42)funct2=4; //slt
    	end 
   
else if(ALUOP==0)funct2=0;

 
  else  if(funct==4)funct2=1; //beq
   
    	
    	
end

endmodule 
