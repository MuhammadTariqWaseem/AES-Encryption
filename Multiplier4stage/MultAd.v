module MultAd(F0,F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,F13,F14,F15,C,s);
				  
input [63:0]F0,F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,F13,F14,F15;
input s;
output [31:0]C;

wire [63:0]sum;

assign sum = F0 + F1 + F2 + F3 + F4 + F5 + F6 + F7 + 
             F8 + F9 + F10 + F11 + F12 + F13 + F14 + F15;
				 
assign C = (s)? sum[31:0] : sum[63:32];

endmodule 