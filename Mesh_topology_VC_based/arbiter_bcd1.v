`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:35 03/06/2018 
// Design Name: 
// Module Name:    arbiter_bcd1 
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
module arbiter_2_bcd(
	 input      [1 			:	0]	in,
	 output	reg[0				:	0]	out,
	 input 	   [0				:	0]	low_pr
);
always @(*) begin
  out=1'd0;
 	 case(low_pr)
		 1'd0:
			 if(in[1]) 			out=1'd1;
			 else if(in[0]) 		out=1'd0;
		 1'd1:
			 if(in[0]) 			out=1'd0;
			 else if(in[1]) 		out=1'd1;
		 default: out=1'd0;
	 endcase 
  end
 endmodule 


 module arbiter_3_bcd(
	 input      [2 			:	0]	in,
	 output	reg[1				:	0]	out,
	 input 	   [1				:	0]	low_pr
);
always @(*) begin
  out=2'd0;
 	 case(low_pr)
		 2'd0:
			 if(in[1]) 			out=2'd1;
			 else if(in[2]) 		out=2'd2;
			 else if(in[0]) 		out=2'd0;
		 2'd1:
			 if(in[2]) 			out=2'd2;
			 else if(in[0]) 		out=2'd0;
			 else if(in[1]) 		out=2'd1;
		 2'd2:
			 if(in[0]) 			out=2'd0;
			 else if(in[1]) 		out=2'd1;
			 else if(in[2]) 		out=2'd2;
		 default: out=2'd0;
	 endcase 
  end
 endmodule 


 module arbiter_4_bcd(
	 input      [3 			:	0]	in,
	 output	reg[1				:	0]	out,
	 input 	   [1				:	0]	low_pr
);
always @(*) begin
  out=2'd0;
 	 case(low_pr)
		 2'd0:
			 if(in[1]) 			out=2'd1;
			 else if(in[2]) 		out=2'd2;
			 else if(in[3]) 		out=2'd3;
			 else if(in[0]) 		out=2'd0;
		 2'd1:
			 if(in[2]) 			out=2'd2;
			 else if(in[3]) 		out=2'd3;
			 else if(in[0]) 		out=2'd0;
			 else if(in[1]) 		out=2'd1;
		 2'd2:
			 if(in[3]) 			out=2'd3;
			 else if(in[0]) 		out=2'd0;
			 else if(in[1]) 		out=2'd1;
			 else if(in[2]) 		out=2'd2;
		 2'd3:
			 if(in[0]) 			out=2'd0;
			 else if(in[1]) 		out=2'd1;
			 else if(in[2]) 		out=2'd2;
			 else if(in[3]) 		out=2'd3;
		 default: out=2'd0;
	 endcase 
  end
 endmodule 
