module ALU (
    input [31:0] A, B,    // ALU 32-bit inputs
    input [2:0] ALUOp,    // ALU operation selector
    output reg [31:0] Result, // ALU 32-bit output
    output reg Zero       // Zero flag
);

always @(*) begin
    case (ALUOp)
        3'b000: Result = A + B;           
        3'b001: Result = A - B;             
        3'b101: Result = (A < B) ? 32'b1 : 32'b0;  
        3'b011: Result = A | B;             
        3'b010: Result = A & B;             
        default: Result = 32'b0;          
    endcase

    Zero = (Result == 32'b0) ? 1'b1 : 1'b0;
end

endmodule
