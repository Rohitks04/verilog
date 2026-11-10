`timescale 1ns/1ps
module tb_priority_encoder_8to3;

    reg [7:0]in;
    wire [2:0]out;

    integer i;

    priority_encoder_8to3 dut (
        .in(in),
        .out(out)
        );

        initial begin 

            $dumpfile("dump.vcd");
            $dumpvars(0,tb_priority_encoder_8to3);

            $monitor("time=%0t, in=%b, out=%b",$time,in,out);
            
            for (i=0; i<256; i=i+1) begin
                in=i;
                #5;
            end
            $finish;
        end     

endmodule
