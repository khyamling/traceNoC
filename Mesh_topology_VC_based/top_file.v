`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2017 12:50:43 PM
// Design Name: 
// Module Name: top_file
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


module top_file(
    );
//pins

reg clk;
reg rst;
reg [31:0] ctr;
//reg [7:0] in1;
//reg [7:0] in2;
//reg [7:0] in3;

wire [7:0] out1;
//wire [7:0] out2;
//wire [7:0] out3;

//packets to be received to node | traffic generated
wire [14:0] pkt0, pkt1, pkt2, pkt3, pkt4, pkt5, pkt6, pkt7;
wire [14:0] pkt8, pkt9, pkt10, pkt11, pkt12, pkt13, pkt14, pkt15;

reg [3:0] rtr_addr0=4'b0000;
reg [3:0] rtr_addr1=4'b0001;
reg [3:0] rtr_addr2=4'b0010; 
reg [3:0] rtr_addr3=4'b0011;
reg [3:0] rtr_addr4=4'b0100;
reg [3:0] rtr_addr5=4'b0101;
reg [3:0] rtr_addr6=4'b0110;
reg [3:0] rtr_addr7=4'b0111;
reg [3:0] rtr_addr8=4'b1000;
reg [3:0] rtr_addr9=4'b1001;
reg [3:0] rtr_addr10=4'b1010;
reg [3:0] rtr_addr11=4'b1011;
reg [3:0] rtr_addr12=4'b1100;
reg [3:0] rtr_addr13=4'b1101;
reg [3:0] rtr_addr14=4'b1110;
reg [3:0] rtr_addr15=4'b1111;

reg [14:0] in_fifo00, in_fifo01, in_fifo02, in_fifo03, in_fifo04;
wire [14:0] out_fifo00,out_fifo01,out_fifo02,out_fifo03,out_fifo04;

reg [14:0] in_fifo10, in_fifo11, in_fifo12, in_fifo13, in_fifo14;
wire [14:0] out_fifo10,out_fifo11,out_fifo12,out_fifo13,out_fifo14;

reg [14:0] in_fifo20, in_fifo21, in_fifo22, in_fifo23, in_fifo24;
wire [14:0] out_fifo20,out_fifo21,out_fifo22,out_fifo23,out_fifo24;

reg [14:0] in_fifo30, in_fifo31, in_fifo32, in_fifo33, in_fifo34;
wire [14:0] out_fifo30,out_fifo31,out_fifo32,out_fifo33,out_fifo34;

reg [14:0] in_fifo40, in_fifo41, in_fifo42, in_fifo43, in_fifo44;
wire [14:0] out_fifo40,out_fifo41,out_fifo42,out_fifo43,out_fifo44;

reg [14:0] in_fifo50, in_fifo51, in_fifo52, in_fifo53, in_fifo54;
wire [14:0] out_fifo50,out_fifo51,out_fifo52,out_fifo53,out_fifo54;


reg [14:0] in_fifo60, in_fifo61, in_fifo62, in_fifo63, in_fifo64;
wire [14:0] out_fifo60,out_fifo61,out_fifo62,out_fifo63,out_fifo64;

reg [14:0] in_fifo70, in_fifo71, in_fifo72, in_fifo73, in_fifo74;
wire [14:0] out_fifo70,out_fifo71,out_fifo72,out_fifo73,out_fifo74;

reg [14:0] in_fifo80, in_fifo81, in_fifo82, in_fifo83, in_fifo84;
wire [14:0] out_fifo80,out_fifo81,out_fifo82,out_fifo83,out_fifo84;

reg [14:0] in_fifo90, in_fifo91, in_fifo92, in_fifo93, in_fifo94;
wire [14:0] out_fifo90,out_fifo91,out_fifo92,out_fifo93,out_fifo94;

reg [14:0] in_fifo100, in_fifo101, in_fifo102, in_fifo103, in_fifo104;
wire [14:0] out_fifo100,out_fifo101,out_fifo102,out_fifo103,out_fifo104;

reg [14:0] in_fifo110, in_fifo111, in_fifo112, in_fifo113, in_fifo114;
wire [14:0] out_fifo110,out_fifo111,out_fifo112,out_fifo113,out_fifo114;

reg [14:0] in_fifo120, in_fifo121, in_fifo122, in_fifo123, in_fifo124;
wire [14:0] out_fifo120,out_fifo121,out_fifo122,out_fifo123,out_fifo124;

reg [14:0] in_fifo130, in_fifo131, in_fifo132, in_fifo133, in_fifo134;
wire [14:0] out_fifo130,out_fifo131,out_fifo132,out_fifo133,out_fifo134;

reg [14:0] in_fifo140, in_fifo141, in_fifo142, in_fifo143, in_fifo144;
wire [14:0] out_fifo140,out_fifo141,out_fifo142,out_fifo143,out_fifo144;

reg [14:0] in_fifo150, in_fifo151, in_fifo152, in_fifo153, in_fifo154;
wire [14:0] out_fifo150,out_fifo151,out_fifo152,out_fifo153,out_fifo154;



reg [7:0] packet;
wire [3:0] src;
wire [3:0] dest;
    

initial begin 
clk=1;
rst=1;
ctr=0;





#500 $finish;
end

always begin
#2 clk = ~clk;
 //in_fifo00 <= packet;

 //in_fifo01 <= 64'b11001000;
 //in_fifo02 <= 64'b00000010;
 //in_fifo03 <= 64'b10001100;
 //in_fifo04 <= 64'b00110000;
//in_fifo00 <= w1;
end


always @(posedge clk) begin
ctr = ctr+1; 

$display("VIGNESH %h %h\n",in_fifo50,out_fifo52);

//assigning generated traffic to router
in_fifo00 <= pkt0; in_fifo10 <= pkt1; in_fifo20 <= pkt2; in_fifo30 <= pkt3;
in_fifo40 <= pkt4; in_fifo50 <= pkt5; in_fifo60 <= pkt6; in_fifo70 <= pkt7;
in_fifo80 <= pkt8; in_fifo90 <= pkt9; in_fifo100 <= pkt10; in_fifo110 <= pkt11;
in_fifo120 <= pkt12; in_fifo130 <= pkt13; in_fifo140 <= pkt14; in_fifo150 <= pkt15;


//x-direction links
in_fifo14 <= out_fifo02; in_fifo02 <= out_fifo14;
in_fifo24 <= out_fifo12; in_fifo12 <= out_fifo24;
in_fifo34 <= out_fifo22; in_fifo22 <= out_fifo34;
in_fifo54 <= out_fifo42; in_fifo42 <= out_fifo54;
in_fifo64 <= out_fifo52; in_fifo52 <= out_fifo64;
in_fifo74 <= out_fifo62; in_fifo62 <= out_fifo74;
in_fifo94 <= out_fifo82; in_fifo82 <= out_fifo94;
in_fifo104 <= out_fifo92; in_fifo92 <= out_fifo104;
in_fifo114 <= out_fifo102; in_fifo102 <= out_fifo114;
in_fifo134 <= out_fifo122; in_fifo122 <= out_fifo134;
in_fifo144 <= out_fifo132; in_fifo132 <= out_fifo144;
in_fifo154 <= out_fifo142; in_fifo142 <= out_fifo154;

//y-direction links
in_fifo41 <= out_fifo03; in_fifo03 <= out_fifo41; 
in_fifo81 <= out_fifo43; in_fifo43 <= out_fifo81;
in_fifo121 <= out_fifo83; in_fifo83 <= out_fifo121; 
in_fifo51 <= out_fifo13; in_fifo13 <= out_fifo51;
in_fifo91 <= out_fifo53; in_fifo53 <= out_fifo91;
in_fifo131 <= out_fifo93; in_fifo93 <= out_fifo131;
in_fifo61 <= out_fifo23; in_fifo23 <= out_fifo61;
in_fifo101 <= out_fifo63; in_fifo63 <= out_fifo101;
in_fifo141 <= out_fifo103; in_fifo103 <= out_fifo141;
in_fifo71 <= out_fifo33; in_fifo33 <= out_fifo71;
in_fifo111 <= out_fifo73; in_fifo73 <= out_fifo111;
in_fifo151 <= out_fifo113; in_fifo113 <= out_fifo151; 
 
end 

//traffic generator
//lfsr7 my_traffic1(w1, clk, rst);
//lfsr7 my_traffic2(w2, clk, rst);
//lfsr7 my_traffic3(w3, clk, rst);

//reading traffic from trace file
//traffic_gen t1(clk, ctr, src, dest, cycle);

reg [63:0] p0, p1, p2, p3, p4, p5, p6, p7;
reg [63:0] p8, p9, p10, p11, p12, p13, p14, p15;

//initializing nodes
node n0(clk, ctr, rtr_addr0, pkt0, p0);
node n1(clk, ctr, rtr_addr1, pkt1, p1);
node n2(clk, ctr, rtr_addr2, pkt2, p2);
node n3(clk, ctr, rtr_addr3, pkt3, p3);
node n4(clk, ctr, rtr_addr4, pkt4, p4);
node n5(clk, ctr, rtr_addr5, pkt5, p5);
node n6(clk, ctr, rtr_addr6, pkt6, p6);
node n7(clk, ctr, rtr_addr7, pkt7, p7);
node n8(clk, ctr, rtr_addr8, pkt8, p8);
node n9(clk, ctr, rtr_addr9, pkt9, p9);
node n10(clk, ctr, rtr_addr10, pkt10, p10);
node n11(clk, ctr, rtr_addr11, pkt11, p11);
node n12(clk, ctr, rtr_addr12, pkt12, p12);
node n13(clk, ctr, rtr_addr13, pkt13, p13);
node n14(clk, ctr, rtr_addr14, pkt14, p14);
node n15(clk, ctr, rtr_addr15, pkt15, p15);



//YANOC ROUTER DECLARATIONS
//r0
wire [1:0] north_out_credit00,east_out_credit00,west_out_credit00,south_out_credit00,local_out_credit00;
reg [1:0] north_in_credit00,east_in_credit00,west_in_credit00,south_in_credit00,local_in_credit00;
wire north_out_wr00, east_out_wr00,west_out_wr00,south_out_wr00,local_out_wr00;
reg north_in_wr00,east_in_wr00,west_in_wr00,south_in_wr00,local_in_wr00;

//r1
wire [1:0] north_out_credit01,east_out_credit01,west_out_credit01,south_out_credit01,local_out_credit01;
reg [1:0] north_in_credit01,east_in_credit01,west_in_credit01,south_in_credit01,local_in_credit01;
wire north_out_wr01, east_out_wr01,west_out_wr01,south_out_wr01,local_out_wr01;
reg north_in_wr01,east_in_wr01,west_in_wr01,south_in_wr01,local_in_wr01;

//r2
wire [1:0] north_out_credit02,east_out_credit02,west_out_credit02,south_out_credit02,local_out_credit02;
reg [1:0] north_in_credit02,east_in_credit02,west_in_credit02,south_in_credit02,local_in_credit02;
wire north_out_wr02, east_out_wr02,west_out_wr02,south_out_wr02,local_out_wr02;
reg north_in_wr02,east_in_wr02,west_in_wr02,south_in_wr02,local_in_wr02;

//r3 
wire [1:0] north_out_credit03,east_out_credit03,west_out_credit03,south_out_credit03,local_out_credit03;
reg [1:0] north_in_credit03,east_in_credit03,west_in_credit03,south_in_credit03,local_in_credit03;
wire north_out_wr03, east_out_wr03,west_out_wr03,south_out_wr03,local_out_wr03;
reg north_in_wr03,east_in_wr03,west_in_wr03,south_in_wr03,local_in_wr03;

//r4
wire [1:0] north_out_credit04,east_out_credit04,west_out_credit04,south_out_credit04,local_out_credit04;
reg [1:0] north_in_credit04,east_in_credit04,west_in_credit04,south_in_credit04,local_in_credit04;
wire north_out_wr04, east_out_wr04,west_out_wr04,south_out_wr04,local_out_wr04;
reg north_in_wr04,east_in_wr04,west_in_wr04,south_in_wr04,local_in_wr04;

//r5
wire [1:0] north_out_credit05,east_out_credit05,west_out_credit05,south_out_credit05,local_out_credit05;
reg [1:0] north_in_credit05,east_in_credit05,west_in_credit05,south_in_credit05,local_in_credit05;
wire north_out_wr05, east_out_wr05,west_out_wr05,south_out_wr05,local_out_wr05;
reg north_in_wr05,east_in_wr05,west_in_wr05,south_in_wr05,local_in_wr05;

//r6
wire [1:0] north_out_credit06,east_out_credit06,west_out_credit06,south_out_credit06,local_out_credit06;
reg [1:0] north_in_credit06,east_in_credit06,west_in_credit06,south_in_credit06,local_in_credit06;
wire north_out_wr06, east_out_wr06,west_out_wr06,south_out_wr06,local_out_wr06;
reg north_in_wr06,east_in_wr06,west_in_wr06,south_in_wr06,local_in_wr06;

//r7
wire [1:0] north_out_credit07,east_out_credit07,west_out_credit07,south_out_credit07,local_out_credit07;
reg [1:0] north_in_credit07,east_in_credit07,west_in_credit07,south_in_credit07,local_in_credit07;
wire north_out_wr07, east_out_wr07,west_out_wr07,south_out_wr07,local_out_wr07;
reg north_in_wr07,east_in_wr07,west_in_wr07,south_in_wr07,local_in_wr07;

//r8 
wire [1:0] north_out_credit08,east_out_credit08,west_out_credit08,south_out_credit08,local_out_credit08;
reg [1:0] north_in_credit08,east_in_credit08,west_in_credit08,south_in_credit08,local_in_credit08;
wire north_out_wr08, east_out_wr08,west_out_wr08,south_out_wr08,local_out_wr08;
reg north_in_wr08,east_in_wr08,west_in_wr08,south_in_wr08,local_in_wr08;

//r9
wire [1:0] north_out_credit09,east_out_credit09,west_out_credit09,south_out_credit09,local_out_credit09;
reg [1:0] north_in_credit09,east_in_credit09,west_in_credit09,south_in_credit09,local_in_credit09;
wire north_out_wr09, east_out_wr09,west_out_wr09,south_out_wr09,local_out_wr09;
reg north_in_wr09,east_in_wr09,west_in_wr09,south_in_wr09,local_in_wr09;

//r10
wire [1:0] north_out_credit10,east_out_credit10,west_out_credit10,south_out_credit10,local_out_credit10;
reg [1:0] north_in_credit10,east_in_credit10,west_in_credit10,south_in_credit10,local_in_credit10;
wire north_out_wr10, east_out_wr10,west_out_wr10,south_out_wr10,local_out_wr10;
reg north_in_wr10,east_in_wr10,west_in_wr10,south_in_wr10,local_in_wr10;

//r11
wire [1:0] north_out_credit11,east_out_credit11,west_out_credit11,south_out_credit11,local_out_credit11;
reg [1:0] north_in_credit11,east_in_credit11,west_in_credit11,south_in_credit11,local_in_credit11;
wire north_out_wr11, east_out_wr11,west_out_wr11,south_out_wr11,local_out_wr11;
reg north_in_wr11,east_in_wr11,west_in_wr11,south_in_wr11,local_in_wr11;

//r12
wire [1:0] north_out_credit12,east_out_credit12,west_out_credit12,south_out_credit12,local_out_credit12;
reg [1:0] north_in_credit12,east_in_credit12,west_in_credit12,south_in_credit12,local_in_credit12;
wire north_out_wr12, east_out_wr12, west_out_wr12, south_out_wr12, local_out_wr12;
reg north_in_wr12,east_in_wr12,west_in_wr12,south_in_wr12,local_in_wr12;


//r13
wire [1:0] north_out_credit13,east_out_credit13,west_out_credit13,south_out_credit13,local_out_credit13;
reg [1:0] north_in_credit13,east_in_credit13,west_in_credit13,south_in_credit13,local_in_credit13;
wire north_out_wr13, east_out_wr13,west_out_wr13,south_out_wr13,local_out_wr13;
reg north_in_wr13,east_in_wr13,west_in_wr13,south_in_wr13,local_in_wr13;


//r14
wire [1:0] north_out_credit14,east_out_credit14,west_out_credit14,south_out_credit14,local_out_credit14;
reg [1:0] north_in_credit14,east_in_credit14,west_in_credit14,south_in_credit14,local_in_credit14;
wire north_out_wr14, east_out_wr14,west_out_wr14,south_out_wr14,local_out_wr14;
reg north_in_wr14,east_in_wr14,west_in_wr14,south_in_wr14,local_in_wr14;


//r15
wire [1:0] north_out_credit15,east_out_credit15,west_out_credit15,south_out_credit15,local_out_credit15;
reg [1:0] north_in_credit15,east_in_credit15,west_in_credit15,south_in_credit15,local_in_credit15;
wire north_out_wr15, east_out_wr15,west_out_wr15,south_out_wr15,local_out_wr15;
reg north_in_wr15,east_in_wr15,west_in_wr15,south_in_wr15,local_in_wr15;

//

initial begin
north_in_credit00 <= 2'b0;
south_in_credit00 <= 2'b0;
east_in_credit00 <= 2'b0;
west_in_credit00 <= 2'b0;
local_in_credit00 <= 2'b0;

north_in_credit01 <= 2'b0;
south_in_credit01 <= 2'b0;
east_in_credit01<= 2'b0;
west_in_credit01 <= 2'b0;
local_in_credit01 <= 2'b0;

north_in_credit02 <= 2'b0;
south_in_credit02 <= 2'b0;
east_in_credit02<= 2'b0;
west_in_credit02 <= 2'b0;
local_in_credit02 <= 2'b0;

north_in_credit03 <= 2'b0;
south_in_credit03 <= 2'b0;
east_in_credit03 <= 2'b0;
west_in_credit03 <= 2'b0;
local_in_credit03 <= 2'b0;

north_in_credit04 <= 2'b0;
south_in_credit04 <= 2'b0;
east_in_credit04 <= 2'b0;
west_in_credit04 <= 2'b0;
local_in_credit04 <= 2'b0;

north_in_credit05 <= 2'b0;
south_in_credit05 <= 2'b0;
east_in_credit05 <= 2'b0;
west_in_credit05 <= 2'b0;
local_in_credit05 <= 2'b0;

north_in_credit06 <= 2'b0;
south_in_credit06 <= 2'b0;
east_in_credit06 <= 2'b0;
west_in_credit06 <= 2'b0;
local_in_credit06 <= 2'b0;

north_in_credit07 <= 2'b0;
south_in_credit07 <= 2'b0;
east_in_credit07 <= 2'b0;
west_in_credit07 <= 2'b0;
local_in_credit07 <= 2'b0;

north_in_credit08 <= 2'b0;
south_in_credit08 <= 2'b0;
east_in_credit08 <= 2'b0;
west_in_credit08 <= 2'b0;
local_in_credit08 <= 2'b0;

north_in_credit09 <= 2'b0;
south_in_credit09 <= 2'b0;
east_in_credit09 <= 2'b0;
west_in_credit09 <= 2'b0;
local_in_credit09 <= 2'b0;

north_in_credit10 <= 2'b0;
south_in_credit10 <= 2'b0;
east_in_credit10 <= 2'b0;
west_in_credit10 <= 2'b0;
local_in_credit10 <= 2'b0;

north_in_credit11 <= 2'b0;
south_in_credit11 <= 2'b0;
east_in_credit11 <= 2'b0;
west_in_credit11 <= 2'b0;
local_in_credit11 <= 2'b0;

north_in_credit12 <= 2'b0;
south_in_credit12 <= 2'b0;
east_in_credit12 <= 2'b0;
west_in_credit12 <= 2'b0;
local_in_credit12 <= 2'b0;

north_in_credit13 <= 2'b0;
south_in_credit13 <= 2'b0;
east_in_credit13 <= 2'b0;
west_in_credit13 <= 2'b0;
local_in_credit13 <= 2'b0;

north_in_credit14 <= 2'b0;
south_in_credit14 <= 2'b0;
east_in_credit14 <= 2'b0;
west_in_credit14 <= 2'b0;
local_in_credit14 <= 2'b0;

north_in_credit15 <= 2'b0;
south_in_credit15 <= 2'b0;
east_in_credit15 <= 2'b0;
west_in_credit15 <= 2'b0;
local_in_credit15 <= 2'b0;

/*north_out_wr <= 1'b1;
east_out_wr <= 1'b1;
west_out_wr <= 1'b1;
south_out_wr <= 1'b1;
local_out_wr <= 1'b1;*/

north_in_wr00 <= 1'b1;
east_in_wr00 <= 1'b1;
west_in_wr00 <= 1'b1;
south_in_wr00 <= 1'b1;
local_in_wr00 <= 1'b1;

north_in_wr01 <= 1'b1;
east_in_wr01 <= 1'b1;
west_in_wr01 <= 1'b1;
south_in_wr01 <= 1'b1;
local_in_wr01 <= 1'b1;

north_in_wr02 <= 1'b1;
east_in_wr02 <= 1'b1;
west_in_wr02 <= 1'b1;
south_in_wr02 <= 1'b1;
local_in_wr02 <= 1'b1;

north_in_wr03 <= 1'b1;
east_in_wr03 <= 1'b1;
west_in_wr03 <= 1'b1;
south_in_wr03 <= 1'b1;
local_in_wr03 <= 1'b1;

north_in_wr04 <= 1'b1;
east_in_wr04 <= 1'b1;
west_in_wr04 <= 1'b1;
south_in_wr04 <= 1'b1;
local_in_wr04 <= 1'b1;

north_in_wr05 <= 1'b1;
east_in_wr05 <= 1'b1;
west_in_wr05 <= 1'b1;
south_in_wr05 <= 1'b1;
local_in_wr05 <= 1'b1;

north_in_wr06 <= 1'b1;
east_in_wr06 <= 1'b1;
west_in_wr06 <= 1'b1;
south_in_wr06 <= 1'b1;
local_in_wr06 <= 1'b1;

north_in_wr07 <= 1'b1;
east_in_wr07 <= 1'b1;
west_in_wr07 <= 1'b1;
south_in_wr07 <= 1'b1;
local_in_wr07 <= 1'b1;

north_in_wr08 <= 1'b1;
east_in_wr08 <= 1'b1;
west_in_wr08 <= 1'b1;
south_in_wr08 <= 1'b1;
local_in_wr08 <= 1'b1;

north_in_wr09 <= 1'b1;
east_in_wr09 <= 1'b1;
west_in_wr09 <= 1'b1;
south_in_wr09 <= 1'b1;
local_in_wr09 <= 1'b1;

north_in_wr10 <= 1'b1;
east_in_wr10 <= 1'b1;
west_in_wr10 <= 1'b1;
south_in_wr10 <= 1'b1;
local_in_wr10 <= 1'b1;

north_in_wr11 <= 1'b1;
east_in_wr11 <= 1'b1;
west_in_wr11 <= 1'b1;
south_in_wr11 <= 1'b1;
local_in_wr11 <= 1'b1;

north_in_wr12 <= 1'b1;
east_in_wr12 <= 1'b1;
west_in_wr12 <= 1'b1;
south_in_wr12 <= 1'b1;
local_in_wr12 <= 1'b1;

north_in_wr13 <= 1'b1;
east_in_wr13 <= 1'b1;
west_in_wr13 <= 1'b1;
south_in_wr13 <= 1'b1;
local_in_wr13 <= 1'b1;

north_in_wr14 <= 1'b1;
east_in_wr14 <= 1'b1;
west_in_wr14 <= 1'b1;
south_in_wr14 <= 1'b1;
local_in_wr14 <= 1'b1;

north_in_wr15 <= 1'b1;
east_in_wr15<= 1'b1;
west_in_wr15 <= 1'b1;
south_in_wr15 <= 1'b1;
local_in_wr15 <= 1'b1;
end

//row0
yanocrouter# ( .X_NODE_NUM(4),.Y_NODE_NUM(4), .SW_X_ADDR(0),.SW_Y_ADDR(0))
my_r00
(out_fifo01, out_fifo02,out_fifo04,out_fifo03,out_fifo00,
north_out_credit00, east_out_credit00, west_out_credit00, south_out_credit00, local_out_credit00,
north_out_wr00, east_out_wr00, west_out_wr00, south_out_wr00, local_out_wr00,
in_fifo01, in_fifo02, in_fifo04, in_fifo03, in_fifo00,
north_in_credit00, east_in_credit00, west_in_credit00, south_in_credit00, local_in_credit00,
north_in_wr00, east_in_wr00, west_in_wr00, south_in_wr00, local_in_wr00,
clk, rst);

yanocrouter# ( .X_NODE_NUM(4),.Y_NODE_NUM(4), .SW_X_ADDR(1),.SW_Y_ADDR(0))
my_r01
(out_fifo11, out_fifo12,out_fifo14,out_fifo13,out_fifo10,
north_out_credit01, east_out_credit01, west_out_credit01, south_out_credit01, local_out_credit01,
north_out_wr01, east_out_wr01, west_out_wr01, south_out_wr01, local_out_wr01,
in_fifo11, in_fifo12, in_fifo14, in_fifo13, in_fifo10,
north_in_credit01, east_in_credit01, west_in_credit01, south_in_credit01, local_in_credit01,
north_in_wr01, east_in_wr01, west_in_wr01, south_in_wr01, local_in_wr01,
clk, rst);

yanocrouter# ( .X_NODE_NUM(4),.Y_NODE_NUM(4), .SW_X_ADDR(2),.SW_Y_ADDR(0))
my_r02
(out_fifo21, out_fifo22,out_fifo24,out_fifo23,out_fifo20,
north_out_credit02, east_out_credit02, west_out_credit02, south_out_credit02, local_out_credit02,
north_out_wr02, east_out_wr02, west_out_wr02, south_out_wr02, local_out_wr02,
in_fifo21, in_fifo22, in_fifo24, in_fifo23, in_fifo20,
north_in_credit02, east_in_credit02, west_in_credit02, south_in_credit02, local_in_credit02,
north_in_wr02, east_in_wr02, west_in_wr02, south_in_wr02, local_in_wr02,
clk, rst);

yanocrouter# ( .X_NODE_NUM(4),.Y_NODE_NUM(4), .SW_X_ADDR(3),.SW_Y_ADDR(0))
my_r03
(out_fifo31, out_fifo32,out_fifo34,out_fifo33,out_fifo30,
north_out_credit03, east_out_credit03, west_out_credit03, south_out_credit03, local_out_credit03,
north_out_wr03, east_out_wr03, west_out_wr03, south_out_wr03, local_out_wr03,
in_fifo31, in_fifo32, in_fifo34, in_fifo33, in_fifo30,
north_in_credit03, east_in_credit03, west_in_credit03, south_in_credit03, local_in_credit03,
north_in_wr03, east_in_wr03, west_in_wr03, south_in_wr03, local_in_wr03,
clk, rst);

//row 2
yanocrouter# ( .X_NODE_NUM(4),.Y_NODE_NUM(4), .SW_X_ADDR(0),.SW_Y_ADDR(1))
my_r04
(out_fifo41, out_fifo42,out_fifo44,out_fifo43,out_fifo40,
north_out_credit04, east_out_credit04, west_out_credit04, south_out_credit04, local_out_credit04,
north_out_wr04, east_out_wr04, west_out_wr04, south_out_wr04, local_out_wr04,
in_fifo41, in_fifo42, in_fifo44, in_fifo43, in_fifo40,
north_in_credit04, east_in_credit04, west_in_credit04, south_in_credit04, local_in_credit04,
north_in_wr04, east_in_wr04, west_in_wr04, south_in_wr04, local_in_wr04,
clk, rst);

yanocrouter# ( .X_NODE_NUM(4),.Y_NODE_NUM(4), .SW_X_ADDR(1),.SW_Y_ADDR(1))
my_r05
(out_fifo51, out_fifo52,out_fifo54,out_fifo53,out_fifo50,
north_out_credit05, east_out_credit05, west_out_credit05, south_out_credit05, local_out_credit05,
north_out_wr05, east_out_wr05, west_out_wr05, south_out_wr05, local_out_wr05,
in_fifo51, in_fifo52, in_fifo54, in_fifo53, in_fifo50,
north_in_credit05, east_in_credit05, west_in_credit05, south_in_credit05, local_in_credit05,
north_in_wr05, east_in_wr05, west_in_wr05, south_in_wr05, local_in_wr05,
clk, rst);

yanocrouter# ( .X_NODE_NUM(4),.Y_NODE_NUM(4), .SW_X_ADDR(2),.SW_Y_ADDR(1))
my_r06
(out_fifo61, out_fifo62,out_fifo64,out_fifo63,out_fifo60,
north_out_credit06, east_out_credit06, west_out_credit06, south_out_credit06, local_out_credit06,
north_out_wr06, east_out_wr06, west_out_wr06, south_out_wr06, local_out_wr06,
in_fifo61, in_fifo62, in_fifo64, in_fifo63, in_fifo60,
north_in_credit06, east_in_credit06, west_in_credit06, south_in_credit06, local_in_credit06,
north_in_wr06, east_in_wr06, west_in_wr06, south_in_wr06, local_in_wr06,
clk, rst);

yanocrouter# ( .X_NODE_NUM(4),.Y_NODE_NUM(4), .SW_X_ADDR(3),.SW_Y_ADDR(1))
my_r07
(out_fifo71, out_fifo72,out_fifo74,out_fifo73,out_fifo70,
north_out_credit07, east_out_credit07, west_out_credit07, south_out_credit07, local_out_credit07,
north_out_wr07, east_out_wr07, west_out_wr07, south_out_wr07, local_out_wr07,
in_fifo71, in_fifo72, in_fifo74, in_fifo73, in_fifo70,
north_in_credit07, east_in_credit07, west_in_credit07, south_in_credit07, local_in_credit07,
north_in_wr07, east_in_wr07, west_in_wr07, south_in_wr07, local_in_wr07,
clk, rst);

//row 3
yanocrouter# ( .X_NODE_NUM(4),.Y_NODE_NUM(4), .SW_X_ADDR(0),.SW_Y_ADDR(2))
my_r08
(out_fifo81, out_fifo82,out_fifo84,out_fifo83,out_fifo80,
north_out_credit08, east_out_credit08, west_out_credit08, south_out_credit08, local_out_credit08,
north_out_wr08, east_out_wr08, west_out_wr08, south_out_wr08, local_out_wr08,
in_fifo81, in_fifo82, in_fifo84, in_fifo83, in_fifo80,
north_in_credit08, east_in_credit08, west_in_credit08, south_in_credit08, local_in_credit08,
north_in_wr08, east_in_wr08, west_in_wr08, south_in_wr08, local_in_wr08,
clk, rst);

yanocrouter# ( .X_NODE_NUM(4),.Y_NODE_NUM(4), .SW_X_ADDR(1),.SW_Y_ADDR(2))
my_r09
(out_fifo91, out_fifo92,out_fifo94,out_fifo93,out_fifo90,
north_out_credit09, east_out_credit09, west_out_credit09, south_out_credit09, local_out_credit09,
north_out_wr09, east_out_wr09, west_out_wr09, south_out_wr09, local_out_wr09,
in_fifo91, in_fifo92, in_fifo94, in_fifo93, in_fifo90,
north_in_credit09, east_in_credit09, west_in_credit09, south_in_credit09, local_in_credit09,
north_in_wr09, east_in_wr09, west_in_wr09, south_in_wr09, local_in_wr09,
clk, rst);

yanocrouter# ( .X_NODE_NUM(4),.Y_NODE_NUM(4), .SW_X_ADDR(2),.SW_Y_ADDR(2))
my_r10
(out_fifo101, out_fifo102,out_fifo104,out_fifo103,out_fifo100,
north_out_credit10, east_out_credit10, west_out_credit10, south_out_credit10, local_out_credit10,
north_out_wr10, east_out_wr10, west_out_wr10, south_out_wr10, local_out_wr10,
in_fifo101, in_fifo102, in_fifo104, in_fifo103, in_fifo100,
north_in_credit10, east_in_credit10, west_in_credit10, south_in_credit10, local_in_credit11,
north_in_wr10, east_in_wr10, west_in_wr10, south_in_wr10, local_in_wr10,
clk, rst);

yanocrouter# ( .X_NODE_NUM(4),.Y_NODE_NUM(4), .SW_X_ADDR(3),.SW_Y_ADDR(2))
my_r11
(out_fifo111, out_fifo112,out_fifo114,out_fifo113,out_fifo110,
north_out_credit11, east_out_credit11, west_out_credit11, south_out_credit11, local_out_credit11,
north_out_wr11, east_out_wr11, west_out_wr11, south_out_wr11, local_out_wr11,
in_fifo111, in_fifo112, in_fifo114, in_fifo113, in_fifo110,
north_in_credit11, east_in_credit11, west_in_credit11, south_in_credit11, local_in_credit11,
north_in_wr11, east_in_wr11, west_in_wr11, south_in_wr11, local_in_wr11,
clk, rst);

//row 4
yanocrouter# ( .X_NODE_NUM(4),.Y_NODE_NUM(4), .SW_X_ADDR(0),.SW_Y_ADDR(3))
my_r12
(out_fifo121, out_fifo122,out_fifo124,out_fifo123,out_fifo120,
north_out_credit12, east_out_credit12, west_out_credit12, south_out_credit12, local_out_credit12,
north_out_wr12, east_out_wr12, west_out_wr12, south_out_wr12, local_out_wr12,
in_fifo121, in_fifo122, in_fifo124, in_fifo123, in_fifo120,
north_in_credit12, east_in_credit12, west_in_credit12, south_in_credit12, local_in_credit12,
north_in_wr12, east_in_wr12, west_in_wr12, south_in_wr12, local_in_wr12,
clk, rst);

yanocrouter# ( .X_NODE_NUM(4),.Y_NODE_NUM(4), .SW_X_ADDR(1),.SW_Y_ADDR(3))
my_r13
(out_fifo131, out_fifo132,out_fifo134,out_fifo133,out_fifo130,
north_out_credit13, east_out_credit13, west_out_credit13, south_out_credit13, local_out_credit13,
north_out_wr13, east_out_wr13, west_out_wr13, south_out_wr13, local_out_wr13,
in_fifo131, in_fifo132, in_fifo134, in_fifo133, in_fifo130,
north_in_credit13, east_in_credit13, west_in_credit13, south_in_credit13, local_in_credit13,
north_in_wr13, east_in_wr13, west_in_wr13, south_in_wr13, local_in_wr13,
clk, rst);

yanocrouter# ( .X_NODE_NUM(4),.Y_NODE_NUM(4), .SW_X_ADDR(2),.SW_Y_ADDR(3))
my_r14
(out_fifo141, out_fifo142,out_fifo144,out_fifo143,out_fifo140,
north_out_credit14, east_out_credit14, west_out_credit14, south_out_credit14, local_out_credit14,
north_out_wr14, east_out_wr14, west_out_wr14, south_out_wr14, local_out_wr14,
in_fifo141, in_fifo142, in_fifo144, in_fifo143, in_fifo140,
north_in_credit14, east_in_credit14, west_in_credit14, south_in_credit14, local_in_credit14,
north_in_wr14, east_in_wr14, west_in_wr14, south_in_wr14, local_in_wr14,
clk, rst);

yanocrouter# ( .X_NODE_NUM(4),.Y_NODE_NUM(4), .SW_X_ADDR(3),.SW_Y_ADDR(3))
my_r15
(out_fifo151, out_fifo152,out_fifo154,out_fifo153,out_fifo150,
north_out_credit15, east_out_credit15, west_out_credit15, south_out_credit15, local_out_credit15,
north_out_wr15, east_out_wr15, west_out_wr15, south_out_wr15, local_out_wr15,
in_fifo151, in_fifo152, in_fifo154, in_fifo153, in_fifo150,
north_in_credit15, east_in_credit15, west_in_credit15, south_in_credit15, local_in_credit15,
north_in_wr15, east_in_wr15, west_in_wr15, south_in_wr15, local_in_wr15,
clk, rst);





/*
//router noc
noc_router my_r0(in_fifo00,in_fifo01,in_fifo02,in_fifo03,in_fifo04,
                 out_fifo00, out_fifo01,out_fifo02,out_fifo03,out_fifo04,
                  rtr_addr0*//*router address*//*,
                  clk, rst);
                  
noc_router my_r1(in_fifo10,in_fifo11,in_fifo12,in_fifo13,in_fifo14,
               out_fifo10, out_fifo11,out_fifo12,out_fifo13,out_fifo14,
               rtr_addr1,
                clk, rst);
                
noc_router my_r2(in_fifo20,in_fifo21,in_fifo22,in_fifo23,in_fifo24,
                 out_fifo20, out_fifo21,out_fifo22,out_fifo23,out_fifo24,
                  rtr_addr2*//*router address*//*,
                  clk, rst);
                                  
noc_router my_r3(in_fifo30,in_fifo31,in_fifo32,in_fifo33,in_fifo34,
               out_fifo30, out_fifo31,out_fifo32,out_fifo33,out_fifo34,
               rtr_addr3,
                clk, rst);

noc_router my_r4(in_fifo40,in_fifo41,in_fifo42,in_fifo43,in_fifo44,
                 out_fifo40, out_fifo41,out_fifo42,out_fifo43,out_fifo44,
                  rtr_addr4*//*router address*//*,
                  clk, rst);
                  
noc_router my_r5(in_fifo50,in_fifo51,in_fifo52,in_fifo53,in_fifo54,
               out_fifo50, out_fifo51,out_fifo52,out_fifo53,out_fifo54,
               rtr_addr5,
                clk, rst);

noc_router my_r6(in_fifo60,in_fifo61,in_fifo62,in_fifo63,in_fifo64,
               out_fifo60, out_fifo61,out_fifo62,out_fifo63,out_fifo64,
               rtr_addr6,
                clk, rst);
                

noc_router my_r7(in_fifo70,in_fifo71,in_fifo72,in_fifo73,in_fifo74,
             out_fifo70, out_fifo71,out_fifo72,out_fifo73,out_fifo74,
             rtr_addr7,
              clk, rst);

noc_router my_r8(in_fifo80,in_fifo81,in_fifo82,in_fifo83,in_fifo84,
            out_fifo80, out_fifo81,out_fifo82,out_fifo83,out_fifo84,
            rtr_addr8,
             clk, rst);  

noc_router my_r9(in_fifo90,in_fifo91,in_fifo92,in_fifo93,in_fifo94,
            out_fifo90, out_fifo91,out_fifo92,out_fifo93,out_fifo94,
            rtr_addr9,
            clk, rst);
            
noc_router my_r10(in_fifo100,in_fifo101,in_fifo102,in_fifo103,in_fifo104,
           out_fifo100, out_fifo101,out_fifo102,out_fifo103,out_fifo104,
           rtr_addr10,
           clk, rst);

noc_router my_r11(in_fifo110,in_fifo111,in_fifo112,in_fifo113,in_fifo114,
           out_fifo110, out_fifo111,out_fifo112,out_fifo113,out_fifo114,
           rtr_addr11,
            clk, rst);


noc_router my_r12(in_fifo120,in_fifo121,in_fifo122,in_fifo123,in_fifo124,
        out_fifo120, out_fifo121,out_fifo122,out_fifo123,out_fifo124,
        rtr_addr12,
        clk, rst);


              
noc_router my_r13(in_fifo130,in_fifo131,in_fifo132,in_fifo133,in_fifo134,
           out_fifo130, out_fifo131,out_fifo132,out_fifo133,out_fifo134,
           rtr_addr13,
            clk, rst);
            


noc_router my_r14(in_fifo140,in_fifo141,in_fifo142,in_fifo143,in_fifo144,
           out_fifo140, out_fifo141,out_fifo142,out_fifo143,out_fifo144,
           rtr_addr14,
            clk, rst);



noc_router my_r15(in_fifo150,in_fifo151,in_fifo152,in_fifo153,in_fifo154,
           out_fifo150, out_fifo151,out_fifo152,out_fifo153,out_fifo154,
           rtr_addr15,
            clk, rst);
*///noc_router my_r2(w2, out2, clk, rst);
//noc_router my_r3(w3, out3, clk);


/*always @(port) begin
$display ("%g\t %b      %b    %b             %b     %b        %b", $time, clk, xo_src, yo_src,  xn_src, yn_src, port);
end*/

always@(negedge clk)
begin
rst=0;
//$display("traffic generator : %b\tInput to Router : %b\tOutput from router",w1,in_fifo00,out_fifo);
end

//For VC based routing
localparam P=5;
parameter V=2; 	// Virtual channel
parameter B=4;    //buffer depth
parameter FPY=11;
parameter Fw=2+V+FPY;
	// Inputs
	reg [4:0] wr_in_en_array;
	wire [74:0] flit_in_array;
	wire [9:0] credit_in_array;
	//reg clk;
	//reg reset;

	// Outputs
	wire [9:0] credit_out_array;
	wire [4:0] wr_out_en_array;
	wire [74:0] flit_out_array;
	
	
	// seperate IO per port
	reg	[Fw-1:0]	flit_in[P-1	:	0];	 
	wire	[V-1:0]	credit_out[P-1	:	0];
	wire	[Fw-1:0]	flit_out[P-1	:	0]; 
	reg	[V-1:0]	credit_in[P-1	:	0]; 
	
	integer k;
	
initial begin 
	//reset 
		 rst=1'b1;		 
		 /*wr_in_en_array ={P{1'b0}};
		 for (k=0;k<P;k=k+1) begin
		 	flit_in[k]= {Fw{1'b0}};	 
			credit_in[k]=	{V{1'b0}}; 
		 end*/
		 #200
		@(posedge clk)#1
		rst=1'b0;		 
		#200
		@(posedge clk)#1
		
		local_in_wr00  = 1'b1;
	    in_fifo60[Fw-1:Fw-2]=2'b10; // header flag
		in_fifo60[FPY+V-1:FPY]=1; // inputport VC
		//header flit payload		
		in_fifo60[FPY-1 :0]= {/*wr_destport_hdr[P-2:0]*/3'b001,/*wr_des_x_addr[3:0]*/2'd2,/*wr_des_y_addr[3:0]*/2'd2,/*wr_src_x_addr[3:0]*/2'd2,/*wr_src_y_addr[3:0]*/2'd1};
      
		@(posedge clk)#1
		//send body flit 1
		local_in_wr00  = 1'b1;
		in_fifo60[Fw-1:Fw-2]=2'b00; // body flag
		in_fifo60[FPY+V-1:FPY]=1; // inputport VC	
		in_fifo60[FPY-1:0]=  11'd8; // your first data to send
		
		@(posedge clk)#1
		//send body flit 2
		local_in_wr00  = 1'b1;
		in_fifo60[Fw-1:Fw-2]=2'b00; // body flag
		in_fifo60[FPY+V-1:FPY]=1; // inputport VC	
		in_fifo60[FPY-1:0]=  11'd9; // your first data to send
		
		@(posedge clk)#1
		//send tail flit 3
		local_in_wr00  = 1'b1;
		in_fifo60[Fw-1:Fw-2]=2'b01; // tail flag
		in_fifo60[FPY+V-1:FPY]=1; // inputport VC	
		in_fifo60[FPY-1:0]=  11'd2; // your first data to send
		
		@(posedge clk)#1
		local_in_wr00  = 1'b0;

		#100
		$stop;

	end



endmodule
