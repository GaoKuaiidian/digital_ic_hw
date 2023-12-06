module alu_unit(
input           a ,
input           b ,
input  [3 : 0]  S ,
input           M ,
input           ci,
output          DO,
output          co
);
wire g  ; 
wire p  ; 
wire pc ;
xor u0 ( DO, p, ci );
and u1 ( pc, p, ci );
or  u2 ( co, g, pc );
assign p=!(S[3]&a&b | S[2]&a&!b | S[1]&!a&b | S[0]&!a&!b);
assign g=S[3]&a&b | S[2]&a&!b | !M;
endmodule