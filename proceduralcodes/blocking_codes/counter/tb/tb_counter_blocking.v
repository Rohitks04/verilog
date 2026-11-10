`timescale 1ns/1ps

module tb_counter_unblocking;
	reg clk;
	reg reset;
	wire [3:0] count;

	counter_unblocking dut (
		.clk   (clk),
		.reset (reset),
		.count (count)
	);

	initial begin
        $dumpfile("waves/dump.vcd");
        $dumpvars(0, tb_counter_unblocking);
		clk = 1'b0;
		forever #5 clk = ~clk;
	end

	integer expected;
	integer cycle;

	initial begin
		reset = 1'b1;
		expected = 0;
		cycle = 0;

		// Hold reset over a rising edge, then check reset and 20 increments.
		@(posedge clk);
		#1;
		if (count !== 4'd0)
			$fatal(1, "Reset failed: expected 0, got %0d", count);

		@(negedge clk);
		reset = 1'b0;

		repeat (20) begin
			@(posedge clk);
			expected = (expected + 1) % 16;
			#1;
			cycle = cycle + 1;
			if (count !== expected[3:0])
				$fatal(1, "Cycle %0d: expected %0d, got %0d", cycle, expected, count);
		end

		$display("PASS: counter increment and rollover checks passed");
		$finish;
	end
endmodule


