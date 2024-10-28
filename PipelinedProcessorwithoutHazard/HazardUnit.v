module HazardUnit (RegWriteE,WriteAddE,rs1,rs2,SS1,SS2,PCSrc);

input RegWriteE;
input [4:0]WriteAddE,rs1,rs2;
output reg SS1,SS2;
input PCSrc;

always@(*) begin
   if(((WriteAddE == rs1) | (WriteAddE == rs2)) & RegWriteE)
	    SS2 = 1'b0;
	else 
	    SS2 = 1'b1;
		 
   if (PCSrc)
	    SS2 = 1'b1;
end

always@(*) begin
   if(((WriteAddE == rs1) | (WriteAddE == rs2)) & RegWriteE)
	    SS1 = 1'b0;
	else 
	    SS1 = 1'b1;
end

endmodule
