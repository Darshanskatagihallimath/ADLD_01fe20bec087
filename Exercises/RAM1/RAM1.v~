module RAM1(addr,data,data_out,clk,rd,wr,cs);
input [9:0]addr;
input [7:0]data;
input clk,rd,wr,cs;
output reg [7:0]data_out;
reg [7:0] mem[31:0];
assign data=(cs&&rd) ? data_out :8'bz;

always @(posedge clk)
   if(cs && wr && !rd) mem[addr] = data;
always @(posedge clk)
   if(cs && rd && !wr) data_out = mem[addr];

endmodule




