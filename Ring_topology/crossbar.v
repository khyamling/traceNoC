`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2017 02:30:46 PM
// Design Name: 
// Module Name: crossbar
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

module crossbar(i0,i1,i2,
      sel0, sel1,sel2,
		o0,o1,o2,clk, rst
    );
input clk, rst;
input[63:0] i0,i1,i2;
output reg[63:0] o0,o1,o2;
input [2:0] sel0, sel1, sel2;
always @(posedge clk)
begin
case(sel0)
5'b00001: o0<=i0;
5'b00010: o0<=i1;
5'b00100: o0<=i2;
default: o0<=8'bxxxxxxxx;
endcase
case(sel1)
5'b00001: o1<=i0;
5'b00010: o1<=i1;
5'b00100: o1<=i2;
default: o1<=8'bxxxxxxxx;
endcase
case(sel2)
5'b00001: o2<=i0;
5'b00010: o2<=i1;
5'b00100: o2<=i2;
default: o2<=8'bxxxxxxxx;
endcase

/*$display("output local i0 %d, %t", i0, $time);
$display("output local i1 %d, %t", i1, $time);
$display("output local i2 %d, %t", i2, $time);
$display("select0 signal %b, %t", sel0, $time);
$display("select1 signal %b, %t", sel1, $time);
$display("select2 signal %b, %t", sel2, $time);
*/
end
//sel1,sel2,sel3,sel4;
//assign o0= (i0&sel0);
//assign o0=((i0&~i1&~i2&~i3&~i4&sel0)|(~i0&i1&~i2&~i3&~i4&sel0)|(~i0&~i1&i2&~i3&~i4&sel0)|(~i0&~i1&~i2&i3&~i4&sel0)|(~i0&~i1&~i2&~i3&i4&sel0));
//assign o1=((i0&~i1&~i2&~i3&~i4&sel1)|(~i0&i1&~i2&~i3&~i4&sel1)|(~i0&~i1&i2&~i3&~i4&sel1)|(~i0&~i1&~i2&i3&~i4&sel1)|(~i0&~i1&~i2&~i3&i4&sel1));
//assign o2=((i0&~i1&~i2&~i3&~i4&sel2)|(~i0&i1&~i2&~i3&~i4&sel2)|(~i0&~i1&i2&~i3&~i4&sel2)|(~i0&~i1&~i2&i3&~i4&sel2)|(~i0&~i1&~i2&~i3&i4&sel2));
//assign o3=((i0&~i1&~i2&~i3&~i4&sel3)|(~i0&i1&~i2&~i3&~i4&sel3)|(~i0&~i1&i2&~i3&~i4&sel3)|(~i0&~i1&~i2&i3&~i4&sel3)|(~i0&~i1&~i2&~i3&i4&sel3));
//assign o4=((i0&~i1&~i2&~i3&~i4&sel4)|(~i0&i1&~i2&~i3&~i4&sel4)|(~i0&~i1&i2&~i3&~i4&sel4)|(~i0&~i1&~i2&i3&~i4&sel4)|(~i0&~i1&~i2&~i3&i4&sel4));
endmodule
