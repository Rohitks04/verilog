`timescale 1ns/1ps

module tb_encoder_4to2;
reg [3:0] in;
wire [1:0] out;

encoder_4to2 dut (
    .in(in),
    .out(out)
);

initial begin
    $dumpfile("waves/dump.vcd");
    $dumpvars(0, tb_encoder_4to2);

    in = 4'b0000; #10;
    in = 4'b0001; #10;
    in = 4'b0010; #10;
    in = 4'b0100; #10;

    $monitor("Time: %0t | in: %b | out: %b", $time, in , out );
    $finish;   
end
    
endmodule
