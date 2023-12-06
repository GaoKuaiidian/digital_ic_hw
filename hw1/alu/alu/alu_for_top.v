module alu_for_top #(
parameter n = 32
) (
input  signed [n-1:0] opA         ,   //operator A
input  signed [n-1:0] opB         ,   //operator B
input         [3:0]   S           ,   //Working mode selection signal
input                 M           ,   //Logical operation control signal
input                 Cin         ,   //carry input signal
output   reg  [n-1:0] DO          ,   //Data output
output                C           ,   //Carry output
output   reg          V           ,   //Overflow indicator output signal
output   reg          N           ,   //DO symbol bit output signal
output   reg          Z               //DO is a zero indicator
);
reg [n-1 : 0] g, p;
reg [n : 0] ci ;
integer i ;
assign C = (M==1)&&(S[2]&S[1])? DO[n-1]: ci [n] ; //the C of add and substract is different 

always @ (*)
    begin
    ci [0] = Cin ;
    for( i = 0; i < n; i = i+1) 
        begin
            g[i]   = S[3]&opA [i]&opB[i] | S[2]&opA [i]&!opB[i] | !M;
            p[i]=!(S[3]&opA [i]&opB[i] | S[2]&opA [i]&!opB[i] | S[1]&!opA [i]&opB[i] | S[0]&!opA [i]&!opB[i]);
            ci[i+1] = g[i] | ( p[i] & ci[i] );
            DO[i]   = p[i] ^ ci[i];
        end
    V = ci[n-1] ^ ci[n] ;
    Z = !DO ;
    N = (M) ? DO[n-1] : 0 ;
    end




endmodule