module Decoder_tb();

	logic [1:0] Op, ImmSrc, RegSrc, ALUControl, FlagW;
	logic [5:0] Funct;
	logic [3:0] Rd;
	logic PCS, RegW, MemW, MemToReg, ALUSrc, NoWrite;

	Decoder DUT(Op, Funct, Rd, PCS, RegW, MemW, MemToReg, ALUSrc, NoWrite, ImmSrc, RegSrc, ALUControl, FlagW);
	
	initial begin
		//DP Reg
		Op = 2'b00; Funct = 6'b000000; Rd = 4'b0000; #10;
		//DP Imm
		Op = 2'b00; Funct = 6'b100000; Rd = 4'b0000; #10;
		//STR
		Op = 2'b01; Funct = 6'b000000; Rd = 4'b0000; #10;
		//LDR
		Op = 2'b01; Funct = 6'b000001; Rd = 4'b0000; #10;
		//Branch
		Op = 2'b10; Funct = 6'b000000; Rd = 4'b0000; #10;
		//STR with rd = 15
		Op = 2'b01; Funct = 6'b000000; Rd = 4'b1111; #10;
	end
	

endmodule
