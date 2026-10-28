`timescale 1ns/1ps

module tb_demux_1to4;

reg din;
reg [1:0] sel;
wire [3:0] y;

demux_1to4 uut (
    .din(din),
    .sel(sel),
    .y(y)
);

initial begin
    $dumpfile("waves/dump.vcd");
    $dumpvars(0,tb_demux_1to4);
end

initial begin
    $monitor("Time=%0t | din=%b sel=%b | y=%b",
              $time, din, sel, y);

    din = 0; sel = 2'b00; #10;
    din = 1; sel = 2'b00; #10;
    din = 1; sel = 2'b01; #10;
    din = 1; sel = 2'b10; #10;
    din = 1; sel = 2'b11; #10;
    din = 0; sel = 2'b11; #10;

    $finish;
end

endmodule