`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:24:45 03/06/2018 
// Design Name: 
// Module Name:    fast_minimum_number 
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
module fast_minimum_number#(
	parameter NUM_OF_INPUTS		=	8,
	parameter DATA_WIDTH			=	5,
	parameter IN_ARRAY_WIDTH	=	NUM_OF_INPUTS	* DATA_WIDTH
)
(
	input  [IN_ARRAY_WIDTH-1			:	0] in_array,
	output [NUM_OF_INPUTS-1				:	0]	min_out
);

	genvar i,j;
	wire [DATA_WIDTH-1					:	0]	numbers				[NUM_OF_INPUTS-1			:0];	
	wire [NUM_OF_INPUTS-2				:	0]	comp_array			[NUM_OF_INPUTS-1			:0];	
		
	generate
	if(NUM_OF_INPUTS==1)begin
		assign min_out = 1'b1;
	end
	else begin //(vc num >1)
		for(i=0; i<NUM_OF_INPUTS;  i=i+1) begin : loop_i
				assign numbers[i]	= in_array	[(i+1)* DATA_WIDTH-1: i*DATA_WIDTH];
				for(j=0; j<NUM_OF_INPUTS-1;  j=j+1) begin : loop_j
							if(i>j)	assign comp_array [i][j] = ~ comp_array [j][i-1];
							else 		assign comp_array [i]	[j] = numbers[i]<= numbers[j+1];
				end//for j
				assign min_out[i]=	& comp_array[i];
		end//for i
	end//else
	endgenerate
	
endmodule