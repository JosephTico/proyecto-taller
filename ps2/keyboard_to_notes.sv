module keyboard_to_notes(
	input A,
	input S,
	input D,
	input F,
	input G,
	input H,
	input J,
	output logic [3:0] note,
	output logic [7:0] volume,
	output logic [6:0] keyArray);
	
	always @(*)
		begin
		keyArray = 0;
			volume = 0;
		  if (A == 1) begin
				note = 0;
				keyArray[0] = 1;
				volume = 255;
		  end else if (S == 1) begin
				note = 1;
				keyArray[1] = 1;
				volume = 255;
		  end else if (D == 1) begin
				note = 2;
				keyArray[2] = 1;
				volume = 255;
		  end else if (F == 1) begin
				note = 3;
				keyArray[3] = 1;
				volume = 255;
		  end else if (G == 1) begin
				note = 4;
				keyArray[4] = 1;
				volume = 255;
		  end else if (H == 1) begin
				note = 5;
				keyArray[5] = 1;
				volume = 255;
		  end else if (J == 1) begin
				note = 6;
				keyArray[6] = 1;
				volume = 255;
		  end
	end
	 
	
endmodule