`timescale 1ns/1ps

module tb_and_gate;
	reg a;
	reg b;
	wire y;

	and_gate uut (
		.a(a),
		.b(b),
		.y(y)
	);
	
    initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, tb_and_gate);
	end

	initial begin
		a = 0; b = 0; #10;
		if (y !== 0) $fatal(1, "Failed: 0 & 0 should be 0");

		a = 0; b = 1; #10;
		if (y !== 0) $fatal(1, "Failed: 0 & 1 should be 0");

		a = 1; b = 0; #10;
		if (y !== 0) $fatal(1, "Failed: 1 & 0 should be 0");

		a = 1; b = 1; #10;
		if (y !== 1) $fatal(1, "Failed: 1 & 1 should be 1");

		$display("All AND gate tests passed.");
		$finish;
	end
endmodule


