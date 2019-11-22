module ALU_tb();

	logic [1:0] ALUControl;
	logic [31:0] SrcA, SrcB, ALUResult;
	logic [3:0] ALUFlags;
	
	ALU DUT(ALUControl, SrcA, SrcB, ALUResult, ALUFlags);
	
	initial begin
		ALUControl = 2'b00; SrcA = 0; SrcB = 0; #10;
		ALUControl = 2'b00; SrcA = 5; SrcB = 7; #10;
		ALUControl = 2'b01; SrcA = 0; SrcB = 0; #10;
		ALUControl = 2'b01; SrcA = 2; SrcB = 3; #10;
		ALUControl = 2'b10; SrcA = 15; SrcB = 0; #10;
		ALUControl = 2'b10; SrcA = 10; SrcB = 0; #10;
		ALUControl = 2'b11; SrcA = 5; SrcB = 13; #10;
		ALUControl = 2'b11; SrcA = 4; SrcB = 3; #10;
	
	end

endmodule
