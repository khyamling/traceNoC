`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2017 11:57:24 AM
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


module topology();

reg clk;
reg rst;

wire [7:0] w0;
wire [7:0] w1;
wire [7:0] w2;
wire [7:0] w3;
//wire [7:0] w4;
//wire [7:0] w5;
//wire [7:0] w6;
//wire [7:0] w7;

reg level0;
reg level1;
reg level2;

reg [63:0] in_fifo0;
reg [63:0] in_fifo1;
reg [63:0] in_fifo2;
reg [63:0] in_fifo3;
//reg [63:0] in_fifo4;
//reg [63:0] in_fifo5;
//reg [63:0] in_fifo6;
//reg [63:0] in_fifo7;

reg [63:0] in_fifo10;
reg [63:0] in_fifo11;
reg [63:0] in_fifo12;
reg [63:0] in_fifo13;
//reg [63:0] in_fifo14;
//reg [63:0] in_fifo15;
//reg [63:0] in_fifo16;
//reg [63:0] in_fifo17;

//reg [63:0] in_fifo20;
//reg [63:0] in_fifo21;
//reg [63:0] in_fifo22;
//reg [63:0] in_fifo23;
//reg [63:0] in_fifo24;
//reg [63:0] in_fifo25;
//reg [63:0] in_fifo26;
//reg [63:0] in_fifo27;

wire [63:0] out00;
wire [63:0] out01;
wire [63:0] out02;
wire [63:0] out03;
//wire [63:0] out04;
//wire [63:0] out05;
//wire [63:0] out06;
//wire [63:0] out07;

wire [63:0] out10;
wire [63:0] out11;
wire [63:0] out12;
wire [63:0] out13;
//wire [63:0] out14;
//wire [63:0] out15;
//wire [63:0] out16;
//wire [63:0] out17;

/*
wire [63:0] out20;
wire [63:0] out21;
wire [63:0] out22;
wire [63:0] out23;
wire [63:0] out24;
wire [63:0] out25;
wire [63:0] out26;
wire [63:0] out27;*/

initial begin
    clk <= 1;
    rst <= 1;
    level0 <= 0;
    level1 <= 1;
    //level2 <= 2;
        
    #120 $finish;
end

always begin
    #2 clk = ~clk;
end

always @(negedge clk) begin
    rst = 0;
end

always @(posedge clk) begin
    in_fifo0 <= w0;
    in_fifo1 <= w1;
    in_fifo2 <= w2;
    in_fifo3 <= w3;
end

always @(posedge clk) begin
    in_fifo10 <= out00;
    in_fifo11 <= out02;
    in_fifo12 <= out01;
    in_fifo13 <= out03;
end

/*
always @(posedge clk) begin
    in_fifo4 <= w4;
    in_fifo5 <= w5;
    in_fifo6 <= w6;
    in_fifo7 <= w7;
end*/

/*
always @(posedge clk) begin
    in_fifo14 <= out01;
    in_fifo15 <= out05;
    in_fifo16 <= out03;
    in_fifo17 <= out07;
end*/

/*
always @(posedge clk) begin
    in_fifo10 <= out00;
    in_fifo11 <= out04;
    in_fifo12 <= out02;
    in_fifo13 <= out06;
end*/

//always @(posedge clk) begin
//    in_fifo20 <= out10;
//    in_fifo21 <= out12;
//    in_fifo22 <= out11;
//    in_fifo23 <= out13;
//end

//always @(posedge clk) begin
//    in_fifo24 <= out14;
//    in_fifo25 <= out16;
//    in_fifo26 <= out15;
//    in_fifo27 <= out17;
//end

//always @(posedge clk) begin
//    $display("in00 %b",in_fifo0);
//    $display("in01 %b",in_fifo1);
//    $display("in02 %b",in_fifo2);
//    $display("in03 %b",in_fifo3);
//    $display("in04 %b",in_fifo4);
//    $display("in05 %b",in_fifo5);
//    $display("in06 %b",in_fifo6);
//    $display("in07 %b",in_fifo7);             
//end

//always @(posedge clk) begin
//    $display("out20 %b",out20);
//    $display("out21 %b",out21);
//    $display("out22 %b",out22);
//    $display("out23 %b",out23);
//    $display("out24 %b",out24);
//    $display("out25 %b",out25);
//    $display("out26 %b",out26);
//    $display("out27 %b",out27);             
//end

lfsr7 ip0(w0, clk, rst);
lfsr7 ip1(w1, clk, rst);

lfsr7 ip2(w2, clk, rst);
lfsr7 ip3(w3, clk, rst);

//lfsr7 ip4(w4, clk, rst);
//lfsr7 ip5(w5, clk, rst);

//lfsr7 ip6(w6, clk, rst);
//lfsr7 ip7(w7, clk, rst);

//level 0 routers
router r00(
        in_fifo0, //up
        in_fifo1, //down
        level0,
        out00,
        out01,
        clk,
        rst);
        
router r01(
        in_fifo2, //up
        in_fifo3, //down
        level0,
        out02,
        out03,
        clk,
        rst);
        
//router r02(
//        in_fifo4, //up
//        in_fifo5, //down
//        level0,
//        out04,
//        out05,
//        clk,
//        rst);
        
//router r03(
//        in_fifo6, //up
//        in_fifo7, //down
//        level0,
//        out06,
//        out07,
//        clk,
//        rst);
        
//level 1 routers
router r10(
        in_fifo10, //up
        in_fifo11, //down
        level1,
        out10,
        out11,
        clk,
        rst);
        
router r11(
        in_fifo12, //up
        in_fifo13, //down
        level1,
        out12,
        out13,
        clk,
        rst);
        
//router r12(
//        in_fifo14, //up
//        in_fifo15, //down
//        level1,
//        out14,
//        out15,
//        clk,
//        rst);
        
//router r13(
//        in_fifo16, //up
//        in_fifo17, //down
//        level1,
//        out16,
//        out17,
//        clk,
//        rst);
        
////level 1 routers
//router r20(
//        in_fifo20, //up
//        in_fifo21, //down
//        level2,
//        out20,
//        out21,
//        clk,
//        rst);
        
//router r21(
//        in_fifo22, //up
//        in_fifo23, //down
//        level2,
//        out22,
//        out23,
//        clk,
//        rst);
        
//router r22(
//        in_fifo24, //up
//        in_fifo25, //down
//        level2,
//        out24,
//        out25,
//        clk,
//        rst);
        
//router r23(
//        in_fifo26, //up
//        in_fifo27, //down
//        level2,
//        out26,
//        out27,
//        clk,
//        rst);
endmodule