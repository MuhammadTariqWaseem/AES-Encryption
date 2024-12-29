module PPWH(clk,reset);
input clk,reset;

wire [31:0]PCPlus4,PCPlus41,PCTargetE,PCNext,PCNext1,PC,Instr,InstrX,InstrF;
reg PCSrc;

wire [31:0]InstrD,InstrL,InstrK,InstrY,PCD,PCPlus4D,WriteDataW,RD1,RD2,ImmExt;
wire Branch,MemWrite,ALUSrc,RegWrite,Jump,RegWriteW,FF,FD,FE;
wire [1:0]ResultSrc, ImmSrc;
wire [2:0]ALUControl;
wire [4:0]WriteAddW;

wire [31:0]RD1E,RD2E,PCE,ImmExtE,PCPlus4E,SrcE,ALUResultX,A32,B32;
wire [4:0]WriteAddE,rs1,rs2,IS1,IS2;
wire [1:0]ResultSrcE,ResultSrcX,A,B;
wire [2:0]ALUControlE;
wire RegWriteE,MemWriteE,RegWriteE1,MemWriteE1,JumpE,JumpE1,BranchE,BranchE1,ALUSrcE;

wire [31:0]RD2X,SrcX,A32X,PCPlus4X,C,C1,PCX,ImmExtX;
wire [4:0]WriteAddX;
wire [2:0]ALUControlX,funct3X;
wire RegWriteX,MemWriteX,JumpX,BranchX,ALUSrcX,Zero;

wire [31:0]ALUResultM,RD2M,PCPlus4M,ReadDataM;
wire [1:0]ResultSrcM;
wire [4:0]WriteAddM;
wire RegWriteM,MemWriteM,SS11,s,STF,STD,STE,STF1;

wire [31:0]ReadDataW,ALUResultW,PCPlus4W;
wire [1:0]ResultSrcW;

wire [63:0]E[15:0];
wire [63:0]F[15:0];

Mux2by1 #(32) pcmux(PCPlus4, PCTargetE, PCSrc, PCNext);

FF321 #(32) ff0(clk, reset, STF, PCNext, PC);
FF32 #(1) ff001(clk, reset, STF , STF1);

		assign Instr = (STF1)? Instr : InstrF ;
      InstructionMemory IM(PCNext,clk, InstrF,reset);
      Adder a0(PC, 32'd4 , PCPlus4);

FF321 #(107) ff1(clk, reset, STD, {Instr,PC,PCPlus4,Instr[19:15],Instr[24:20],FF}, {InstrL,PCD,PCPlus4D,IS1,IS2,SS11});
 
  
		Mux2by1 #(32) ins1(InstrL,32'h00000013, SS11, InstrD);
      Controller3 c(InstrD[6:0], InstrD[14:12], InstrD[30],ResultSrc, ImmSrc, MemWrite, 
                   Branch,ALUSrc, RegWrite, Jump, ALUControl,FD,InstrD[25]);
      Register rff(clk, RegWriteW, InstrD[19:15], InstrD[24:20],WriteAddW, WriteDataW, RD1 ,RD2);
		Extend ext(InstrD[31:7], ImmSrc, ImmExt);
      PP1 HU(ResultSrcX[0],WriteAddX,RegWriteX,rs1,rs2,FF,FD,FE,STF,STD,STE,PCSrc);
		

		
FF321 #(217) ff2(clk, reset, STE, {RegWrite,ResultSrc,MemWrite,Jump,Branch,ALUControl,ALUSrc,RD1,RD2,
                PCD,InstrD[11:7],ImmExt,PCPlus4D,InstrD[19:15], InstrD[24:20],InstrD}, {RegWriteE,ResultSrcE,MemWriteE,JumpE,BranchE,
					 ALUControlE,ALUSrcE,RD1E,RD2E,PCE,WriteAddE,ImmExtE,PCPlus4E,rs1,rs2,InstrK});	
					 
					 
		Mux3by1 #(32) muxA(RD1E, ALUResultM, WriteDataW, A, A32);
		Mux3by1 #(32) muxB(RD2E, ALUResultM, WriteDataW, B, B32);
		Mux2by1 #(32) srcbmux(B32, ImmExtE, ALUSrcE, SrcE);	
		ForwardingUnit fdu(WriteAddM,WriteAddW,rs1,rs2,RegWriteM,RegWriteW,A,B);
		Mux2by1 #(4) Flush(4'b0000,{BranchE,JumpE,RegWriteE,MemWriteE},FE,{BranchE1,JumpE1,RegWriteE1,MemWriteE1});
		
		
FF32 #(209) ff3(clk, reset, {RegWriteE1,ResultSrcE,MemWriteE1,A32,SrcE,B32,WriteAddE,PCPlus4E,ALUControlE,InstrK[14:12],BranchE1,JumpE1,PCE,ImmExtE}, 
                {RegWriteX,ResultSrcX,MemWriteX,A32X,SrcX,RD2X,WriteAddX,PCPlus4X,ALUControlX,funct3X,BranchX,JumpX,PCX,ImmExtX});
					
		ALU2 alu(A32X, SrcX, ALUControlX, ALUResultX, Zero,funct3X);
		Adder a1(PCX,ImmExtX, PCTargetE);
		MWCS(clk,reset,A32X,SrcX,1'b0,C);
      always@(*) begin 
		  if((BranchX === 1'bx)|(Zero === 1'bx)|(JumpX === 1'bx))
		      PCSrc = 0;
		  else
	         PCSrc = (BranchX & Zero) | JumpX ; 
		end		

FF32 #(106) ff4(clk, reset, {RegWriteX,ResultSrcX,MemWriteX,ALUResultX,RD2X,WriteAddX,PCPlus4X,funct3X[0]}, 
                {RegWriteM,ResultSrcM,MemWriteM,ALUResultM,RD2M,WriteAddM,PCPlus4M,s});
			 
	   DataMemory DM(clk, ALUResultX, RD2X, MemWriteX, ReadDataM);
		
		
FF32 #(104) ff5(clk, reset, {RegWriteM,ResultSrcM,ALUResultM,ReadDataM,WriteAddM,PCPlus4M}, 
                {RegWriteW,ResultSrcW,ALUResultW,ReadDataW,WriteAddW,PCPlus4W});
					 
      mux4by1 #(32) resultmux(ALUResultW, ReadDataW, PCPlus4W, C, ResultSrcW, WriteDataW);
		
endmodule
		