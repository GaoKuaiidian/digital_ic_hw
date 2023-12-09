module clk_ctrl #(
) (
    input       rst_n       ,
    input [1:0] sel_clk     ,
    input [2:0] clk_in      ,
    output reg  clk_out     
);
    reg  [2:0]  clk_enable  ;
    reg  [2:0]  other_clks_is_disable  ;
    reg  [2:0]  sel_clk_in  ;
    reg  [2:0]  reg_clk_enable_in   ;
    reg  [2:0]  clk_enable_d2 ;

    // genvar i;
    generate
        always @(*) begin
            for(integer i = 0; i < 3; i = i + 1 ) begin
                    sel_clk_in[i] = sel_clk == i ;
                    other_clks_is_disable[i] = ~clk_enable[(i+1)%3] & ~clk_enable[(i+2)%3] ;
                    reg_clk_enable_in = sel_clk_in[i] & other_clks_is_disable[i] ;
                    clk_out = ( clk_enable[i] && clk_in[i] ) | clk_out ;
            end
        end
    endgenerate

    genvar i ;
    generate
        for (i = 0; i < 3; i = i + 1 ) begin
            always @(negedge clk_in[i] or negedge rst_n) begin
                if(~rst_n)
                    clk_enable[i] <= (i == 0) ;
                else
                    clk_enable[i] <= reg_clk_enable_in[i] ;
            end
        end 
    endgenerate
endmodule

    // assign other_clks_is_disable[0] = ~clk_enable[2] & ~clk_enable[1] ;
    // assign other_clks_is_disable[1] = ~clk_enable[2] & ~clk_enable[0] ;
    // assign other_clks_is_disable[2] = ~clk_enable[1] & ~clk_enable[0] ;