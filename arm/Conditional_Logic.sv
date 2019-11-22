module Conditional_Logic(input logic [3:0] Cond, ALUFlags,
								 input logic [1:0] FlagW,
								 input logic Clk, Reset, PCS, RegW, MemW, NoWrite,
								 output logic PCSrc, RegWrite, MemWrite);
								 
								 
	//NZCV
	
	logic [3:0] Flags = 4'b0000;
	logic [1:0] FlagWrite;
	logic CondEx;

	//Condition checking
	assign PCSrc = PCS & CondEx;
	assign RegWrite = (RegW) & (CondEx) & (~NoWrite);
	assign MemWrite = MemW & CondEx;
	assign FlagWrite = FlagW & {2{CondEx}};

	logic N, Z, C, V;
	assign {N, Z, C, V} = Flags;

	always_comb
		begin
			case(Cond)
				//Equal
				4'b0000 : CondEx = Z;
				//Not equal
				4'b0001 : CondEx = ~Z;
				//Carry set/unsigned higher or same 
				4'b0010 : CondEx = C;
				//Carry clear / unsigned lower
				4'b0011 : CondEx = ~C;
				//Minus/negative
				4'b0100 : CondEx = N;
				//Plus, positive
				4'b0101 : CondEx = ~N;
				//Overflow / overflow set 
				4'b0110 : CondEx = V;
				//No overflow / overflow clear 
				4'b0111 : CondEx = ~V;
				//Unsigned higher 
				4'b1000 : CondEx = ~Z & C;
				//Unsigned lower or same
				4'b1001 : CondEx = Z | ~C;
				//signed greater than or egual
				4'b1010 : CondEx = ~(N ^ V);
				//signed less than
				4'b1011 : CondEx = (N ^ V);
				//signed greater than
				4'b1100 : CondEx = ~Z & (~(N ^ V));
				//signed lees than or equal
				4'b1101 : CondEx = Z | (N ^ V);
				//always / unconditional 
				4'b1110 : CondEx = 1'b1;
				default : CondEx = 1'bX;
			endcase
		end


	//Flags writing
	always_ff @(negedge Clk)
		begin
			if(!Reset)
				begin
					if(FlagWrite[0]) Flags[1:0] <= ALUFlags[1:0];
					if(FlagWrite[1]) Flags[3:2] <= ALUFlags[3:2];
				end
			else Flags <= 4'b0;	
		end
endmodule
	
	
