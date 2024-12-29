module CSA #(parameter WIDTH = 8) (X,Y,Z,S,C);
input [WIDTH-1:0]X,Y,Z;
output [WIDTH-1:0]C,S;

generate
   genvar i;
	for(i=0; i<WIDTH ; i=i+1) begin : Add
	   assign S[i] = X[i] ^ Y[i] ^ Z[i];
		assign C[i] = (X[i] & Y[i]) | (X[i] & Z[i]) | (Z[i] & Y[i]);
	end
endgenerate

endmodule 