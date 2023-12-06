module seq_dect (
	input           clk         ,
	input           clr         ,
    input           A           ,
    input           B           ,
	output reg      Z            
);
parameter   IDLE        = 3'd0  ,
            DETECT_01   = 3'd1  ,
            DETECT_X0   = 3'd2  ,
            DETECT_0111 = 3'd3  ,
            DETECT_011  = 3'd4  ;
reg [2:0]   state_cur, 
            state_next;
always @(posedge clk or negedge clr) begin
	if (~clr)   state_cur <= IDLE;
	else        state_cur <= state_next;
end
always@(*) begin
	case (state_cur)
		IDLE        :   case ({A,B})
                    2'b00: state_next = DETECT_X0    ;
                    2'b01: state_next = DETECT_01    ;  
                    2'b10: state_next = DETECT_X0    ;  
                    2'b11: state_next = IDLE         ;
                    endcase    
		DETECT_01   :   case ({A,B})
                    2'b00: state_next = DETECT_X0    ;                    
                    2'b01: state_next = DETECT_01    ;
                    2'b10: state_next = DETECT_X0    ;
                    2'b11: state_next = DETECT_0111  ;
                    endcase
        DETECT_X0   :   case ({A,B})
                    2'b00: state_next = DETECT_X0    ;
                    2'b01: state_next = DETECT_01    ;
                    2'b10: state_next = DETECT_X0    ;
                    2'b11: state_next = DETECT_011   ;
                    endcase
        DETECT_0111 :   case ({A,B})
                    2'b00: state_next = DETECT_X0    ;
                    2'b01: state_next = IDLE         ;
                    2'b10: state_next = DETECT_X0    ;
                    2'b11: state_next = IDLE         ;
                    endcase
        DETECT_011  :  case ({A,B})
                    2'b00: state_next = DETECT_X0    ;
                    2'b01: state_next = DETECT_01    ;
                    2'b10: state_next = IDLE         ;
                    2'b11: state_next = IDLE         ;
                    endcase
    endcase
end
always @(*) begin
    Z = state_cur == DETECT_0111 &&  A    == 1'b0  ||
        state_cur == DETECT_011  && {A,B} == 2'b10 ;
end
endmodule
