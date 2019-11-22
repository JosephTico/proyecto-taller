module Conditional_Logic_tb();
	
	logic [3:0] Cond, ALUFlags;
	logic [1:0] FlagW;
	logic clk, reset, PCS, RegW, MemW, NoWrite, PCSrc, RegWrite, MemWrite;
	
	Conditional_Logic DUT(Cond, ALUFlags, FlagW, clk, reset, PCS, RegW, MemW, NoWrite, PCSrc, RegWrite, MemWrite);
	
	initial begin
	//equal
	Cond = 0; ALUFlags = 0; RegW = 1; MemW = 0; FlagW = 0; PCS = 1; NoWrite = 0; clk = 1; reset = 0; #10;
	Cond = 0; ALUFlags = 1; RegW = 1; MemW = 0; FlagW = 0; PCS = 1; NoWrite = 0; clk = 0; reset = 0; #10;
	Cond = 0; ALUFlags = 2; RegW = 1; MemW = 0; FlagW = 0; PCS = 1; NoWrite = 0; clk = 1; reset = 0; #10;
	Cond = 0; ALUFlags = 3; RegW = 1; MemW = 0; FlagW = 0; PCS = 1; NoWrite = 0; clk = 0; reset = 0; #10;
	Cond = 0; ALUFlags = 4; RegW = 1; MemW = 0; FlagW = 1; PCS = 1; NoWrite = 0; clk = 1; reset = 0; #10;
	Cond = 0; ALUFlags = 5; RegW = 1; MemW = 0; FlagW = 1; PCS = 1; NoWrite = 0; clk = 0; reset = 0; #10;
	Cond = 0; ALUFlags = 6; RegW = 1; MemW = 0; FlagW = 1; PCS = 1; NoWrite = 0; clk = 1; reset = 0; #10;
	Cond = 0; ALUFlags = 7; RegW = 1; MemW = 0; FlagW = 1; PCS = 1; NoWrite = 0; clk = 0; reset = 0; #10;
	Cond = 0; ALUFlags = 8; RegW = 0; MemW = 1; FlagW = 2; PCS = 0; NoWrite = 1; clk = 1; reset = 0; #10;
	Cond = 0; ALUFlags = 9; RegW = 0; MemW = 1; FlagW = 2; PCS = 0; NoWrite = 1; clk = 0; reset = 0; #10;
	Cond = 0; ALUFlags = 10; RegW = 0; MemW = 1; FlagW = 2; PCS = 0; NoWrite = 1; clk = 1; reset = 0; #10;
	Cond = 0; ALUFlags = 11; RegW = 0; MemW = 1; FlagW = 2; PCS = 0; NoWrite = 1; clk = 0; reset = 0; #10;
	Cond = 0; ALUFlags = 12; RegW = 0; MemW = 1; FlagW = 3; PCS = 0; NoWrite = 1; clk = 1; reset = 0; #10;
	Cond = 0; ALUFlags = 13; RegW = 0; MemW = 1; FlagW = 3; PCS = 0; NoWrite = 1; clk = 0; reset = 0; #10;
	Cond = 0; ALUFlags = 14; RegW = 0; MemW = 1; FlagW = 3; PCS = 0; NoWrite = 1; clk = 1; reset = 0; #10;
	Cond = 0; ALUFlags = 15; RegW = 0; MemW = 1; FlagW = 3; PCS = 0; NoWrite = 1; clk = 0; reset = 0; #10;
	
	//GT
	Cond = 12; ALUFlags = 0; RegW = 1; MemW = 0; FlagW = 0; PCS = 1; NoWrite = 0; clk = 1; reset = 0; #10;
	Cond = 12; ALUFlags = 1; RegW = 1; MemW = 0; FlagW = 0; PCS = 1; NoWrite = 0; clk = 0; reset = 0; #10;
	Cond = 12; ALUFlags = 2; RegW = 1; MemW = 0; FlagW = 0; PCS = 1; NoWrite = 0; clk = 1; reset = 0; #10;
	Cond = 12; ALUFlags = 3; RegW = 1; MemW = 0; FlagW = 0; PCS = 1; NoWrite = 0; clk = 0; reset = 0; #10;
	Cond = 12; ALUFlags = 4; RegW = 1; MemW = 0; FlagW = 1; PCS = 1; NoWrite = 0; clk = 1; reset = 0; #10;
	Cond = 12; ALUFlags = 5; RegW = 1; MemW = 0; FlagW = 1; PCS = 1; NoWrite = 0; clk = 0; reset = 0; #10;
	Cond = 12; ALUFlags = 6; RegW = 1; MemW = 0; FlagW = 1; PCS = 1; NoWrite = 0; clk = 1; reset = 0; #10;
	Cond = 12; ALUFlags = 7; RegW = 1; MemW = 0; FlagW = 1; PCS = 1; NoWrite = 0; clk = 0; reset = 0; #10;
	Cond = 12; ALUFlags = 8; RegW = 0; MemW = 1; FlagW = 2; PCS = 0; NoWrite = 1; clk = 1; reset = 0; #10;
	Cond = 12; ALUFlags = 9; RegW = 0; MemW = 1; FlagW = 2; PCS = 0; NoWrite = 1; clk = 0; reset = 0; #10;
	Cond = 12; ALUFlags = 10; RegW = 0; MemW = 1; FlagW = 2; PCS = 0; NoWrite = 1; clk = 1; reset = 0; #10;
	Cond = 12; ALUFlags = 11; RegW = 0; MemW = 1; FlagW = 2; PCS = 0; NoWrite = 1; clk = 0; reset = 0; #10;
	Cond = 12; ALUFlags = 12; RegW = 0; MemW = 1; FlagW = 3; PCS = 0; NoWrite = 1; clk = 1; reset = 0; #10;
	Cond = 12; ALUFlags = 13; RegW = 0; MemW = 1; FlagW = 3; PCS = 0; NoWrite = 1; clk = 0; reset = 0; #10;
	Cond = 12; ALUFlags = 14; RegW = 0; MemW = 1; FlagW = 3; PCS = 0; NoWrite = 1; clk = 1; reset = 0; #10;
	Cond = 12; ALUFlags = 15; RegW = 0; MemW = 1; FlagW = 3; PCS = 0; NoWrite = 1; clk = 0; reset = 0; #10;
	
	end
endmodule
