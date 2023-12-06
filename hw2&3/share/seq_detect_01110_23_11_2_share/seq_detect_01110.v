module seq_detect_01110 (
	input           clk         ,
	input           clr         ,//asynchronous low active reset
    input           A           ,//low  input, eg D0
    input           B           ,//high input, eg D1
	output reg      Z            //detect 01001
);
//can be 3'bxxx ?
parameter   IDLE        = 3'b000  ,
            S_01        = 3'b001  ,
            S_X0        = 3'b010  ,
            S_0111      = 3'b011  ,
            S_011       = 3'b100  ;
// parameter   IDLE        = 0  ,
//             S_01        = 1  ,
//             S_X0        = 2  ,
//             S_0111      = 3  ,
//             S_011       = 4  ;
/*
parameter   IDLE        = 3'd0  ,
            DETECT_01   = 3'd1  ,
            DETECT_X0   = 3'd2  ,
            DETECT_0111 = 3'd3  ,
            DETECT_011  = 3'd4  ;
*/
reg [2:0]   state_cur, 
            state_next;		// Make sure these are big enough to hold the state_cur encodings.
	
// Edge-triggered always block (DFFs) for state_cur flip-flops. Asynchronous reset.	
always @(posedge clk or negedge clr) begin
	if (~clr)   state_cur <= IDLE;
	else        state_cur <= state_next;
end

// Combinational always block for state_cur transition logic. Given the current state_cur and inputs,
// what should be state_next state_cur be?
// Combinational always block: Use blocking assignments.    
always@(*) begin
	case (state_cur)
		IDLE    : state_next =  { 3{     ~B} } &  S_X0    |
                                { 3{~A &  B} } &  S_01    |
                                { 3{ A &  B} } &  IDLE    ;
		S_01    : state_next =  { 3{     ~B} } &  S_X0    |
                                { 3{~A &  B} } &  S_01    |
                                { 3{ A &  B} } &  S_0111  ;
		S_X0    : state_next =  { 3{     ~B} } &  S_X0    |
                                { 3{~A &  B} } &  S_01    |
                                { 3{ A &  B} } &  S_011   ;
		S_0111  : state_next =  { 3{     ~B} } &  S_X0    |
                                { 3{~A &  B} } &  IDLE    |
                                { 3{ A &  B} } &  IDLE    ;
		S_011   : state_next =  { 3{~A & ~B} } &  S_X0    |
                                { 3{~A &  B} } &  S_01    |                                
                                { 3{ A & ~B} } &  IDLE    |                                
                                { 3{ A &  B} } &  IDLE    ;                            
		default : state_next = 'x;
	endcase
end
/* The following code does not support x input for a in testbench, so it needs to be changed to the above code
always@(*) begin
	case (state_cur)
		IDLE    : state_next =  { 3{~A & ~B} } &  S_X0    |
                                { 3{~A &  B} } &  S_01    |
                                { 3{ A & ~B} } &  S_X0    |
                                { 3{ A &  B} } &  IDLE    ;
		S_01    : state_next =  { 3{~A & ~B} } &  S_X0    |
                                { 3{~A &  B} } &  S_01    |
                                { 3{ A & ~B} } &  S_X0    |
                                { 3{ A &  B} } &  S_0111  ;
		S_X0    : state_next =  { 3{~A & ~B} } &  S_X0    |
                                { 3{~A &  B} } &  S_01    |
                                { 3{ A & ~B} } &  S_X0    |
                                { 3{ A &  B} } &  S_011   ;
		S_0111  : state_next =  { 3{~A & ~B} } &  S_X0    |
                                { 3{~A &  B} } &  IDLE    |
                                { 3{ A & ~B} } &  S_X0    |
                                { 3{ A &  B} } &  IDLE    ;
		S_011   : state_next =  { 3{~A & ~B} } &  S_X0    |
                                { 3{~A &  B} } &  S_01    |                                
                                { 3{ A & ~B} } &  IDLE    |                                
                                { 3{ A &  B} } &  IDLE    ;                            
		default : state_next = 'x;
	endcase
end
*/
always@(*) begin
	case (state_cur)
		IDLE    :   case ({A,B})
                    2'b00: state_next = S_X0    ;
                    2'b01: state_next = S_01    ;  
                    2'b10: state_next = S_X0    ;  
                    2'b11: state_next = IDLE    ;
                    2'bx0: state_next = S_X0    ;//it can be delete , but use casex 
                    endcase
    
		S_01    :   case ({A,B})
                    2'b00: state_next = S_X0    ;                    
                    2'b01: state_next = S_01    ;
                    2'b10: state_next = S_X0    ;
                    2'b11: state_next = S_0111  ;
                    2'bx0: state_next = S_X0    ;//it can be delete , but use casex
                    endcase
        S_X0    :   case ({A,B})
                    2'b00: state_next = S_X0    ;
                    2'b01: state_next = S_01    ;
                    2'b10: state_next = S_X0    ;
                    2'b11: state_next = S_011   ;
                    2'bx0: state_next = S_X0    ;//it can be delete , but use casex 
                    endcase
        S_0111  :   case ({A,B})
                    2'b00: state_next = S_X0    ;
                    2'b01: state_next = IDLE    ;
                    2'b10: state_next = S_X0    ;
                    2'b11: state_next = IDLE    ;
                    2'bx0: state_next = S_X0    ;//it can be delete , but use casex 
                    endcase
        S_01    :   case ({A,B})
                    2'b00: state_next = S_X0    ;
                    2'b01: state_next = S_01    ;
                    2'b10: state_next = IDLE    ;
                    2'b11: state_next = IDLE    ;
                    endcase
    endcase
end
//The above code can be replaced with the following code
// sl == 2'b11 ? 4'b1000:
// sl == 2'b10 ? 4'b0100:
// sl == 2'b01 ? 4'b0010:
// 4'b0001;
// */

// Combinational output logic. In this problem, a procedural block (combinational always block) 
// is more convenient. Be careful not to create a latch.

always @(*) begin
    Z = state_cur == S_0111 && {A,B} == 2'b00 ||
        state_cur == S_0111 && {A,B} == 2'b01 ||
    //The above code can be replaced with the following code
    //  state_cur == S_0111 &&  A    == 1'b0  ||
        state_cur == S_011  && {A,B} == 2'b10 ;
end
//The above code can be replaced with the following code
// assign...
endmodule
