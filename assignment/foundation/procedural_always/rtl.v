module procedural_always (
    input wire a, b,
    output reg y
);
    always @(*) begin
        y = a & b;
    end
endmodule