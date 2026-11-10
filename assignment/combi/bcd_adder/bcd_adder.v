module bcd_adder(
    input wire [3:0] a,
    input wire [3:0]b,
    input wire cin,
    output reg [3:0] sum,
    output reg cout
);
    reg [4:0] temp;

    always @(*) begin
        temp ={1'b0, a} + {1'b0, b} + cin;
        if (temp > 5'd9) begin
            temp = temp + 5'd6;

        end
        sum = temp[3:0];
        cout = temp[4];
    end
endmodule
