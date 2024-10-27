module Register1(clk, write_enable,read_addr1, read_addr2, write_addr, write_data, read_data1, read_data2);
    input wire clk;
    input write_enable;
    input [4:0] read_addr1;
    input [4:0] read_addr2;
    input [4:0] write_addr;
    input [31:0] write_data;
    output [31:0] read_data1;
    output [31:0] read_data2;

    reg [31:0] register[0:31];
    
	 assign read_data1 = (read_addr1 == 5'b00000) ? 32'b0 : ((read_addr1 == write_addr) ? write_data : register[read_addr1]);
    assign read_data2 = (read_addr2 == 5'b00000) ? 32'b0 : ((read_addr2 == write_addr) ? write_data : register[read_addr2]);
		  
    always @(posedge clk) 
	 begin
		  if(write_enable & (write_addr != 5'b00000)) 
            register[write_addr] <= write_data;
    end

endmodule