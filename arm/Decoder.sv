module Decoder(input logic [1:0] Op,
				   input logic [5:0] Funct,
					input logic [3:0] Rd,
					output logic PCS, RegW, MemW, MemToReg, ALUSrc, NoWrite,
					output logic [1:0] ImmSrc, RegSrc, ALUControl, FlagW);

	logic ALUOp;
	
	//LDR instruction
	assign MemToReg = ~Op[1] & Op[0] & Funct[0];
	//STR instruction
	assign MemW = ~Op[1] & Op[0] & ~Funct[0];
	//Register-Register operation turns off ALUSrc flag
	assign ALUSrc = ~(~Op[0] & ~Op[1] & ~Funct[5]);
	//STR and B instructions do not write on registers
	assign RegW = ~((~Op[1] & Op[0] & ~Funct[0]) | (Op[1] & ~Op[0]));
	//ALUOp activates with operations with registers
	assign ALUOp = ~Op[0] & ~Op[1];
	//PC Logic
	assign PCS = (((Rd == 15) & RegW) | (Op[1] & ~Op[0]));
	
	always_comb
		begin
			case(Op)
				//data processing
				2'b00 : if(~Funct[5])
								begin
									ImmSrc = 2'bXX;
									RegSrc = 2'b00;
								end
						  else
								begin
									ImmSrc = 2'b00;
									RegSrc = 2'bX0;
								end
				//LDR or STR
				2'b01 : begin 
							  ImmSrc = 2'b01;
							  if(~Funct[0]) RegSrc = 2'b10;
							  else RegSrc = 2'bX0;
						  end
				//Branch instruction
				2'b10 : begin
								ImmSrc = 2'b10;
								RegSrc = 2'bX1;
						  end
				default:
						begin
							ImmSrc = 2'bXX;
							RegSrc = 2'bXX;
						end
			endcase
		end
		
	//ALU Decoder
	ALU_Decoder ALUDeco(ALUOp, Funct[4:0], NoWrite, FlagW, ALUControl);
	
endmodule
