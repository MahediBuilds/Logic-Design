module counter_behav(count, rst, clk);
    input rst, clk;
    output reg [2:0] count;

    always @(posedge clk) begin
        if (rst)
            count <= 3'b000;
        else
            count <= count + 1;
    end
endmodule

module test_mod;
    reg rst, clk;
    wire [2:0] count;
    
    counter_behav countbeh(count, rst, clk);
    
    initial begin
        $dumpfile("9.vcd");
        $dumpvars(0, test_mod);
        
        rst = 1;
        clk = 0;
        #100;
        
        rst = 0;
        #200;
        
        $finish;
    end
    
    always #5 clk = ~clk;
endmodule
