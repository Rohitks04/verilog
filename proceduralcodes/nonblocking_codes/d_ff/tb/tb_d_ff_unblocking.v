`timescale 1ns/1ps

module tb_d_ff_unblocking;
	reg clk;
	reg d;
	wire q;

	d_ff_unblocking uut (
		.clk(clk),
		.d(d),
		.q(q)
	);

	always #5 clk = ~clk;

	initial begin
        $dumpfile("waves/dump.vcd");
        $dumpvars(0, tb_d_ff_unblocking);
		clk <= 1'b0;
		d   <= 1'b0;

		#10 d <= 1'b1;
		#10 d <= 1'b0;
		#10 d <= 1'b1;
		#10 $finish;
	end

	initial begin
		$monitor("time=%0t clk=%b d=%b q=%b", $time, clk, d, q);
	end
endmodule
