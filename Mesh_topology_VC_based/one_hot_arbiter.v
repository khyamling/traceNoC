`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:58:36 03/06/2018 
// Design Name: 
// Module Name:    one_hot_arbiter 
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
module one_hot_arbiter #(
	parameter ARBITER_WIDTH	=8
	
)
(
	input		[ARBITER_WIDTH-1 			:	0]	request,
	output	[ARBITER_WIDTH-1			:	0]	grant,
	output											any_grant,
	input												clk,
	input												reset
);

	generate 
	if(ARBITER_WIDTH<=4) begin
		//my own arbiter 
		my_one_hot_arbiter #(
			.ARBITER_WIDTH	(ARBITER_WIDTH)
		)
		one_hot_arb
		(	
			.clk			(clk), 
			.reset 		(reset), 
			.request		(request), 
			.grant		(grant),
			.any_grant	(any_grant)
		);
	
	end else begin
		// Dimitrakopoulos arbiter
		arbiter #(
			.ARBITER_WIDTH	(ARBITER_WIDTH)
		)
		one_hot_arb
		(	
			.clk			(clk), 
			.reset 		(reset), 
			.request		(request), 
			.grant		(grant),
			.anyGrant	(any_grant)
		);
	end
	endgenerate
endmodule