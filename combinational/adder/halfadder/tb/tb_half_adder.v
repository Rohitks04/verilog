`timescale 1ns/1ps

module tb_half_adder;
	reg a, b;
	wire sum, carry;

	half_adder dut (
		.a(a),
		.b(b),
		.sum(sum),
		.carry(carry)
	);

	initial begin
		$dumpfile("waves/dump.vcd");
		$dumpvars(0,tb_half_adder);
	end



	initial begin
		a = 0; b = 0; #10;
		if ({carry, sum} !== 2'b00) $fatal(1, "Failed: 0 + 0");

		a = 0; b = 1; #10;
		if ({carry, sum} !== 2'b01) $fatal(1, "Failed: 0 + 1");

		a = 1; b = 0; #10;
		if ({carry, sum} !== 2'b01) $fatal(1, "Failed: 1 + 0");

		a = 1; b = 1; #10;
		if ({carry, sum} !== 2'b10) $fatal(1, "Failed: 1 + 1");

		$display("All half-adder tests passed.");
		$finish;
	end
endmodule
