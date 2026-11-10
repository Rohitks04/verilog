
`timescale 1ns/1ps

module tb;

    reg [7:0] a,b;
    reg cin;

    wire [7:0] sum,carry;

    ripple_adder #(.n(8)) dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .carry(carry)
    );
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
        
        $monitor("time=%0t a=%b b=%b cin=%b sum=%b carry=%b",
                 $time, a, b, cin, sum, carry);
        
        a=0; b=0; cin=0;
        #10;
        
        a=5; b=4; cin=0;
        #10;
        
        a=7; b=8; cin=1;
        #10;
        
        a=15; b=15; cin=1;
        #10;
        
        a=9; b=10; cin=0;
        #10;

        a=10; b=13; cin=0;
        #10;

        a=15; b=15; cin=1;
        #10;    

        a=255; b=255; cin=1;
        #10;

        $finish;
    end
    
endmodule
