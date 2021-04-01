//`include "xyrouting.v"
module route_packet(clk, src_addr, dest_addr, port);

input wire clk;
input wire [3:0] src_addr;
input wire [3:0] dest_addr;
output wire [3:0] port;

reg [1:0] xd;
reg [1:0] yd;
reg [1:0] xo_src;
reg [1:0] yo_src;

wire [1:0] xn_dest;
wire [1:0] yn_dest;


initial begin 
	//$display ("time\t clk xo_src   yo_src  to xn_src  yn_src via port p");	
 	$monitor ("%g\t %b  %b  %b  %b  %b  %b  %b", $time, clk, dest_addr, xo_src, yo_src,  xn_dest, yn_dest, port);	
 	//clk = 1;       // initial value of clock

 	xd <= dest_addr[3:2];
 	yd <= dest_addr[1:0];

 	xo_src <= src_addr[3:2];
 	yo_src <= src_addr[1:0];

end

//always begin
	//#2 clk = ~clk;
//end

always @(clk) begin
	if (xo_src == xd && yo_src == yd) begin
	$display("XY DONE\n");
	end
	else begin
		if (xo_src != xd) begin
			xo_src = xn_dest;
		end
		if (yo_src != yd) begin
			yo_src = yn_dest;
		end
	end
end

route c1 ( clk, xd, yd, xo_src, yo_src, xn_dest, yn_dest, port );
endmodule