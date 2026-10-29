`timescale 1ns/1ps

module tb_mux_4in1;

	reg [3:0] d;
	reg [1:0] sel;
	wire y;
	integer i;
	integer j;
	reg expected;

	mux_4in1 dut (
		.d(d),
		.sel(sel),
		.y(y)
	);

	initial begin
		for (i = 0; i < 16; i = i + 1) begin
			for (j = 0; j < 4; j = j + 1) begin
				d = i;
				sel = j;
				#10;
				expected = d[sel];

				if (y !== expected) begin
					$display("FAIL: d=%b sel=%b y=%b expected=%b", d, sel, y, expected);
					$finish;
				end
			end
		end

		$display("PASS: all mux_4in1 test cases passed");
		$finish;
	end

endmodule
