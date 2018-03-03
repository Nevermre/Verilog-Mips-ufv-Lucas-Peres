module Control(input [5:0] opcode,output RegDst, output Branch, output MemRead, output Jump, output MemWrite, output ALUsrc,output RegWrite, output [1:0]ALUOP,output MemtoReg);


reg RegDst,Branch,MemRead,MemtoReg, MemWrite,Jump,ALUsrc,RegWrite,Mem;
reg [1:0]ALUOP;


always @(*)
begin

        if(opcode==6'b000000) 
        begin
               RegDst<=1;
               Branch<=0;
               MemRead<=0;
               MemtoReg<=0;
               ALUOP<=2; 
               MemWrite<=0;
               ALUsrc<=0;
               RegWrite<=1; 
             
	
        end

        if(opcode==6'b100011)         //
        begin

	 		 RegDst<=0;
               Branch<=0;
               MemRead<=1;
               MemtoReg<=1;
               ALUOP<=0; 
               MemWrite<=0;
               ALUsrc<=1;
               RegWrite<=1; 
        end

        if(opcode==6'b101011)     //sw
        begin

	 			 RegDst<=0;
               Branch<=0;
               MemRead<=0;
               MemtoReg<=0;
               ALUOP<=0; 
               MemWrite<=1;
               ALUsrc<=1;
               RegWrite<=0; 

        end
        if(opcode==6'b000100)//beq
        begin
			  RegDst<=0;
               Branch<=1;
               MemRead<=0;
               MemtoReg<=0;
               ALUOP<=1; 
               MemWrite<=0;
               ALUsrc<=0;
               RegWrite<=0; 
               
            

        end

end                                                    
endmodule