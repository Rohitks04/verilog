module tb_bcd_adder;
reg [3:0] a,b;
reg cin ;
wire [3:0] sum;
wire cout;

integer i,j,k;

bcd_adder dut(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_bcd_adder);
    $monitor("Time=%0t | a=%b | b=%b | cin=%b | sum=%b | cout=%b",$time, a, b, cin, sum, cout);
    
     for (i = 0; i < 10; i = i + 1) begin
            for (j = 0; j < 10; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin

                    a = i;
                    b = j;
                    cin = k;

                    #10;

                end
            end
        end

        $display("All test cases completed!");
        $finish;

    end

endmodule
