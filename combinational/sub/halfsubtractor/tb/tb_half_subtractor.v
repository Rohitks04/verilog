`timescale 1ns/1ps

module tb_half_subtractor;

	reg  a;
	reg  b;
	wire diff;
	wire borrow;

	integer errors;

	half_subtractor dut (
		.a(a),
		.b(b),
		.diff(diff),
		.borrow(borrow)
	);

	task check_result;
		input expected_diff;
		input expected_borrow;
		begin
			#1;
			$display("%0t\t%b\t%b\t%b\t%b", $time, a, b, diff, borrow);
			if (diff !== expected_diff || borrow !== expected_borrow) begin
				$display("ERROR: expected diff=%b borrow=%b", expected_diff, expected_borrow);
				errors = errors + 1;
			end
			#9;
		end
	endtask

	initial begin
		$dumpfile("waves/dump.vcd");
		$dumpvars(0, tb_half_subtractor);

		errors = 0;
		$display("Time\ta\tb\tdiff\tborrow");

		a = 0; b = 0; check_result(0, 0);
		a = 0; b = 1; check_result(1, 1);
		a = 1; b = 0; check_result(1, 0);
		a = 1; b = 1; check_result(0, 0);

		if (errors == 0)
			$display("PASS: all half-subtractor test cases passed.");
		else
			$display("FAIL: %0d half-subtractor test case(s) failed.", errors);

		$finish;
	end

endmodule
