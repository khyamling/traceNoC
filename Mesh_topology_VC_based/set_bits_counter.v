`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:11:27 03/06/2018 
// Design Name: 
// Module Name:    set_bits_counter 
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
module set_bits_counter #(
	parameter IN_WIDTH =2,
	parameter OUT_WIDTH = log2(IN_WIDTH+1)
	)
	(
	input 	[IN_WIDTH-1 		:	0]	in,
	output 	[OUT_WIDTH-1		:	0]	out
	
);
	`LOG2
	
	wire 	[IN_WIDTH-2 		:	0]	addrin2;
	wire  [OUT_WIDTH-1	:	0]	addrout [IN_WIDTH-2 		:	0]	;
	wire  [OUT_WIDTH-1	:	0]	addrin1 [IN_WIDTH-1 		:	0];
	
	assign addrin1[0] = {{(OUT_WIDTH-1){1'b0}},in[0]};
	assign out 			= addrin1 [IN_WIDTH-1];
	
	genvar i;
	generate 
		for (i=0; i<IN_WIDTH-1; i=i+1) begin : loop
					assign addrin1[i+1] 	= addrout[i];
					assign addrin2[i] 	= in[i+1];
					assign addrout[i]		= addrin1[i] + addrin2 [i];
		end
	endgenerate
endmodule