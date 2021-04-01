
`include "define.v"

module yanocrouter #(
	parameter VC_NUM_PER_PORT=2,
	parameter BUFFER_NUM_PER_VC=4,
	parameter PORT_NUM=5,
	parameter PYLD_WIDTH=10,
	parameter FLIT_TYPE_WIDTH=2,
	parameter X_NODE_NUM=4,
	parameter Y_NODE_NUM=3,
	parameter SW_X_ADDR=2,
	parameter SW_Y_ADDR=1,
	parameter SW_OUTPUT_REGISTERED=0,       // 1: registered , 0 not registered
	parameter PORT_SEL_WIDTH=PORT_NUM-1,     //assum that no port whants to send a packet to itself!
	parameter VC_ID_WIDTH=VC_NUM_PER_PORT,
	parameter FLIT_WIDTH=PYLD_WIDTH+ FLIT_TYPE_WIDTH+VC_ID_WIDTH,
	parameter FLIT_ARRAY_WIDTH=FLIT_WIDTH*PORT_NUM,
	parameter CREDIT_ARRAY_WIDTH=VC_NUM_PER_PORT*PORT_NUM,
	parameter VC_FULL_WIDTH=VC_NUM_PER_PORT*2 
	
	)

(
   //output flit port of router 
   north_out_flit, east_out_flit, west_out_flit, south_out_flit, local_out_flit,
   
   //credit output
   north_out_credit, east_out_credit, west_out_credit, south_out_credit, local_out_credit,
   
  //write enable output
   north_out_wr, east_out_wr, west_out_wr, south_out_wr, local_out_wr,
   
   //input flit port of router
    north_in_flit, east_in_flit, west_in_flit, south_in_flit, local_in_flit,
   
   //credit input
   north_in_credit, east_in_credit, west_in_credit, south_in_credit, local_in_credit,
  
  //write enable output
   north_in_wr, east_in_wr, west_in_wr, south_in_wr, local_in_wr,

 // Inputs
   clk, reset
   );


   input clk, reset;
   
  //flit output port of router
   output [FLIT_WIDTH-1:0] north_out_flit;
   output [FLIT_WIDTH-1:0] east_out_flit;
   output [FLIT_WIDTH-1:0] west_out_flit;
   output [FLIT_WIDTH-1:0] south_out_flit;
   output [FLIT_WIDTH-1:0] local_out_flit;

  //credit output port of router
 
  output [VC_NUM_PER_PORT-1:0] north_out_credit;
  output [VC_NUM_PER_PORT-1:0] east_out_credit;
  output [VC_NUM_PER_PORT-1:0] west_out_credit;
  output [VC_NUM_PER_PORT-1:0] south_out_credit;
  output [VC_NUM_PER_PORT-1:0] local_out_credit;


  //write enable output port of router

  output north_out_wr;
  output east_out_wr;
  output west_out_wr;
  output south_out_wr;
  output local_out_wr;


//flit input port of router
   input [FLIT_WIDTH-1:0] north_in_flit;
   input [FLIT_WIDTH-1:0] east_in_flit;
   input [FLIT_WIDTH-1:0] west_in_flit;
   input [FLIT_WIDTH-1:0] south_in_flit;
   input [FLIT_WIDTH-1:0] local_in_flit;

  //credit input port of router
 
  input[VC_NUM_PER_PORT-1:0] north_in_credit;
  input[VC_NUM_PER_PORT-1:0] east_in_credit;
  input[VC_NUM_PER_PORT-1:0] west_in_credit;
  input[VC_NUM_PER_PORT-1:0] south_in_credit;
  input[VC_NUM_PER_PORT-1:0] local_in_credit;


  //write enable input port of router

  input north_in_wr;
  input east_in_wr;
  input west_in_wr;
  input south_in_wr;
  input local_in_wr;


 router#(.VC_NUM_PER_PORT(VC_NUM_PER_PORT), 
         .BUFFER_NUM_PER_VC(BUFFER_NUM_PER_VC), 
			.PORT_NUM(PORT_NUM), .PYLD_WIDTH(PYLD_WIDTH), 
			.FLIT_TYPE_WIDTH(FLIT_TYPE_WIDTH),
          .X_NODE_NUM(X_NODE_NUM), 
			 .Y_NODE_NUM(Y_NODE_NUM), 
			 .SW_X_ADDR(SW_X_ADDR),
          .SW_Y_ADDR(SW_Y_ADDR), 
			 .SW_OUTPUT_REGISTERED(SW_OUTPUT_REGISTERED))
   router1(
	         .wr_in_en_array({south_in_wr, west_in_wr, north_in_wr, east_in_wr, local_in_wr}), 
				.flit_in_array({south_in_flit,west_in_flit, north_in_flit,east_in_flit,local_in_flit}),
				.credit_in_array({south_in_credit,west_in_credit, north_in_credit,east_in_credit,local_in_credit}),
				.wr_out_en_array({south_out_wr,west_out_wr,north_out_wr, east_out_wr,local_out_wr}),
				.flit_out_array({south_out_flit,west_out_flit,north_out_flit, east_out_flit,local_out_flit}),
            .credit_out_array({south_out_credit,west_out_credit,north_out_credit, east_out_credit,local_out_credit}), 
            .clk(clk),
            .reset(reset)
    );
endmodule 
