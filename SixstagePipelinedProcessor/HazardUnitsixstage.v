module HazardUnitsixstage (ResultSrcX,ResultSrcM,RegWriteX,WriteAddX,WriteAddM,rs1,rs2,FF,FD,FE,ST,PCSrc);

input ResultSrcX,ResultSrcM,RegWriteX;
input [4:0]WriteAddX,WriteAddM,rs1,rs2;
output reg FF,FD,FE,ST;
input PCSrc;

always@(ResultSrcX or PCSrc) begin
   if( ((WriteAddX == rs1) | (WriteAddX == rs2)) & (RegWriteX | ResultSrcX) & (WriteAddX != 5'd0))
	    FE <= 1'b0;
	else if ( ((WriteAddM == rs1) | (WriteAddM == rs2)) & ResultSrcM & (WriteAddM != 5'd0))
	    FE <= 1'b0;
	else if (PCSrc)
	    FE <= 1'b0;
	else 
	    FE <= 1'b1;
end

always@(PCSrc) begin
   if(PCSrc)
	    FD <= 1'b1;
	else 
	    FD <= 1'b0;
end

always@(PCSrc) begin
   if(PCSrc)
	    FF <= 1'b0;
	else 
	    FF <= 1'b1;
end

always@(ResultSrcE) begin 
   if((((WriteAddE == rs1) | (WriteAddE == rs2)) & ResultSrcE))
	    ST <= 1'b1;
	else ST <= 1'b0;
end
endmodule
