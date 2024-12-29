module Mux4to1(t1, t2, t3, t4, sel1, sel2, op);
    input t1, t2, t3, t4, sel1, sel2;
    output op;
    wire a, b, c, d;

    and a1(a, t1, ~sel1, ~sel2);
    and a2(b, t2, ~sel1, sel2);
    and a3(c, t3, sel1, ~sel2);
    and a4(d, t4, sel1, sel2);
    or o1(op, a, b, c, d);
endmodule

module test;
    reg t1, t2, t3, t4, sel1, sel2;
    wire op;
    Mux4to1 muxg(t1, t2, t3, t4, sel1, sel2, op);

    initial begin
        $dumpfile("4.vcd");
        $dumpvars(0, test);
        t1 = 0; t2 = 0; t3 = 0; t4 = 0; sel1 = 0; sel2 = 0; #20;
        t1 = 1; t2 = 0; t3 = 0; t4 = 0; sel1 = 0; sel2 = 0; #20;
        t1 = 0; t2 = 0; t3 = 0; t4 = 0; sel1 = 0; sel2 = 1; #20;
        t1 = 1; t2 = 1; t3 = 0; t4 = 0; sel1 = 0; sel2 = 1; #20;
        t1 = 0; t2 = 0; t3 = 1; t4 = 0; sel1 = 1; sel2 = 0; #20;
        t1 = 1; t2 = 1; t3 = 0; t4 = 1; sel1 = 1; sel2 = 0; #20;
        t1 = 1; t2 = 0; t3 = 0; t4 = 1; sel1 = 1; sel2 = 1; #20;
        t1 = 0; t2 = 1; t3 = 1; t4 = 0; sel1 = 1; sel2 = 1; #20;
        $finish;
    end
endmodule
