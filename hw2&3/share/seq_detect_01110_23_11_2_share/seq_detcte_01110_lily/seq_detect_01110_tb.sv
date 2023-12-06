`timescale 1ns/1ps
module seq_detect_01110_tb;
parameter   SEQUENCE_WIDTH = 24 ;//Can be changed to any length
reg [ SEQUENCE_WIDTH - 1 : 0 ] SEQ = 24'b01110_111_01110_01110_x01110; //Output Z should be 1 three times
//PATTERN:{D0,...,DX-1,DX}, {A,B} <= {D0,D1}... at each clock rise edge，so this pattern means {ABABAB...AB}
 
// parameter   SEQUENCE_WIDTH = 12 ;//Can be changed to any length
// reg [ SEQUENCE_WIDTH - 1 ] SEQ = 12'b01_00_10_01_00_00_00_10_01_11_00_11; //Output Z should be 1 twice
//PATTERN:{D0,...,DX-1,DX}, {A,B} <= {D0,D1}... at each clock rise edge，so this pattern means {ABABAB...AB}

//SEQ = {12'b11_00_11_01_10_00_00_00_01_10_00_01};
//PATTERN:{DX,DX-1,...,D0}, {B,A} <= {D1,D0}... at each clock rise edge，so this pattern means {BABABA...BA}

integer i  ;
reg   clk  ;
reg   clr  ;
reg   A    ;
reg   B    ;
wire  Z    ;
//State machine name viewer
reg [ 6 * 8 - 1 :0]  monitor_state;    // This reg can be used to show state name in wave. Notion: One ASCII code is 8bit,make sure the width is enough
always @(*) begin
    case(u_seq_detect_01110.state_cur)
        IDLE    :   monitor_state  =  "S_00  "  ; 
        S_01    :   monitor_state  =  "S_01  "  ; 
        S_X0    :   monitor_state  =  "S_X0  "  ; 
        S_0111  :   monitor_state  =  "S_0111"  ;
        S_011   :   monitor_state  =  "S_011 "  ;
        default :   monitor_state  =  "???   "  ;
    endcase        
end
initial begin
clk     =  1'b1;    
clr     =  1'b1;
A       =  1'b0;
B       =  1'b0;
end
always #10 clk =  ~ clk ;
initial begin
    #10 clr = 1'b0;
    #20 clr = 1'b1;
    for ( i = SEQUENCE_WIDTH / 2 - 1 ; i >=0  ; i = i - 1 ) begin
        A = SEQ[ i * 2 + 1 ];
        B = SEQ[ i * 2     ];
        #20 ;
    end
    $stop;
end
seq_detect_01110 u_seq_detect_01110(
    .clk  ( clk  ),
    .clr  ( clr  ),
    .A    ( A    ),
    .B    ( B    ),
    .Z    ( Z    )
);
endmodule