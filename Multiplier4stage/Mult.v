
module Mult(clk,reset,A,B,C,s);
input clk,reset,s;
input [31:0]A,B;
output [31:0]C;

wire s1,s2,s3,s4;
wire [63:0]D[31:0];
wire [63:0]d[31:0];
wire [63:0]E[15:0];
wire [63:0]F[7:0];
wire [63:0]X[7:0];
wire [63:0]Y[3:0];
wire [63:0]Z[1:0];
wire [63:0]z[1:0];
wire [63:0]sum;

			generate
			  genvar i;
			  for (i = 0; i < 32; i=i+1) begin: PARTIAL_PRODUCTS
					Mux2by1 #(64) pcmux(64'b0,{{{32{1'b0}},B} << i}, A[i], D[i]);
			  end
			endgenerate

generate
  genvar k;
  for (k = 0; k < 32; k=k+1) begin: PARTIAL_Store
      FF32 #(64) ff1(clk,reset,D[k],d[k]);
  end
endgenerate
FF32 #(1) f(clk,reset,s1,s2);

			generate
			  genvar j;
			  for (j = 0; j < 16; j=j+1) begin: ADD_PARTIALS
					assign E[j] = d[j] + d[31-j];
			  end
			endgenerate
			
			generate
			  genvar l;
			  for (l = 0; l < 8; l=l+1) begin: ADD2_PARTIALS
					assign X[l] = E[l] + E[15-l];
			  end
			endgenerate


FF32 #(513) ff2(clk,reset,{X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],s2},
                         {F[0],F[1],F[2],F[3],F[4],F[5],F[6],F[7],s3});
								 
			generate
			  genvar m;
			  for (m = 0; m < 4; m=m+1) begin: ADD3_PARTIALS
					assign Y[m] = F[m] + F[7-m];
			  end
			endgenerate
			
			generate
			  genvar n;
			  for (n = 0; n < 2; n=n+1) begin: ADD4_PARTIALS
					assign Z[n] = Y[n] + Y[3-n];
			  end
			endgenerate

FF32 #(129) ff3(clk,reset,{Z[0],Z[1],s3},{z[0],z[1],s4});

			assign sum = z[0] + z[1];
				 
assign C = (s4)? sum[31:0] : sum[63:32];

endmodule
