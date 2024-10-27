module RippleCounter(clk,reset,q);
input clk,reset;
output [3:0]q;

tff t1(clk,reset,q[0]);

tff t2(q[0],reset,q[1]);

tff t3(q[1],reset,q[2]);

tff t4(q[2],reset,q[3]);

endmodule
