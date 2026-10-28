`timescale 1ns/1ps

module tb_or_gate;
	reg a;
	reg b;
	wire y;

	// The RTL module must be named or_gate and expose a, b, and y ports.
	or_gate dut (
		.a(a),
		.b(b),
		.y(y)
	);

	initial begin
		$dumpfile("waves/dump.vcd");
		$dumpvars(0, tb_or_gate);
		$monitor("time=%0t | a=%b b=%b | y=%b", $time, a, b, y);

		a = 1'b0; b = 1'b0; #10;
		a = 1'b0; b = 1'b1; #10;
		a = 1'b1; b = 1'b0; #10;
		a = 1'b1; b = 1'b1; #10;

		$finish;
	end
endmodule
