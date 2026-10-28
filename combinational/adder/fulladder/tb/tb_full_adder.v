
`timescale 1ns/1ps

module tb_full_adder;

    reg a, b, cin;
    wire sum, carry;

    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $dumpfile("waves/dump.vcd");
        $dumpvars(0, tb_full_adder);

        $monitor("a=%b b=%b cin=%b sum=%b carry=%b",
                  a, b, cin, sum, carry);

        a=0; b=0; cin=0; #10;
        a=0; b=0; cin=1; #10;
        a=0; b=1; cin=0; #10;
        a=0; b=1; cin=1; #10;
        a=1; b=0; cin=0; #10;
        a=1; b=0; cin=1; #10;
        a=1; b=1; cin=0; #10;
        a=1; b=1; cin=1; #10;

        $display("Test completed!");
        $finish;
    end

endmodule
