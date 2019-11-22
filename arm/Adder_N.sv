module Adder_N
          #(parameter N = 3)
          (input logic [N-1:0] A, B,
          input logic Ci,
          output logic [N-1:0] S,
          output logic Co, V, Z, Neg);
  
	
  assign {Co, S}= A + B + Ci;
  assign Neg = S[N-1] ? 1'b1 : 1'b0;
  assign Z = (S == 0) ? 1'b1 : 1'b0;
  assign V = (~A[N-1] & ~B[N-1] & S[N-1]) | (A[N-1] & B[N-1] & ~S[N-1] );
  
    

endmodule