`timescale 1ns / 1ps

module Register1_tb();

    // Inputs
    reg clk;
    reg write_enable;
    reg [4:0] read_addr1;
    reg [4:0] read_addr2;
    reg [4:0] write_addr;
    reg [31:0] write_data;

    // Outputs
    wire [31:0] read_data1;
    wire [31:0] read_data2;

    // Instantiate the Unit Under Test (UUT)
    Register1 uut (
        .clk(clk), 
        .write_enable(write_enable), 
        .read_addr1(read_addr1), 
        .read_addr2(read_addr2), 
        .write_addr(write_addr), 
        .write_data(write_data), 
        .read_data1(read_data1), 
        .read_data2(read_data2)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test scenario
    initial begin
        // Initialize Inputs
        write_enable = 0;
        read_addr1 = 0;
        read_addr2 = 0;
        write_addr = 0;
        write_data = 0;

        // Wait 100 ns for global reset to finish
        #100;

        // Test case 1: Write to register 1
        write_enable = 1;
        write_addr = 5'd1;
        write_data = 32'hAABBCCDD;
        #10;

        // Test case 2: Read from register 1
        write_enable = 0;
        read_addr1 = 5'd1;
        #10;

        // Test case 3: Write to register 2
        write_enable = 1;
        write_addr = 5'd2;
        write_data = 32'h11223344;
        #10;

        // Test case 4: Read from register 1 and 2
        write_enable = 0;
        read_addr1 = 5'd1;
        read_addr2 = 5'd2;
        #10;

        // Test case 5: Write to register 0 (should not change)
        write_enable = 1;
        write_addr = 5'd0;
        write_data = 32'hFFFFFFFF;
        #10;

        // Test case 6: Read from register 0
        write_enable = 0;
        read_addr1 = 5'd0;
        #10;

    end

    // Monitor changes
    initial begin
        $monitor("Time=%0t, WE=%b, WAddr=%d, WData=%h, RAddr1=%d, RData1=%h, RAddr2=%d, RData2=%h",
                 $time, write_enable, write_addr, write_data, read_addr1, read_data1, read_addr2, read_data2);
    end

endmodule