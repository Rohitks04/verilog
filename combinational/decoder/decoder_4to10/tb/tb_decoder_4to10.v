`timescale 1ps/1ps

module tb_decoder_4to10;
reg  [3:0] in;
wire [9:0] out;
decoder_4to10 dut (
    .in(in),
    .out(out)
);
initial begin
    $dumpfile("waves/dump.vcd");
    $dumpvars(0, tb_decoder_4to10);
    $monitor("Time=%0t | in=%b | out=%b",$time, in, out);
    in = 4'b0000;
    #10;
    in = 4'b0001;
    #10;
    in = 4'b0010;
    #10;
    in = 4'b0011;
    #10;
    in = 4'b0100;
    #10;
    in = 4'b0101;
    #10;
    in = 4'b0110;
    #10;
    in = 4'b0111;
    #10;
    in = 4'b1000;
    #10;
    in = 4'b1001;
    #10;
    in = 4'b1010;
    #10;
    in = 4'b1011;
    #10;
    in = 4'b1100;
    #10;
    in = 4'b1101;
    #10;
    in = 4'b1110;
    #10;
    in = 4'b1111;
    #10;
    $finish;
    $display("test compeleted");
end
endmodule