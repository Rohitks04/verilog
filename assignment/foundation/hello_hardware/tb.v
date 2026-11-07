`timescale 1ns/1ps

module tb;
	reg  in;
	wire out;

	hello_hardware dut (
		.in(in),
		.out(out)
	);
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);    

	initial begin
		in = 1'b0;
		#10;
		if (out !== 1'b0) $fatal(1, "Expected out=0 when in=0");

		in = 1'b1;
		#10;
		if (out !== 1'b1) $fatal(1, "Expected out=1 when in=1");

		in = 1'b0;
		#10;
		if (out !== 1'b0) $fatal(1, "Expected out=0 when in=0");

		$display("PASS: hello_hardware test completed");
		$finish;
	end
endmodule
