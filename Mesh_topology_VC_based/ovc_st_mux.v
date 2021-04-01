`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:09:00 03/06/2018 
// Design Name: 
// Module Name:    ovc_st_mux 
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
module ovc_st_mux #(
		parameter	IN_WIDTH	  				=	16,
		parameter	PORT_SEL_NUM			=	4, 
		parameter	VC_NUM_PER_PORT	 	=	4,
		parameter	PORT_SEL_BCD_WIDTH	=  log2	(PORT_SEL_NUM),
		parameter	VC_BCD_WIDTH 		 	=	log2	(VC_NUM_PER_PORT)	

	)
	(
		input [IN_WIDTH-1				:0]	mux_in,
		output									mux_out,
		input[PORT_SEL_BCD_WIDTH-1	:0]	port_sel_bcd,
		input[VC_BCD_WIDTH -1		:0]	vc_num_bcd
	
	);
	`LOG2
	
	wire [VC_NUM_PER_PORT -1:0] 	mux1_in [PORT_SEL_NUM-1:0] ;
	wire [VC_NUM_PER_PORT -1:0]  mux1_out;
	genvar i; 
	generate
		for(i=0;i<PORT_SEL_NUM; i=i+1'b1) begin : lp
			assign mux1_in [i] = mux_in[((i+1)*VC_NUM_PER_PORT )-1	:	i*VC_NUM_PER_PORT ];
		end
	endgenerate
	assign mux1_out = mux1_in [port_sel_bcd];
	assign mux_out  = mux1_out [vc_num_bcd];
	
endmodule