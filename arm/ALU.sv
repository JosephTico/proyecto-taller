module ALU(input logic [1:0] ALUControl,
			  input logic [31:0] SrcA, SrcB,
			  output logic [31:0] ALUResult,
			  output logic [3:0] ALUFlags);
	
	logic [31:0] AddS, SubS;
	logic AddC, AddV, AddZ, AddN, SubC, SubV, SubZ, SubN;

	
	Adder_N #(32) Add(SrcA, SrcB, 1'b0, AddS, AddC, AddV, AddZ, AddN);
	Adder_N #(32) Sub(SrcA, ~SrcB, 1'b1, SubS, SubC, SubV, SubZ, SubN);
	
	always_comb
		begin
			case(ALUControl)
				2'b00 : begin
							ALUResult = AddS;
							ALUFlags = {AddN, AddZ, AddC, AddV};
						  end
				2'b01 : begin
							ALUResult = SubS;
							ALUFlags = {SubN, SubZ, SubC, SubV};
						  end
				2'b10 : begin
							ALUResult = SrcA & SrcB;
							ALUFlags = {ALUResult[31], SubZ, 2'b00};
						  end
				2'b11 : begin
							ALUResult = SrcA | SrcB;
							ALUFlags = {ALUResult[31], SubZ, 2'b00};
						  end
				default : begin
								ALUResult = 32'b0;
								ALUFlags = 4'b0;
							 end
			endcase
		end
endmodule
				
				