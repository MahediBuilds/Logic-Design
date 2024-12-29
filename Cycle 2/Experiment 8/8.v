module JK_FF(jk, clk, q, qb);
    input [1:0] jk;
    input clk;
    output reg q = 1'b0;
    output reg qb;

    always @(posedge clk) begin
        case (jk)
            2'b00: q = q;
            2'b01: q = 1'b0;
            2'b10: q = 1'b1;
            2'b11: q = ~q;
        endcase
        qb = ~q;
    end
endmodule

module test_jkflipf;
    reg [1:0] A;
    reg c;
    wire x, xb;

    JK_FF jkff(A, c, x, xb);

    initial c = 1'b0;
    always #5 c = ~c;

    initial begin
        $dumpfile("8.vcd");
        $dumpvars(0, test_jkflipf);

        A = 2'b00; #10;
        A = 2'b01; #10;
        A = 2'b10; #10;
        A = 2'b11; #20;

        $finish;
    end
endmodule
