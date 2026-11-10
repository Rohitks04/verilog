`timescale 1ns/1ps
module tb_freq_div;

    reg sys_clk;
    reg arest_n;
    wire real_clk;  
    
    freq_div dut (
        .sys_clk(sys_clk),
        .arest_n(arest_n),
        .real_clk(real_clk)
    );
    
    initial begin
        $dumpfile("waves/dump.vcd");
        $dumpvars(0, tb_freq_div);
    end
    
    initial begin
        sys_clk = 0;
        arest_n = 0;
        forever #1 sys_clk = ~sys_clk;
    end

    initial begin
        #7
        arest_n = 1;
        #500
        $finish;
    end
    
endmodule
