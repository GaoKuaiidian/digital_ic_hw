module data_trans (
    input       reset_n ,
    input       start   ,
    input       clk     ,
    input [7:0] data_in ,
    input       byt     ,
    output reg [7:0] data_o  ,
    output reg       data_en 
);
parameter   IDLE     = 1'b0  ,
            S_4bit_DATA   = 1'b1  ;
reg         state_cur;
reg [3:0]   data_reg;
always @(posedge clk or negedge reset_n) begin
    if(~reset_n) begin
        data_reg    <= 'b0  ;
        data_en     <= 'b0  ;
        data_o      <= 'b0  ;
        state_cur   <= IDLE ;
    end else casex (state_cur)
	        IDLE    :   casex ({start,byt})
            2'b0x:  begin
                    data_en     <= 'b0          ;   
                    data_o      <= 'b0          ;  
                    state_cur   <= IDLE         ;  end
            2'b11:  begin
                    data_en     <= 'b1          ;    
                    data_o      <= data_in      ;    
                    state_cur   <= IDLE         ;  end   
            2'b10:  begin
                    data_reg    <= data_in[3:0] ;    
                    data_en     <= 'b0          ;    
                    data_o      <= 'bx          ;    
                    state_cur   <= S_4bit_DATA  ;  end
            endcase
		S_4bit_DATA     :   casex ({start,byt}) 
            2'b0x:  begin
                    data_en     <= 'b0          ;  
                    data_o      <= 'b0          ;  
                    state_cur   <= S_4bit_DATA  ;  end
            2'b11:  begin
                    data_reg    <= data_in[3:0] ;    
                    data_en     <= 'b1          ;    
                    data_o      <= { data_reg , data_in[7:4] };    
                    state_cur   <= S_4bit_DATA  ; end   
            2'b10:  begin
                    data_en     <= 'b1          ;    
                    data_o      <= { data_reg , data_in[3:0] };     
                    state_cur   <= IDLE         ; end        
            endcase
    endcase
end
endmodule