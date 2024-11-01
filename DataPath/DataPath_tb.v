module DataPath_tb;
    // Inputs
    reg clk, reset;
    reg [1:0] ResultSrc;
    reg PCSrc, ALUSrc;
    reg RegWrite;
    reg [1:0] ImmSrc;
    reg [2:0] ALUControl;
    reg [31:0] Instr;
    reg [31:0] ReadData;

    // Outputs
    wire Zero;
    wire [31:0] PC;
    wire [31:0] ALUResult;
    wire [31:0] WriteData;

    // Instantiate the Unit Under Test (UUT)
    DataPath dut (
        .clk(clk), 
        .reset(reset), 
        .ResultSrc(ResultSrc), 
        .PCSrc(PCSrc), 
        .ALUSrc(ALUSrc), 
        .RegWrite(RegWrite), 
        .ImmSrc(ImmSrc), 
        .ALUControl(ALUControl), 
        .Zero(Zero), 
        .PC(PC), 
        .Instr(Instr), 
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
        // Reset initialization
        reset = 1;
        #20;
        reset = 0;

        // Apply initial control signals and test stimuli
        ResultSrc = 2'b00;
        ALUSrc = 1'b1;
        PCSrc = 1'b0;
        RegWrite = 1'b1;
        ImmSrc = 2'b00;
        ALUControl = 3'b000;
        Instr = 32'h00500113;   // Some instruction
        ReadData = 32'h0;       // Set initial read data
        
        #50;
        Instr = 32'h00C00193;

        #50;
        Instr = 32'hFF718393;
        // Add some delay and change stimuli to test more cases
        #50;
        Instr = 32'h0023E233;   // Another instruction
        ALUControl = 3'b011;
        ALUSrc = 1'b0;
    end
endmodule
