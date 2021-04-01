`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2017 12:52:22 PM
// Design Name: 
// Module Name: noc_router
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


module noc_router(in_fifo00,in_fifo01,in_fifo02,in_fifo03,in_fifo04,
                 out_fifo00, out_fifo01,out_fifo02,out_fifo03,out_fifo04,
                 rtr_addr,
                 clk, rst);
    input wire [63:0] in_fifo00;
    input wire [63:0] in_fifo01;
    input wire [63:0] in_fifo02;
    input wire [63:0] in_fifo03;
    input wire [63:0] in_fifo04;
    input wire [3:0] rtr_addr;
                 
    output reg [63:0] out_fifo00;
    output reg [63:0] out_fifo01;
    output reg [63:0] out_fifo02;
    output reg [63:0] out_fifo03;
    output reg [63:0] out_fifo04;

    
    
    
    input wire clk, rst;
//    output reg [7:0]out_port;
    
//for fifo buffer
reg rd_en00 = 1;
reg rd_en01 = 1;
reg rd_en02 = 1;
reg rd_en03 = 1;
reg rd_en04 = 1;

reg wr_en00 = 1;
reg wr_en01 = 1;
reg wr_en02 = 1;
reg wr_en03 = 1;
reg wr_en04 = 1;

wire [63:0] fifo_out00;
wire [63:0] fifo_out01;
wire [63:0] fifo_out02;
wire [63:0] fifo_out03;
wire [63:0] fifo_out04;

reg [63:0] fifo_in00;
reg [63:0] fifo_in01;
reg [63:0] fifo_in02;
reg [63:0] fifo_in03;
reg [63:0] fifo_in04;

wire empty00;
wire empty01;
wire empty02;
wire empty03;
wire empty04;

wire full00;
wire full01;
wire full02;
wire full03;
wire full04;

wire [3:0] fifo_counter00;
wire [3:0] fifo_counter01;
wire [3:0] fifo_counter02;
wire [3:0] fifo_counter03;
wire [3:0] fifo_counter04;

//for routing algorithm
reg [3:0] src_addr00;
reg [3:0] src_addr01;
reg [3:0] src_addr02;
reg [3:0] src_addr03;
reg [3:0] src_addr04;

reg [3:0] dest_addr00;
reg [3:0] dest_addr01;
reg [3:0] dest_addr02;
reg [3:0] dest_addr03;
reg [3:0] dest_addr04;

wire [3:0] port_out00;
wire [3:0] port_out01;
wire [3:0] port_out02;
wire [3:0] port_out03;
wire [3:0] port_out04;


//for arbiter
wire gnt00, gnt01, gnt02, gnt03, gnt04;
reg req00, req01, req02, req03, req04;
//reg rst_arbiter=1;


wire gnt10, gnt11, gnt12, gnt13, gnt14;
reg req10, req11, req12, req13, req14;

wire gnt20, gnt21, gnt22, gnt23, gnt24;
reg req20, req21, req22, req23, req24;

wire gnt30, gnt31, gnt32, gnt33, gnt34;
reg req30, req31, req32, req33, req34;

wire gnt40, gnt41, gnt42, gnt43, gnt44;
reg req40, req41, req42, req43, req44;

//for crossbar
reg [63:0] i0, i1, i2, i3, i4;
wire [63:0] o0, o1, o2, o3, o4;
reg [4:0] sel0, sel1, sel2, sel3, sel4;

initial begin
rd_en00 = 1; //allowing reading and writing
rd_en01 = 1;
rd_en02 = 1;
rd_en03 = 1;
rd_en04 = 1;

wr_en00 = 1;
wr_en01 = 1;
wr_en02 = 1;
wr_en03 = 1;
wr_en04 = 1;
end


always @(in_fifo00) begin
fifo_in00 <= in_fifo00; 
end

always @(in_fifo01) begin
fifo_in01 <= in_fifo01; 
end

always @(in_fifo02) begin
fifo_in02 <= in_fifo02; 
end

always @(in_fifo03) begin
fifo_in03 <= in_fifo03; 
end

always @(posedge clk) begin
fifo_in04 <= in_fifo04; 
end


//assigning buffer values to inputs of crossbar
always @(fifo_out00) begin
i0 <= fifo_out00;
end

always @(fifo_out01) begin
i1 <= fifo_out01;
end

always @(fifo_out02) begin
i2 <= fifo_out02;
end

always @(fifo_out03) begin
i3 <= fifo_out03;
end

always @(fifo_out04) begin
i4 <= fifo_out04;
end


//assigning outputs of crossbar to output of router
always @(o0) begin
out_fifo00 <= o0;
end

always @(o1) begin
out_fifo01 <= o1;
end

always @(o2) begin
out_fifo02 <= o2;
end

always @(o3) begin
out_fifo03 <= o3;
end

always @(o4) begin
out_fifo04 <= o4;
end


/*random logic to test if module is working
always@(posedge clk)
begin
port_out = fifo_in + 8'b00000001;
end
*/

//when packet arrives at the router, its pushed into a fifo buffer
fifo1 my_buffer00(
       rst,
       clk,
       rd_en00,
       wr_en00,
       fifo_in00,
       fifo_out00,
       empty00,
       full00,
       fifo_counter00 // Able to count more than depth
    ); 
    
fifo1 my_buffer01(
           rst,
           clk,
           rd_en01,
           wr_en01,
           fifo_in01,
           fifo_out01,
           empty01,
           full01,
           fifo_counter01 // Able to count more than depth
        ); 
        
fifo1 my_buffer02(
               rst,
               clk,
               rd_en02,
               wr_en02,
               fifo_in02,
               fifo_out02,
               empty02,
               full02,
               fifo_counter02 // Able to count more than depth
            ); 
            
            
fifo1 my_buffer03(
                   rst,
                   clk,
                   rd_en03,
                   wr_en03,
                   fifo_in03,
                   fifo_out03,
                   empty03,
                   full03,
                   fifo_counter03 // Able to count more than depth
                ); 

fifo1 my_buffer04(
       rst,
       clk,
       rd_en04,
       wr_en04,
       fifo_in04,
       fifo_out04,
       empty04,
       full04,
       fifo_counter04 // Able to count more than depth
    ); 

always@(fifo_out00) begin 
$display("FIFO 0 output : %b\n",fifo_out00);
dest_addr00<=fifo_out00[3:0];
//src_addr00<=fifo_out00[7:4];
src_addr00 <= rtr_addr;
end


always@(fifo_out01) begin
$display("FIFO 1 output : %b\n",fifo_out01);
dest_addr01<=fifo_out01[3:0];
//src_addr01<=fifo_out01[7:4];
src_addr01 <= rtr_addr;
end


always@(fifo_out02) begin
$display("FIFO 2 output : %b\n",fifo_out02);
dest_addr02<=fifo_out02[3:0];
src_addr02<= rtr_addr;
end


always@(fifo_out03) begin
$display("FIFO 3 output : %b\n",fifo_out03);
dest_addr03<=fifo_out03[3:0];
src_addr03<= rtr_addr;
end


always@(fifo_out04) begin
$display("FIFO 4 output  : %b\n",fifo_out04);
dest_addr04<=fifo_out04[3:0];
src_addr04<= rtr_addr;
end

always @(posedge clk) begin 
$display("Port-Out Signals: port0:%b port1:%b port2:%b port3:%b port4:%b",port_out00,port_out01,port_out02,port_out03,port_out04);
$display("\nRequest 11: %b",req11); 
$display("Grant LOCAL: %b\t NORTH: %b\t EAST:%b\t SOUTH:%b\t WEST:%b",gnt10, gnt11, gnt12, gnt13, gnt14);
$display("Crossbar Select Signal: sel0:%b sel1:%b sel2:%b sel3:%b sel4:%b",sel0,sel1,sel2,sel3,sel4);
$display("Crossbar output i0: %b\t i1: %b\t i2: %b\t i3: %b\t i4: %b\t\n",i0,i1,i2,i3,i4);
$display("Crossbar output o0: %b\t o1: %b\t o2: %b\t o3: %b\t o4: %b\t\n",o0,o1,o2,o3,o4);

end


//implementing routing algorithm
route c0 (clk, src_addr00, dest_addr00, port_out00);
route c1 (clk, src_addr01, dest_addr01, port_out01);
route c2 (clk, src_addr02, dest_addr02, port_out02);
route c3 (clk, src_addr03, dest_addr03, port_out03);                                                    
route c4 (clk, src_addr04, dest_addr04, port_out04);


//for local port
always@(posedge clk) begin
//out_port<=port_out00; //assigning 4 bit output from routing algo to 8 bit output of router

//to detemine request value for arbiter 
if (port_out00==0) begin //LOCAL PORT 
req00=1; req01=0; req02=0; req03=0; req04 =0;
end

else if(port_out00==8) begin //NORTH PORT
req01=1; req00=0; req02=0; req03=0; req04 =0;
end

else if(port_out00==4) begin//EAST PORT
req02=1; req00=0; req01=0; req03=0; req04 =0;
end

else if(port_out00==1) begin//SOUTH PORT
req03=1; req00=0; req01=0; req02=0; req04 =0;
end

else if(port_out00==2) begin //WEST PORT
req04=1; req00=0; req01=0; req02=0; req03=0;
end 

//selecting the output port of crossbar
if (gnt00==1) begin
sel0 = 5'b00001; //sel1=5'b00000; sel2=5'b00000; sel3=5'b00000; sel4=5'b00000;
end 

if (gnt01==1) begin
/*sel0 = 5'b00000; */sel1=5'b00001;/* sel2=5'b00000; sel3=5'b00000; sel4=5'b00000;*/
end 

if (gnt02==1) begin
/*sel0 = 5'b00000; sel1=5'b00000;*/ sel2=5'b00001; /*sel3=5'b00000; sel4=5'b00000;*/
end 

if (gnt03==1) begin
/*sel0 = 5'b00000; sel1=5'b00000; sel2=5'b00000; */sel3=5'b00001;/* sel4=5'b00000;*/
end 

if (gnt04==1) begin
/*sel0 = 5'b00000; sel1=5'b00000; sel2=5'b00000; sel3=5'b00000;*/ sel4=5'b00001;
end 

end


//for north
always@(posedge clk) begin
//out_port<=port_out00; //assigning 4 bit output from routing algo to 8 bit output of router

//to detemine request value for arbiter 
if (port_out01==0) begin //LOCAL PORT 
req10=1; req11=0; req12=0; req13=0; req14 =0;
end

else if(port_out01==8) begin //NORTH PORT
req11=1; req10=0; req12=0; req13=0; req14 =0;
end

else if(port_out01==4) begin//EAST PORT
req12=1; req10=0; req11=0; req13=0; req14 =0;
end

else if(port_out01==1) begin//SOUTH PORT
req13=1; req10=0; req11=0; req12=0; req14 =0;
end

else if(port_out01==2) begin //WEST PORT
req14=1; req10=0; req11=0; req12=0; req13=0;
end 

//selecting the output port of crossbar
if (gnt10==1) begin
sel0 = 5'b00010; /*sel1=5'b00000; sel2=5'b00000; sel3=5'b00000; sel4=5'b00000;*/
end 

if (gnt11==1) begin
$display("\nEntered Grant11\n");
/*sel0 = 5'b00000;*/ sel1=5'b00010;/* sel2=5'b00000; sel3=5'b00000; sel4=5'b00000;*/
end 

if (gnt12==1) begin
/*sel0 = 5'b00000; sel1=5'b00000; */sel2=5'b00010; /*sel3=5'b00000; sel4=5'b00000;*/
end 

if (gnt13==1) begin
/*sel0 = 5'b00000; sel1=5'b00000; sel2=5'b00000; */sel3=5'b00010; /*sel4=5'b00000;*/
end 

if (gnt14==1) begin
/*sel0 = 5'b00000; sel1=5'b00000; sel2=5'b00000; sel3=5'b00000;*/ sel4=5'b00010;
end 

end


//for east
always@(posedge clk) begin
//out_port<=port_out00; //assigning 4 bit output from routing algo to 8 bit output of router

//to detemine request value for arbiter 
if (port_out02==0) begin //LOCAL PORT 
req20=1; req21=0; req22=0; req23=0; req24 =0;
end

else if(port_out02==8) begin //NORTH PORT
req21=1; req20=0; req22=0; req23=0; req24 =0;
end

else if(port_out02==4) begin//EAST PORT
req22=1; req20=0; req21=0; req23=0; req24 =0;
end

else if(port_out02==1) begin//SOUTH PORT
req23=1; req20=0; req21=0; req22=0; req24 =0;
end

else if(port_out02==2) begin //WEST PORT
req24=1; req20=0; req21=0; req22=0; req23=0;
end 

//selecting the output port of crossbar
if (gnt20==1) begin
sel0 = 5'b00100; /*sel1=5'b00000; sel2=5'b00000; sel3=5'b00000; sel4=5'b00000;*/
end 

if (gnt21==1) begin
/*sel0 = 5'b00000;*/ sel1=5'b00100;/* sel2=5'b00000; sel3=5'b00000; sel4=5'b00000;*/
end 

if (gnt22==1) begin
/*sel0 = 5'b00000; sel1=5'b00000; */sel2=5'b00100; /*sel3=5'b00000; sel4=5'b00000;*/
end 

if (gnt23==1) begin
/*sel0 = 5'b00000; sel1=5'b00000; sel2=5'b00000; */sel3=5'b00100; /*sel4=5'b00000;*/
end 

if (gnt24==1) begin
/*sel0 = 5'b00000; sel1=5'b00000; sel2=5'b00000; sel3=5'b00000;*/ sel4=5'b00100;
end 

end


//for south
always@(posedge clk) begin
//out_port<=port_out00; //assigning 4 bit output from routing algo to 8 bit output of router

//to detemine request value for arbiter 
if (port_out03==0) begin //LOCAL PORT 
req30=1; req31=0; req32=0; req33=0; req34 =0;
end

else if(port_out03==8) begin //NORTH PORT
req31=1; req30=0; req32=0; req33=0; req34 =0;
end

else if(port_out03==4) begin//EAST PORT
req32=1; req30=0; req31=0; req33=0; req34 =0;
end

else if(port_out03==1) begin//SOUTH PORT
req33=1; req30=0; req31=0; req32=0; req34 =0;
end

else if(port_out03==2) begin //WEST PORT
req34=1; req30=0; req31=0; req32=0; req33=0;
end 

//selecting the output port of crossbar
if (gnt30==1) begin
sel0 = 5'b01000; /*sel1=5'b00000; sel2=5'b00000; sel3=5'b00000; sel4=5'b00000;*/
end 

if (gnt31==1) begin
/*sel0 = 5'b00000;*/ sel1=5'b01000;/* sel2=5'b00000; sel3=5'b00000; sel4=5'b00000;*/
end 

if (gnt32==1) begin
/*sel0 = 5'b00000; sel1=5'b00000; */sel2=5'b01000; /*sel3=5'b00000; sel4=5'b00000;*/
end 

if (gnt33==1) begin
/*sel0 = 5'b00000; sel1=5'b00000; sel2=5'b00000; */sel3=5'b01000; /*sel4=5'b00000;*/
end 

if (gnt34==1) begin
/*sel0 = 5'b00000; sel1=5'b00000; sel2=5'b00000; sel3=5'b00000;*/ sel4=5'b01000;
end 

end


//for west
always@(posedge clk) begin
//out_port<=port_out00; //assigning 4 bit output from routing algo to 8 bit output of router

//to detemine request value for arbiter 
if (port_out04==0) begin //LOCAL PORT 
req40=1; req41=0; req42=0; req43=0; req44 =0;
end

else if(port_out04==8) begin //NORTH PORT
req41=1; req40=0; req42=0; req43=0; req44 =0;
end

else if(port_out04==4) begin//EAST PORT
req42=1; req40=0; req41=0; req43=0; req44 =0;
end

else if(port_out04==1) begin//SOUTH PORT
req43=1; req40=0; req41=0; req42=0; req44 =0;
end

else if(port_out04==2) begin //WEST PORT
req44=1; req40=0; req41=0; req42=0; req43=0;
end 

//selecting the output port of crossbar
if (gnt40==1) begin
sel0 = 5'b10000; /*sel1=5'b00000; sel2=5'b00000; sel3=5'b00000; sel4=5'b00000;*/
end 

if (gnt41==1) begin
/*sel0 = 5'b00000;*/ sel1=5'b10000;/* sel2=5'b00000; sel3=5'b00000; sel4=5'b00000;*/
end 

if (gnt42==1) begin
/*sel0 = 5'b00000; sel1=5'b00000; */sel2=5'b10000; /*sel3=5'b00000; sel4=5'b00000;*/
end 

if (gnt43==1) begin
/*sel0 = 5'b00000; sel1=5'b00000; sel2=5'b00000; */sel3=5'b10000; /*sel4=5'b00000;*/
end 

if (gnt44==1) begin
/*sel0 = 5'b00000; sel1=5'b00000; sel2=5'b00000; sel3=5'b00000;*/ sel4=5'b10000;
end 

end





//we know which port is chosen by routing algo,
//check with arbiter to resolve contention for the same o/p port
arbiter0 my_arb0(gnt04,gnt03,gnt02,gnt01,gnt00,req04,req03,req02,req01,req00,clk,rst);
arbiter0 my_arb1(gnt14,gnt13,gnt12,gnt11,gnt10,req14,req13,req12,req11,req10,clk,rst);
arbiter0 my_arb2(gnt24,gnt23,gnt22,gnt21,gnt20,req24,req23,req22,req21,req20,clk,rst);
arbiter0 my_arb3(gnt34,gnt33,gnt32,gnt31,gnt30,req34,req33,req32,req31,req30,clk, rst);
arbiter0 my_arb4(gnt44,gnt43,gnt42,gnt41,gnt40,req44,req43,req42,req41,req40,clk, rst);

//arbiter decides which port to send it to, crossbar sends it to that port
//this crossbar need not have five inputs, since we deal with one packet at a time
crossbar my_crsbar(i0,i1,i2,i3,i4,
      sel0, sel1,sel2,sel3,sel4,
		o0,o1,o2,o3,o4,clk, rst
    );

endmodule
