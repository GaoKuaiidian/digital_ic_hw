module FIFO64x8 #(
    parameter DATA_WIDTH      = 8 ,
    parameter FIFO_DEPTH      = 64,
    parameter PROG_FULL_TH    = 48,// programmable full threshold
    parameter PROG_EMPTY_TH   = 16 // programmable empty threshold
//parameter integer DATA_WIDTH      = 8;
//parameter integer FIFO_DEPTH      = 64;
//parameter integer PROG_FULL_TH    = 48;// programmable full threshold
//parameter integer PROG_EMPTY_TH   = 16;// programmable empty threshold
)(
    input       reset_n ,// synchronous negative reset
    input       clk     ,

    //wr interface
    input [DATA_WIDTH-1:0]  data_in ,
    input                   wr_en   ,
    //rd interface

    output [DATA_WIDTH-1:0] data_o  ,
    input                   rd_en   ,

    // status interface
    output  full    ,// programmable full
    output  empty    // programmable empty
);
localparam 	ADDRESS_WIDTH = $clog2(FIFO_DEPTH);
localparam  Wen_Width = DATA_WIDTH;

//write and read control
wire wr_real_en;
wire rd_real_en;
assign wr_real_en =  ~full & wr_en  ;
assign rd_real_en =  ~empty & rd_en ;
//wr_ptr and rd_ptr
reg [ADDRESS_WIDTH-1: 0 ]wr_ptr;
reg [ADDRESS_WIDTH-1: 0 ]rd_ptr;
always @(posedge clk or negedge reset_n) begin
    if(~reset_n) begin
        wr_ptr <= 'b0;
        rd_ptr <= 'b0;
    end
    else begin
        if(wr_real_en)
            if(wr_ptr == {ADDRESS_WIDTH{1'b1}})
            wr_ptr <= 'b0;
            else
            wr_ptr <= wr_ptr + 1'b1;
        if(rd_real_en)
            if(rd_ptr == {ADDRESS_WIDTH{1'b1}})
            rd_ptr <= 'b0;
            else
            rd_ptr <= rd_ptr + 1'b1;                
    end
end
//state signal
assign full   = (wr_ptr - rd_ptr) >= PROG_FULL_TH;
assign empty  = (wr_ptr - rd_ptr) <= PROG_EMPTY_TH;

S65NLLHS2PH64x8 #(
  .Bits      (DATA_WIDTH),
  .Word_Depth(FIFO_DEPTH),
  .Add_Width (ADDRESS_WIDTH),
  .Wen_Width (Wen_Width),
  .Word_Pt   (1'b1)
)u_S65NLLHS2PH64x8 (
    .QA    ( data_o),       //read data
    .CLKA  ( ~clk  ),       //A port:read
    .CLKB  ( ~clk  ),       //B port:write
    //reverse clk to make sure sample in the middle of data
    .CENA  ( ~rd_real_en ),  //low active	
    .CENB  ( ~wr_real_en ),  //low active	
    .BWENB ( 'b0   ),       //low active	
    .AA    ( rd_ptr    ),   //read address	
    .AB    ( wr_ptr    ),   //write address	
    .DB    ( data_in   )    //write data
);

endmodule