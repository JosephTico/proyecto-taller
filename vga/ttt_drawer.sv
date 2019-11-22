	module ttt_drawer(clk, display_enabled, x, y, r, g, b, keyArray);

	input logic clk;
	input logic display_enabled;
	input logic [9:0] x;
	input logic [8:0] y;
	output logic [7:0] r;
	output logic [7:0] g;
	output logic [7:0] b;
	input logic [6:0] keyArray;
	
	integer xdir = 1;
	integer ydir = 1;
	
	integer counter = 0;

		
	
	always @ (posedge clk)
	begin
		r <= 8'h00;
		g <= 8'h00;
		b <= 8'h00;
	
		
		
		if (display_enabled)
		begin
		r <= 8'hFF;
		g <= 8'hFF;
		b <= 8'hFF;
			
			if (x % 91 == 0)
			begin
				r <= 8'h00;
				g <= 8'h00;
				b <= 8'h00;
			end
			
			if (keyArray[0] == 1 && x > 0 && x < 91)
			begin
				r <= 8'hDD;
				g <= 8'hDD;
				b <= 8'hDD;
			end
			
			if (keyArray[1] == 1 && x > 91 && x < 91*2)
			begin
				r <= 8'hDD;
				g <= 8'hDD;
				b <= 8'hDD;
			end
			
			if (keyArray[2] == 1 && x > 91*2 && x < 91*3)
			begin
				r <= 8'hDD;
				g <= 8'hDD;
				b <= 8'hDD;
			end
			
			if (keyArray[3] == 1 && x > 91*3 && x < 91*4)
			begin
				r <= 8'hDD;
				g <= 8'hDD;
				b <= 8'hDD;
			end
			
			if (keyArray[4] == 1 && x > 91*4 && x < 91*5)
			begin
				r <= 8'hDD;
				g <= 8'hDD;
				b <= 8'hDD;
			end
			
			if (keyArray[5] == 1 && x > 91*5 && x < 91*6)
			begin
				r <= 8'hDD;
				g <= 8'hDD;
				b <= 8'hDD;
			end
			
			if (keyArray[6] == 1 && x > 91*6 && x < 91*7)
			begin
				r <= 8'hDD;
				g <= 8'hDD;
				b <= 8'hDD;
			end
		
		end
		
	end

endmodule