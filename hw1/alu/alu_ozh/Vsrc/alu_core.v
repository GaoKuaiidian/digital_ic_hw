module alu_core #(
parameter n = 32
) (
input signed  [n-1:0] opA         ,   
input signed  [n-1:0] opB         ,   
input         [3:0]   S           ,   
input                 M           ,   
input                 Cin         ,   
output        [n-1:0] DO          ,   
output                C           ,   
output                V           ,   
output                N           ,   
output                Z               
);

wire [n : 0] ci ;
assign C = (M==1)&&(S[2]&S[1])? (opA <opB): ci [n] ;
assign ci [0] = Cin ;
assign V = ci[n-1] ^ ci[n] ;
assign N = (M) ? DO[n-1] :0 ;
assign Z = !DO ;
generate
    genvar i;
    for (i = 0; i < n; i = i+1) 
    begin :u
        alu_unit u_alu_unit(opA[i] ,opB[i], S, M, ci[i], DO[i],ci[i+1]);
    end
endgenerate
endmodule