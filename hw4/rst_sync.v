module rst_sync (
    input clk ,
    input rst_n ,
    output reg rst_sync_n
);
always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
        rst_sync_n <= 1'b0 ;
    else
        rst_sync_n <= 1'b1 ;
end
endmodule