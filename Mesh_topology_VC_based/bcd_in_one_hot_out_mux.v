`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:35:37 03/06/2018 
// Design Name: 
// Module Name:    bcd_in_one_hot_out_mux 
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
module bcd_in_one_hot_out_mux #(
	parameter	IN_BCD_WIDTH	  		=	8,
	parameter	SEL_BCD_WIDTH 			=  2, 
	parameter   SEL_WIDTH				=	2**SEL_BCD_WIDTH,
	parameter	OUT_BCD_WIDTH 			=	IN_BCD_WIDTH/SEL_WIDTH,
	parameter	OUT_WIDTH				=	2**OUT_BCD_WIDTH
)
(
	input [IN_BCD_WIDTH-1		:	0]	mux_in,
	output[OUT_WIDTH-1			:	0]	mux_out,
	input	[SEL_BCD_WIDTH-1		:	0]	sel

	);

	wire [OUT_BCD_WIDTH-1		:	0]	mux_out_bcd;
	
bcd_mux #(
		.IN_WIDTH			(IN_BCD_WIDTH),
		.OUT_WIDTH  		(OUT_BCD_WIDTH)
	)
	the_bcd_mux
	(
		.mux_in				(mux_in),
		.mux_out				(mux_out_bcd),
		.sel					(sel)

	);
	
	bcd_to_one_hot #(
	.BCD_WIDTH		(OUT_BCD_WIDTH),
	.ONE_HOT_WIDTH	(OUT_WIDTH)
	)
	conv
	(
	.bcd_code		(mux_out_bcd),
	.one_hot_code	(mux_out)
	);
endmodule