module demux_1to8 (
	input  wire       data_in,
	input  wire [2:0] sel,
	output reg  [7:0] data_out
);

	always @(*) begin
		data_out = 8'b0;
		data_out[sel] = data_in;
	end

endmodule
