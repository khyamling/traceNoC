`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:00:58 03/06/2018 
// Design Name: 
// Module Name:    one_hot_to_bcd 
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
module one_hot_to_bcd #(
	parameter ONE_HOT_WIDTH	=	4,
	parameter BCD_WIDTH		=	log2(ONE_HOT_WIDTH)
)
(
	input 	[ONE_HOT_WIDTH-1		:	0] one_hot_code,
	output 	[BCD_WIDTH-1			:	0]	bcd_code

);

`LOG2
localparam MUX_IN_WIDTH	=	BCD_WIDTH* ONE_HOT_WIDTH;

wire [MUX_IN_WIDTH-1		:	0]	bcd_temp ;

genvar i;
generate 
	for(i=0; i<ONE_HOT_WIDTH; i=i+1) begin :mux_in_gen_loop
			assign bcd_temp[(i+1)*BCD_WIDTH-1 : i*BCD_WIDTH] =  i[BCD_WIDTH-1:0];
	end
endgenerate

 one_hot_mux #(
		.IN_WIDTH	(MUX_IN_WIDTH),
		.SEL_WIDTH	(ONE_HOT_WIDTH)
		
	)
	one_hot_to_bcd_mux
	(
		.mux_in		(bcd_temp),
		.mux_out		(bcd_code),
		.sel			(one_hot_code)

	);



endmodule