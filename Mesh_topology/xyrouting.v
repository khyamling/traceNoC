module route(
	clk,
	src_addr,
	dest_addr,
	port);
//	xd,
//	yd,
//	xo_src,
//	yo_src,
//	xn_src,
//	yn_src,
//	port
//	);


input wire clk;
input wire [3:0] src_addr;
input wire [3:0] dest_addr;
output reg [3:0] port;

reg [1:0] xd;
reg [1:0] yd;
reg [1:0] xo_src;
reg [1:0] yo_src;

reg [1:0] xn_dest;
reg [1:0] yn_dest;

reg [1:0] xdiff;
reg [1:0] ydiff;

initial begin 
	xn_dest = 2'b00;
	yn_dest = 2'b00;
	xdiff = 2'b00;
	ydiff = 2'b00;
end

always @(dest_addr) begin
    $display("Entered the xy routing procedure at time %g with dest: %b and src: %b",$time,dest_addr,src_addr);
	xd=dest_addr[1:0];
	yd=dest_addr[3:2];
	xo_src=src_addr[1:0];
	yo_src=src_addr[3:2];
	xdiff = xd - xo_src; 
	ydiff = yd - yo_src; 

	$display( "xdiff %d and ydiff %d\n",xdiff,ydiff);
	//$display("time  clk  xdiff  ydiff");
	//$monitor ("%g\t %b      %b     %b", $time, clk, xdiff, ydiff);
	if((xd==xo_src) && (yd==yo_src) && (xdiff!==0) && (ydiff==0)) begin
	$display("Routing Done!\n"); 
	port = 4'b0;
	end
	else if (xd==xo_src) begin
		//$display("Hello");
		if (yd == yo_src) begin
			//LOCAL PORT 0000
			yn_dest = yo_src;
			port = 4'b0000;
		end
		else if (yd > yo_src) begin
			// SOUTH PORT 0001
			$display("s");
			yn_dest = yo_src + 2'b01;
			port = 4'b0001;
		end
		else if (yd < yo_src) begin
			// NORTH PORT 1000
			$display("n");
			yn_dest = yo_src - 2'b01;
			port = 4'b1000;
		end
	end
	else if (xd > xo_src) begin
		// EAST PORT 0100 
		$display("e");
		xn_dest = xo_src + 2'b01;
		port = 4'b0100;
	end
	else if (xd < xo_src) begin
		// WEST PORT 0010
		$display("w");
		xn_dest = xo_src - 2'b01;
		port = 4'b0010;
	end 
end

endmodule