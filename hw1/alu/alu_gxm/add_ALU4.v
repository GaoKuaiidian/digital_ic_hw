module add_ALU4(
  input wire a,b,ci,M,
  input wire [3:0] s,
  output wire co,d
);

wire g,p;
assign g=(s[3]&a&b)|(s[2]&a&(~b))|(~M);
assign p=~((s[3]&a&b)|(s[2]&a&(~b))|(s[1]&(~a)&b)|(s[0]&(~a)&(~b)));
assign co=g|(p&ci);
assign d=p^ci;

endmodule