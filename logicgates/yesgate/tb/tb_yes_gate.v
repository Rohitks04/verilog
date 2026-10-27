`timescale 1ns/1ps

module tb_yes_gate;

reg a;
wire y;

yes_gate dut (
    .a(a),
    .y(y)
);

initial begin
    $dumpfile("waves/dump.vcd");
    $dumpvars(0, tb_yes_gate);
end

initial begin
    $monitor("Time=%0t | a=%b | y=%b", $time, a, y);

    a = 0; #10;
    a = 1; #10;

    $finish;
end

endmodule
