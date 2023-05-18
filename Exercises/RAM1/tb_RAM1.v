module RAM1_test;

reg [9:0]addr=10'd0;
wire [9:0]data_out;
reg [9:0]data=8'd0;
reg clk,wr,cs,rd;
integer k;

RAM1 ram(addr,data,data_out,clk,rd,wr,cs);

initial 
begin
for(k=0;k<1023;k=k+1)
begin
 data=data+1;
 addr=addr+1;
 wr=1;
 rd=0;

$display("addr: %5d,data: %5d,clk: %d",addr,data,clk);
end
end
always #5 clk=~clk;
endmodule

module RAM1(addr,data,data_out,clk,rd,wr,cs);
input [9:0]addr;
input [9:0]data;
input clk,rd,wr,cs;
output reg [9:0]data_out;
reg [7:0] mem[1023:0];
assign data=(cs&&rd) ? data_out :8'bz;

always @(posedge clk)
   if(cs && wr && !rd) mem[addr] = data;
always @(posedge clk)
   if(cs && rd && !wr) data_out = mem[addr];

endmodule

