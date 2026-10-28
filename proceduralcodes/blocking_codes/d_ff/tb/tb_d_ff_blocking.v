`timescale 1ns/1ps

module tb_d_ff_blocking;
	reg clk;
	reg d;
	wire q;

	d_ff_blocking uut (
		.clk(clk),
		.d(d),
		.q(q)
	);

	always #5 clk = ~clk;

	initial begin
        $dumpfile("waves/dump.vcd");
        $dumpvars(0, tb_d_ff_blocking);
		clk = 1'b0;
		d = 1'b0;

		// Change data away from the rising edge, then check it is captured.
		#2 d = 1'b1;
		#6;
		if (q !== 1'b1) $fatal(1, "Expected q=1 after sampling d=1");

		d = 1'b0;
		#10;
		if (q !== 1'b0) $fatal(1, "Expected q=0 after sampling d=0");

		d = 1'b1;
		#10;
		if (q !== 1'b1) $fatal(1, "Expected q=1 after sampling d=1");

		$display("d_ff_blocking test passed");
		$finish;
	end
endmodule
