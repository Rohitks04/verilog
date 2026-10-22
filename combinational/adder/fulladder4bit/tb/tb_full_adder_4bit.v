`timescale 1ns/1ps

module tb_full_adder_4bit;
	reg  [3:0] a;
	reg  [3:0] b;
	reg        cin;
	wire [3:0] sum;
	wire       cout;

	integer a_value;
	integer b_value;
	integer carry_value;

	

	// Positional ports: A, B, Cin, Sum, Cout.
	full_adder_4bit dut (a, b, cin, sum, cout);

	initial begin
        $dumpfile("waves/dump.vcd");
        $dumpvars(0,tb_full_adder_4bit);
    end

	initial begin	
		$display(" time |   a    b  cin | cout  sum");
		$monitor("%4t | %4b %4b   %b  |   %b   %4b",
				 $time, a, b, cin, cout, sum);

		for (a_value = 0; a_value < 16; a_value = a_value + 1)
			for (b_value = 0; b_value < 16; b_value = b_value + 1)
				for (carry_value = 0; carry_value < 2; carry_value = carry_value + 1) begin
					a = a_value;
					b = b_value;
					cin = carry_value;
					#10;
				end
		#50;
		$finish;
	end
endmodule

