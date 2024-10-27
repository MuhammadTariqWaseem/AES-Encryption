module SCPP_tb();
    // Inputs
    reg clk, reset;
    reg [31:0] Instr;
    reg [31:0] ReadData;

    // Outputs
    wire [31:0] PC;
    wire MemWrite;
    wire [31:0] ALUResult;
    wire [31:0] WriteData;

    // Instantiate the Unit Under Test (UUT)
    SCP dut(
        .clk(clk), 
        .reset(reset), 
        .PC(PC), 
        .Instr(Instr), 
        .MemWrite(MemWrite), 
        .ALUResult(ALUResult), 
        .WriteData(WriteData), 
        .ReadData(ReadData)
    );

    // Clock generation
    always begin
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;
    end

    // Initial block for test stimulus
    initial begin
        // Apply reset
        reset = 1;
        #20;
        reset = 0;

        // Apply instructions at specific time intervals
        Instr = 32'h00500113;  // Some instruction
        #50;
        Instr = 32'h00C00193;  // Another instruction
        #50;
        Instr = 32'hFF718393;  // Branch instruction
        #50;
        Instr = 32'h0023E233;  // Memory instruction
        #50;
        Instr = 32'h0041F2B3;  // Load instruction
        #50;
        Instr = 32'h0041F2B3;
        #50;
        Instr = 32'h004282B3;  // Another instruction
        #50;
        Instr = 32'h02728863;  // Branch instruction
        #50;
        Instr = 32'h0041A233;  // Memory instruction
        #50;
        Instr = 32'h00020463;  // Load instruction
        // Stop simulation after running all instructions
    end
endmodule
