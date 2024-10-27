module AluDecoder_tb;

reg funct7b5, opb5;
reg [2:0] funct3;
reg [1:0] ALUOp;
wire [2:0]ALUControl;

AluDecoder dut(funct7b5, opb5, funct3, ALUOp, ALUControl);
initial begin
  funct3 = 3'b000;
  {funct7b5, opb5} = 2'b00;
  ALUOp = 2'b00;
  #20;
  
  ALUOp = 2'b01;
  #20;
  
  ALUOp = 2'b10;
  
  funct3 = 3'b000;
  {funct7b5, opb5} = 2'b00;
  #20;
  {funct7b5, opb5} = 2'b01;
  #20;
  {funct7b5, opb5} = 2'b10;
  #20;
  {funct7b5, opb5} = 2'b11;
  #20;
  
  funct3 = 3'b010;
  #20;
  funct3 = 3'b110;
  #20;
  funct3 = 3'b111;
  #20;
  
end
endmodule