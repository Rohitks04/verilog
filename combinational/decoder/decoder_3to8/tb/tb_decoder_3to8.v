`timescale 1ps/1ps

module tb_decoder_3to8;
reg  [2:0] in;
wire [7:0] out;
decoder_3to8 dut (
    .in(in),
    .out(out)
);
initial begin
    $dumpfile("waves/dump.vcd");
    $dumpvars(0, tb_decoder_3to8);
    $monitor("Time=%0t | in=%b | out=%b",$time, in, out);
    in = 3'b000;
    #10;
    in = 3'b001;
    #10;
    in = 3'b010;
    #10;
    in = 3'b011;
    #10;
    in = 3'b100;
    #10;
    in = 3'b101;
    #10;
    in = 3'b110;
    #10;
    in = 3'b111;
    #10;
    $finish;
    $display("test compeleted");
end
endmodule