module Register_Bank(input logic Clk, WE3,
							input logic [3:0] A1, A2, A3,
							input logic [31:0] WD3, R15,
							output logic [31:0] RD1, RD2);
							
	logic [31:0] rf[14:0];
	
	always_ff @(negedge Clk)
		if(WE3) rf[A3] <= WD3;
	
	assign RD1 = (A1 == 4'b1111) ? R15 : rf[A1];
	assign RD2 = (A2 == 4'b1111) ? R15 : rf[A2];
	
endmodule
