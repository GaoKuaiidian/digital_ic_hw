module data_convert_top(
    input            clk,
    input            reset_n,
    input            start,
    input            byt,
    input    [7:0]   data_in,
    output           full,
    output           empty,
    output   [4:0]   dmod,
    output           mod_en
    );

//reg/wire define
  wire  [7:0] trans_out;
  wire        trans_out_en;
  wire  [7:0] fifo_out;
  wire        rd;

//---------------main code---------------//

data_trans u1(
    .clk     (clk),
    .reset_n (reset_n),
    .start   (start),
    .data_in (data_in),
    .byt     (byt),
    .data_o  (trans_out),
    .data_en (trans_out_en)
);

FIFO64x8 u2(
    .clk     (clk),
    .reset_n (reset_n),
    .wr_en   (trans_out_en),
    .data_in (trans_out),
    .rd_en   (rd),
    .data_o  (fifo_out),
    .full    (full),
    .empty   (empty)
);

data_mod u3(
    .clk     (clk),
    .reset_n (reset_n),
    .data_in (fifo_out),
    .rdy     (empty),
    .rd      (rd),
    .mod_en  (mod_en),
    .dmod    (dmod)
);

endmodule
