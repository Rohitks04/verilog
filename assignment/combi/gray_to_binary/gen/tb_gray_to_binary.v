`timescale 1ps/1ps 
module tb_gray_to_binary;
reg [3:0] gray ;
wire [3:0] binary ;
reg [3:0] expected ;

integer i;

gray_to_binary dut (
    .gray(gray),
    .binary(binary) 
);
 
initial begin
    $dumpfile("dump.vdc");
    $dumpvars(0,tb_gray_to_binary);
    
    $monitor("time=%0t,gray=%b,binary=%b",$time,gray,binary);

    for(i=0;i<16;i=i+1)begin
        
        gray=i;

        expected[3] = gray[3];
        expected[2] = expected[3]^gray[2];
        expected[1] = expected[2]^gray[1];
        expected[0] = expected[1]^gray[0];

        #10;

        if (binary == expected)begin
            $display("test pass: gray=%b,expected=%b,output=%b",gray,expected,binary);
        end
        else begin
            $display("test pass: gray=%b,expected=%b,output=%b",gray,expected,binary); 
        end
    end
    $finish;

end

endmodule