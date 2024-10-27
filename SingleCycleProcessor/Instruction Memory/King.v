module SystemX(A,B,C,F);
input wire A,B,C;
output reg F;

always@(*) begin
  if(C == 0) begin
      if(A == 0)
         F <= 1'b1;
		else begin
		   if(B == 1)
		      F <= 1'b1;
			else
			   F <= 1'b0;
		end
  end
  else
    F <= 1'b0;
end
endmodule