
module Multloop(clk,reset,A,B,E0,E1,E2,E3,E4,E5,E6,E7,E8,
             E9,E10,E11,E12,E13,E14,E15);
input clk,reset;
input [31:0]A,B;
output [31:0]E0,E1,E2,E3,E4,E5,E6,E7,E8,E9,E10,E11,E12,E13,E14,E15;

wire [63:0]D[31:0];
wire [63:0]E[15:0];

generate
  genvar i;
  for (i = 0; i < 32; i=i+1) begin: PARTIAL_PRODUCTS
      Mux2by1 #(64) pcmux(64'b0,{{{32{1'b0}},B} << i}, A[i], D[i]);
  end
endgenerate

generate
  genvar j;
  for (j = 0; j < 16; j=j+1) begin: ADD_PARTIALS
      assign E[j] = D[j] + D[31-j];
  end
endgenerate

assign {E1,E2,E3,E4,E5,E6,E7,E8,E9,E10,E11,E12,E13,E14,E15} = {E[0],E[1],E[2],E[3],E[4],E[5],E[6],E[7],E[8],
             E[9],E[10],E[11],E[12],E[13],E[14],E[15]};

endmodule
