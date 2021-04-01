`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2017 09:31:34 AM
// Design Name: 
// Module Name: central_router
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


module central_router(
    port,
    n,
    fifo_in,
    clk,
    rst
    );
    
    input wire [1:0] port;
    input wire [3:0] n;
    input wire [63:0] fifo_in;
    input wire clk;
    input wire rst;
    
    reg rd_en = 1;
    reg wr_en = 1;
    wire [63:0] fifo_out;
    wire empty;
    wire full;
    wire [3:0] fifo_counter;
    
    fifo1 buffer(rst, clk, rd_en, wr_en, fifo_in,
            fifo_out, empty, full, fifo_counter // Able to count more than depth
        );
    
    reg [3:0] src_addr;
    reg [3:0] dest_addr;
    
    always @(fifo_out) begin
        src_addr <= fifo_out[3:0];
        dest_addr <= fifo_out[7:4];
        $display("SRC AND DEST CHANGED.");
    end
    
    always @(negedge clk) begin
        $display("Central SRC:%b DEST:%b PORT:%b",src_addr,dest_addr,port);
    end
    
    //Call routing logic
    routelogic_center center();
    
endmodule
