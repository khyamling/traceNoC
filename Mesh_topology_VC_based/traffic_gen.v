`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2018 03:21:07 PM
// Design Name: 
// Module Name: traffic_gen
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



module traffic_gen(
    clk, ctr, src, dest, cycle
    );
    input clk;
    input wire [31:0] ctr;
    output reg [3:0] src;
    output reg [3:0] dest;
    output reg [31:0] cycle;
    

    reg [159:0] temp;
    reg [63:0] ram [0:65535];
    reg [19:0] line;    
    
initial begin
      line = 20'b1;
      $readmemh("trail.mem", ram);
      end


always @(posedge clk) begin
    
    //$display("\n ***cycle: %b\t temp: %b****\n", cycle, temp);
    
    if(ctr) begin
        temp <= ram[ctr];
        cycle <= temp[31:0];
        src <= temp[39:36];
        dest <= temp[35:32];
        //$display("VGNESH %b %b",src,dest);
        //line <= line + 1;
        //$display("\n ***ctr: %b\t cycle: %b\t line: %b****\n", ctr, cycle,line);
    end

    end
endmodule
