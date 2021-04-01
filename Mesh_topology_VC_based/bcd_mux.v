`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:21:45 03/06/2018 
// Design Name: 
// Module Name:    bcd_mux 
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
module bcd_mux #(
		parameter	IN_WIDTH	  		=	20,
		parameter	OUT_WIDTH  		=	5,
		parameter	IN_NUM	  		=	IN_WIDTH/OUT_WIDTH,
		parameter	SEL_WIDTH_BCD 	=  log2(IN_NUM) 
		

	)
	(
		input 	[IN_WIDTH-1			:0]	mux_in,
		output	[OUT_WIDTH-1		:0]	mux_out,
		input		[SEL_WIDTH_BCD-1	:0]	sel

	);
	`LOG2
	wire [OUT_WIDTH-1		:0] mux_in_2d [IN_NUM -1	:0];
	genvar i;
	generate 
		for (i=0; i< IN_NUM; i=i+1'b1) begin : loop
			assign mux_in_2d[i]	=mux_in[((i+1)*OUT_WIDTH)-1	:	i*OUT_WIDTH];	
		end
	endgenerate
	
	assign mux_out = mux_in_2d[sel];
	
endmodule

