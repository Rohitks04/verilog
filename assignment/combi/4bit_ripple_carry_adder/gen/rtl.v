module full_adder(
    input a,b,cin,
    output sum,carry
);
    
    assign sum =a^b^cin;
    assign carry = (a&b) | (b&cin) | (a&cin);
endmodule

module ripple_adder#(parameter n=4)
(
    input [n -1:0] a,b,
    input cin,
    output [n -1:0] sum,
    output [n -1:0] carry
);
                     
    full_adder fa0(a[0],b[0],cin,sum[0],carry[0]);
    full_adder fa1(a[1],b[1],carry[0],sum[1],carry[1]);
    full_adder fa2(a[2],b[2],carry[1],sum[2],carry[2]);
    full_adder fa3(a[3],b[3],carry[2],sum[3],carry[3]);
endmodule
