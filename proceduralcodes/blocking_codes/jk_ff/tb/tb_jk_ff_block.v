`timescale 1ns/1ps

module tb_jk_ff_block;
	reg j;
	reg k;
	reg clk;
	wire q;
	wire qbar;

	jk_ff_block dut (
		.j(j),
		.k(k),
		.clk(clk),
		.q(q),
		.qbar(qbar)
	);

	always #5 clk = ~clk;

	task apply_inputs;
		input j_value;
		input k_value;
		input expected_q;
		begin
			@(negedge clk);
			j = j_value;
			k = k_value;
			@(posedge clk);
			#1;
			if (q !== expected_q || qbar !== ~expected_q) begin
				$display("FAIL: j=%b k=%b expected q=%b qbar=%b, got q=%b qbar=%b",
						 j_value, k_value, expected_q, ~expected_q, q, qbar);
				$finish;
			end
		end
	endtask

	initial begin
        $dumpfile("waves/dump.vcd");
        $dumpvars(0, tb_jk_ff_block);
		clk = 1'b0;
		j = 1'b0;
		k = 1'b0;

		// Set, hold, reset, then toggle the JK flip-flop.
		apply_inputs(1'b1, 1'b0, 1'b1);
		apply_inputs(1'b0, 1'b0, 1'b1);
		apply_inputs(1'b0, 1'b1, 1'b0);
		apply_inputs(1'b1, 1'b1, 1'b1);
		apply_inputs(1'b1, 1'b1, 1'b0);

		$display("PASS: all JK flip-flop tests passed");
		$finish;
	end
endmodule
