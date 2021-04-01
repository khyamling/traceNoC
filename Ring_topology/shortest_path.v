`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2017 10:24:30 PM
// Design Name: 
// Module Name: shortest_path
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

module shortest_path(
    port,
    src_addr,
    dest_addr,
    n,
    clk,
    rst
    );

output reg [1:0] port;
input wire [3:0] src_addr;
input wire [3:0] dest_addr;
input wire [3:0] n;
input wire clk;
input wire rst;
reg [3:0] diff;
reg [3:0] ndiff;

initial begin
    port = 2'b11;
    diff = 4'b0000;
    ndiff = 4'b0000;
end
   
always @(posedge clk) begin
    if (src_addr == dest_addr) begin
        diff <= 4'b0000;
        ndiff <= n;
        $display("diff = 0 %d %d ",src_addr,dest_addr);
    end
    else if (src_addr > dest_addr) begin
        diff = src_addr - dest_addr;
        ndiff = n - diff;
        $display("diff = s-d %d %d ",src_addr,dest_addr);
    end
    else if (dest_addr > src_addr) begin
        diff = dest_addr - src_addr;
        ndiff = n - diff; 
        $display("diff = d - s %d %d ",src_addr,dest_addr);
    end
    
    //ndiff <= n - diff;
    if (diff != 0) begin
        if (dest_addr < src_addr) begin
            if (diff >= ndiff) begin
                //EAST PORT
                port = 2'b10;
                $display("d<s EAST %b %b %d %d",src_addr, dest_addr, diff, ndiff);
            end
            else if (diff < ndiff) begin
                //WEST PORT
                port = 2'b01;
                $display("d<s WEST %b %b %d %d",src_addr, dest_addr, diff, ndiff);
            end
        end
        else if (dest_addr > src_addr) begin
            if (diff >= ndiff) begin
                //WEST PORT
                port = 2'b01;
                $display("d>s WEST %b %b %d %d",src_addr, dest_addr, diff, ndiff);
            end
            else if (diff < ndiff) begin
                //EAST PORT
                port = 2'b10;
                $display("d>s EAST %b %b %d %d",src_addr, dest_addr, diff, ndiff);
            end
        end
    end
    else begin
        //LOCAL PORT
        port = 2'b00;
        $display("LOCAL %b %b",src_addr, dest_addr);
    end
    
end
    
endmodule