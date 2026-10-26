`timescale 1ns/1ps

module tb_not_gate;
	reg a;
	wire y;

	// DUT is assumed to be named not_gate with ports a and y.
	not_gate dut (.a(a), .y(y));

	initial begin
		$dumpfile("waves/dump.vcd");
		$dumpvars(0, tb_not_gate);
	end

	initial begin
		$monitor("time=%0t a=%b y=%b", $time, a, y);

		a = 1'b0;
		#10;
		a = 1'b1;
		#10;

		$finish;
	end
endmodule



