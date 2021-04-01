`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:57:02 03/06/2018 
// Design Name: 
// Module Name:    bcd_to_one_hot 
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
`include "define.v"
module bcd_to_one_hot #(
	parameter BCD_WIDTH		=	2,
	parameter ONE_HOT_WIDTH	=	2**BCD_WIDTH
	
)
(
	input 	[BCD_WIDTH-1			:	0]	bcd_code,
	output 	[ONE_HOT_WIDTH-1		:	0] one_hot_code
 );

	genvar i;
	generate 
		for(i=0; i<ONE_HOT_WIDTH; i=i+1) begin :one_hot_gen_loop
				assign one_hot_code[i] = bcd_code == i[BCD_WIDTH-1			:	0];
		end
	endgenerate
 
endmodule