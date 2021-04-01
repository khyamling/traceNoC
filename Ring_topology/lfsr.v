`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    lfsr7 
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module lfsr7 (out1, clk, rst);

  output reg [7:0] out1;
  input clk, rst;

  wire feedback;

  assign feedback = ~(out1[4] ^ out1[2]);

always @(posedge clk)
  begin
    if (rst)
      out1 = 8'b0;
    else
      out1 = {out1[6:0],feedback};
      out1[7:4] = out1[7:4]%8;
  end
endmodule
