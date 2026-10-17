`timescale 1ns/1ps

module tb_4bit_half_adder;
	reg  [3:0] a;
	reg  [3:0] b;
	wire [3:0] sum;
	wire       carry;
	reg  [4:0] expected;
	integer i;
	integer j;

	four_bit_half_adder dut (
		.a(a),
		.b(b),
		.sum(sum),
		.carry(carry)
	);

	initial begin
        $dumpfile("waves/dump.vcd");
        $dumpvars(0,tb_4bit_half_adder);
    end

    initial begin    
		for (i = 0; i < 16; i = i + 1) begin
			for (j = 0; j < 16; j = j + 1) begin
				a = i;
				b = j;
				expected = i + j;
				#1;
				if ({carry, sum} !== expected) begin
					$display("FAIL: a=%0d b=%0d expected=%0d got=%0d",
							 a, b, expected, {carry, sum});
					$finish;
				end
			end
		end

		$display("PASS: all 256 input combinations verified");
		$finish;
	end
endmodule
