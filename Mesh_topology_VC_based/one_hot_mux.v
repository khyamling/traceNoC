`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:02:22 03/06/2018 
// Design Name: 
// Module Name:    one_hot_mux 
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
module one_hot_mux #(
		parameter	IN_WIDTH	  =	20,
		parameter	SEL_WIDTH =   5, 
		parameter	OUT_WIDTH =	IN_WIDTH/SEL_WIDTH

	)
	(
		input [IN_WIDTH-1		:0]	mux_in,
		output[OUT_WIDTH-1	:0]	mux_out,
		input[SEL_WIDTH-1	:0]	sel

	);

	wire [IN_WIDTH-1	:0]	mask;
	wire [IN_WIDTH-1	:0]	masked_mux_in;
	wire [SEL_WIDTH-1:0]  	mux_out_gen [OUT_WIDTH-1:0]; 
	
	genvar i,j;
	
	//first selector masking
	generate 	// first_mask = {sel[0],sel[0],sel[0],....,sel[n],sel[n],sel[n]}
		for(i=0; i<SEL_WIDTH; i=i+1) begin : mask_loop
			assign mask[(i+1)*OUT_WIDTH-1 : (i)*OUT_WIDTH]	=	{OUT_WIDTH{sel[i]} };
		end
		
		assign masked_mux_in	= mux_in & mask;
		
		for(i=0; i<OUT_WIDTH; i=i+1) begin : lp1
			for(j=0; j<SEL_WIDTH; j=j+1) begin : lp2
				assign mux_out_gen [i][j]	=	masked_mux_in[i+OUT_WIDTH*j];
			end
			assign mux_out[i] = | mux_out_gen [i];
		end
	endgenerate
	
endmodule