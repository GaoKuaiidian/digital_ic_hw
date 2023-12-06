`timescale 1ns/1ps
module seq_detect_01110_tb;
parameter   SEQUENCE_WIDTH = 24 ;//Can be changed to any length
reg [ SEQUENCE_WIDTH - 1 : 0 ] SEQ = 24'b01110_111_01110_01110_x01110; //Output Z should generate high pulse FOUR times
//PATTERN:{D0,...,DX-1,DX}, {A,B} <= {D0,D1}... at each clock rise edge，so this pattern means {ABABAB...AB}

parameter   IDLE        = 3'b000  ,
            S_01        = 3'b001  ,
            S_X0        = 3'b010  ,
            S_0111      = 3'b011  ,
            S_011       = 3'b100  ;
integer i  ;
reg   clk  ;
reg   clr  ;
reg   A    ;
reg   B    ;
wire  Z    ;
//State machine name viewer
reg [ 6 * 8 - 1 :0]  monitor_state;
// Reg monitor_state can be used to show state name in wave. Notion: One ASCII code is 8bit,make sure the width is enough
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
    $finish;
end
seq_detect_01110 u_seq_detect_01110(
    .clk  ( clk  ),
    .clr  ( clr  ),
    .A    ( A    ),
    .B    ( B    ),
    .Z    ( Z    )
);
//initial begin
//  $display("\n*** fsdb file dump is turned on ***\n");
//  $fsdbDumpfile("tb_alu_top.fsdb");
//  $fsdbDumpvars(0);
//end
endmodule