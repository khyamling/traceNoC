`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:19:12 03/06/2018 
// Design Name: 
// Module Name:    fixed_priority_bcd_arbiter 
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
 module fixed_priority_bcd_arbiter #(
	parameter IN_WIDTH	=	4,
	parameter OUT_WIDT	=	log2(IN_WIDTH)
)
(
	 input      [IN_WIDTH-1 			:	0]	request,
	 output	reg[OUT_WIDT-1				:	0]	grant,
	 output 											any_grant
);
	`LOG2
	reg[OUT_WIDT-1	:0] i;
	assign  any_grant= | request;
	always @(*) begin
		grant={OUT_WIDT{1'b0}};
		for(i=IN_WIDTH-1'b1;i>{OUT_WIDT{1'b0}};i=i-1'b1) begin 
			if(request[i]) 			grant=i;
		end
		if(request[0]) 			grant={OUT_WIDT{1'b0}};
 	end
endmodule
 