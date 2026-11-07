`timescale 1ps/1ps

module tb;
    
    reg [3:0] a,b;
    reg cin;
    wire [3:0] sum,carry;

    ripple_adder #(.n(4)) dut(
      .a(a),
      .b(b),
      .cin(cin),
      .sum(sum),
      .carry(carry)
    );
  
    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
    
    end

    initial begin

        $monitor("time=%0t a=%b b=%b cin=%b sum=%b carry=%b",$time,a,b,cin,sum,carry);

        a = 0; b = 0; cin = 0;
        #10 a = 5; b = 4; cin = 0;
        #10 a = 7; b = 8; cin = 1;
        #10 a = 15; b = 15; cin = 1;
        #10 a = 9; b = 10; cin = 0;
        #20 $finish;
    end

    always @(a,b,cin) begin 

        #1;
        $display("time=%0t a=%b b=%b cin=%b sum=%b carry=%b",$time,a,b,cin,sum,carry);
    end
endmodule