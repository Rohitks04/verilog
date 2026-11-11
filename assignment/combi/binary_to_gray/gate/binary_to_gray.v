module binary_to_gray (
    input [3:0] binary,
    output [3:0] gray
);

buf  (gray[3], binary[3]);
xor  (gray[2], binary[3],binary[2]);
xor  (gray[1], binary[2],binary[1]);
xor  (gray[0],binary[1],binary[0]);
    
endmodule