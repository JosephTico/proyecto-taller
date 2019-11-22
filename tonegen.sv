module tonegen (
  input clk,
  input reset,
  input logic [7:0] volume,
  input logic [3:0] note,
  input logic [2:0] octave,
  input left_chan_ready,
  input right_chan_ready,
  output logic [15:0] sample_data,
  output logic sample_valid
);
  /* send a square wave audio signal to the codec */
  logic [11:0] counter;
  logic sqrclk;
  logic [11:0] clk_div;
  // octave 0 clk_div values
  logic [11:0] notes [12] = '{
    1468, // C
    1386, // C-sharp and D-flat
    1308, // D
    1234, // D-sharp and E-flat
    1165, // E
    1099, // F
    1038, // F-sharp and G-flat
    980, // G
    924, // G-sharp and A-flat
    873, // A
    824, // A-sharp and B-flat
    777 // B
  };
  always_ff @(posedge clk or posedge reset) begin
    clk_div = notes[note] >> octave;
    if (reset)
      begin
        sqrclk <= 0;
        counter <= 11'd0;
      end
    else if (left_chan_ready && right_chan_ready)
      begin
        if (!sample_valid) begin
          if (counter == clk_div) begin
            sqrclk <= ~sqrclk;
            counter <= 11'd0;
          end else begin
            counter <= counter + 11'd1;
          end
        end
        sample_valid <= 1;
      end
    else
      begin
        sample_valid <= 0;
      end
  end
  always_comb begin
    if (sqrclk == 1'b1)
      sample_data = volume;
    else
      sample_data = -volume;
  end
endmodule