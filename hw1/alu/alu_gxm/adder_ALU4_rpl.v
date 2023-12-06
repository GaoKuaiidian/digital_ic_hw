module adder_ALU4_rpl(
  input wire [3:0] a,b,
  input wire ci,M,[3:0]s,
  output wire co,
  output wire [3:0] d
);

wire [4:0] c;
assign co=c[4];
assign c[0]=ci;

generate 
  genvar i;
    for(i=0;i<4;i=i+1) begin:u
      add_ALU4 add(a[i],b[i],c[i],M,s,c[i+1],d[i]);
    end
endgenerate

endmodule