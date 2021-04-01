`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:26 03/06/2018 
// Design Name: 
// Module Name:    fifo_ram 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "define.v"
module fifo_ram     #(
    parameter DATA_WIDTH    = 32,
    parameter ADDR_WIDTH    = 8,
    parameter SSA_EN="YES" // "YES" , "NO"
    )
    (
        input [DATA_WIDTH-1         :       0]  wr_data,
        input [ADDR_WIDTH-1         :       0]      wr_addr,
        input [ADDR_WIDTH-1         :       0]      rd_addr,
        input                                               wr_en,
        input                                               rd_en,
        input                                           clk,
        output [DATA_WIDTH-1   :       0]      rd_data
    );

	reg [DATA_WIDTH-1:0] memory_rd_data;
   // memory
	reg [DATA_WIDTH-1:0] queue [2**ADDR_WIDTH-1:0] /* synthesis ramstyle = "no_rw_check , M9K" */;
	always @(posedge clk ) begin
			if (wr_en)
				 queue[wr_addr] <= wr_data;
			if (rd_en)
				 memory_rd_data <=
//synthesis translate_off
//synopsys  translate_off
					  #1
//synopsys  translate_on
//synthesis translate_on
					  queue[rd_addr];
	end
generate
    if(SSA_EN =="YES") begin :predict
		//add bypass
        reg [DATA_WIDTH-1:0]  bypass_reg;
		  reg rd_en_delayed;
        always @(posedge clk ) begin
			 bypass_reg 	<=wr_data;
			 rd_en_delayed	<=rd_en;
		  end

		  assign rd_data = (rd_en_delayed)? memory_rd_data  : bypass_reg;



    end else begin : no_predict
        assign rd_data =  memory_rd_data;
    end
	 endgenerate
endmodule