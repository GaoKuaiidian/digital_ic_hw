`timescale 1ns/1ps
module tb_alu_top;
parameter   ALU_WIDTH = 32              ;
reg signed  [ALU_WIDTH-1:0] opA         ;   //operator A
reg signed  [ALU_WIDTH-1:0] opB         ;   //operator B
reg         [3:0]   S           ;   //Working mode selection signal
reg                 M           ;   //Logical operation control signal
reg                 Cin         ;   //carry input signal
wire        [ALU_WIDTH-1:0] DO          ;   //Data output
wire                C           ;   //Carry output
wire                V           ;   //Overflow indicator output signal
wire                N           ;   //DO symbol bit output signal
wire                Z           ;   //DO is a zero indicator

localparam [17:0] select_signal = 
{6'b0000_1_0
,6'b0001_1_0
,6'b0010_1_0
,6'b0011_1_0
,6'b0100_1_0
,6'b0101_1_0
,6'b0110_1_0
,6'b0111_1_0
,6'b1000_1_0
,6'b1001_1_0
,6'b1010_1_0
,6'b1011_1_0
,6'b1100_1_0
,6'b1101_1_0
,6'b1110_1_0
,6'b1111_1_0
,6'b1001_0_1
,6'b0110_1_1
};


wire signed [ALU_WIDTH-1:0] opB_c       ;   //complement of operator B
assign opB_c = (~opB +1);

reg  signed [ALU_WIDTH-1:0] DO_golden   ;
reg                 C_golden    ;
reg                 V_golden    ;
reg                 N_golden    ;
reg                 Z_golden    ;

integer error_count;
//initial error_count = 0;
alu_top #(
    .ALU_WIDTH(ALU_WIDTH)
) u_alu_top(
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

//18 kinds of situation
generate
if (ALU_WIDTH<32) begin :full_test
initial                                                
begin
error_count=0;
end
else begin :no_full_test
initial                                                
begin
    #10	{S,Cin,M} = 6'b0000_1_0;opA = 32'hffff0000;opB = 32'hff00ff00;//all bits are 0
    #10	{S,Cin,M} = 6'b0001_1_0;opA = 32'hffff0000;opB = 32'hff00ff00;//nor
    #10	{S,Cin,M} = 6'b0010_1_0;opA = 32'hffff0000;opB = 32'hff00ff00;//notand
    #10	{S,Cin,M} = 6'b0011_1_0;opA = 32'hffff0000;opB = 32'hff00ff00;//notA
    #10	{S,Cin,M} = 6'b0100_1_0;opA = 32'hffff0000;opB = 32'hff00ff00;//andnot
    #10	{S,Cin,M} = 6'b0101_1_0;opA = 32'hffff0000;opB = 32'hff00ff00;//notB
    #10	{S,Cin,M} = 6'b0110_1_0;opA = 32'hffff0000;opB = 32'hff00ff00;//xor
    #10	{S,Cin,M} = 6'b0111_1_0;opA = 32'hffff0000;opB = 32'hff00ff00;//nand
    #10	{S,Cin,M} = 6'b1000_1_0;opA = 32'hffff0000;opB = 32'hff00ff00;//and
    #10	{S,Cin,M} = 6'b1001_1_0;opA = 32'hffff0000;opB = 32'hff00ff00;//xnor
    #10	{S,Cin,M} = 6'b1010_1_0;opA = 32'hffff0000;opB = 32'hff00ff00;//B
    #10	{S,Cin,M} = 6'b1011_1_0;opA = 32'hffff0000;opB = 32'hff00ff00;//notor
    #10	{S,Cin,M} = 6'b1100_1_0;opA = 32'hffff0000;opB = 32'hff00ff00;//A
    #10	{S,Cin,M} = 6'b1101_1_0;opA = 32'hffff0000;opB = 32'hff00ff00;//or not
    #10	{S,Cin,M} = 6'b1110_1_0;opA = 32'hffff0000;opB = 32'hff00ff00;//or
    #10	{S,Cin,M} = 6'b1111_1_0;opA = 32'hffff0000;opB = 32'hff00ff00;//all bits are 1

    #10	{S,Cin,M} = 6'b1001_0_1;opA = 32'hffff_ffff;opB = 32'haaaa_aaaa;//add
    #10	{S,Cin,M} = 6'b1001_0_1;opA = 32'h7fff_ffff;opB = 32'h7aaa_aaaa;//overflow test of add
    #10	{S,Cin,M} = 6'b0110_1_1;opA = 32'hffff_ffff;opB = 32'h0000_ffff;//sub
    #10	{S,Cin,M} = 6'b0110_1_1;opA = 32'h0000_0001;opB = 32'h0000_0002;//sub
end    
always @(*) begin
    case ({S,Cin,M})
        6'b0000_1_0: begin//all bits are 0
            DO_golden =  'b0; 
            {C_golden,V_golden,N_golden,Z_golden} = {1'b1,1'b0,1'b0,1'b1};
        end
        6'b0001_1_0: begin//nor
            DO_golden =  ~opA & ~opB; 
            {C_golden,V_golden,N_golden,Z_golden} = {1'b1,1'b0,1'b0,!(|DO_golden)};
        end
        6'b0010_1_0: begin//notand
            DO_golden =  ~opA & opB;
            {C_golden,V_golden,N_golden,Z_golden} = {1'b1,1'b0,1'b0,!(|DO_golden)};
        end
        6'b0011_1_0: begin//notA
            DO_golden =  ~opA;
            {C_golden,V_golden,N_golden,Z_golden} = {1'b1,1'b0,1'b0,!(|DO_golden)};
        end
        6'b0100_1_0: begin//andnot
            DO_golden =  opA & ~opB; 
            {C_golden,V_golden,N_golden,Z_golden} = {1'b1,1'b0,1'b0,!(|DO_golden)};
        end
        6'b0101_1_0: begin//notB
            DO_golden =  ~opB; 
            {C_golden,V_golden,N_golden,Z_golden} = {1'b1,1'b0,1'b0,!(|DO_golden)};
        end
        6'b0110_1_0: begin//xor
            DO_golden =  opA ^ opB; 
            {C_golden,V_golden,N_golden,Z_golden} = {1'b1,1'b0,1'b0,!(|DO_golden)};
        end
        6'b0111_1_0: begin//nand
            DO_golden =  ~opA | opB; 
            {C_golden,V_golden,N_golden,Z_golden} = {1'b1,1'b0,1'b0,!(|DO_golden)};
        end
        6'b1000_1_0: begin//and
            DO_golden =  opA & opB; 
            {C_golden,V_golden,N_golden,Z_golden} = {1'b1,1'b0,1'b0,!(|DO_golden)};
        end
        6'b1001_1_0: begin//xnor
            DO_golden =  opA ~^ opB; 
            {C_golden,V_golden,N_golden,Z_golden} = {1'b1,1'b0,1'b0,!(|DO_golden)};
        end
        6'b1010_1_0: begin//B
            DO_golden =  opB; 
            {C_golden,V_golden,N_golden,Z_golden} = {1'b1,1'b0,1'b0,!(|DO_golden)};
        end
        6'b1011_1_0: begin//notor
            DO_golden =  ~(opA & !opB); 
            {C_golden,V_golden,N_golden,Z_golden} = {1'b1,1'b0,1'b0,!(|DO_golden)};
        end
        6'b1100_1_0: begin//A
            DO_golden =  opA; 
            {C_golden,V_golden,N_golden,Z_golden} = {1'b1,1'b0,1'b0,!(|DO_golden)};
        end
        6'b1101_1_0: begin//or not
            DO_golden =  ~(!opA & opB);  
            {C_golden,V_golden,N_golden,Z_golden} = {1'b1,1'b0,1'b0,!(|DO_golden)};
        end
        6'b1110_1_0: begin//or
            DO_golden =  opA | opB; 
            {C_golden,V_golden,N_golden,Z_golden} = {1'b1,1'b0,1'b0,!(|DO_golden)};
        end
        6'b1111_1_0: begin//all bits are 1
            DO_golden =  32'hffffffff; 
            {C_golden,V_golden,N_golden,Z_golden} = {1'b1,1'b0,1'b0,1'b0};
        end
        6'b1001_0_1: begin//add
            {C_golden,DO_golden} =  opA + opB; 
            {V_golden,N_golden,Z_golden} = {(opA[31]~^opB[31])&&(opA[31]!==DO_golden[31]),DO_golden[31],!(|DO_golden)};
        end
        6'b0110_1_1: begin//sub
            DO_golden =  opA - opB; 
            C_golden = opA < opB;
            {V_golden,N_golden,Z_golden} = {(opA[31]^opB[31])&&(opA[31]!==DO_golden[31]),DO_golden[31],!(|DO_golden)};
        end 
        default: $display($time,"*** There is one illegal input! -- INPUT: {S,Cin,M}=%b%b%b;opA=%h,opB=%h,\t OUTPUT: DO=%h,C=%b,V=%b,N=%b,Z=%b***",S,Cin,M,opA,opB,DO,C,V,N,Z);
    endcase        
end                                                            
initial begin
	$monitor($time," -- INPUT: {S,Cin,M}=%b%b%b;opA=%h,opB=%h,\t OUTPUT: DO=%h,C=%b,V=%b,N=%b,Z=%b",S,Cin,M,opA,opB,DO,C,V,N,Z);    
end
initial begin
    #2
    for (i=0; i<22; i=i+1) begin
        #10
        if ({C_golden,V_golden,N_golden,Z_golden}!=={C,V,N,Z}) begin
            error_count = error_count + 1;
            if (error_count <= 10) begin
                //$display("***ERROR at time = %0d ***", $time);
                $display("ERROR at time = %0d -- INPUT:S = %b, Cin = %b, M = %b;opA=%h,opB=%h,\t OUTPUT: DO=%h,C=%b,V=%b,N=%b,Z=%b, Correct OUTPUT: DO=%h,C=%b,V=%b,N=%b,Z=%b",$time,S,Cin,M,opA,opB,DO,C,V,N,Z,DO_golden,C_golden,V_golden,N_golden,Z_golden);
            end
            if (error_count == 10) begin
                $display("\n\nError count reached 10, subsequent error messages are suppressed");
            end
        end
    end
    if (error_count == 0)
        $display("*** Testbench Successfully Completed! There is no error!***");
    else begin
        $display("\n*********************************************");
        $display("*** Testbench completed with %0d errors ***",error_count);
        $display("*********************************************\n\n");
    end
    $finish;
end        
end
end
endgenerate
initial begin
//`ifdef fsdbdump
  $display("\n*** fsdb file dump is turned on ***\n");
  $fsdbDumpfile("tb_alu_top.fsdb");
  $fsdbDumpvars(0);
//  #1000
//  $fsdbDumpoff;
//`endif
end
endmodule
