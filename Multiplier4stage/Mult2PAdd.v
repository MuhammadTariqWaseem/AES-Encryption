module Mult2PAdd(clk,reset,A,B,C,s);
input clk,reset,s;
input [31:0]A,B;
output [31:0]C;

wire [63:0]D[31:0];
wire [63:0]E[15:0];
wire [63:0]F[15:0];
wire [63:0]sum;

generate
  genvar i;
  for (i = 0; i < 32; i=i+1) begin: PARTIAL_PRODUCTS
      Mux2by1 #(64) pcmux(64'b0,{{{32{1'b0}},B} << i}, A[i], D[i]);
  end
endgenerate

PADD	PADD_inst (
	.clock ( clk ),
	.data0x ( D[0] ),
	.data10x ( D[10] ),
	.data11x ( D[11] ),
	.data12x ( D[12] ),
	.data13x ( D[13] ),
	.data14x ( D[14] ),
	.data15x ( D[15] ),
	.data16x ( D[16] ),
	.data17x ( D[17] ),
	.data18x ( D[18] ),
	.data19x ( D[19] ),
	.data1x ( D[1] ),
	.data20x ( D[20] ),
	.data21x ( D[21] ),
	.data22x ( D[22] ),
	.data23x ( D[23] ),
	.data24x ( D[24] ),
	.data25x ( D[25] ),
	.data26x ( D[26] ),
	.data27x ( D[27] ),
	.data28x ( D[28] ),
	.data29x ( D[29] ),
	.data2x ( D[2] ),
	.data30x ( D[30] ),
	.data31x ( D[31] ),
	.data3x ( D[3] ),
	.data4x ( D[4] ),
	.data5x ( D[5] ),
	.data6x ( D[6] ),
	.data7x ( D[7] ),
	.data8x ( D[8] ),
	.data9x ( D[9] ),
	.result ( sum )
	);

				 
assign C = (s)? sum[31:0] : sum[63:32];

endmodule
