`timescale 1ps/1ps
module tb;
    reg  a,b;
    wire y;

    procedural_always dut(
        .a(a),
        .b(b),
        .y(y)
    );
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
    end
    initial begin
        a = 1'b0; b = 1'b0;
        #10;
        if (y !== 1'b0) $fatal(1, "Expected y=0 when a=0, b=0");
        a = 1'b0; b = 1'b1;
        #10;
        if (y !== 1'b0) $fatal(1, "Expected y=0 when a=0, b=1");
        a = 1'b1; b = 1'b0;
        #10;
        if (y !== 1'b0) $fatal(1, "Expected y=0 when a=1, b=0");
        a = 1'b1; b = 1'b1;
        #10;
        if (y !== 1'b1) $fatal(1, "Expected y=1 when a=1, b=1");
        $display("PASS: procedural_always test completed");
        $finish;
    end
endmodule    