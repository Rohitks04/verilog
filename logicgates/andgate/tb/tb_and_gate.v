`timescale 1ns/1ps

module tb_and_gate;
	reg a;
	reg b;
	wire y;

	and_gate uut (
		.a(a),
		.b(b),
		.y(y)
	);

    initial begin
		$dumpfile("waves/dump.vcd");
		$dumpvars(0, tb_and_gate);
	end

	initial begin
    $monitor("Time=%0t | a=%b | b=%b | y=%b", $time, a, b, y);

    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $display("AND gate testing completed.");
    $finish;
end
endmodule


