module ALU_Decoder(input logic ALUOp,
						 input logic [4:0] Funct,
						 output logic NoWrite,
						 output logic [1:0] FlagW, ALUControl);
	
	logic [3:0] Cmd;
	assign Cmd = Funct[4:1];
	logic S;
	assign S = Funct[0];
	always_comb
		begin
			if(~ALUOp)
				begin
					ALUControl = 2'b00;
					FlagW = 2'b00;
					NoWrite = 1'b0;
				end
			else
				begin
					case(Cmd)
						//Add operation
						4'b0100 : begin
										NoWrite = 1'b0;
										ALUControl = 2'b00;
										if(~S) FlagW = 2'b00;
										else FlagW = 2'b11;
									 end
						//Sub operation
						4'b0010 : begin
										NoWrite = 1'b0;
										ALUControl = 2'b01;
										if(~S) FlagW = 2'b00;
										else FlagW = 2'b11;
									 end
						//And operation
						4'b0000 : begin
										NoWrite = 1'b0;
										ALUControl = 2'b10;
										if(~S) FlagW = 2'b00;
										else FlagW = 2'b10;
									 end
						//Or operation
						4'b1100 : begin
										NoWrite = 1'b0;
										ALUControl = 2'b11;
										if(~S) FlagW = 2'b00;
										else FlagW = 2'b10;
									 end
						//Compare operation
						4'b1010 : begin
										NoWrite = 1'b1;
										ALUControl = 2'b01;
										if(S) FlagW = 2'b11;
										else FlagW = 2'bXX;
									 end
						default : begin
										NoWrite = 1'bx;
										ALUControl = 2'bXX;
										FlagW = 2'bXX;
									 end
					
					endcase
				
				end
		end
endmodule		