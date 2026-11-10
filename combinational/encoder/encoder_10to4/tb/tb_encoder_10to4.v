module tb_encoder_10to4;
reg [9:0] in;
wire [3:0] out;

encoder_10to4 dut (
    .in(in),
    .out(out)
);
initial begin
    $dumpfile("waves/dump.vcd");
    $dumpvars(0, tb_encoder_10to4);
    in = 10'b0000000000; #10;
    in = 10'b0000000001; #10;
    in = 10'b0000000010; #10;
    in = 10'b0000000100; #10;
    in = 10'b0000001000; #10;
    in = 10'b0000010000; #10;
    in = 10'b0000100000; #10;
    in = 10'b0001000000; #10;
    in = 10'b0010000000; #10;
    in = 10'b0100000000; #10;
    in = 10'b1000000000; #10;
    $monitor("Time: %0t | in: %b | out: %b", $time, in , out );
    $finish;
end
endmodule               

