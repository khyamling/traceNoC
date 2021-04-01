`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:38:03 03/06/2018 
// Design Name: 
// Module Name:    one_hot_demux 
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
module one_hot_demux	#(
		parameter IN_WIDTH=5,
		parameter SEL_WIDTH=4,
		parameter OUT_WIDTH=IN_WIDTH*SEL_WIDTH
	)
	(
		input 	[SEL_WIDTH-1		:	0] demux_sel,//selectore
		input 	[IN_WIDTH-1			:	0] demux_in,//repeated
		output 	[OUT_WIDTH-1		:	0]	demux_out
	);

	genvar i,j;
	generate 
	for(i=0;i<SEL_WIDTH;i=i+1)begin :loop1
		for(j=0;j<IN_WIDTH;j=j+1)begin :loop2
				assign demux_out[i*IN_WIDTH+j] =	 demux_sel[i]	&	demux_in[j];
		end//for j
	end//for i
	endgenerate

	

endmodule
