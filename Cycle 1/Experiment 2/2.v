module no(t0, a, b, t1);
    input a, b;
    output t0, t1;
    wire x1, x2;

    and a1(x1, a, b);
    not n1(t0, x1);
    or o1(x2, a, b);
    not n2(t1, x2);
endmodule

module testbench;
    reg a, b;
    wire t0, t1;

    no g(t0, a, b, t1);

    initial begin
        $dumpfile("2.vcd");
        $dumpvars(0, testbench);

        a = 1'b0; b = 1'b0; #20;
        a = 1'b0; b = 1'b1; #20;
        a = 1'b1; b = 1'b0; #20;
        a = 1'b1; b = 1'b1; #20;

        $finish;
    end
endmodule
