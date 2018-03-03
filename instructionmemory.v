module InstructionMemory(inst,pc,clk);
input clk;
input [31:0] pc;
output [31:0] inst;
reg [31:0] inst;

reg [31:0] memdata [127:0];

initial
        begin
        //128 memdatas to be added here, each of 32 bits, but for sake of simplicity, only added 7 memdatas

      
		memdata[0] <= 32'h8c060000; // add r1,r1,r1
		memdata[1] <= 32'h8c050001;
		memdata[2] <= 32'h00661820;
		memdata[3] <= 32'h00a12822; // add r1,r1,r1
		memdata[4] <= 32'h0005102a; // add r1,r1,r1
		memdata[5] <= 32'h1022fffc; // add r1,r1,r1
		memdata[6] <= 32'hac630000; // lw r1,0(r0)
		memdata[16] <= 0; // add r1,r1,r1
		memdata[17] <= 0; // sw r1,0(r0)
		memdata[7] <= 0; // add r1,r1,r1
		memdata[8] <= 0; // slt r2, r15, r1
		memdata[9] <= 0; // beq r2,r0, -3
		memdata[10] <= 0; // beq r2,r0, -3
		memdata[11] <= 0;
		memdata[12] <= 0;
		memdata[13] <= 0;
		memdata[14] <= 0;
		memdata[15] <= 0;
        //memdata[7] = 32'b00000000000000010001000000100000;
        //memdata[8] = 32'b00000000000000010001000000100000;
        //memdata[9] = 32'b00000000000000010001000000100000;

        end

always @(posedge clk)
        begin
		
                inst = memdata[pc];
        end

endmodule

