`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2017 09:37:54 AM
// Design Name: 
// Module Name: routelogic_leaf
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


module routelogic_leaf(
    port,
    src_addr,
    dest_addr,
    clk,
    rst
    );

output reg [3:0] port;
input wire [3:0] src_addr;
input wire [3:0] dest_addr;
input wire clk;
input wire rst;

initial begin
    port = 2'b11;
end    

always @(src_addr or dest_addr) begin
    if (src_addr == dest_addr) begin
        //LOCAL PORT
        port <= 4'b0000;
    end
    else begin
        port <= 4'b0001;
    end
end

endmodule
