module csm #(
) (
    input       rst_n       ,
    input [1:0] RCC_CR_in   ,
    input       clk_ext     ,//fclk:100MHz
    output      clk_sys     
);

reg rst_sync_n ;
reg [1:0] RCC_CR ;
reg counter ;
always @(posedge clk_sys or negedge rst_n) begin
    if(~rst_n)
        rst_sync_n <= 1'b0 ;
    else
        rst_sync_n <= 1'b1 ;
end

always @(posedge clk_sys or negedge rst_n) begin
    if(~rst_n)
        RCC_CR <= 2'b00 ;
    else if(clk_shift_when_initial)
        RCC_CR <= 2'b10 ;
    else
        RCC_CR <= RCC_CR_in ;
end


clk_gen#(
    .CLK_PERIOD_NS ( 31250 ),
    .START_TIME_NS ( 5*1000 )
)u_clk_gen_32K(
    .clk_out ( clk_local_32K )//fclk:32KHz
);
clk_gen#(
    .CLK_PERIOD_NS ( 100   ),
    .START_TIME_NS ( 5*1000 )
)u_clk_gen_10M(
    .clk_out ( clk_local_10M )//fclk:10MHz
);
clk_ctrl#(
)u_clk_ctrl(
    .rst_n    ( rst_n    ),
    .sel_clk  ( sel_clk  ),
    .clk_in   ( clk_in   ),
    .clk_out  ( clk_out  )
);

endmodule