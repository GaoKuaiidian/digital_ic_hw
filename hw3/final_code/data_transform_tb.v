`timescale 1ns/1ns

module data_transform_tb;
reg [47:0] test_sequence;
reg clk;
reg reset_n;
reg start;
reg [7:0]data_in;
reg byte_en;
reg [7:0]data_o;
reg data_en;
integer i;
data_transform u1( .clk(clk), .reset_n(reset_n), .start(start), .data_in(data_in), .byte_en(byte_en), .data_o(data_o), .data_en(data_en));

initial
begin
`ifdef vcdplusdump
  $display("\n*** VCD+ file dump is turned on ***\n");
  $vcdpluson;
  #1000;
  $vcdplusoff;
`endif
`ifdef vcddump
  $display("\n*** VCD file dump is turned on ***\n");
  $dumpvars;
//  #1000;
//  $dumpoff;
`endif
`ifdef fsdbdump
  $display("\n*** fsdb file dump is turned on ***\n");
  $fsdbDumpfile("add4.fsdb");
  $fsdbDumpvars(0);
//  #1000
//  $fsdbDumpoff;
`endif
end
initial
begin
    clk = 0;
    reset_n = 1;
    i   = 0;
    test_sequence = 48'h100243950687;
#10 reset_n = 0;
#10 reset_n = 1;
end
always #10 clk = ~clk;
always @(posedge clk or negedge reset_n)begin
if(i <= 7)begin
    if (i==1 || i==4) begin
        i       <= i + 1;
        start   <= 1;
        data_in <= test_sequence[47:40];
        test_sequence <= test_sequence << 8; 
        byte_en    <= 0;
    end else begin
        i       <= i + 1;
        start   <= 1;
        data_in <= test_sequence[47:40]; 
        test_sequence <= test_sequence << 8;
        byte_en    <= 1;
    end
end
end
initial
begin
#500;
$finish;
end
endmodule
