module ARM_tb();
	logic Clk, Reset;
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
	
	ARM DUT(Clk, Reset, WriteData, DataAdr, MemWrite);
	
	initial begin
		Reset <= 1; #22; Reset <= 0;
		
	end
	
	always 
		begin
			Clk <= 1; #5 ; Clk <= 0; #5;
		end
	
	
	
	always @(negedge Clk)
		begin
			if(MemWrite) 
			begin
				if(DataAdr === 100 & WriteData === 7) 
					begin
						$display("Simulation succeeded");
						$stop;
					end 
				else if (DataAdr !== 96) 
					begin
						$display("Simulation failed");
						$stop;
					end
			end
		end
endmodule
