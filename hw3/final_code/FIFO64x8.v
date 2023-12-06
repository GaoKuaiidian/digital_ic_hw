/*
module FIFO64x8 (
    input wire [7:0]data_in,
    input wire wr_en,
    input wire reset_n,
    input wire clk,
    input wire rd_en,
    output wire [7:0]data_o,
    output reg full,
    output reg empty

);
reg [5:0]rd_count;
reg [5:0]wr_count;
reg rd_count_sta;
reg wr_count_sta;
reg [5:0]dif;
wire [7:0] BWENB;
assign BWENB = {8{~wr_en}};
S65NLLHS2PH64x8 u1(.QA(data_o),.CLKA(~clk),.CLKB(~clk),.CENA(~rd_en),.CENB(~wr_en),.BWENB(BWENB),.AA(rd_count),.AB(wr_count),.DB(data_in));
always @(*) begin
  if(rd_count_sta ^ wr_count_sta)begin
    dif = 6'b111111 - rd_count + wr_count; 
  end else begin
    dif = wr_count - rd_count;
  end
  if (dif <= 6'b010000) begin
    empty = 1;
    full  = 0;
  end else begin
    if (dif >= 6'b110000) begin
      full  = 1;
      empty = 0;
    end else begin
      full  = 0;
      empty = 0;  
    end
  end
end

always @(posedge clk or negedge reset_n) begin
  if (!reset_n) begin
    rd_count <= 0 ;
    wr_count <= 0 ;
    rd_count_sta <= 0;
    wr_count_sta <= 0;
  end else begin
    if (rd_count == 6'b111111) begin
      rd_count_sta <= ~rd_count_sta;
    end else begin
      rd_count_sta <= rd_count_sta;
    end
    if (wr_count == 6'b111111) begin
      wr_count_sta <= ~wr_count_sta;
    end else begin
      wr_count_sta <= wr_count_sta;
    end
    if (wr_en) begin
      wr_count <= wr_count + 1'b1;
    end else begin
      wr_count <= wr_count;
    end
    if (rd_en) begin
      rd_count <= rd_count + 1'b1;
    end else begin
      rd_count <= rd_count;
    end
  end
end
endmodule
*/
module FIFO64x8 (
    input wire [7:0]data_in,
    input wire wr_en,
    input wire reset_n,
    input wire clk,
    input wire rd_en,
    output wire [7:0]data_o,
    output reg full,
    output reg empty
);
reg [5:0]rd_count;
reg [5:0]wr_count;
reg [5:0]dif;
wire [7:0] BWENB;
assign BWENB = {8{~wr_en}};
S65NLLHS2PH64x8 u1(.QA(data_o),.CLKA(~clk),.CLKB(~clk),.CENA(~rd_en),.CENB(~wr_en),.BWENB(BWENB),.AA(rd_count),.AB(wr_count),.DB(data_in));
always @(*) begin
  dif = wr_count - rd_count;
  if (dif <= 6'b010000) begin
    empty = 1;
    full  = 0;
  end else begin
    if (dif >= 6'b110000) begin
      full  = 1;
      empty = 0;
    end else begin
      full  = 0;
      empty = 0;  
    end
  end
end
always @(posedge clk or negedge reset_n) begin
  if (!reset_n) begin
    rd_count <= 0 ;
    wr_count <= 0 ;
  end else begin
    if (wr_en) begin
      wr_count <= wr_count + 1'b1;
    end else begin
      wr_count <= wr_count;
    end
    if (rd_en) begin
      rd_count <= rd_count + 1'b1;
    end else begin
      rd_count <= rd_count;
    end
  end
end
endmodule