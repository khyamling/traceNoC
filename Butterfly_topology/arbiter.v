`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2017 04:20:37 PM
// Design Name: 
// Module Name: arbiter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module arbiter0(gnt01,gnt00,req01,req00,clk,rst);

   output reg gnt01,gnt00;
   input      req01,req00;
   input      clk,rst;

   parameter idle=5'b00000;
   parameter GNT1=5'b00010;
   parameter GNT0=5'b00001;

   reg [4:0]  state,next_state;

   always @ (posedge clk)
     begin
    if(rst)
      state=idle;
    else
      state=next_state;
     end

   always @ (state,req01,req00)
     begin
    next_state=0;

    case (state)

      idle:begin

         if(req00)
           next_state=GNT0;
         else if(req01)
           next_state=GNT1;
         else
           next_state=idle;
      end // case: idle

      GNT0:begin

         if(req00)
           next_state=GNT0;
         else
           next_state=idle;
      end

      GNT1:begin
         if(req01)
           next_state=GNT1;
         else
           next_state=idle;
      end

    endcase // case (state)
     end // always @ (state,req3,req2,req1,req0)

//always @ (state)
always @ (posedge clk)
/*begin
if(rst) begin
gnt04=0;
      gnt03=0;
      gnt02=0;
      gnt01=0;
      gnt00=0;
		end
		else if(clk) */

  begin
     if(state==idle) begin
        gnt01=0;
        gnt00=0;
     end
     else if(state==GNT0) begin
        gnt01=0;
        gnt00=1;
		$display("value of grant %d", gnt00);
     end
     else if(state==GNT1) begin
        gnt01=1;
        gnt00=0;
     end
  end // always @ (state)
//end
endmodule
