`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:17:54 03/06/2018 
// Design Name: 
// Module Name:    two_level_bcd_arbiter 
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
module two_level_bcd_arbiter #(
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
 wire	[ARBITER_BCD_WIDTH-1		:	0]	grant1,grant2;
 wire [ARBITER_WIDTH-1 			:	0]	request2;
 wire sel;
 reg	[ARBITER_WIDTH-1 			:	0]	mask,mask_next;
 
 
 assign request2 = request& mask;
 assign grant = (sel)? grant2 : grant1;
 
 
 always@(posedge clk or posedge reset) begin
			if(reset)				mask <= {ARBITER_WIDTH{1'b1}};
			else if(any_grant) 	mask	<= mask_next;
end //always
		
		
		
 genvar i;
 generate 
	for(i=0;i<ARBITER_WIDTH;i=i+1) begin : loop
		always@(*) begin
			mask_next[i] <=  (grant < i)? 1'b1: 1'b0;
		end //always
	end //for
 endgenerate
 
 
 
 
 
fixed_priority_bcd_arbiter #(
	.IN_WIDTH		(ARBITER_WIDTH)
	)
	first_arbiter
	(
	 .request	(request), 
    .grant	(grant1),
	 .any_grant	(any_grant)
	);
 
 
 fixed_priority_bcd_arbiter #(
	.IN_WIDTH		(ARBITER_WIDTH)
	)
	second_arbiter
	(
	 .request	(request2), 
    .grant	(grant2),
	 .any_grant	(sel)
	);
 
 
 
 endmodule
