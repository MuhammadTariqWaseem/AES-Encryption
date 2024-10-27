module MainDecoder_tb;

reg [6:0] op;
wire [1:0] ResultSrc, ImmSrc, ALUOp;
wire MemWrite, Branch, ALUSrc, RegWrite, Jump;

MainDecoder dut(op,ResultSrc,MemWrite,Branch,ALUSrc,RegWrite, Jump, ImmSrc,ALUOp);

initial begin
    op = 7'b0000011;
	 #20;
	 op = 7'b0100011;
	 #20;
	 op = 7'b0110011;
	 #20;
	 op = 7'b1100011;
	 #20;
	 op = 7'b0010011;
	 #20;
	 op = 7'b1101111;
end
endmodule