module InstructionMemory(input [31:0]a,input clk,output [31:0] rd,input reset);

    INST	INST_inst0(.aclr (reset),.address ({a[9:2],2'b00}),.clock ( clk ),.q (rd[7:0]));
	 INST	INST_inst1(.aclr (reset),.address ({a[9:2],2'b01}),.clock ( clk ),.q (rd[15:8]));
    INST	INST_inst2(.aclr (reset),.address ({a[9:2],2'b10}),.clock ( clk ),.q (rd[23:16]));
	 INST	INST_inst3(.aclr (reset),.address ({a[9:2],2'b11}),.clock ( clk ),.q (rd[31:24]));

 endmodule