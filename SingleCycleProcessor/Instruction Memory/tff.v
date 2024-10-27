module tff(clk,reset,q);
input clk,reset;
output q;

wire d;

assign d = !q;

always@(posedge clk,reset)
begin
   if(reset)
	    q <= 1'b0;
	else
	    q <= d;
end
endmodule
