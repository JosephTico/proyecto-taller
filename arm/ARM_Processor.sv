module ARM_Processor(input logic Clk, Reset,
							input logic [31:0] Instr, ReadData,
							output logic [31:0] PC, WriteData, ALUResult,
							output logic MemWrite);
	
	logic RegWrite, ALUSrc, MemToReg, PCSrc;
	logic [1:0] RegSrc, ImmSrc, ALUControl;
	logic [3:0] ALUFlags;
	
	
	Datapath Path(Clk, Reset, RegWrite, ALUSrc, MemToReg, PCSrc, RegSrc, ImmSrc, ALUControl, Instr, ReadData, ALUFlags, PC, ALUResult, WriteData);
	
	Control_Unit Control(Instr[31:28], ALUFlags, Instr[15:12], Instr[25:20], Instr[27:26], Clk, Reset, ImmSrc, RegSrc, ALUControl, PCSrc, RegWrite, MemWrite, MemToReg, ALUSrc);
	

	
endmodule
						

	
	