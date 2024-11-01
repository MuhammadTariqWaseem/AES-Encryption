module AluDecoder(funct7b5, opb5, funct3, ALUOp, ALUControl);
input funct7b5, opb5;
input [2:0] funct3;
input [1:0] ALUOp;
output reg [2:0]ALUControl;

    wire RtypeSub;
    assign RtypeSub = funct7b5 & opb5;  
    always@(*)
	 begin
       case(ALUOp)
           2'b00:ALUControl = 3'b000; 
           2'b01:ALUControl = 3'b001; 
           default: case(funct3)
                         3'b000:    
								     if (RtypeSub)
                                 ALUControl = 3'b001;
                             else
						               ALUControl = 3'b000;
                         3'b010: ALUControl = 3'b101; // slt, slti
                         3'b110: ALUControl = 3'b011; // or, ori
                         3'b111: ALUControl = 3'b010; // and, andi
                         default:ALUControl = 3'bxxx; // ???
                   endcase
       endcase
	 end
 endmodule