`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:13:03 03/06/2018 
// Design Name: 
// Module Name:    bcd_arbiter 
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
module bcd_arbiter #(
	parameter ARBITER_WIDTH	=4,
	parameter ARBITER_BCD_WIDTH= log2(ARBITER_WIDTH)
)
(
	input		[ARBITER_WIDTH-1 			:	0]	request,
	output	[ARBITER_BCD_WIDTH-1		:	0]	grant,
	output											any_grant,
	input												clk,
	input												reset
	
);
`LOG2

	generate 
	if(ARBITER_WIDTH<= 4) begin
		my_bcd_arbiter #(
			.ARBITER_WIDTH	(ARBITER_WIDTH)
		)
		my_bcd_arbiter
		(
		.request		(request),
		.grant		(grant),
		.any_grant	(any_grant),
		.clk			(clk),
		.reset		(reset)
		);
	end else begin 
		two_level_bcd_arbiter #(
			.ARBITER_WIDTH	(ARBITER_WIDTH)
		)
		my_two_level_bcd_arbiter
			(
			.request		(request),
			.grant		(grant),
			.any_grant	(any_grant),
			.clk			(clk),
			.reset		(reset)
			
		);
	end
	endgenerate
endmodule