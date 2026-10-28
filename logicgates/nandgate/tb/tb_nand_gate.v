`timescale 1ns/1ps

module tb_nand_gate;
	reg a;
	reg b;
	wire y;

	nand_gate dut ( 
          .a(a),
          .b(b),
          .y(y)
);

	initial begin
		$dumpfile("waves/dump.vcd");
		$dumpvars(0, tb_nand_gate);
    end

    initial begin
        $monitor("Time: %0t | a: %b | b: %b | y: %b", $time, a, b, y);
		a = 0; b = 0; #10;
		a = 0; b = 1; #10;
		a = 1; b = 0; #10;
		a = 1; b = 1; #10;
        $display("Test completed.");
		$finish;
	end
endmodule
