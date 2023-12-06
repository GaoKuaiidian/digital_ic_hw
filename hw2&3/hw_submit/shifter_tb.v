`timescale 1ns/1ps
module shifter_tb;
parameter   WIDTH = 4 ;//Can be changed to any length

reg                   clk         ;
reg                   clr         ;//asynchronous low active reset
reg [ WIDTH - 1 : 0 ] D           ;
reg                   D_sr        ;
reg                   D_sl        ;
reg                   ld          ;
reg                   sr          ;
reg                   sl          ;
reg [ 2 : 0 ]         prior_con   ; //priority control signal
wire[ WIDTH-1 : 0 ]   Q           ;
 
initial begin
    clk         <=  1'b1    ;   
    clr         <=  1'b1    ;   
    D           <=  4'b0110 ;   
    D_sr        <=  1'b1    ;   
    D_sl        <=  1'b1    ;   
    ld          <=  1'b0    ;   
    sr          <=  1'b0    ;   
    sl          <=  1'b0    ;   
    prior_con   <=  3'b0    ;   
end
always #10 clk =  ~ clk ;
initial begin
    #10 clr = 1'b0 ;
    #20 clr = 1'b1 ;
        ld  = 1'b1 ;
    #20 prior_con = 3'b010 ;
        sr  = 1'b1 ;
    #40 prior_con = 3'b100 ;
        sl  = 1'b1 ;
    #80
    $stop;
end
shifter#(
    .WIDTH      ( WIDTH )
)u_shifter(
    .clk        ( clk        ),
    .clr        ( clr        ),
    .D          ( D          ),
    .D_sr       ( D_sr       ),
    .D_sl       ( D_sl       ),
    .ld         ( ld         ),
    .sr         ( sr         ),
    .sl         ( sl         ),
    .prior_con  ( prior_con  ),
    .Q          ( Q          )
);
//initial begin
//  $display("\n*** fsdb file dump is turned on ***\n");
//  $fsdbDumpfile("tb_alu_top.fsdb");
//  $fsdbDumpvars(0);
//end
endmodule

