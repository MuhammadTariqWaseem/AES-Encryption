module King_tb;
   reg A,B,C;
   wire F;

King k(A,B,C,F);

initial
begin 
 A = 1'b0;
 B = 1'b0;
 C = 1'b0;
 
 #10;
 C = 1;
 #10;
 
 B = 1;
 C = 0;
 
 #10;
 C = 1;
 #10;
 
 A = 1;
 B = 0;
 C = 0;
 
 #10;
 C = 1;
 #10;
 
 B = 1;
 C = 0;
 
 #10;
 C = 1;
 
 end
 endmodule
 