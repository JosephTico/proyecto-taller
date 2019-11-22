module ALU_Decoder_tb();
	
	logic ALUOp, NoWrite;
	logic [4:0] Funct;
	logic [1:0] FlagW, ALUControl;

	ALU_Decoder DUT(ALUOp,Funct,NoWrite, FlagW, ALUControl);
	
	initial begin
		ALUOp = 0; Funct = 5'b10000; #10;
		ALUOp = 1; Funct = 5'b01000; #10;
		ALUOp = 1; Funct = 5'b01001; #10;
		ALUOp = 1; Funct = 5'b00100; #10;
		ALUOp = 1; Funct = 5'b00101; #10;
		ALUOp = 1; Funct = 5'b00000; #10;
		ALUOp = 1; Funct = 5'b00001; #10;
		ALUOp = 1; Funct = 5'b11000; #10;
		ALUOp = 1; Funct = 5'b11001; #10;
		ALUOp = 1; Funct = 5'b11110; #10;
	end
	

endmodule
