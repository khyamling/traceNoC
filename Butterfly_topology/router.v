`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2017 11:57:24 AM
// Design Name: 
// Module Name: router
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


module router(
    fifo_in0, //up
    fifo_in1, //down
    level,
    out0,
    out1,
    clk,
    rst);


output wire [63:0] out0;
output wire [63:0] out1;

input wire [63:0] fifo_in0;
input wire [63:0] fifo_in1;
input wire level;
input wire clk;
input wire rst;
wire port0;
wire port1;

reg rd_en0 = 1;
reg rd_en1 = 1;
reg wr_en0 = 1;
reg wr_en1 = 1;
wire [63:0] fifo_out0;
wire [63:0] fifo_out1;
wire empty0;
wire empty1;
wire full0;
wire full1;
wire [3:0] fifo_counter0;
wire [3:0] fifo_counter1;

fifo1 buffer1 (rst, clk, rd_en1, wr_en1, fifo_in1, fifo_out1, empty1, full1, fifo_counter1);
fifo1 buffer2 (rst, clk, rd_en0, wr_en0, fifo_in0, fifo_out0, empty0, full0, fifo_counter0);

reg [2:0] src_addr0;
reg [2:0] dest_addr0;
always @(fifo_out0) begin
        src_addr0 <= fifo_out0[5:3];
        dest_addr0 <= fifo_out0[2:0];
        //$display("DEST ADDRESS AT PORT 0 CHANGED TO %b",dest_addr0);
end

reg [2:0] src_addr1;
reg [2:0] dest_addr1;
always @(fifo_out1) begin
        src_addr1 <= fifo_out1[5:3];
        dest_addr1 <= fifo_out1[2:0];
        //$display("DEST ADDRESS AT PORT 1 CHANGED TO %b",dest_addr1);
end

routing_logic r0 (src_addr0, dest_addr0, port0, level, clk, rst);
routing_logic r1 (src_addr1, dest_addr1, port1, level, clk, rst);

reg req0_0, req0_1;
reg req1_0, req1_1;

wire gnt0_1, gnt0_0;
wire gnt1_0, gnt1_1;

always @(posedge clk) begin
    if (port0 == 0) begin
        req0_0 <= 1;
    end
    else if (port0 == 1) begin
        req1_0 <= 1;
    end
end

always @(posedge clk) begin
    if (port1 == 0) begin
        req0_1 <= 1;
    end
    else if (port1 == 1) begin
        req1_1 <= 1;
    end
end

//call arbiter
arbiter0 a0 (gnt0_1,gnt0_0,req0_1,req0_0,clk,rst);
arbiter0 a1 (gnt1_1,gnt1_0,req1_1,req1_0,clk,rst);

reg sel0; 
reg sel1;

//assign select signal for crossbar
always @(posedge clk) begin
    if (gnt0_0 == 1) begin
        sel0 = 1'b0;
    end
    else if (gnt0_1 == 1) begin
        sel0 = 1'b1; //take packet from east
    end

    if (gnt1_0 == 1) begin
        sel1 = 1'b0;
    end
    else if (gnt1_1 == 1) begin
        sel1 = 1'b1; //take packet from east
    end
end



crossbar c1 (fifo_out0,fifo_out1,
      sel0, sel1,
      out0,out1,
      clk, rst
    );

endmodule
