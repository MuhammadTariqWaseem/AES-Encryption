 module DataMemory(
    input wire clk,
    input wire [31:0] a,
    input wire [31:0] wd,
    input wire we,
    output wire [31:0] rd
);

 RAM1	RAM1_inst0(.address ({a[15:2],2'b00}),.clock (clk),.data(wd[7:0]),.wren (we),.q(rd[7:0]));
 RAM1	RAM1_inst1(.address ({a[15:2],2'b01}),.clock (clk),.data(wd[15:8]),.wren (we),.q(rd[15:8]));
 RAM1	RAM1_inst2(.address ({a[15:2],2'b10}),.clock (clk),.data(wd[23:16]),.wren (we),.q(rd[23:16]));
 RAM1	RAM1_inst3(.address ({a[15:2],2'b11}),.clock (clk),.data(wd[31:24]),.wren (we),.q(rd[31:24]));

endmodule