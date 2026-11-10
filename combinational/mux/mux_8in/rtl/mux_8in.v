module mux_8in (
    input wire a,b,c,d,e,f,g,h,
    input wire [2:0] sel,
    output wire y
);
assign y = (sel == 3'b000) ? a :
                (sel == 3'b001) ? b :
                (sel == 3'b010) ? c :
                (sel == 3'b011) ? d :
                (sel == 3'b100) ? e :
                (sel == 3'b101) ? f :
                (sel == 3'b110) ? g : h;
endmodule