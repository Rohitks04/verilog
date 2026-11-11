`timescale 1ns/1ps
module tb_forloop_b_to_g;
reg [3:0] binary;
wire [3:0] gray;
binary_to_gray dut (
    .binary(binary),
    .gray(gray)
);
integer i;
initial begin
    $dumpfile("dump_1.vcd");
    $dumpvars(0,tb_forloop_b_to_g);
    $monitor("time=%0t | binary=%b | gray =%b",$time,binary,gray);
    for(i=0;i<16;i=i+1) begin
        binary = i; #10;
    end
    $finish;
end       
    
endmodule