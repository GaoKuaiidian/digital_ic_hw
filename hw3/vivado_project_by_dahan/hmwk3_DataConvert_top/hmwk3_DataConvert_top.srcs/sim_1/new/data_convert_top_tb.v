`timescale 1ns / 1ps

module data_convert_top_tb();
    
  reg        clk;
  reg        reset_n;
  reg        start;
  reg  [7:0] data_in;
  reg        byt;
  wire       full;
  wire       empty;
  wire [4:0] dmod;
  wire       mod_en;

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset_n =1;
    #10
    reset_n = 0;
    #20
    reset_n = 1;
    #10
    start = 1;
    byt = 1;
    data_in = 8'h10;
    #10
    byt = 0;
    data_in = 8'hf2;
    #10
    byt = 1;
    data_in = 8'h43;
    #10
    byt = 1;
    data_in = 8'h95;
    #10
    byt = 0;
    data_in = 8'hf6;
    #10
    byt = 1;
    data_in = 8'h87;
    #2000
    $finish;
end

data_convert_top u_top(
    .clk(clk),
    .reset_n(reset_n),
    .start(start),
    .data_in(data_in),
    .byt(byt),
    .full(full),
    .empty(empty),
    .dmod(dmod),
    .mod_en(mod_en)
    );

endmodule

