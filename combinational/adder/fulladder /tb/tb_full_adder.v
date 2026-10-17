`timescale 1ns/1ps

module tb_full_adder;
	reg a, b, cin;
	wire sum, carry;
	reg expected_sum, expected_carry;
	integer i;
	integer errors;

	full_adder dut (
		.a(a),
		.b(b),
		.cin(cin),
		.sum(sum),
		.carry(carry)
	);

	initial begin
        $dumpfile("waves/dump.vcd");
        $dumpvars(0,tb_full_adder);
	end

    initial begin    
		errors = 0;
		for (i = 0; i < 8; i = i + 1) begin
			{a, b, cin} = i;
			expected_sum = a ^ b ^ cin;
			expected_carry = (a & b) | (a & cin) | (b & cin);
			#10;

			if ((sum !== expected_sum) || (carry !== expected_carry)) begin
				$display("FAIL a=%b b=%b cin=%b: sum=%b carry=%b; expected sum=%b carry=%b",
						 a, b, cin, sum, carry, expected_sum, expected_carry);
				errors = errors + 1;
			end else begin
				$display("PASS a=%b b=%b cin=%b: sum=%b carry=%b",
						 a, b, cin, sum, carry);
			end
		end

		if (errors == 0)
			$display("All 8 full-adder test cases passed.");
		else
			$display("%0d of 8 full-adder test cases failed.", errors);
		$finish;
	end
endmodule
