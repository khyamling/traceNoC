`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2018 04:50:30 AM
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
    output reg [15:0] src;
    output reg [15:0] dest;
    output reg [31:0] cycle;
    
    //reg[19:0] line;
    
    initial begin
      $readmemh("hello.mem", ram);
    end

reg [39:0] temp;
reg [39:0] ram [0:65535];

initial begin
    //line = 20'b01;
end

always @(posedge clk) 
begin
    temp <= ram[ctr];
    cycle <= temp[31:0];
    //$display("HERE SGS %32b \n",cycle);
    if(ctr) begin
        src <= temp[39:36];
        dest <= temp[35:32];
        //line <= line + 20'b01; 
    end
end
    
endmodule
