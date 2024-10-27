module FF32 #(parameter WIDTH = 8)
              (input  clk, reset,
               input  [WIDTH-1:0] d,
               output reg [WIDTH-1:0] q);

    always @(posedge clk or posedge reset)
        if (reset) 
            q <= 0;
        else 
            q <= d;

endmodule
