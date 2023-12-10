module csm #(
) (
    input       rst_n       ,
    input [1:0] RCC_CR_in   ,
    input       clk_ext_100M     ,//fclk:100MHz
    output      clk_sys     ,
    output      clk_ext_100M_ready
);

reg rst_sync_n ;
reg [1:0] RCC_CR ;
reg [14:0] counter_to_compute_clk_ext_100M_is_stable ;
reg flag_initial_n ; 

always @(posedge clk_sys or negedge rst_n) begin
    if(~rst_n)
        rst_sync_n <= 1'b0 ;
    else
        rst_sync_n <= 1'b1 ;
end

always @(posedge clk_sys or negedge rst_n) begin
    if(~rst_n)
        RCC_CR <= 2'b00 ;
    else
        RCC_CR <= RCC_CR_in ;
end

always @(posedge clk_sys or negedge rst_n) begin
    if(~rst_n)
        counter_to_compute_clk_ext_100M_is_stable <= 15'b0 ;
    else if(~flag_initial_n)
        counter_to_compute_clk_ext_100M_is_stable <= counter_to_compute_clk_ext_100M_is_stable + 1'b1 ;
end

assign clk_ext_100M_ready = counter_to_compute_clk_ext_100M_is_stable == 15'd29950;

always @(posedge clk_sys or negedge rst_n) begin
    if(~rst_n)
        flag_initial_n <= 1'b0 ;
    else if(counter_to_compute_clk_ext_100M_is_stable == 15'd29950)
        flag_initial_n <= 1'b1 ;
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
    .sel_clk  ( RCC_CR   ),
    .clk_in   ( {clk_ext_100M,clk_local_32K,clk_local_10M}   ),
    .clk_out  ( clk_sys  )
);

endmodule