`timescale  1ns / 1ps
module tb_csm;

// csm Inputs
reg   rst_n                                    ;
reg   [1:0]  RCC_CR_in                         ;
wire   clk_100M                                ;

// csm Outputs
wire  clk_sys                              ;
wire  clk_ext_100M_ready                   ;

initial
begin
    rst_n = 0;
    RCC_CR_in = 0;
    #5 rst_n  =  1;
    wait(clk_ext_100M_ready == 1);
    #100 RCC_CR_in = 2'b10;
    #10000
    #100
    #60 RCC_CR_in = 2'b01;
    #312500 $finish;
end

clk_gen#(
    .CLK_PERIOD_NS ( 10   ),
    .START_TIME_NS ( 3*1000*1000 )
)u_clk_gen_100M(
    .clk_out ( clk_100M )//fclk:100MHz
);

csm  u_csm (
    .rst_n                   ( rst_sync_n            ),
    .RCC_CR_in               ( RCC_CR_in             ),
    .clk_ext_100M            ( clk_100M              ),

    .clk_sys                 ( clk_sys                   ),
    .clk_ext_100M_ready      ( clk_ext_100M_ready        )
);

rst_sync u_rst_sync(
    .clk    ( clk_sys    ),
    .rst_n  ( rst_n  ),
    .rst_sync_n  ( rst_sync_n  )
);

endmodule