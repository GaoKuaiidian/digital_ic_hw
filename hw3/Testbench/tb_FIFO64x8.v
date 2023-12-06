`timescale  1ns / 1ps

module tb_FIFO64x8;

// FIFO64x8 Parameters
parameter PERIOD         = 10;
parameter DATA_WIDTH     = 8 ;
parameter FIFO_DEPTH     = 64;
parameter PROG_FULL_TH   = 48;
parameter PROG_EMPTY_TH  = 16;

// FIFO64x8 Inputs
reg   reset_n                              = 'b0 ;
reg   clk                                  = 'b0 ;
reg   [DATA_WIDTH-1:0]  data_in            = 'b0 ;
reg   wr_en                                = 'b0 ;
reg   rd_en                                = 'b0 ;

// FIFO64x8 Outputs
wire  [DATA_WIDTH-1:0]  data_o             ;
wire  full                                 ;
wire  empty                                ;

integer i ;
initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) reset_n  =  1;
	// write begin
	for ( i = 0; i <= 63; i = i + 1 ) begin
		@(posedge clk);
		wr_en   = 1'b1 ;
        data_in = i    ;
	end
    wr_en   = 1'b0 ;
	// read begin
	for ( i = 0; i <= 63; i = i + 1 ) begin
		@(posedge clk);
		rd_en = 1'b1 ;
	end
    rd_en   = 1'b0 ;
	repeat(10)@(posedge clk);
	$finish;		
end

FIFO64x8 #(
    .DATA_WIDTH    ( DATA_WIDTH    ),
    .FIFO_DEPTH    ( FIFO_DEPTH    ),
    .PROG_FULL_TH  ( PROG_FULL_TH  ),
    .PROG_EMPTY_TH ( PROG_EMPTY_TH ))
 u_FIFO64x8 (
    .reset_n                 ( reset_n                 ),
    .clk                     ( clk                     ),
    .data_in                 ( data_in  			   ),
    .wr_en                   ( wr_en                   ),
    .rd_en                   ( rd_en                   ),

    .data_o                  ( data_o                  ),
    .full                    ( full                    ),
    .empty                   ( empty                   )
);

endmodule