module PCPlus4(input logic [31:0] PC,
					output logic [31:0] PCP);
	always_comb
		PCP = PC + 4;

endmodule
