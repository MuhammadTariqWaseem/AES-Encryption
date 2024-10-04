`timescale 1ns / 1ps
module tb_InstructionMemory;

    reg [31:0] a;
    reg clk;
    wire [31:0] rd;

    InstructionMemory uut (
        .a(a),
        .clk(clk),
        .rd(rd)
    );

   always
    begin
        clk <= 1;
        # 25;
        clk <= 0; 
        # 25;
    end

    initial begin
        $monitor("At time %t, address = %h, read data = %h", $time, a, rd);

        a = 32'h00000000;  
        #50;  

        a = 32'h00000004;  
        #50; 

        a = 32'h00000008; 
        #50;  

        a = 32'h0000000C; 
        #50;
        
        a = 32'h000003FC;  
        #50;  
        
        a = 32'h000003FF; 
    end

endmodule

