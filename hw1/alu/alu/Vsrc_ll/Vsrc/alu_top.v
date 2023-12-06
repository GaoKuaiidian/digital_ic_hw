module alu_top #(
parameter n = 32
) (
input         [n-1:0] opA         ,   //operator A
input         [n-1:0] opB         ,   //operator B
input         [3:0]   S           ,   //Working mode selection signal
input                 M           ,   //Logical operation control signal
input                 Cin         ,   //carry input signal
output        [n-1:0] DO          ,   //Data output
output                C           ,   //Carry output
output                V           ,   //Overflow indicator output signal
output                N           ,   //DO symbol bit output signal
output                Z               //DO is a zero indicator
);

wire [n : 0] ci ;

assign C = M? ((S[2]&S[1])? DO [n-1]: ci [n]): 0 ; 
assign ci [0] = Cin ;

generate
    genvar i;
    for (i = 0; i < n; i = i+1) 
    begin :u
        alu_unit (opA[i] ,opB[i] , S , M , ci[i] , DO[i] ,ci[i+1]);
    end
endgenerate

assign V = ci[n-1] ^ ci[n] ;
assign Z = !DO ;
assign N = (M) ? DO[n-1] :0 ;

endmodule
