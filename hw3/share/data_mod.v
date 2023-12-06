module data_mod (
    input   reset_n         ,
    input   clk             ,
    input   [7:0] data_in   ,
    input   rdy             ,
    output  rd              ,
    output  reg [4:0] dmod  ,
    output  reg mod_en  
);
    reg [7:0] data_tem ;
    reg state_read_ok ;
    assign rd = state_read_ok & ~ rdy ;
    reg [3:0] state ;
    always @(posedge clk or negedge reset_n) begin
        if(~reset_n)
            state <= 4'b0 ; 
        else if(rd || state == 2 || state == 5 || state == 7)
            if(state == 4'd7)
                state <= 4'b0 ;
            else
                state <= state + 1'b1;    
    end
    always @(*) begin
        case(state)
            0, 1, 3, 4, 6 : state_read_ok = 1'b1;
            default: state_read_ok = 1'b0;
        endcase
    end
    always @(posedge clk or negedge reset_n) begin
        if(~reset_n)
            data_tem <= 'b0;
        else case({state , rd})
            {4'd0 , 1'b1} : begin   
                                    data_tem[2:0] <= data_in[7:5];
                                    dmod     <= data_in[4:0] ;   
                                end
            {4'd1 , 1'b1} : begin 
                                    data_tem[5:0] <= data_in[7:2];
                                    dmod     <= {data_in[1:0],data_tem[2:0]} ;   
                                end
            {4'd2 , 1'b0} : dmod     <= data_tem[4:0] ;
            {4'd3 , 1'b1} : begin 
                                    data_tem[3:0] <= data_in[7:4];
                                    dmod     <= {data_in[3:0],data_tem[5]} ; 
                                end
            {4'd4 , 1'b1} : begin 
                                    data_tem[6:0] <= data_in[7:1] ;
                                    dmod     <= {data_in[0],data_tem[3:0]} ; 
                                end
            {4'd5 , 1'b0} : dmod     <= data_tem[4:0] ;
            {4'd6 , 1'b1} : begin 
                                    data_tem[4:0] <= data_in[7:3] ;
                                    dmod     <= {data_in[2:0],data_tem[6:5]} ;   
                                end
            {4'd7 , 1'b0} : dmod     <= data_tem[4:0] ;  
        endcase
    end
    always @(posedge clk or negedge reset_n) begin
        if(~reset_n)
            mod_en <= 1'b0 ;
        else if(rd || state == 2 || state == 5 || state == 7)
            mod_en <= 1'b1 ;
        else 
            mod_en <= 1'b0 ;      
    end
endmodule