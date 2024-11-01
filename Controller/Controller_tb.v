module Controller_tb;

 reg [6:0] op;
 reg [2:0] funct3;
 reg funct7b5, Zero;
 wire [1:0] ResultSrc,ImmSrc;
 wire MemWrite,PCSrc, ALUSrc,RegWrite, Jump;
 wire [2:0] ALUControl;
 
 Controller dut(op, funct3 , funct7b5, Zero, ResultSrc, ImmSrc, MemWrite, PCSrc, ALUSrc, RegWrite, Jump, ALUControl);
 
 initial begin
    op = 7'b0000011;
	 #20;
	 op = 7'b0100011;
	 #20;
	 op = 7'b0110011;
	 funct3 = 3'b000;
	 #20;
	 funct3 = 3'b000;
	 #20;
	 funct3 = 3'b010;
	 #20;
	 funct3 = 3'b110;
	 #20;
	 funct3 = 3'b111;
	 #20;
	 
	 op = 7'b1100011;
	 #20;
	 op = 7'b0010011;
	 #20;
	 op = 7'b1101111;
 end
 endmodule