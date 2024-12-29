module encoder4to2(b0, b1, d0, d1, d2, d3);
    output b0, b1;
    input d0, d1, d2, d3;
    
    assign b0 = d1 | d3;
    assign b1 = d2 | d3;
endmodule

module test;
    wire b0, b1;
    reg d0, d1, d2, d3;
    encoder4to2 encg(b0, b1, d0, d1, d2, d3);

    initial begin
        $dumpfile("6.vcd");
        $dumpvars(0, test);
        d0 = 0; d1 = 0; d2 = 0; d3 = 1;
        #40;
        d0 = 0; d1 = 1; d2 = 0; d3 = 0;
        #40;
        d0 = 0; d1 = 0; d2 = 1; d3 = 0;
        #40;
        d0 = 1; d1 = 0; d2 = 0; d3 = 0;
        #40;
        $finish;
    end
endmodule
