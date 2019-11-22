module Datapath(input logic Clk, Reset, RegWrite, ALUSrc, MemToReg, PCSrc,
					 input logic [1:0] RegSrc, ImmSrc, ALUControl,
					 input logic [31:0] Instr, ReadData,
					 output logic [3:0] ALUFlags,
					 output logic [31:0] PC, ALUResult, WriteData);
	
	logic [31:0] PCP, PCP4, PCP8, Result, ExtImm, SrcB, SrcA;
	logic [3:0] RA1, RA2, RD1, RD2;

	
	//pc plus 4
	Plus4 PCPlus4(PC, PCP4);
	
	//pc plus 8
	Plus4 PCPlus8(PCP4, PCP8);
	
	//pc mux
	MUX_2_To_1 #(32) PCMux(PCSrc, PCP4, Result, PCP);
	
	//pc register 
	PC_Register PCReg(Clk, Reset, PCP, PC);
	
	//mux RA1
	MUX_2_To_1 #(4) RA1Mux(RegSrc[0], Instr[19:16], 4'b1111, RA1);
	
	//mux RA2
	MUX_2_To_1 #(4) RA2Mux(RegSrc[1], Instr[3:0], Instr[15:12], RA2);
	
	//extend
	Extend Ext(ImmSrc, Instr[23:0], ExtImm);
	
	//mux SrcB
	MUX_2_To_1 #(32) SrcBMux(ALUSrc, WriteData, ExtImm, SrcB);
	
	//ALU
	ALU alu(ALUControl, SrcA, SrcB, ALUResult, ALUFlags);
	
	//mux to memory
	MUX_2_To_1 #(32) ResultMux(MemToReg, ALUResult, ReadData, Result);
	
	//register bank
	Register_Bank RegBank(Clk, RegWrite, RA1, RA2, Instr[15:12], Result, PCP8, SrcA, WriteData);
	
	
endmodule
