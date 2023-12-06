module shifter_4bit #(
) (
    input                       clk         ,
    input                       clr         ,
    input [ 4 - 1 : 0 ]         D           ,
    input                       D_sr        ,
    input                       D_sl        ,
    input                       ld          ,
    input                       sr          ,
    input                       sl          ,
    output reg [4 - 1 : 0]      Q           
);
    always @(posedge clk or negedge clr) begin
        if(~clr)       Q <=   4'b0                      ;
        else if(ld)    Q <=   D                         ;
        else if(sr)    Q <= { D_sr, Q[4 -1 :1] }        ;
        else if(sl)    Q <= { Q[4 -2 :0],D_sl  }        ;
    end
endmodule