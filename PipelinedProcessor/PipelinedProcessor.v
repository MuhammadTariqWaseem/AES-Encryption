module PipelinedProcessor(clk,reset);
input clk,reset;

wire [31:0]PCPlus4,PCTargetE,PCNext,PC,Instr;
reg PCSrc;

wire [31:0]InstrD,PCD,PCPlus4D,WriteDataW,RD1,RD2,ImmExt;
wire Branch,MemWrite,ALUSrc,RegWrite,Jump,RegWriteW;
wire [1:0]ResultSrc, ImmSrc;
wire [2:0]ALUControl;
wire [4:0]WriteAddW;

wire [31:0]RD1E,RD2E,PCE,ImmExtE,PCPlus4E,SrcE,ALUResultE;
wire [4:0]WriteAddE;
wire [1:0]ResultSrcE;
wire [2:0]ALUControlE;
wire RegWriteE,MemWriteE,JumpE,BranchE,ALUSrcE,Zero;

wire [31:0]ALUResultM,RD2M,PCPlus4M,ReadDataM;
wire [1:0]ResultSrcM;
wire [4:0]WriteAddM;
wire RegWriteM,MemWriteM;

wire [31:0]ReadDataW,ALUResultW,PCPlus4W;
wire [1:0]ResultSrcW;

Mux2by1 #(32) pcmux(PCPlus4, PCTargetE, PCSrc, PCNext);

FF32 #(32) ff0(clk, reset, PCNext, PC);


      InstructionMemory IM(PCNext,clk, Instr, reset);
      Adder a0(PC, 32'd4 , PCPlus4);

		
FF32 #(96) ff1(clk, reset, {Instr,PC,PCPlus4}, {InstrD,PCD,PCPlus4D});


      Controller1 c(InstrD[6:0], InstrD[14:12], InstrD[30],ResultSrc, ImmSrc, MemWrite, 
                   Branch,ALUSrc, RegWrite, Jump, ALUControl);
      Register rf(clk, RegWriteW, InstrD[19:15], InstrD[24:20],WriteAddW, WriteDataW, RD1 ,RD2);
		Extend ext(InstrD[31:7], ImmSrc, ImmExt);

		
FF32 #(175) ff2(clk, reset, {RegWrite,ResultSrc,MemWrite,Jump,Branch,ALUControl,ALUSrc,RD1,RD2,
                PCD,InstrD[11:7],ImmExt,PCPlus4D}, {RegWriteE,ResultSrcE,MemWriteE,JumpE,BranchE,
					 ALUControlE,ALUSrcE,RD1E,RD2E,PCE,WriteAddE,ImmExtE,PCPlus4E});	
					 
					 
	   Mux2by1 #(32) srcbmux(RD2E, ImmExtE, ALUSrcE, SrcE);
      ALU alu(RD1E, SrcE, ALUControlE, ALUResultE, Zero);
      Adder a1(PCE,ImmExtE, PCTargetE);	
      always@(*) begin 
		  if((BranchE === 1'bx)|(Zero === 1'bx)|(JumpE === 1'bx))
		      PCSrc = 0;
		  else
	         PCSrc = (BranchE & Zero) | JumpE ; 
		end
	

FF32 #(105) ff3(clk, reset, {RegWriteE,ResultSrcE,MemWriteE,ALUResultE,RD2E,WriteAddE,PCPlus4E}, 
                {RegWriteM,ResultSrcM,MemWriteM,ALUResultM,RD2M,WriteAddM,PCPlus4M});
					 
					 
	   DataMemory DM(clk, ALUResultM, RD2M, MemWriteM, ReadDataM);
		
		
FF32 #(104) ff4(clk, reset, {RegWriteM,ResultSrcM,ALUResultM,ReadDataM,WriteAddM,PCPlus4M}, 
                {RegWriteW,ResultSrcW,ALUResultW,ReadDataW,WriteAddW,PCPlus4W});
					 
      Mux3by1 #(32) resultmux(ALUResultW, ReadDataW, PCPlus4W, ResultSrc, WriteDataW);
		
endmodule
		