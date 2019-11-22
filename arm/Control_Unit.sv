module Control_Unit(input logic [3:0] Cond, ALUFlags, Rd,
						  input logic [5:0] Funct,
						  input logic [1:0] Op,
						  input logic Clk, Reset,
						  output logic [1:0] ImmSrc, RegSrc, ALUControl,
						  output logic PCSrc, RegWrite, MemWrite, MemToReg, ALUSrc);
	
	logic PCS, RegW, MemW, NoWrite;
	logic [1:0] FlagW;
	
	Decoder Main_Decoder(Op, Funct, Rd, PCS, RegW, MemW, MemToReg, ALUSrc, NoWrite, ImmSrc, RegSrc, ALUControl, FlagW);
	Conditional_Logic Cond_Logic(Cond, ALUFlags, FlagW, Clk, Reset, PCS, RegW, MemW, NoWrite, PCSrc, RegWrite, MemWrite);
	

endmodule
