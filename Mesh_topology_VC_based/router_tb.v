`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:47:51 03/26/2018
// Design Name:   router
// Module Name:   /verilog_project/pronoc_router/router_tb.v
// Project Name:  pronoc_router
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: router
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module router_tb;

	// Inputs
	reg [4:0] wr_in_en_array;
	reg [69:0] flit_in_array;
	reg [9:0] credit_in_array;
	reg clk;
	reg reset;

	// Outputs
	wire [9:0] credit_out_array;
	wire [4:0] wr_out_en_array;
	wire [69:0] flit_out_array;

	// Instantiate the Unit Under Test (UUT)
	router uut (
		.wr_in_en_array(wr_in_en_array), 
		.flit_in_array(flit_in_array), 
		.credit_out_array(credit_out_array), 
		.wr_out_en_array(wr_out_en_array), 
		.flit_out_array(flit_out_array), 
		.credit_in_array(credit_in_array), 
		.clk(clk), 
		.reset(reset)
	);

always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		wr_in_en_array = 0;
		flit_in_array = 0;
		credit_in_array = 0;
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#10;
		
		wr_in_en_array = 1;
		flit_in_array = 1;
		credit_in_array = 1;
		clk = 1;
		reset = 0;
     #10;   
		// Add stimulus here

	end
      
endmodule

