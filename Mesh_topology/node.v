`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2018 03:34:57 PM
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
    clk, ctr, node_addr, packet, p
    );
    
    input clk;
    input wire [31:0] ctr;
    input wire [3:0] node_addr;
    input wire [63:0] p;
    output reg [39:0] packet;
    
    wire [3:0] src;
    wire [3:0] dest;
    wire [31:0] cycle;

    /*reg [3:0] src1;
    reg [3:0] dest1;*/
    //reg [31:0] ctr1;
    //reg [1:0] recv_flag;
    
    reg [63:0] temp;
    
    traffic_gen t1(clk, ctr, src, dest, cycle);
//    traffic_recv r1(clk, ctr, src1, dest1, ctr1, recv_flag);
    
    always @(posedge clk) begin
        //$display("Artist %b",p);
        if (p[3:0] == node_addr) begin
            $display(" Ctr: %d Init_ctr: %d Latency: %d node_addr: %d packet_dest %d\n",ctr, p[39:8],(ctr-p[39:8]), node_addr, p[3:0]);
        end
    end
    
    always @(posedge clk) begin
        if (node_addr == src) begin
            packet[3:0] <= dest;
            packet[7:4] <= src;            
            packet[39:8] <= ctr;
            $display("\n***node : %b\t packet:%b src: %b dest: %b***\n", node_addr, packet,src, dest);
        end
/*        else begin 
            packet[39:0] <= 40'bx;
        end*/
    end 
    
   /* always @(posedge clk) begin
        temp <= p;
        src1 = temp[3:0];
        dest1 = temp[7:4];
        ctr1 = temp[39:8];
            if (node_addr == dest1) begin
              recv_flag=1;
            end
        end 
   */     
//    always@(negedge clk) begin
//        recv_flag = 0;
//    end
endmodule
