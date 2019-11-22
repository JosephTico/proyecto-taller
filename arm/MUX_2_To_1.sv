module MUX_2_To_1
						#(parameter N = 8)
						(input logic S,
						input logic [N-1:0] D0, D1,
						output logic [N-1:0] Y);

	always_comb
		begin
			case(S)
				1'b0: Y = D0;
				1'b1: Y = D1;
				default : Y = 0;
			endcase
		end
endmodule
