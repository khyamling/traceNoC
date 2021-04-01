`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:12:16 03/06/2018 
// Design Name: 
// Module Name:    wide_or 
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
module wide_or #(
	parameter IN_ARRAY_WIDTH =80,
	parameter IN_NUM	 =5,
	parameter IN_WIDTH	=	IN_ARRAY_WIDTH/IN_NUM,
	parameter CMP_VAL	=	IN_WIDTH/(IN_NUM-1),
	parameter OUT_WIDTH = (IN_ARRAY_WIDTH/IN_NUM)+CMP_VAL
	
	)
	(
	input 	[IN_ARRAY_WIDTH-1 		:	0]	in,
	output 	[OUT_WIDTH-1				:	0]	out
);
	
	genvar i,j;
	wire [IN_WIDTH-1		:	0]		in_sep	[IN_NUM-1		:	0];
	wire [IN_NUM-2			:	0]		gen 		[OUT_WIDTH-1	:	0];
	generate 
		for(i=0;i<IN_NUM; i=i+1'b1		) begin : lp
			assign in_sep[i]  = in[(IN_WIDTH*(i+1))-1	: IN_WIDTH*i];
		end
		for (j=0;j<IN_NUM-1;j=j+1)begin : loop1
				for(i=0;i<OUT_WIDTH; i=i+1	)begin : loop2
					if(i>=CMP_VAL*(j+1))begin : if1
						assign gen[i][j] = in_sep[j][i-CMP_VAL];
					end 
					else if( i< CMP_VAL*(j+1) && i>= (CMP_VAL*j)) begin 
						assign gen[i][j] = in_sep[IN_NUM-1][i];
					end
					else	begin 
						assign gen[i][j] = in_sep[j][i];
					end
				end// for i
			end// for j
		for(i=0;i<OUT_WIDTH; i=i+1'b1		) begin : lp2
			assign out[i]				= |  gen[i];
		end
	endgenerate
endmodule
