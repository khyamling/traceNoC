`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2017 09:51:37 PM
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


module topology(out1[7:0], out2[7:0], out3[7:0], out4[7:0],
    out5[7:0], out6[7:0], out7[7:0], out8[7:0] );

reg clk;
reg rst;

reg [3:0] src_addr1;
reg [3:0] src_addr2;
reg [3:0] src_addr3;
reg [3:0] src_addr4;
reg [3:0] src_addr5;
reg [3:0] src_addr6;
reg [3:0] src_addr7;
reg [3:0] src_addr8;

wire [7:0] w1;
wire [7:0] w2;
wire [7:0] w3;
wire [7:0] w4;
wire [7:0] w5;
wire [7:0] w6;
wire [7:0] w7;
wire [7:0] w8;

reg [63:0] in_fifo1;
reg [63:0] in_fifo_east1;
reg [63:0] in_fifo_west1;

reg [63:0] in_fifo2;
reg [63:0] in_fifo_east2;
reg [63:0] in_fifo_west2;

reg [63:0] in_fifo3;
reg [63:0] in_fifo_east3;
reg [63:0] in_fifo_west3;

reg [63:0] in_fifo4;
reg [63:0] in_fifo_east4;
reg [63:0] in_fifo_west4;

reg [63:0] in_fifo5;
reg [63:0] in_fifo_east5;
reg [63:0] in_fifo_west5;

reg [63:0] in_fifo6;
reg [63:0] in_fifo_east6;
reg [63:0] in_fifo_west6;

reg [63:0] in_fifo7;
reg [63:0] in_fifo_east7;
reg [63:0] in_fifo_west7;

reg [63:0] in_fifo8;
reg [63:0] in_fifo_east8;
reg [63:0] in_fifo_west8;

output wire [63:0] out1;
wire [63:0] out_east1;
wire [63:0] out_west1;

output wire [63:0] out2;
wire [63:0] out_east2;
wire [63:0] out_west2;

output wire [63:0] out3;
wire [63:0] out_east3;
wire [63:0] out_west3;

output wire [63:0] out4;
wire [63:0] out_east4;
wire [63:0] out_west4;

output wire [63:0] out5;
wire [63:0] out_east5;
wire [63:0] out_west5;

output wire [63:0] out6;
wire [63:0] out_east6;
wire [63:0] out_west6;

output wire [63:0] out7;
wire [63:0] out_east7;
wire [63:0] out_west7;

output wire [63:0] out8;
wire [63:0] out_east8;
wire [63:0] out_west8;

reg [3:0] n;


//traffic gen
//node
reg [31:0] ctr;
//wire [15:0] src;
//wire [15:0] dest;
//wire [127:0] cycle;
wire [31:0] packet;

initial begin
    clk = 1;
    rst = 1;
    //traffic gen 
    ctr <= 8'b0;
    n = 4'b1000;
    src_addr1 <= 4'b0000;
    src_addr2 <= 4'b0001;
    src_addr3 <= 4'b0010;
    src_addr4 <= 4'b0011;
    src_addr5 <= 4'b0100;
    src_addr6 <= 4'b0101;
    src_addr7 <= 4'b0110;
    src_addr8 <= 4'b0111;
    
    #120 $finish;
end

//reg [63:0] ram [0:3];
//initial begin
//  $readmemh("hello.mem", ram);
//end


node n1(clk, ctr, 4'b0000, w1);
node n2(clk, ctr, 4'b0001, w2);
node n3(clk, ctr, 4'b0010, w3);
node n4(clk, ctr, 4'b0011, w4);
node n5(clk, ctr, 4'b0100, w5);
node n6(clk, ctr, 4'b0101, w6);
node n7(clk, ctr, 4'b0110, w7);
node n8(clk, ctr, 4'b0111, w8);
always @(posedge clk) begin
     //$display(" VIGNESH %8b", w8);
//$display(" \n%%%%%%%%%%% %1h %1h %8h %%%%%%%%%%%%%%\n",src, dest, cycle);
//    $display(" \n%%%%%% %64b, %64b, %64b, %64b  %%%%%%%%%%%%%%\n",ram[0],ram[1],ram[2],ram[3]);
end


always begin
    #2 clk = ~clk;
end

always @(negedge clk) begin
    rst = 0;
    ctr=ctr+8'b00000001;
end

always @(posedge clk) begin
    in_fifo1 <= w1;
    in_fifo2 <= w2;
    in_fifo3 <= w3; 
    in_fifo4 <= w4;
    in_fifo5 <= w5;
    in_fifo6 <= w6;
    in_fifo7 <= w7; 
    in_fifo8 <= w8;
end

always @(posedge clk) begin
    //assign input for routers
   in_fifo_west2 <= out_east1;
   in_fifo_east8 <= out_west1;

   in_fifo_west3 <= out_east2;
   in_fifo_east1 <= out_west2;

   in_fifo_west4 <= out_east3;
   in_fifo_east2 <= out_west3;
   
   in_fifo_west5 <= out_east4;
   in_fifo_east3 <= out_west4;

   in_fifo_west6 <= out_east5;
   in_fifo_east4 <= out_west5;
   
   in_fifo_west7 <= out_east6;
   in_fifo_east5 <= out_west6;

   in_fifo_west8 <= out_east7;
   in_fifo_east6 <= out_west7;
   
   in_fifo_west1 <= out_east8;
   in_fifo_east7 <= out_west8;
end


//lfsr7 ip1(w1, clk, rst);
//lfsr7 ip2(w2, clk, rst);
//lfsr7 ip3(w3, clk, rst);
//lfsr7 ip4(w4, clk, rst);
//lfsr7 ip5(w5, clk, rst);
//lfsr7 ip6(w6, clk, rst);
//lfsr7 ip7(w7, clk, rst);
//lfsr7 ip8(w8, clk, rst);

router r1(
        src_addr1,
        n,
        in_fifo1, //local
        in_fifo_east1, //east
        in_fifo_west1, //west
        out1,
        out_east1,
        out_west1,
        clk,
        rst);
router r2(
        src_addr2,
        n,
        in_fifo2, //local
        in_fifo_east2, //east
        in_fifo_west2, //west
        out2,
        out_east2,
        out_west2,
        clk,
        rst);
router r3(
        src_addr3,
        n,
        in_fifo3, //local
        in_fifo_east3, //east
        in_fifo_west3, //west
        out3,
        out_east3,
        out_west3,
        clk,
        rst);
        
router r4(
        src_addr4,
        n,
        in_fifo4, //local
        in_fifo_east4, //east
        in_fifo_west4, //west
        out4,
        out_east4,
        out_west4,
        clk,
        rst);
router r5(
        src_addr5,
        n,
        in_fifo5, //local
        in_fifo_east5, //east
        in_fifo_west5, //west
        out5,
        out_east5,
        out_west5,
        clk,
        rst);
router r6(
        src_addr6,
        n,
        in_fifo6, //local
        in_fifo_east6, //east
        in_fifo_west6, //west
        out6,
        out_east6,
        out_west6,
        clk,
        rst);

router r7(
        src_addr7,
        n,
        in_fifo7, //local
        in_fifo_east7, //east
        in_fifo_west7, //west
        out7,
        out_east7,
        out_west7,
        clk,
        rst);
router r8(
        src_addr8,
        n,
        in_fifo8, //local
        in_fifo_east8, //east
        in_fifo_west8, //west
        out8,
        out_east8,
        out_west8,
        clk,
        rst);

endmodule
