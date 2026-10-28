`timescale 1ns/1ps

module tb_mux_2in1_unblocking;
	reg a;
	reg b;
	reg sel;
	wire y;
	integer i;
	integer errors;

	// Positional ports: a, b, select, output.
	mux_2in1_unblocking dut (a, b, sel, y);

	initial begin
        $dumpfile("waves/dump.vcd");
        $dumpvars(0, tb_mux_2in1_unblocking);
		errors = 0;
		for (i = 0; i < 8; i = i + 1) begin
			{sel, a, b} = i[2:0];
			#10;
			if (y !== (sel ? b : a)) begin
				$display("FAIL: sel=%b a=%b b=%b expected=%b got=%b",
						 sel, a, b, (sel ? b : a), y);
				errors = errors + 1;
			end
		end

		if (errors == 0)
			$display("PASS: all mux input combinations produced the expected output");
		else
			$display("FAIL: %0d test(s) failed", errors);
		$finish;
	end
endmodule
