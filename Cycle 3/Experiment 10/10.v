module gates(input a, b, output [2:0] y);
    assign y[2] = a & b;
    assign y[1] = a | b;
    assign y[0] = ~a;
endmodule

module gates_tb;
    wire [2:0] y;
    reg a, b;
    
    gates gates_inst(a, b, y);
    
    initial begin
        $dumpfile("10.vcd");
        $dumpvars(0, gates_tb);
        
        a = 1'b0; b = 1'b0;
        #50;
        
        a = 1'b0; b = 1'b1;
        #50;
        
        a = 1'b1; b = 1'b0;
        #50;
        
        a = 1'b1; b = 1'b1;
        #50;
        
        $finish;
    end
endmodule
