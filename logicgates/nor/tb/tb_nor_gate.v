
`timescale 1ps/1ps

module tb_nor_gate;

    reg a;
    reg b;
    wire y;

    nor_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $dumpfile("waves/dump.vcd");
        $dumpvars(0, tb_nor_gate);
    end

    initial begin
        a = 0; b = 0;
        #10;
        a = 0; b = 1;
        #10;
        a = 1; b = 0;
        #10;
        a = 1; b = 1;
        #10;

        $display("Test completed");
        $finish;
    end

endmodule
