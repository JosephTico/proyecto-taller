module PC_Register_tb();
	logic clk, reset;
	logic [31:0] PCP, PC;
	
	PC_Register DUT(clk,reset,PCP,PC);
	
	initial begin
	
		clk = 1; reset = 0; PCP = 15; #10;
		clk = 0; reset = 0; PCP = 10; #10;
		clk = 1; reset = 0; PCP = 10; #10;
		clk = 0; reset = 0; PCP = 15; #10;
		clk = 1; reset = 0; PCP = 12; #10;
	end
	
endmodule
