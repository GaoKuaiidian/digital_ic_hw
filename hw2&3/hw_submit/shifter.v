module shifter #(
    parameter WIDTH = 4 
) (
    input                       clk         ,
    input                       clr         ,//asynchronous low active reset
    input [ WIDTH - 1 : 0 ]     D           ,
    input                       D_sr        ,
    input                       D_sl        ,
    input                       ld          ,
    input                       sr          ,
    input                       sl          ,
    input [ 2 : 0 ]             prior_con   , //priority control signal
    output reg [WIDTH - 1 : 0]  Q           
);
/* Priority control truth table
prior_con   |  high |  medium   | low
3'b000      |  ld   |   sr      | sl
3'b001      |  ld   |   sl      | sr
3'b010      |  sr   |   ld      | sl
3'b011      |  sr   |   sl      | ld
3'b100      |  sl   |   ld      | sl
3'b101      |  sl   |   sl      | ld
*/
/* Another priority control truth table (2 is the highest priority)
prior_con   |  ld   |   sr      | sl
000         |  2    |   1       | 0 
001         |  2    |   0       | 1 
010         |  1    |   2       | 0 
011         |  0    |   2       | 1 
100         |  1    |   0       | 2 
101         |  0    |   1       | 2 
*/

    reg [2:0] control ; //The high level has a high priority
    always @(*) begin
        case(prior_con)
            3'b000 : control = { ld , sr , sl } ;
            3'b001 : control = { ld , sl , sr } ;
            3'b010 : control = { sr , ld , sl } ;
            3'b011 : control = { sr , sl , ld } ;
            3'b100 : control = { sl , ld , sl } ;
            3'b101 : control = { sl , sl , ld } ;
            default: control = { ld , sr , sl } ;
        endcase
    end
    always @(posedge clk or negedge clr) begin
        if(~clr) begin
            Q <=   0 ;
        end
        else case(prior_con)
            3'b000 :case (1'b1)
                        control[ 2 ] : Q <=   D                         ;
                        control[ 1 ] : Q <= { D_sr, Q[WIDTH -1 :1] }    ;
                        control[ 0 ] : Q <= { Q[WIDTH -2 :0],D_sl  }    ;
                        default      : Q <=   Q                         ;
                    endcase 
            3'b001 :case (1'b1)
                        control[ 2 ] : Q <=   D                         ;                        
                        control[ 1 ] : Q <= { D_sr, Q[WIDTH -1 :1] }    ;
                        control[ 0 ] : Q <= { Q[WIDTH -2 :0],D_sl  }    ;
                        default      : Q <=   Q                         ;
                    endcase  
            3'b010 :case (1'b1)                       
                        control[ 2 ] : Q <= { D_sr, Q[WIDTH -1 :1] }    ;
                        control[ 1 ] : Q <=   D                         ;
                        control[ 0 ] : Q <= { Q[WIDTH -2 :0],D_sl  }    ;
                        default      : Q <=   Q                         ;
                    endcase 
            3'b011 :case (1'b1)                        
                        control[ 2 ] : Q <= { D_sr, Q[WIDTH -1:1] }     ;
                        control[ 1 ] : Q <= { Q[WIDTH -2 :0],D_sl }     ;
                        control[ 0 ] : Q <=   D                         ;
                        default      : Q <=   Q                         ;
                    endcase 
            3'b100 :case (1'b1)
                        control[ 2 ] : Q <= { Q[WIDTH -2 :0],D_sl }     ;
                        control[ 1 ] : Q <=   D                         ;
                        control[ 0 ] : Q <= { D_sr, Q[WIDTH -1:1] }     ;                        
                        default      : Q <=   Q                         ;
                    endcase 
            3'b101 :case (1'b1)
                        control[ 2 ] : Q <= { Q[WIDTH -2 :0],D_sl }    ;
                        control[ 1 ] : Q <= { D_sr, Q[WIDTH -1 :1] }    ;
                        control[ 0 ] : Q <=   D                         ;
                        default      : Q <=   Q                         ;
                    endcase 
            default:case (1'b1)
                        control[ 2 ] : Q <=   D                         ;
                        control[ 1 ] : Q <= { D_sr, Q[WIDTH -1 :1] }    ;
                        control[ 0 ] : Q <= { Q[WIDTH -2 :0],D_sl }    ;
                        default      : Q <=   Q                         ;
                    endcase 
        endcase
    end        
endmodule