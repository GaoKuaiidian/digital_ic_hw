`timescale  1ns / 1ps
module tb_top;
parameter PERIOD = 10  ;
parameter DATA_WIDTH     = 8 ;
parameter FIFO_DEPTH     = 64;
parameter PROG_FULL_TH   = 48;
parameter PROG_EMPTY_TH  = 16;

reg   reset_n                              = 0 ;
reg   start                                = 0 ;
reg   clk                                  = 0 ;
reg   [7:0]  data_in                       = 0 ;
reg   byt                                  = 0 ;
wire  [4:0]  dmod                          ;
wire  mod_en                               ;
wire  [7:0]  trans_data_o                  ;
wire  trans_data_en                        ;
wire  [DATA_WIDTH-1:0]  fifo_data_o        ;
wire  full                                 ;
wire  empty                                ;
reg [55:0] input_data = 56'h87_X6_95_43_XX_X2_10;
integer i;
initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    clk     = 1'b1 ;
    reset_n = 1'b0 ;
    start   = 1'b0 ;
    data_in = 8'bx ;
    byt     = 8'b0 ;
    #10
    reset_n = 1'b1 ;

    repeat(5)@(posedge clk);
    start   = 1'b1;
	data_in = input_data[7:0];
    input_data = input_data >> 8;
	byt <= 1'b1;
	@(posedge clk);

	data_in = input_data[7:0];
    input_data = input_data >> 8;
	byt <= 1'b0;
	@(posedge clk);

    data_in = input_data[7:0];
    input_data = input_data >> 8;
    start   = 1'b0 ;
	@(posedge clk);

    data_in = input_data[7:0];
    input_data = input_data >> 8;
    start   = 1'b1 ;
    byt     = 1'b1;
	@(posedge clk);

    data_in = input_data[7:0];
    input_data = input_data >> 8;
    start   = 1'b1 ;
    byt     = 1'b1;
	@(posedge clk);

    data_in = input_data[7:0];
    input_data = input_data >> 8;
	byt <= 1'b0 ;
	@(posedge clk);

    data_in = input_data[7:0];
    input_data = input_data >> 8;
	byt <= 1'b1 ;
	@(posedge clk);  

    for(i=0; i<16; i=i+1)begin
        data_in = 8'b0;
        byt <= 1'b1 ;
        @(posedge clk); 
    end
    repeat(10) @(posedge clk);
    $finish;    
end 

data_trans  u_data_trans (
    .reset_n                 ( reset_n        ),
    .start                   ( start          ),
    .clk                     ( clk            ),
    .data_in                 ( data_in        ),
    .byt                     ( byt            ),
    
    .data_o                  ( trans_data_o   ),
    .data_en                 ( trans_data_en  )
);
FIFO64x8 #(
    .DATA_WIDTH    ( DATA_WIDTH    ),
    .FIFO_DEPTH    ( FIFO_DEPTH    ),
    .PROG_FULL_TH  ( PROG_FULL_TH  ),
    .PROG_EMPTY_TH ( PROG_EMPTY_TH ))
 u_FIFO64x8 (
    .reset_n                 ( reset_n                 ),
    .clk                     ( clk                     ),
    .data_in                 ( trans_data_o 		   ),
    .wr_en                   ( trans_data_en           ),
    .rd_en                   ( rd_en                   ),

    .data_o                  ( fifo_data_o             ),
    .full                    ( full                    ),
    .empty                   ( empty                   )
);
data_mod  u_data_mod (
    .reset_n                 ( reset_n        ),
    .clk                     ( clk            ),
    .data_in                 ( fifo_data_o    ),
    .rdy                     ( empty          ),
    .rd                      ( rd_en          ),

    .dmod                    ( dmod           ),
    .mod_en                  ( mod_en         )
);

endmodule