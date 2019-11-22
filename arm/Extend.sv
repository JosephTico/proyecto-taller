module Extend(input logic [1:0] ImmSrc,
				  input logic [23:0] Instr,
				  output logic [31:0] ExtImm);
	always_comb
		case(ImmSrc)
			//register-immediate operation
			2'b00 : ExtImm = {24'b0, Instr[7:0]};
			//LDR or STR operation
			2'b01 : ExtImm = {20'b0, Instr[11:0]};
			//register-register operation
			2'b10 : ExtImm = {{6{Instr[23]}}, Instr[23:0], 2'b00};
			default : ExtImm = 32'b0;
		endcase
endmodule
	
				  