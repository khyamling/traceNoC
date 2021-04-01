`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2017 09:23:24 AM
// Design Name: 
// Module Name: topology
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


module topology(

    );

reg clk;
reg rst;
wire [7:0] w1;
reg [63:0] in_fifo;
reg [3:0] n;
wire [3:0] port;

initial begin
    clk = 1;
    rst = 1;
    n = 4'b0101;
    
    #40 $finish;
end

always begin
    #2 clk = ~clk;
end

always @(negedge clk) begin
    rst = 0;
end

always @(w1) begin
    in_fifo <= w1;   
end

lfsr7 ip1(w1, clk, rst);
router r1 (port,in_fifo,clk, rst);

//central_router central(port, n, in_fifo, clk, rst );

endmodule
