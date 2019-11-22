module Extend_tb();
	logic [1:0] ImmSrc;
	logic [23:0] Instr;
	logic [31:0] ExtImm;
	
	Extend DUT(ImmSrc, Instr, ExtImm);
	
	initial begin
		Instr = 24'hABCD; ImmSrc = 00; #10;
		Instr = 24'hABCD; ImmSrc = 01; #10;
		Instr = 24'hABCD; ImmSrc = 10; #10;
	end
	
endmodule
