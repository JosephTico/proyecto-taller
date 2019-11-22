module Control_Unit_tb();

	logic [3:0] Cond, ALUFlags, Rd, FlagsReg;
	logic [5:0] Funct;
	logic [1:0] Op, ImmSrc, RegSrc, ALUControl, FlagRegWrite;
	logic PCSrc, RegWrite, MemWrite, MemToReg, ALUSrc, Clk, Reset, CondEx;
	
	logic [1:0] FlagW;
	logic PCS, RegW, MemW, NoWrite;

	Control_Unit DUT(Cond, ALUFlags, Rd, Funct, Op, Clk, Reset, ImmSrc, RegSrc, ALUControl, PCSrc, RegWrite, MemWrite, MemToReg, ALUSrc);
	Decoder DUT1(Op, Funct, Rd, PCS, RegW, MemW, MemToReg, ALUSrc, NoWrite, ImmSrc, RegSrc, ALUControl, FlagW);
	Conditional_Logic DUT2(Cond, ALUFlags, FlagW, Clk, Reset, PCS, RegW, MemW, NoWrite, FlagsReg, FlagRegWrite, PCSrc, RegWrite, MemWrite, CondEx);
	

	initial begin
		//NZCV = 1100
		//ANDS Rd5 #Imm
		Cond = 14; ALUFlags = 12; Rd = 5; Funct = 6'b100001; Op = 0; Clk = 1; Reset = 0; #10;
		//AND
		Cond = 14; ALUFlags = 12; Rd = 5; Funct = 6'b100000; Op = 0; Clk = 0; Reset = 0; #10;
		//ANDEQ Rd5 #Imm
		Cond = 0; ALUFlags = 7; Rd = 5; Funct = 6'b100000; Op = 0; Clk = 1; Reset = 0; #10;
		//Cond = 0; ALUFlags = 7; Rd = 5; Funct = 6'b100000; Op = 0; Clk = 0; Reset = 0; #10;
		
		//ANDS
		//Cond = 0; ALUFlags = 12; Rd = 5; Funct = 6'b100001; Op = 0; Clk = 1; Reset = 0; #10;
		//Cond = 0; ALUFlags = 12; Rd = 5; Funct = 6'b100001; Op = 0; Clk = 0; Reset = 0; #10;
		//Cond = 0; ALUFlags = 12; Rd = 5; Funct = 6'b100001; Op = 0; Clk = 1; Reset = 0; #10;		

	end


endmodule
