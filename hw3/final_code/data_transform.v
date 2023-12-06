module data_transform (
    input wire reset_n,
    input wire clk,
    input wire start,
    input wire [7:0]data_in,
    input wire byte_en,
    output reg [7:0]data_o,
    output reg data_en
);
reg [3:0] data_temp;
reg count;
   always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        data_o                    <= 8'h00;
        data_en                   <= 1'b0;
        count                     <= 1'b0;
    end else begin
        if (start) begin
            if (byte_en && !count) begin
                data_o            <= data_in;
                data_en           <= 1'b1;
                count             <= 1'b0;
            end else begin
                if (byte_en && (count == 1'b1)) begin
                    data_o        <= {data_temp[3:0],data_in[7:4]};
                    data_temp     <= data_in[3:0];
                    count         <= 1'b1;
                    data_en       <= 1'b1;
                end else begin
                    if (!byte_en && (count ==1'b1)) begin
                        data_o    <= {data_temp[3:0],data_in[3:0]};
                        count     <= 1'b0;
                        data_en   <= 1'b1;
                    end else begin
                        data_en   <= 0;
                        data_temp <= data_in[3:0];
                        count     <= 1'b1;
                    end
                end
            end
        end else begin
            data_en <= 1'b0;
        end
    end
   end 
endmodule
