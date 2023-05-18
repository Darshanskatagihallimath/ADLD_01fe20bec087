module ram_1_test;

reg [9:0]addr=10'd0;
wire [7:0]data_out;
reg [7:0]data=8'd0;
reg wr,cs,rd;
integer k;

ram_1 ram(addr,data,data_out,clk,rd,wr,cs);

initial 
begin
for(k=0;k<1023;k=k+1)
begin
 data=data+1;
 addr=addr+1;

end
always #5 clk=~clk;
endmodule
