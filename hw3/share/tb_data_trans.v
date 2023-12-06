`timescale 1ns/1ps
module tb_data_trans ();
reg       reset_n ;
reg       start   ;
reg       clk     ;
reg  [7:0]data_in ;
reg       byt     ;
wire [7:0] data_o ;
wire       data_en;
reg [47:0] input_data = 48'h87_X6_95_43_X2_10;

parameter   IDLE            = 1'b0  ,
            S_4bit_DATA     = 1'b1  ;

initial begin
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
	repeat(2)  @(posedge clk);  

    repeat(10) @(posedge clk);
    $finish;    
end 
always #5 clk = ~ clk ;
data_trans u_data_trans(
    .reset_n  ( reset_n  ),
    .start    ( start    ),
    .clk      ( clk      ),
    .data_in  ( data_in  ),
    .byt      ( byt      ),
    .data_o   ( data_o   ),
    .data_en  ( data_en  )
);

endmodule