`timescale 1ns/1ns

module add_ALU4_test;
  reg [3:0] a,b,s;
  reg ci,M;
  wire co;
  wire [3:0] d;

adder_ALU4_rpl test(
  .a(a),
  .b(b),
  .s(s),
  .M(M),
  .ci(ci),
  .co(co),
  .d(d)
);

integer i;
initial begin
  a=4'b0;b=4'b0;ci=1'b0;M=1;s=4'b1001;
#10 a=4'b1111;
#10 ci=1;
#10 b=4'b1111;
#10 ci=0;
#10 a=4'b0000;
#10 b=4'b0000;
#10 a=4'b0;b=4'b0;ci=1'b0;M=1;s=4'b0110;
#10 a=4'b1111;
#10 ci=1;
#10 b=4'b1111;
#10 ci=0;
#10 a=4'b0000;
#10 b=4'b0000;
#10 $stop ;
end  
initial begin
  $monitor("%b%b%b:%b%b",a,b,ci,co,d);
end
endmodule