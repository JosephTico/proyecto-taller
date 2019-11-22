module ARM(input logic Clk, Reset,
			  output logic [31:0] WriteData, DataAdr,
			  output logic MemWrite,
			  input logic [7:0] peripheralsIn,
			  output logic [7:0] peripheralsOut);
			  
	logic [31:0] PC, Instr, ReadData;

	ARM_Processor ARMP(Clk, Reset, Instr, ReadData, PC, WriteData, DataAdr, MemWrite);
	
	//instruction memory
	Instruction_Memory InstrMem(PC, Instr);
	
	//data memory
	Data_Memory DataMem(Clk, Reset, MemWrite, DataAdr, WriteData, ReadData, peripheralsIn, peripheralsOut);

endmodule
	
