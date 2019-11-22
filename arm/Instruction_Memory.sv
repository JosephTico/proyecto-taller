module Instruction_Memory(input logic [31:0] A,
								  output logic [31:0] RD);
								  
	logic [31:0] RAM[80:0];
	
	initial
		$readmemh("instructions.dat", RAM);
	
	assign RD = RAM[A[31:2]];
	
endmodule
