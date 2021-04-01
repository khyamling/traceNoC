`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:03:44 03/06/2018 
// Design Name: 
// Module Name:    arbiter 
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
module arbiter_2_one_hot(
	 input      [1 			:	0]	in,
	 output	reg[1				:	0]	out,
	 input 	   						low_pr
);
always @(*) begin
	 out=2'b00;
 	 case(low_pr)
		 1'd0:
			 if(in[1]) 				out=2'b10;
			 else if(in[0]) 		out=2'b01;
		 1'd1:
			 if(in[0]) 				out=2'b01;
			 else if(in[1]) 		out=2'b10;
		  default: out=2'b00;
	 endcase 
  end
 endmodule 




module arbiter_3_one_hot(
	 input      [2 			:	0]	in,
	 output	reg[2				:	0]	out,
	 input 	   [1				:	0]	low_pr
);
always @(*) begin
  out=3'b000;
 	 case(low_pr)
		 2'd0:
			 if(in[1]) 				out=3'b010;
			 else if(in[2]) 		out=3'b100;
			 else if(in[0]) 		out=3'b001;
		 2'd1:
			 if(in[2]) 				out=3'b100;
			 else if(in[0]) 		out=3'b001;
			 else if(in[1]) 		out=3'b010;
		 2'd2:
			 if(in[0]) 				out=3'b001;
			 else if(in[1]) 		out=3'b010;
			 else if(in[2]) 		out=3'b100;
		 default: out=3'b000;
	 endcase 
  end
 endmodule 


 module arbiter_4_one_hot(
	 input      [3 			:	0]	in,
	 output	reg[3				:	0]	out,
	 input 	   [1				:	0]	low_pr
);
always @(*) begin
  out=4'b0000;
 	 case(low_pr)
		 2'd0:
			 if(in[1]) 				out=4'b0010;
			 else if(in[2]) 		out=4'b0100;
			 else if(in[3]) 		out=4'b1000;
			 else if(in[0]) 		out=4'b0001;
		 2'd1:
			 if(in[2]) 				out=4'b0100;
			 else if(in[3]) 		out=4'b1000;
			 else if(in[0]) 		out=4'b0001;
			 else if(in[1]) 		out=4'b0010;
		 2'd2:
			 if(in[3]) 				out=4'b1000;
			 else if(in[0]) 		out=4'b0001;
			 else if(in[1]) 		out=4'b0010;
			 else if(in[2]) 		out=4'b0100;
		 2'd3:
			 if(in[0]) 				out=4'b0001;
			 else if(in[1]) 		out=4'b0010;
			 else if(in[2]) 		out=4'b0100;
			 else if(in[3]) 		out=4'b1000;
		 default: out=4'b0000;
	 endcase 
  end
 endmodule 

