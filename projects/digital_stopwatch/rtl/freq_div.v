module freq_div (
    input sys_clk,
    input arest_n,
    output reg real_clk
);
    parameter CK_FREQ = 25_000_000;
    parameter FREQ_BITS = $clog2(CK_FREQ);
    reg [FREQ_BITS-1:0] f_counter;

    always @(posedge sys_clk , negedge arest_n) begin
        if (!arest_n) begin
            f_counter <= 0;
            real_clk <= 0;
        end 

        else if (f_counter == CK_FREQ/2 - 1) begin
                f_counter <= 0;
                real_clk <= ~real_clk;
        end 

        else begin
                f_counter <= f_counter + 1;
            end
        end
    endmodule