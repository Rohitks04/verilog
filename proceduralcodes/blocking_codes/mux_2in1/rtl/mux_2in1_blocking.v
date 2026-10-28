module mux_2in1_blocking (
	input  wire a,
	input  wire b,
	input  wire sel,
	output reg  y
);

	always @(*) begin
		y = sel ? b : a;
	end

endmodule
