`timescale 1ns/1ps
module tb_dual_port_ram ();
  parameter	Bits = 8;
  parameter	Word_Depth = 64;
  parameter	Add_Width = 6;
  parameter     Wen_Width = 8;
  parameter     Word_Pt = 1;
wire	[Bits-1:0] QA;			
reg		   CLKA;			//A:read,B:write
reg		   CLKB;			
reg		   CENA;			
reg		   CENB;			
reg [Wen_Width-1:0] BWENB;							
reg	[Add_Width-1:0] AA;							
reg	[Add_Width-1:0] AB;							
reg	[Bits-1:0] DB;
 S65NLLHS2PH64x8 u_S65NLLHS2PH64x8(
 .QA		(QA		),
 .CLKA	(CLKA	),
 .CLKB	(CLKB	),
 .CENA	(CENA	),
 .CENB	(CENB	),		
 .BWENB	(BWENB	),		
 .AA		(AA		),		
 .AB		(AB		),		
 .DB		(DB		));	

always #5 CLKA = ~ CLKA;
always #5 CLKB = ~ CLKB;
integer i ;
initial begin
	CLKA 	= 1'b0;		
	CLKB 	= 1'b0;		
	CENA 	= 1'b0;			
	CENB 	= 1'b0;			
	BWENB	=  'b0;	
	AA	 	=  'b0;			
	AB	 	=  'b0;			
	DB	 	=  'b0;
// write begin
	for (i = 0; i <= 63; i = i + 1 ) begin
		#20
		CENB =  1'b1 ;
		BWENB = 8'b1 ;
		AB = i ;
		DB = i ;
	end
	CENB =  1'b0 ;
	BWENB =  'b0 ;
// read begin
	for (i = 0; i <= 63; i = i + 1 ) begin
		#20
		CENA =  1'b1 ;
		AA = i ;
	end
	#20 $finish;		
end
endmodule
