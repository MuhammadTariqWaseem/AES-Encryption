 module Controller3(op, funct3 , funct7b5, ResultSrc, ImmSrc, MemWrite, Branch, ALUSrc, RegWrite, Jump, ALUControl, SS2,funct7b1);
 
 input [6:0] op;
 input [2:0] funct3;
 input funct7b5;
 output [1:0] ResultSrc,ImmSrc;
 output MemWrite,Branch, ALUSrc,RegWrite, Jump;
 output [2:0] ALUControl;
 input SS2,funct7b1;
 
 wire [1:0] ALUOp;
 wire [1:0] ResultSrc1,ImmSrc1;
 wire MemWrite1,Branch1, ALUSrc1,RegWrite1, Jump1;
 wire [2:0] ALUControl1;
 
 MainDecoder md(op, ResultSrc1, MemWrite1, Branch1, ALUSrc1, RegWrite1, Jump1, ImmSrc1, ALUOp);
 AluDecoder1 ad(funct7b5 , op[5], funct3, ALUOp, ALUControl1,funct7b1);

 Mux2by1 #(12) srcbmux( 12'h000 ,{ResultSrc1, ImmSrc1, MemWrite1, Branch1, ALUSrc1, RegWrite1, Jump1, ALUControl1}, SS2 ,
                       {ResultSrc, ImmSrc, MemWrite, Branch, ALUSrc, RegWrite, Jump, ALUControl});
  
 endmodule