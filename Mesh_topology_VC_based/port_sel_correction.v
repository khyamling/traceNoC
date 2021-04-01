`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:39:13 03/06/2018 
// Design Name: 
// Module Name:    port_sel_correction 
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
module port_sel_correction #(
	parameter PORT_NUM	=	5,
	parameter SWITCH_LOCATION = 0,
	parameter PORT_NUM_BCD_WIDTH	=	log2(PORT_NUM),
	parameter PORT_SEL_BCD_WIDTH	=	log2(PORT_NUM-1)
)
(
	input [PORT_NUM_BCD_WIDTH-1		:	0] port_num_bcd,
	output[PORT_SEL_BCD_WIDTH-1		:	0] port_sel_bcd
);

	`LOG2
	localparam PORT_SEL_WIDTH = PORT_NUM-1;
	
	wire [PORT_NUM-1			:	0] port_num_one_hot;
	wire [PORT_SEL_WIDTH-1	:	0]	port_sel_one_hot;
	
	bcd_to_one_hot #(
		.BCD_WIDTH		(PORT_NUM_BCD_WIDTH),
		.ONE_HOT_WIDTH	(PORT_NUM)
	)
	conv1
	(
		.bcd_code		(port_num_bcd),
		.one_hot_code	(port_num_one_hot)
	);
 
	genvar i;	
	generate 
	//remove one extra bit from port num
	for(i=0;i<PORT_NUM;i=i+1)begin :port_loop
		if	(i>SWITCH_LOCATION)		assign port_sel_one_hot[i-1]		=	port_num_one_hot[i];
		else if(i<SWITCH_LOCATION)	assign port_sel_one_hot[i]			=	port_num_one_hot[i];
	end//for	
	endgenerate
	
	one_hot_to_bcd #(
		.ONE_HOT_WIDTH (PORT_SEL_WIDTH)
	)
	conv2
	(
		.one_hot_code	(port_sel_one_hot),
		.bcd_code		(port_sel_bcd)

	);

endmodule