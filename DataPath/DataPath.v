 module DataPath(input clk, reset,
                 input [1:0]ResultSrc,
                 input PCSrc, ALUSrc,
                 input RegWrite,
                 input [1:0]ImmSrc,
                 input [2:0]ALUControl,
                 output Zero,
                 output [31:0]PC,
                 input [31:0]Instr,
                 output [31:0] ALUResult, WriteData,
                 input [31:0] ReadData);
					  
    wire [31:0] PCNext, PCPlus4, PCTarget;
    wire [31:0] ImmExt;
    wire [31:0] SrcA, SrcB;
    wire [31:0] Result;

    FF32 #(32) pcreg(clk, reset, PCNext, PC);
	 
    Adder pcadd4(PC, 32'd4, PCPlus4);
    Adder pcaddbranch(PC, ImmExt, PCTarget);
	 
    Mux2by1 #(32) pcmux(PCPlus4, PCTarget, PCSrc, PCNext);

    Register rf(clk, RegWrite, Instr[19:15], Instr[24:20],Instr[11:7], Result, SrcA, WriteData);
    
	 Extend ext(Instr[31:7], ImmSrc, ImmExt);

    Mux2by1 #(32) srcbmux(WriteData, ImmExt, ALUSrc, SrcB);
	 
    ALU alu(SrcA, SrcB, ALUControl, ALUResult, Zero);
	 
    Mux3by1 #(32) resultmux(ALUResult, ReadData, PCPlus4, ResultSrc, Result);
	 
 endmodule