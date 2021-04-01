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


module top_file(pkt0[7:0], pkt1[7:0], pkt2[7:0], pkt3[7:0], pkt4[7:0], pkt5[7:0], pkt6[7:0], pkt7[7:0], 
                pkt8[7:0], pkt9[7:0], pkt10[7:0], pkt11[7:0], pkt12[7:0], pkt13[7:0], pkt14[7:0], pkt15[7:0]
                );//pins

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
output wire [39:0] pkt0, pkt1, pkt2, pkt3, pkt4, pkt5, pkt6, pkt7;
output wire [39:0] pkt8, pkt9, pkt10, pkt11, pkt12, pkt13, pkt14, pkt15;

reg [63:0] p0, p1, p2, p3, p4, p5, p6, p7;
reg [63:0] p8, p9, p10, p11, p12, p13, p14, p15;

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

reg [63:0] in_fifo00, in_fifo01, in_fifo02, in_fifo03, in_fifo04;
wire [63:0] out_fifo00,out_fifo01,out_fifo02,out_fifo03,out_fifo04;

reg [63:0] in_fifo10, in_fifo11, in_fifo12, in_fifo13, in_fifo14;
wire [63:0] out_fifo10,out_fifo11,out_fifo12,out_fifo13,out_fifo14;

reg [63:0] in_fifo20, in_fifo21, in_fifo22, in_fifo23, in_fifo24;
wire [63:0] out_fifo20,out_fifo21,out_fifo22,out_fifo23,out_fifo24;

reg [63:0] in_fifo30, in_fifo31, in_fifo32, in_fifo33, in_fifo34;
wire [63:0] out_fifo30,out_fifo31,out_fifo32,out_fifo33,out_fifo34;

reg [63:0] in_fifo40, in_fifo41, in_fifo42, in_fifo43, in_fifo44;
wire [63:0] out_fifo40,out_fifo41,out_fifo42,out_fifo43,out_fifo44;

reg [63:0] in_fifo50, in_fifo51, in_fifo52, in_fifo53, in_fifo54;
wire [63:0] out_fifo50,out_fifo51,out_fifo52,out_fifo53,out_fifo54;


reg [63:0] in_fifo60, in_fifo61, in_fifo62, in_fifo63, in_fifo64;
wire [63:0] out_fifo60,out_fifo61,out_fifo62,out_fifo63,out_fifo64;

reg [63:0] in_fifo70, in_fifo71, in_fifo72, in_fifo73, in_fifo74;
wire [63:0] out_fifo70,out_fifo71,out_fifo72,out_fifo73,out_fifo74;

reg [63:0] in_fifo80, in_fifo81, in_fifo82, in_fifo83, in_fifo84;
wire [63:0] out_fifo80,out_fifo81,out_fifo82,out_fifo83,out_fifo84;

reg [63:0] in_fifo90, in_fifo91, in_fifo92, in_fifo93, in_fifo94;
wire [63:0] out_fifo90,out_fifo91,out_fifo92,out_fifo93,out_fifo94;

reg [63:0] in_fifo100, in_fifo101, in_fifo102, in_fifo103, in_fifo104;
wire [63:0] out_fifo100,out_fifo101,out_fifo102,out_fifo103,out_fifo104;

reg [63:0] in_fifo110, in_fifo111, in_fifo112, in_fifo113, in_fifo114;
wire [63:0] out_fifo110,out_fifo111,out_fifo112,out_fifo113,out_fifo114;


reg [63:0] in_fifo120, in_fifo121, in_fifo122, in_fifo123, in_fifo124;
wire [63:0] out_fifo120,out_fifo121,out_fifo122,out_fifo123,out_fifo124;

reg [63:0] in_fifo130, in_fifo131, in_fifo132, in_fifo133, in_fifo134;
wire [63:0] out_fifo130,out_fifo131,out_fifo132,out_fifo133,out_fifo134;


reg [63:0] in_fifo140, in_fifo141, in_fifo142, in_fifo143, in_fifo144;
wire [63:0] out_fifo140,out_fifo141,out_fifo142,out_fifo143,out_fifo144;

reg [63:0] in_fifo150, in_fifo151, in_fifo152, in_fifo153, in_fifo154;
wire [63:0] out_fifo150,out_fifo151,out_fifo152,out_fifo153,out_fifo154;



//reg [7:0] packet;
wire [3:0] src;
wire [3:0] dest;
    

initial begin 
clk=1;
rst=1;
ctr=0;





#600 $finish;
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
 
//Assigning packets from local  
p0 <= out_fifo00; p1 <= out_fifo10; p2 <= out_fifo20; p3 <= out_fifo30; p4 <= out_fifo40; p5 <= out_fifo50;
p6 <= out_fifo60; p7 <= out_fifo70; p8 <= out_fifo80; p9 <= out_fifo90; p10 <= out_fifo100; p11 <= out_fifo110;
p12 <= out_fifo120; p13 <= out_fifo130; p14 <= out_fifo140; p15 <= out_fifo150;

end 

//traffic generator
//lfsr7 my_traffic1(w1, clk, rst);
//lfsr7 my_traffic2(w2, clk, rst);
//lfsr7 my_traffic3(w3, clk, rst);

//reading traffic from trace file
//traffic_gen t1(clk, ctr, src, dest, cycle);


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
 
   //router noc
noc_router my_r0(in_fifo00,in_fifo01,in_fifo02,in_fifo03,in_fifo04,
                 out_fifo00, out_fifo01,out_fifo02,out_fifo03,out_fifo04,
                  rtr_addr0/*router address*/,
                  clk, rst);
                  
noc_router my_r1(in_fifo10,in_fifo11,in_fifo12,in_fifo13,in_fifo14,
               out_fifo10, out_fifo11,out_fifo12,out_fifo13,out_fifo14,
               rtr_addr1,
                clk, rst);
                
noc_router my_r2(in_fifo20,in_fifo21,in_fifo22,in_fifo23,in_fifo24,
                 out_fifo20, out_fifo21,out_fifo22,out_fifo23,out_fifo24,
                  rtr_addr2/*router address*/,
                  clk, rst);
                                  
noc_router my_r3(in_fifo30,in_fifo31,in_fifo32,in_fifo33,in_fifo34,
               out_fifo30, out_fifo31,out_fifo32,out_fifo33,out_fifo34,
               rtr_addr3,
                clk, rst);

noc_router my_r4(in_fifo40,in_fifo41,in_fifo42,in_fifo43,in_fifo44,
                 out_fifo40, out_fifo41,out_fifo42,out_fifo43,out_fifo44,
                  rtr_addr4/*router address*/,
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
//noc_router my_r2(w2, out2, clk, rst);
//noc_router my_r3(w3, out3, clk);


/*always @(port) begin
$display ("%g\t %b      %b    %b             %b     %b        %b", $time, clk, xo_src, yo_src,  xn_src, yn_src, port);
end*/

always@(negedge clk)
begin
rst=0;
//$display("traffic generator : %b\tInput to Router : %b\tOutput from router",w1,in_fifo00,out_fifo);
end

endmodule
