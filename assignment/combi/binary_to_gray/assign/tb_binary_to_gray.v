`timescale 1ns/1ps
module tb_binary_to_gray;
reg[3:0] binary;
wire[3:0] gray;
reg [3:0] expected; 
integer i;

binary_to_gray dut (
    .binary(binary),
    .gray(gray)
);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0,tb_binary_to_gray);

    $monitor("time=%0t | binary=%b | gray =%b",$time,binary,gray);
    for(i=0;i<16;i=i+1) begin
        binary = i; #10;
        expected = binary ^ (binary >> 1);
    end

    if (gray == expected) begin
        $display("Test pass for binary=%b, expected gray=%b, got gray=%b", binary, expected, gray);
    end else begin
        $display("Test failed for binary=%b, expected gray=%b, got gray=%b", binary, expected, gray);
    end

end

endmodule
    