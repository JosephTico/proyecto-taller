module divide_clock_by_two(in_clk, out_clk);

input in_clk;
output out_clk;
reg out_clk;

always @(posedge in_clk)
out_clk <= ~out_clk;

endmodule