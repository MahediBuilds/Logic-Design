module andor(A, B, C, D, Y);
    input A, B, C, D;
    output Y;
    wire and_op1, and_op2;

    and g1(and_op1, A, B);
    and g2(and_op2, C, D);
    or g3(Y, and_op1, and_op2);
endmodule

module test_andor;
    reg a, b, c, d;
    wire y;
    andor ao(a, b, c, d, y);

    initial begin
        $dumpfile("3.vcd");
        $dumpvars(0, test_andor);
        a = 0; b = 1; c = 1; d = 1; #10;
        a = 0; b = 0; c = 1; d = 0; #10;
        $finish;
    end
endmodule
