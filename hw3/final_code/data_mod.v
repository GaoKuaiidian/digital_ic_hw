module data_mod (
	input  wire  	  clk     ,
	input  wire  	  reset_n ,
	input  wire 	  empty   ,
	input  wire [7:0] data_in ,

	output wire	      rd 	  ,
	output reg  [4:0] dmod    ,
	output reg 		  mod_en
);
	reg [2:0] count  	      ;
	reg [7:0] data_temp       ;
	assign rd = ~empty && count!= 3'd2 && count!= 3'd5 && count!= 3'd7;
	always @(posedge clk or negedge reset_n) begin
		if(~reset_n) begin
			dmod   <= 5'd0;
			mod_en <= 1'b0;
			data_temp <= 8'd0;
		    count <= 3'd0;
		end else begin
			if (~empty) begin
				data_temp <=  (count == 3'd2 || count == 3'd5 || count == 3'd7)? data_temp : data_in;			  
				mod_en <= 1'b1 ;
			    count <= count + 1'b1 ;
				case  (count)
					3'd0: dmod <= data_in[4:0]                     ;
					3'd1: dmod <= {data_in[1:0], data_temp[7:5]} ;
					3'd2: dmod <= {data_temp[6:2]}               ;
					3'd3: dmod <= {data_in[3:0], data_temp[7]}   ;
					3'd4: dmod <= {data_in[0], data_temp[7:4]}   ;
					3'd5: dmod <= {data_temp[5:1]}               ;
					3'd6: dmod <= {data_in[2:0], data_temp[7:6]} ;
					3'd7: dmod <= {data_temp[7:3]}               ;
				endcase
			end else begin
				dmod   <= 5'd0;
				mod_en <= 1'b0;
				data_temp <= data_temp;
			end
		end
	end

endmodule 