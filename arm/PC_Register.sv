module PC_Register(input logic clk,reset,
						 input logic [31:0] PCP,
						 output logic [31:0] PC);

	always_ff @(posedge clk)
		begin
			if(reset)
				PC <= 0;
			else
				PC <= PCP;
		end
		
endmodule
