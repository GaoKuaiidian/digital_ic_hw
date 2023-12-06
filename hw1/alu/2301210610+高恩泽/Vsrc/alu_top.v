module alu_top #(
parameter ALU_WIDTH = 32
) (
input         [ALU_WIDTH-1:0] opA         ,   //operator A
input         [ALU_WIDTH-1:0] opB         ,   //operator B
input         [3:0]   S           ,   //Working mode selection signal
input                 M           ,   //Logical operation control signal
input                 Cin         ,   //carry input signal
output        [ALU_WIDTH-1:0] DO          ,   //Data output
output                C           ,   //Carry output
output                V           ,   //Overflow indicator output signal
output                N           ,   //DO symbol bit output signal
output                Z               //DO is a zero indicator
);

wire [ALU_WIDTH : 0] ci ;
assign C = (M==1)&&(S[2]&S[1])? DO[ALU_WIDTH-1]: ci [ALU_WIDTH] ; //the C of add and substract is different 
assign ci [0] = Cin ;

generate
    genvar i;
    for (i = 0; i < ALU_WIDTH; i = i+1) 
    begin :u
        alu_unit u_alu_unit(opA[i] ,opB[i] , S , M , ci[i] , DO[i] ,ci[i+1]);
    end
endgenerate

assign V = ci[ALU_WIDTH-1] ^ ci[ALU_WIDTH] ;
assign Z = !DO ;
assign N = (M) ? DO[ALU_WIDTH-1] :0 ;

endmodule