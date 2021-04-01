`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:00:01 03/06/2018 
// Design Name: 
// Module Name:    my_one_hot_arbiter 
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
module my_one_hot_arbiter #(
	parameter ARBITER_WIDTH	=4
	
)
(
	input		[ARBITER_WIDTH-1 			:	0]	request,
	output	[ARBITER_WIDTH-1			:	0]	grant,
	output											any_grant,
	input												clk,
	input												reset
);
	`LOG2
	localparam ARBITER_BCD_WIDTH= log2(ARBITER_WIDTH);
	reg 	[ARBITER_BCD_WIDTH-1		:	0] 	low_pr;
	wire 	[ARBITER_BCD_WIDTH-1		:	0] 	grant_bcd;
	
	one_hot_to_bcd #(
		.ONE_HOT_WIDTH	(ARBITER_WIDTH)
	)conv 
	(
		.one_hot_code(grant),
		.bcd_code(grant_bcd)
	);
	
	always@(posedge clk or posedge reset) begin
		if(reset) begin
			low_pr	<=	{ARBITER_BCD_WIDTH{1'b0}};
		end else begin
			if(any_grant) low_pr <= grant_bcd;
		end
	end
	

	assign any_grant = | request;

	generate 
		if(ARBITER_WIDTH	==2) 		arbiter_2_one_hot arb( .in(request) , .out(grant), .low_pr(low_pr));
		if(ARBITER_WIDTH	==3) 		arbiter_3_one_hot arb( .in(request) , .out(grant), .low_pr(low_pr));
		if(ARBITER_WIDTH	==4) 		arbiter_4_one_hot arb( .in(request) , .out(grant), .low_pr(low_pr));
	endgenerate

endmodule