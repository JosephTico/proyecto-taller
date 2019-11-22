module Hex_Display(input logic [3:0] Number,
						 output logic [6:0] Segments);
						 
	assign Segments =
		({7{(Number == 4'h0)}} & 7'b1000000) |
		({7{(Number == 4'h1)}} & 7'b1111001) |
		({7{(Number == 4'h2)}} & 7'b0100100) |
		({7{(Number == 4'h3)}} & 7'b0110000) |
		({7{(Number == 4'h4)}} & 7'b0011001) |
		({7{(Number == 4'h5)}} & 7'b0010010) |
		({7{(Number == 4'h6)}} & 7'b0000010) |
		({7{(Number == 4'h7)}} & 7'b1111000) |
		({7{(Number == 4'h8)}} & 7'b0000000) |
		({7{(Number == 4'h9)}} & 7'b0010000) |
		({7{(Number == 4'hA)}} & 7'b0001000) |
		({7{(Number == 4'hB)}} & 7'b0000011) |
		({7{(Number == 4'hC)}} & 7'b1000110) |
		({7{(Number == 4'hD)}} & 7'b0100001) |
		({7{(Number == 4'hE)}} & 7'b0000110) |
		({7{(Number == 4'hF)}} & 7'b0001110);
	
						 
endmodule
