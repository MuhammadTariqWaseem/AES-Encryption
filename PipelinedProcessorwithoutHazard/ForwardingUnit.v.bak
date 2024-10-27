module ForwardingUnit(rdM,rdW,rs1,rs2,RegWriteM,RegWriteW,A,B);
input [4:0]rdM,rdW,rs1,rs2;
input RegWriteM,RegWriteW;
output reg [1:0]A,B;

always@(*) begin
   if ((rdM == rs1) & (rdM == 5'b00000) & RegWriteM)
	   A = 2'b01;
	else 	if ((rdW == rs1) & (rdW == 5'b00000) & RegWriteW)
	   A = 2'b10;
	else 
	   A = 2'b00;
end

always@(*) begin
   if ((rdM == rs2) & (rdM == 5'b00000) & RegWriteM)
	   B = 2'b01;
	else 	if ((rdW == rs2) & (rdW == 5'b00000) & RegWriteW)
	   B = 2'b10;
	else 
	   B = 2'b00;
end

endmodule
