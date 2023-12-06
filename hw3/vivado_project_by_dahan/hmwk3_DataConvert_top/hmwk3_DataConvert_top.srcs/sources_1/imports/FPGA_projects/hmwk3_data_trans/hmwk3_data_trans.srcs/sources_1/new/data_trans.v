module data_trans(
	input 							clk,
	input 							reset_n,
	input 							start,
	input 	    [7:0] 	data_in,
	input 		 					byt,
	output	reg [7:0] 	data_o,
	output	reg					data_en
	);
	
//reg/wire define
  reg [3:0] data_reg;
//FSM
  parameter EMPTY = 1'b0, HALF = 1'b1;
  reg state;

//transition logic
always@(posedge clk or negedge reset_n) begin
	if (!reset_n) begin
		data_o <= 8'd0;
		data_reg <= 4'd0;
		state <= EMPTY;
	end
	else begin 
	  	case(state)
					EMPTY : begin
						if (start && byt) begin
							data_o <= data_in;
							data_en <= 1'b1;
							state <= EMPTY;
						end
						else if (start && !byt) begin
							data_reg <= data_in[3:0];
							data_en <= 1'b0;
							state <= HALF;
						end
					end
					HALF : begin
						if (start && byt) begin
							data_o <= {data_reg , data_in[7:4]};
							data_en <= 1'b1;
							data_reg <= data_in[3:0];
							state <= HALF;
						end
						else if(start && !byt) begin
							data_o <= {data_reg , data_in[3:0]};
							data_en <= 1'b1;
							state <= EMPTY;
						end
					end
	    endcase
	end
end
endmodule