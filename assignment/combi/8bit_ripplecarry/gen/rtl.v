
module full_adder (
    input a,b,cin,
    output sum,carry
);

    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (a & cin);

endmodule

module ripple_adder #(parameter n = 8)
(
    input [-1:0] a,b,
    input cin,
    output [-1:0] sum,carry
);

     full_adder foa(
        a[0], b[0], cin,
        sum[0],carry[0]
     );

     genvar i;

     generate
        for (i =1 ; i < n; i = i + 1 ) begin: gen_fa

            full_adder fa(
                a[i],b[i],carry[i-1],
                sum[i],carry[i]
            );
        
        end
     endgenerate

endmodule

