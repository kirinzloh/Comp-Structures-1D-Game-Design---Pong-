/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module drawing_3 (
    input clk,
    input rst,
    input [3:0] ballX,
    input [3:0] ballY,
    input [3:0] padA,
    input [3:0] padB,
    input playing,
    output reg [255:0] pattern
  );
  
  
  
  reg [22:0] M_counter_d, M_counter_q = 1'h0;
  
  integer i;
  
  always @* begin
    if (playing == 1'h1) begin
      for (i = 1'h0; i < 5'h10; i = i + 1) begin
        pattern[(i)*16+15-:16] = 16'hffff;
      end
      pattern[(ballX)*16+(ballY)*1+0-:1] = 1'h0;
      pattern[0+(padA - 1'h1)*1+0-:1] = 1'h0;
      pattern[0+(padA)*1+0-:1] = 1'h0;
      pattern[0+(padA + 1'h1)*1+0-:1] = 1'h0;
      pattern[240+(padB - 1'h1)*1+0-:1] = 1'h0;
      pattern[240+(padB)*1+0-:1] = 1'h0;
      pattern[240+(padB + 1'h1)*1+0-:1] = 1'h0;
    end else begin
      for (i = 1'h0; i < 5'h10; i = i + 1) begin
        pattern[(i)*16+15-:16] = 16'h0000;
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
    end
  end
  
endmodule
