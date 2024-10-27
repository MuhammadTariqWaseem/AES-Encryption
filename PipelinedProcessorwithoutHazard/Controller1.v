 module Controller1(op, funct3 , funct7b5, ResultSrc, ImmSrc, MemWrite, Branch, ALUSrc, RegWrite, Jump, ALUControl);
 
 input [6:0] op;
 input [2:0] funct3;
 input funct7b5;
 output [1:0] ResultSrc,ImmSrc;
 output MemWrite,Branch, ALUSrc,RegWrite, Jump;
 output [2:0] ALUControl;
 
 wire [1:0] ALUOp;
 wire Branch;
 
 MainDecoder md(op, ResultSrc, MemWrite, Branch, ALUSrc, RegWrite, Jump, ImmSrc, ALUOp);
 AluDecoder ad(funct7b5 , op[5], funct3, ALUOp, ALUControl);
 
 endmodule