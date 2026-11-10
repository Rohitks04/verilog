`timescale 1ns/1ps

module tb_decoder_2to4;

reg  [1:0] in;
wire [3:0] out;

decoder_2to4 dut (
    .in(in),
    .out(out)
);

initial begin
    $dumpfile("waves/dump.vcd");
    $dumpvars(0, tb_decoder_2to4);
    $monitor("Time=%0t | in=%b | out=%b",$time, in, out);
    
    in = 2'b00;
    #10;
    in = 2'b01;
    #10;
    in = 2'b10;
    #10;
    in = 2'b11;
    #10;
 $finish;
 $display("test compeleted");

end

endmodule
