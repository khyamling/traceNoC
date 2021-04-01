`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2017 09:51:37 PM
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
    src_addr1,
    n,
    fifo_in,
    fifo_in_east,
    fifo_in_west,
    out,
    out_east,
    out_west,
    clk,
    rst);
    
    wire [1:0] port;
    wire [1:0] port_east;
    wire [1:0] port_west;
    
    input wire [3:0] src_addr1;
    input wire [3:0] n;
    input wire [63:0] fifo_in;
    input wire [63:0] fifo_in_east;
    input wire [63:0] fifo_in_west;
    input wire clk;
    input wire rst;
    
    output wire [63:0] out;
    output wire [63:0] out_east;
    output wire [63:0] out_west;
    
    reg rd_en = 1;
    reg rd_en_east = 1;
    reg rd_en_west = 1;
    reg wr_en = 1;
    reg wr_en_east = 1;
    reg wr_en_west = 1;
    wire [63:0] fifo_out;
    wire [63:0] fifo_out_east;
    wire [63:0] fifo_out_west;
    wire empty;
    wire empty_east;
    wire empty_west;
    wire full;
    wire full_east;
    wire full_west;
    wire [3:0] fifo_counter;
    wire [3:0] fifo_counter_east;
    wire [3:0] fifo_counter_west;
    
    fifo1 buffer(rst, clk, rd_en,wr_en,fifo_in,fifo_out,empty,full,fifo_counter);
    
    fifo1 buffer_east(rst, clk, rd_en_east, wr_en_east, fifo_in_east,
            fifo_out_east, empty_east, full_east, fifo_counter_east // Able to count more than depth
        );
        
    fifo1 buffer_west(rst, clk, rd_en_west, wr_en_west, fifo_in_west,
            fifo_out_west, empty_west, full_west, fifo_counter_west // Able to count more than depth
        );
    
    reg [3:0] src_addr;
    reg [3:0] dest_addr;
     
    reg [3:0] src_addr_east;
    reg [3:0] dest_addr_east;

    reg [3:0] src_addr_west;
    reg [3:0] dest_addr_west;
    
    always @(posedge clk) begin
        src_addr <= src_addr1; 
        src_addr_east <= src_addr1; 
        src_addr_west <= src_addr1; 
    end
  
    always @(posedge clk) begin
        //src_addr <= fifo_out_east[3:0];
        dest_addr <= fifo_out[7:4];
        //$display("SOURCE - %b DEST - %b.\n",src_addr,dest_addr);
    end
  
    always @(posedge clk) begin
        //src_addr_east <= fifo_out_east[3:0];
        dest_addr_east <= fifo_out_east[7:4];
        //$display("SOURCE_e - %b DEST_e - %b.\n",src_addr_east,dest_addr_east);
    end
    
    always @(posedge clk) begin
        //src_addr_west <= fifo_out_west[3:0];
        dest_addr_west <= fifo_out_west[7:4];
        //$display("SOURCE_w - %b DEST_w - %b.\n",src_addr_west,dest_addr_west);
    end
    
    shortest_path route_logic(port,src_addr,dest_addr,n,clk,rst);
    shortest_path route_logic_east(port_east, src_addr_east, dest_addr_east, n, clk, rst);
    shortest_path route_logic_west(port_west, src_addr_west, dest_addr_west, n, clk, rst);
    
    reg reqe_00, reqe_01, reqe_02;
    reg reqw_00, reqw_01, reqw_02;
    reg reql_00, reql_01, reql_02;
    
    initial begin 
        reqe_00 <= 1'bx; 
        reqe_01 <= 1'bx; 
        reqe_02 <= 1'bx;
        reqw_00 <= 1'bx; 
        reqw_01 <= 1'bx; 
        reqw_02 <= 1'bx;
        reql_00 <= 1'bx; 
        reql_01 <= 1'bx; 
        reql_02 <= 1'bx;
    end
    
    wire gnte_00, gnte_01, gnte_02;
    wire gntw_00, gntw_01, gntw_02;
    wire gntl_00, gntl_01, gntl_02;
    
    //set reqe_0x signals based on 
    //port
    always @(posedge clk) begin
        if (port == 2'b00) begin
            reql_00 <= 1;
            reqe_00 <= 0;
            reqw_00 <= 0;
            $display("Requesting Local Port at LP");
        end
        else if (port == 2'b01) begin
            reqe_00 <= 1;
            reql_00 <= 0;
            reqw_00 <= 0;
            $display("Requesting East Port at LP");
        end
        else if (port == 2'b10) begin
            reqw_00 <= 1;
            reqe_00 <= 0;
            reql_00 <= 0;
            $display("Requesting West Port at LP");
        end
    end
    
    always @(posedge clk) begin
            if (port_east == 2'b00) begin
                reql_01 <= 1;
                reqe_01 <= 0;
                reqw_01 <= 0;
                $display("Requesting Local Port at EP");
            end
            else if (port_east == 2'b01) begin
                reql_01 <= 0;
                reqe_01 <= 1;
                reqw_01 <= 0;
                $display("Requesting East Port at EP");
            end
            else if (port_east == 2'b10) begin
                reql_01 <= 0;
                reqe_01 <= 0;
                reqw_01 <= 1;
                $display("Requesting West Port at EP");
            end
        end 
    
    always @(posedge clk) begin
        if (port_west == 2'b00) begin
            reql_02 <= 1;
            reqe_02 <= 0;
            reqw_02 <= 0;
            $display("Requesting Local Port at WP");
        end
        else if (port_west == 2'b01) begin
            reql_02 <= 0;
            reqe_02 <= 1;
            reqw_02 <= 0;
            $display("Requesting East Port at WP");
        end
        else if (port_west == 2'b10) begin
            reql_02 <= 0;
            reqe_02 <= 0;
            reqw_02 <= 1;
            $display("Requesting West Port at WP");
        end
    end 
    
    arbiter0 a_e (gnte_02,gnte_01,gnte_00,reqe_02,reqe_01,reqe_00,clk,rst);
    arbiter0 a_w (gntw_02,gntw_01,gntw_00,reqw_02,reqw_01,reqw_00,clk,rst);
    arbiter0 a_l (gntl_02,gntl_01,gntl_00,reql_02,reql_01,reql_00,clk,rst); 
    
    reg [4:0] sel_e; 
    reg [4:0] sel_w;
    reg [4:0] sel_l;
    
    //assign select signal for crossbar
    always @(posedge clk) begin
        if (gnte_00 == 1) begin
            sel_e = 5'b00001;
            $display("Granting L for E o/p");
        end
        else if (gnte_01 == 1) begin
            sel_e = 5'b00010; //take packet from east
            $display("Granting E for E o/p");
        end
        else if (gnte_02 == 1) begin
            sel_e = 5'b00100;
            $display("Granting W for E o/p");
        end
        else begin
            sel_e = 5'bxxxxx;        
        end
        
        if (gntw_00 == 1) begin
            sel_w = 5'b00001;
            $display("Granting L for W o/p");
        end
        else if (gntw_01 == 1) begin
            sel_w = 5'b00010;
            $display("Granting E for W o/p");
        end
        else if (gntw_02 == 1) begin
            sel_w = 5'b00100;
            $display("Granting W for E o/p");
        end
        else begin
            sel_w = 5'bxxxxx;        
        end
        
        if (gntl_00 == 1) begin
            sel_l = 5'b00001;
            $display("Granting L for L o/p");
        end
        else if (gntl_01 == 1) begin
            sel_l = 5'b00010;
            $display("Granting E for L o/p");
        end
        else if (gntl_02 == 1) begin
            sel_l = 5'b00100;
            $display("Granting W for L o/p");
        end
        else begin
            sel_l = 5'bxxxxx;        
        end
    end
    
    
    crossbar c1 (fifo_out,fifo_out_west,fifo_out_east,
          sel_l, sel_w,sel_e,
            out,out_west,out_east,clk, rst
        );
endmodule