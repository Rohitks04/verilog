module gray_to_binary (
    input reg [3:0] gray ,
    output wire [3:0] binary 
);

assign binary[3] = gray[3];
assign binary[2] = gray[3] ^ binary[2];
assign binary[1] = gray[2] ^ binary[1];
assign binary[0] = gray[1] ^ binary[0];
    
endmodule
