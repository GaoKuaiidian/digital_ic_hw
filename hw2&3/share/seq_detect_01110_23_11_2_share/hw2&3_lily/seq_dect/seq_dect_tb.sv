`timescale 1ns/1ps
module seq_dect_tb;
reg [ 16 - 1 : 0 ] SEQ_PATTERN = 16'b01_11_00_11_10_00_11_10;
reg     clk  ;
reg     clr  ;
reg     A    ;
reg     B    ;
wire    Z    ;
integer i    ;
initial begin
clk     =  1'b1;
clr     =  1'b1;
A       =  1'b0;
B       =  1'b0;
end
always #10 clk =  ~ clk ;
initial begin
    #10 clr = 1'b0;
    #20 clr = 1'b1;
    for ( i = 7 ; i >=0  ; i = i - 1 ) begin
        A = SEQ_PATTERN[ i * 2 + 1 ];
        B = SEQ_PATTERN[ i * 2     ];
        #20 ;
    end
    $finish;
end
seq_dect u_seq_dect(
    .clk  ( clk  ),
    .clr  ( clr  ),
    .A    ( A    ),
    .B    ( B    ),
    .Z    ( Z    )
);
endmodule