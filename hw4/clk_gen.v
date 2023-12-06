`timescale 1ns/1ns
module clk_gen #(
    parameter CLK_PERIOD_NS = 10 ,
    parameter START_TIME_NS    = 5*1000
) (
    output reg clk_out
);
    initial begin
        clk_out = 1'bx ;
        #START_TIME_NS ;
        forever begin
            #(CLK_PERIOD_NS/2) clk_out = ~ clk_out ;
        end
    end
endmodule