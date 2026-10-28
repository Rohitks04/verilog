`timescale 1ns/1ps

module tb_xnor_gate;

    reg a;
    reg b;
    wire y;

    xnor_gate dut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $dumpfile("waves/dump.vcd");
        $dumpvars(0, tb_xnor_gate);
        $monitor("At time %t: a=%b, b=%b, y=%b", $time, a, b, y);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $display("Test completed");
        $finish;
    end
endmodule