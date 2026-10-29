module mux_4in1 (
	input [3:0] d,
	input [1:0] sel,
	output reg y
);

always @(*) begin
	if (sel == 2'b00)
		y = d[0];
	else if (sel == 2'b01)
		y = d[1];
	else if (sel == 2'b10)
		y = d[2];
	else
		y = d[3];
end

endmodule
