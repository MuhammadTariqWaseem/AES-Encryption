module PipelinedProcessorwithoutHazard(clk,reset);
input clk,reset;

wire [31:0]PCPlus4,PCTargetE,PCNext,PC,Instr,InstrX;
reg PCSrc;

wire [31:0]InstrD,InstrL,PCD,PCPlus4D,WriteDataW,RD1,RD2,ImmExt;
wire Branch,MemWrite,ALUSrc,RegWrite,Jump,RegWriteW,SS1,SS2;
wire [1:0]ResultSrc, ImmSrc;
wire [2:0]ALUControl;
wire [4:0]WriteAddW;

wire [31:0]RD1E,RD2E,PCE,ImmExtE,PCPlus4E,SrcE,ALUResultE,A32,B32;
wire [4:0]WriteAddE,rs1,rs2;
wire [1:0]ResultSrcE,A,B;
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


      InstructionMemory IM(PCNext,clk, InstrX,reset);
		Mux2by1 #(32) stall1(32'h00000013, InstrX, !PCSrc, Instr);
      Adder a0(PC, 32'd4 , PCPlus4);

		
FF32 #(96) ff1(clk, reset, {Instr,PC,PCPlus4}, {InstrL,PCD,PCPlus4D});
 
 
      Mux2by1 #(32) ins(InstrL,32'h00000013, PCSrc, InstrD);
      Controller2 c(InstrD[6:0], InstrD[14:12], InstrD[30],ResultSrc, ImmSrc, MemWrite, 
                   Branch,ALUSrc, RegWrite, Jump, ALUControl,1'b1);
      Register1 rff(clk, RegWriteW, InstrD[19:15], InstrD[24:20],WriteAddW, WriteDataW, RD1 ,RD2);
		Extend ext(InstrD[31:7], ImmSrc, ImmExt);
      //HazardUnit HU(ResultSrcE[0],WriteAddE,InstrD[19:15],InstrD[24:20],SS1,SS2,PCSrc,clk);
		

		
FF32 #(185) ff2(clk, reset, {RegWrite,ResultSrc,MemWrite,Jump,Branch,ALUControl,ALUSrc,RD1,RD2,
                PCD,InstrD[11:7],ImmExt,PCPlus4D,InstrD[19:15], InstrD[24:20]}, {RegWriteE,ResultSrcE,MemWriteE,JumpE,BranchE,
					 ALUControlE,ALUSrcE,RD1E,RD2E,PCE,WriteAddE,ImmExtE,PCPlus4E,rs1,rs2});	
					 
					 
		Mux3by1 #(32) muxA(RD1E, ALUResultM, WriteDataW, A, A32);
		Mux3by1 #(32) muxB(RD2E, ALUResultM, WriteDataW, B, B32);
		Mux2by1 #(32) srcbmux(B32, ImmExtE, ALUSrcE, SrcE);
      ALU alu(A32, SrcE, ALUControlE, ALUResultE, Zero);
      Adder a1(PCE,ImmExtE, PCTargetE);	
		ForwardingUnit fdu(WriteAddM,WriteAddW,rs1,rs2,RegWriteM,RegWriteW,A,B);
      always@(*) begin 
		  if((BranchE === 1'bx)|(Zero === 1'bx)|(JumpE === 1'bx))
		      PCSrc = 0;
		  else
	         PCSrc = (BranchE & Zero) | JumpE ; 
		end
	

FF32 #(105) ff3(clk, reset, {RegWriteE,ResultSrcE,MemWriteE,ALUResultE,RD2E,WriteAddE,PCPlus4E}, 
                {RegWriteM,ResultSrcM,MemWriteM,ALUResultM,RD2M,WriteAddM,PCPlus4M});
					 
					 
	   DataMemory DM(clk, ALUResultE, RD2E, MemWriteE, ReadDataM);
		
		
FF32 #(104) ff4(clk, reset, {RegWriteM,ResultSrcM,ALUResultM,ReadDataM,WriteAddM,PCPlus4M}, 
                {RegWriteW,ResultSrcW,ALUResultW,ReadDataW,WriteAddW,PCPlus4W});
					 
      Mux3by1 #(32) resultmux(ALUResultW, ReadDataW, PCPlus4W, ResultSrcW, WriteDataW);
		
endmodule
		