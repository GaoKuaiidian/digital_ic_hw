module data_mod(
    input             clk,
    input             reset_n,
    input      [7:0]  data_in,
    input             rdy,
    output            rd,
    output reg        mod_en,
    output reg [4:0]  dmod
    );
//reg/wire define
  reg [7:0] databuf[0:4];    //5 bytes deep data buffer    
  wire      din_flag;        //1:data input allowed   0:is busy,data input paused
//FSM define  
  parameter IDLE=4'b0000,s1=4'b0001,s2=4'b0010,s3=4'b0011,s4=4'b0100;
  parameter s5=4'b0101,s6=4'b0110,s7=4'b0111,s8=4'b1000;
  reg [3:0] state;

//FSM
always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        state <= IDLE;
    end
    else begin
        case (state)   //synopsys full_case
            IDLE : begin  //only data in
                databuf[0] <= data_in;
                mod_en <= 1'b0;
                state <= s1;
            end
            s1 : begin   //data in and out
                dmod <= databuf[0][4:0];
                mod_en <= 1'b1;
                databuf[1] <= data_in;
                state <= s2;
            end
            s2 : begin    //data in and out
                dmod <= {databuf[1][1:0],databuf[0][7:5]};
                mod_en <= 1'b1;
                databuf[2] <= data_in;
                state <= s3;
            end
            s3 : begin    //data in and out
                dmod <= databuf[1][6:2];
                mod_en <= 1'b1;
                databuf[3] <= data_in;
                state <= s4;
            end
            s4 : begin    //data in and out
                dmod <= {databuf[2][3:0],databuf[1][7]};
                mod_en <= 1'b1;
                databuf[4] <= data_in;
                state <= s5;
            end
            s5 : begin    //only data out
                dmod <= {databuf[3][0],databuf[2][7:4]};
                mod_en <= 1'b1;
                state <= s6;
            end
            s6 : begin    //only data out
                dmod <= databuf[3][5:1];
                mod_en <= 1'b1;
                state <= s7;
            end
            s7 : begin    //only data out
                dmod <= {databuf[4][2:0] , databuf[3][7:6]};
                mod_en <= 1'b1;
                state <= s8;
            end
            s8 : begin    //only data out
                dmod <= databuf[4][7:3];
                mod_en <= 1'b1;
                state <= IDLE;
            end
        endcase
    end
end
// rd
assign din_flag = (state==IDLE)||(state==s1)||(state==s2)||(state==s3)||(state==s4);
assign rd = din_flag & !rdy;

endmodule
