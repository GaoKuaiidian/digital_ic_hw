`timescale 1ns/1ps
module shifter_4bit_tb;

reg                   clk         ;
reg                   clr         ;
reg [ 4 - 1 : 0 ]     D           ;
reg                   D_sr        ;
reg                   D_sl        ;
reg                   ld          ;
reg                   sr          ;
reg                   sl          ;
wire[ 4 - 1 : 0 ]     Q           ;
 
initial begin
    clk         <=  1'b1    ;   
    clr         <=  1'b1    ;   
    D           <=  4'b0110 ;   
    D_sr        <=  1'b1    ;   
    D_sl        <=  1'b1    ;   
    ld          <=  1'b0    ;   
    sr          <=  1'b0    ;   
    sl          <=  1'b0    ;   
end
always #10 clk =  ~ clk ;
initial begin
    #10 clr = 1'b0 ;
    #20 clr = 1'b1 ;
        ld  = 1'b1 ;sr  = 1'b0 ;sl  = 1'b0 ;
    #20 ld  = 1'b0 ;sr  = 1'b1 ;sl  = 1'b0 ;
    #20 ld  = 1'b0 ;sr  = 1'b0 ;sl  = 1'b1 ;    
    #20
    $finish;
end
shifter_4bit#(
)u_shifter_4bit(
    .clk        ( clk        ),
    .clr        ( clr        ),
    .D          ( D          ),
    .D_sr       ( D_sr       ),
    .D_sl       ( D_sl       ),
    .ld         ( ld         ),
    .sr         ( sr         ),
    .sl         ( sl         ),
    .Q          ( Q          )
);
endmodule

