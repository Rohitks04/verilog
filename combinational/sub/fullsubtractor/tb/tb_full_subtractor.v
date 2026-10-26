
`timescale 1ns/1ps

module tb_full_subtractor;

reg A, B, Bin;
wire Diff, Bout;

full_subtractor dut (
    .A(A),
    .B(B),
    .Bin(Bin),
    .Diff(Diff),
    .Bout(Bout)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_full_subtractor);

    A=0; B=0; Bin=0; #10;
    A=0; B=0; Bin=1; #10;
    A=0; B=1; Bin=0; #10;
    A=0; B=1; Bin=1; #10;
    A=1; B=0; Bin=0; #10;
    A=1; B=0; Bin=1; #10;
    A=1; B=1; Bin=0; #10;
    A=1; B=1; Bin=1; #10;

    $finish;
end

endmodule


