module top;


wire [31:0] in2;
wire [4:0] addr3;
wire [31:0] data3;



wire [5:0] opcode;
wire [5:0] funct;
wire [31:0] pc;
wire [31:0] inst;
wire [4:0] rs;
wire [4:0] rt;
wire [4:0] rd;
wire [15:0] addr;
wire [31:0] result;
wire [31:0] Rs;
wire [31:0] Rt;
wire [31:0] out;
wire [31:0] extendaddr;
wire [31:0] newpc;
wire RegDst;
wire [1:0]ALUOP;
clkGen CLK(clk);
PC pc1(pc,fio_pc,clk);
InstructionMemory IM(inst,pc,clk);
Splitter SP(inst,opcode,rs,rt,rd,funct,addr);
     

wire zero;
ALU al(fio_alu,Rs,in2,result,clk,zero);
wire RegWrite;
RegisterFile RF(rs,rt,Rs,Rt,addr3,data3,clk,RegWrite);

DataMemory DM(MemWrite,MemRead,Rt,result,clk,out);

SignExtend SE(addr,extendaddr);  	//inp,oup
Control controle(opcode, RegDst, Branch,  MemRead,  Jump,  MemWrite, ALUsrc, RegWrite,  ALUOP,MemtoReg);
wire desvia;
and1 a(zero,Branch,desvia);

wire [2:0] fio_alu;

ControleALU cont_alu(funct,ALUOP,fio_alu);



mux5 mreg(rt, rd, RegDst,addr3);

wire ALUsrc;
mux32 mreg2( Rt, extendaddr, ALUsrc, in2);

wire MemtoReg;        

mux32 mreg3(result,out, MemtoReg, data3);

wire [31:0] fio_pc; 
wire [31:0] pc2; 
wire [31:0] pce;  
mu2 desv(pc2,pce,desvia,fio_pc);

PC_ALU alpc(pce,pc,extendaddr);	//chksignal to be used for deciding the amount of increment (+1 or +extendaddr)
pc4 pc4(pc,pc2);






initial begin
   	$monitor("pc = %5d inst=%h in1 = %5d in2 = %5d result = %5d time=%5d",pc,inst,Rs,in2,result,$time);

	#42
	$finish;


	end

endmodule

