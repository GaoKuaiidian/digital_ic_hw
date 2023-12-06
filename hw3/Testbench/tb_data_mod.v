`timescale  1ns / 1ps

module tb_data_mod;

// data_mod Parameters
parameter PERIOD  = 10;

// data_mod Inputs
reg   reset_n                              = 0 ;
reg   clk                                  = 0 ;
reg   [7:0]  data_in                       = 0 ;
reg   rdy                                  = 0 ;

// data_mod Outputs
wire  rd                                   ;
wire  [4:0]  dmod                          ;
wire  mod_en                               ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

data_mod  u_data_mod (
    .reset_n                 ( reset_n        ),
    .clk                     ( clk            ),
    .data_in                 ( data_in        ),
    .rdy                     ( rdy            ),
    .rd                      ( rd             ),
    .dmod                    ( dmod           ),
    .mod_en                  ( mod_en         )
);
integer i;
reg [79:0] pattern = {
5'd15,
5'd14,
5'd13,
5'd12,
5'd11,
5'd10,
5'd9,
5'd8,
5'd7,
5'd6,
5'd5,
5'd4,
5'd3,
5'd2,
5'd1,
5'd0};
initial
begin
    reset_n = 0;
    rdy = 1'b1;
    #(PERIOD*2) reset_n  =  1;
    @(posedge clk);
    rdy = 1'b0;
    for(i=0 ; i< 12 ; i=i+1 )begin
        if(i==5||i==6) begin
            rdy = 1'b1;
            @(posedge clk);
            rdy = 1'b0;       
        end else begin
            @(negedge clk);
            data_in = pattern[7:0];
            pattern = pattern >> 8;
            @(posedge clk);
            while(~rd) @(posedge clk);            
        end
        
    end
    repeat(2) @(posedge clk);
    $finish;
end

endmodule