`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:14:03 03/06/2018 
// Design Name: 
// Module Name:    my_bcd_arbiter 
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
module my_bcd_arbiter #(
	parameter ARBITER_WIDTH	=8,
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
	reg 	[ARBITER_BCD_WIDTH-1		:	0] 	low_pr;
	
	always@(posedge clk or posedge reset) begin
		if(reset) begin
			low_pr	<=	{ARBITER_BCD_WIDTH{1'b0}};
		end else begin
			if(any_grant) low_pr <= grant;
		end
	end
	

	assign any_grant = | request;

	generate 
		if(ARBITER_WIDTH	==2) 		arbiter_2_bcd arb( .in(request) , .out(grant), .low_pr(low_pr));
		if(ARBITER_WIDTH	==3) 		arbiter_3_bcd arb( .in(request) , .out(grant), .low_pr(low_pr));
		if(ARBITER_WIDTH	==4) 		arbiter_4_bcd arb( .in(request) , .out(grant), .low_pr(low_pr));
	endgenerate

endmodule
