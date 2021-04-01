`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2018 02:54:17 PM
// Design Name: 
// Module Name: node
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


module node(
    clk, ctr, node_addr, packet
    );
    
    input clk;
    input wire [31:0] ctr;
    input wire [3:0] node_addr;
    output reg [7:0] packet;
    
    wire [3:0] src;
    wire [3:0] dest;
    wire [32:0] cycle;
    
    traffic_gen t1(clk, ctr, src, dest, cycle);
    
    always @(ctr) begin
        if (node_addr == src) begin
            packet[3:0] <= src;
            packet[7:4] <= dest;
        end
    end 
endmodule
