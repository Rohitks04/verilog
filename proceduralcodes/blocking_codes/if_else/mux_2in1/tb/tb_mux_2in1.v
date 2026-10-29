`timescale 1ns/1ps

module tb_mux_2in1;

reg a;
reg b;
reg sel;
wire y;
integer i;

mux_2in1 dut (
	.a(a),
	.b(b),
	.sel(sel),
	.y(y)
);

initial begin
	for (i = 0; i < 8; i = i + 1) begin
		{sel, b, a} = i[2:0];
		#10;
		if (y !== (sel ? b : a)) begin
			$display("FAIL: a=%b b=%b sel=%b y=%b", a, b, sel, y);
			$finish;
		end
	end

	$display("PASS: all mux_2in1 input combinations verified");
	$finish;
end

endmodule
