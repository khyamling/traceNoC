`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2017 11:57:24 AM
// Design Name: 
// Module Name: routing_logic
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


module routing_logic(
    src_addr, dest_addr, port, level, clk, rst);

output reg port;
  
input wire [2:0] src_addr;
input wire [2:0] dest_addr;
input wire clk;
input wire rst;
input wire level;

initial begin
    port <= 0;
    
end

always @(posedge clk) begin
    if ((src_addr[level] ^ dest_addr[level]) == 0) begin
        port <= 0;
        //$display("ADDR:%b SRC: %b ADDR:%b DEST:%b PORT:%b LEVEL:%b",src_addr, src_addr[level], dest_addr, dest_addr[level], port, level);
    end
    else if((src_addr[level] ^ dest_addr[level]) == 1) begin
        port <= 1;
        //$display("ADDR:%b SRC: %b ADDR:%b DEST:%b PORT:%b LEVEL:%b",src_addr, src_addr[level], dest_addr, dest_addr[level], port, level);
    end
end

endmodule
