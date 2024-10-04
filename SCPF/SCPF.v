module SCPF(input clk, reset,
           output [31:0] WriteData, DataAdr,
           output MemWrite);
    wire [31:0] PC, Instr, ReadData;
    
    SCP s(clk, reset, PC, Instr, MemWrite, DataAdr,  WriteData, ReadData);
    InstructionMemory IM(PC,clk, Instr);
    DataMemory DM(clk, DataAdr, WriteData, MemWrite, ReadData);
	 
 endmodule