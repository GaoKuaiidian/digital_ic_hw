module data_trans (
    input       reset_n ,//asyn, low active
    input       start   ,
    input       clk     ,
    input [7:0] data_in ,
    input       byt     ,
    output[7:0] data_o  ,
    output      data_en 
);
parameter   IDLE   = 2'b00  ,//No transmission
            S_O_T  = 2'b01  ,//Ordinary transmission
            S_X_F  = 2'b10  ,//Transfers on and after the first x is encountered
            S_X_S  = 2'b11  ;//Transfer  on the second x is encountered
reg [1:0]   state_cur, 
            state_next;
always @(posedge clk or negedge clr) begin
	if (~clr)   state_cur <= IDLE;
	else        state_cur <= state_next;
end
reg [7:0]   data_d1,
            data_d2;
always @(posedge clk or negedge reset_n) begin
    if(~reset_n) begin
        data_d1 <= 'b0  ;
        data_d2 <= 'b0  ;
    end else if (start) begin
        data_d1 <= data_in  ;
        data_d2 <= data_d1  ;
    end
end
always@(*) begin
	casex (state_cur)
		IDLE    :   case ({start,byt})
                    2'b0x: state_next = IDLE    ;
                    2'b10: state_next = S_X_F   ;  
                    2'b11: state_next = S_O_T   ;
                    endcase
		S_O_T   :   case ({start,byt})
                    2'b00: state_next = S_X0    ;                    
                    2'b01: state_next = S_01    ;
                    2'b10: state_next = S_X0    ;
                    2'b11: state_next = S_0111  ;
                    endcase
        S_X_F   :   case ({start,byt})
                    2'b00: state_next = S_X0    ;
                    2'b01: state_next = S_01    ;
                    2'b10: state_next = S_X0    ;
                    2'b11: state_next = S_011   ; 
                    endcase
        S_X_S   :   case ({A,B})
                    2'b00: state_next = S_X0    ;
                    2'b01: state_next = IDLE    ;
                    2'b10: state_next = S_X0    ;
                    2'b11: state_next = IDLE    ;
                    endcase
    endcase
end
//Output logic
always@(*) begin
	case (state)
		IDLE : { data_en , data_o } = { 1'b0 , 8'bx     };
		S_O_T: { data_en , data_o } = { 1'b1 , data_d1  };
		S_X_F: { data_en , data_o } = { 1'b0 , 8'bx     };
		S_X_S: { data_en , data_o } = { 1'b0 , 8'bx     };
	endcase
end
endmodule