`timescale 1ns/1ps
module tb_alu_core;
parameter   n = 32              ;
reg signed  [n-1:0] opA         ;   
reg signed  [n-1:0] opB         ;  
reg         [3:0]   S           ;   
reg                 M           ;   
reg                 Cin         ;  
wire        [n-1:0] DO          ;  
wire                C           ;  
wire                V           ;   
wire                N           ;   
wire                Z           ;   

alu_core #(
    .n(32)
) u_alu_core(
    .opA    (opA) ,   
    .opB    (opB) ,   
    .S      (S  ) ,   
    .M      (M  ) ,   
    .Cin    (Cin) ,   
    .DO     (DO ) ,   
    .C      (C  ) ,   
    .V      (V  ) ,   
    .N      (N  ) ,   
    .Z      (Z  )     
);

//function test
initial                                                
begin    
#10	S=4'b0000;Cin=1'b1;M=1'b0;opA = 32'hf05a_f05a;opB = 32'h0fa5_f05a;//all bits 0
#10	S=4'b0001;Cin=1'b1;M=1'b0;                                        //nor
#10	S=4'b0010;Cin=1'b1;M=1'b0;                                        //notand
#10	S=4'b0011;Cin=1'b1;M=1'b0;                                        //not A
#10	S=4'b0100;Cin=1'b1;M=1'b0;                                        //andnot
#10	S=4'b0101;Cin=1'b1;M=1'b0;                                        //not B
#10	S=4'b0110;Cin=1'b1;M=1'b0;                                        //xor
#10	S=4'b0111;Cin=1'b1;M=1'b0;                                        //nand
#10	S=4'b1000;Cin=1'b1;M=1'b0;                                        //and
#10	S=4'b1001;Cin=1'b1;M=1'b0;                                        //xnor
#10	S=4'b1010;Cin=1'b1;M=1'b0;                                        //B
#10	S=4'b1011;Cin=1'b1;M=1'b0;                                        //notor
#10	S=4'b1100;Cin=1'b1;M=1'b0;                                        //A
#10	S=4'b1101;Cin=1'b1;M=1'b0;                                        //or not
#10	S=4'b1110;Cin=1'b1;M=1'b0;                                        //or
#10	S=4'b1111;Cin=1'b1;M=1'b0;                                        //all bits 1
#10	S=4'b1001;Cin=1'b0;M=1'b1;opA = 32'h0101_0000;opB = 32'h1010_0101;//add
#10	S=4'b0110;Cin=1'b1;M=1'b1;opA = 32'h8000_0000;opB = 32'h0000_0001;//sub
#10	S=4'b0110;Cin=1'b1;M=1'b1;opA = 32'h0000_ffff;opB = 32'h0001_0000;//sub
#10 $finish;
end
        
initial begin
	$monitor($time,"**INPUT:S=%b,Cin=%b,M=%b;opA=%h,opB=%h Compute result: DO=%h,C=%b,V=%b,N=%b,Z=%b**",S,Cin,M,opA,opB,DO,C,V,N,Z);    
end
initial begin
  $fsdbDumpfile("tb_alu_core.fsdb");
  $fsdbDumpvars(0);
end
endmodule
