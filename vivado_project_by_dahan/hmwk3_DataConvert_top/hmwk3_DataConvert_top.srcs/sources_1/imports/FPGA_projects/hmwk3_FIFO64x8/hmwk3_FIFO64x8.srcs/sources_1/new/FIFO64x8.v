module FIFO64x8 
   #(
	parameter FULL_LIMIT  = 48,
	parameter EMPTY_LIMIT = 16)
	(
	input 			 clk,
	input 			 reset_n,
	input 			 wr_en,
	input  	[7:0] 	 data_in,
	input 			 rd_en,
	output 	[7:0] 	 data_o,
	output 	reg		 full,
	output 	reg		 empty
	);
//reg/wire define
  wire			wr_en_flag;
  wire			rd_en_flag;
  reg    [5:0] 	wr_ptr;
  reg    [5:0] 	rd_ptr;


//-----------------main code--------------------//
assign wr_en_flag = (!reset_n | full) ? 1'b0 : wr_en;
assign rd_en_flag = (!reset_n | empty)? 1'b0 : rd_en;

//wr_ptr
always @(negedge clk or negedge reset_n) begin
	if (! reset_n) begin
		wr_ptr <= 6'd0;
	end
	else begin 
		if (wr_en_flag && !full) begin
			wr_ptr <= wr_ptr + 1'b1;
		end
	end
end

//rd_ptr
always @(negedge clk or negedge reset_n) begin
	if (! reset_n) begin
		rd_ptr <= 6'd0;
	end
	else begin 
		if (rd_en_flag && !empty) begin
			rd_ptr <= rd_ptr + 1'b1;
		end
	end
end

//full
always @(posedge clk or negedge reset_n) begin
	if (! reset_n) begin
		full <= 1'b0;
	end
	else begin 
		if ((wr_ptr - rd_ptr) >= 47) begin
			full <= 1'b1;
		end
		else begin
			full <= 1'b0;
		end
	end
end

//empty
always @(posedge clk or negedge reset_n) begin
	if (! reset_n) begin
		empty <= 1'b1;
	end
	else begin 
		if ((wr_ptr - rd_ptr) <= 15) begin
			empty <= 1'b1;
		end
		else begin
			empty <= 1'b0;
		end
	end
end

// assign full  = (wr_ptr - rd_ptr >= 47)  				? 1'b1 : 1'b0;
// assign empty = ((wr_ptr - rd_ptr <= 15) || !reset_n) ? 1'b1 : 1'b0;

S65NLLHS2PH64x8 u(
    .QA(data_o),
	.CLKA(clk),
	.CLKB(clk),
	.CENA(~rd_en_flag),
	.CENB(~wr_en_flag),
    .BWENB({8{~wr_en_flag}}),
	.AA(rd_ptr),
	.AB(wr_ptr),
	.DB(data_in));

endmodule