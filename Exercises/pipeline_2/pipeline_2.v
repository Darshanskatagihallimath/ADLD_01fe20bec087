module pipe2(rs1,rs2,rd,func,addr,clk1,clk2,y);

parameter n=16;
 integer i;
input [n-1:0]rs1,rs2,rd;
input [3:0]func;
input [7:0]addr;
input clk1,clk2;                               //clock
output [15:0]y;
reg [15:0] mem [0:255];                     //256x16 mem
reg [15:0] regbank [0:15];
reg [n-1:0]A,B,Z,L12_rd,L23_rd,L34_z;
reg [3:0]L12_func;
reg [7:0]L12_addr,L23_addr,L34_addr;

always @(posedge clk1)
begin

A <=  regbank[rs1];
B <=  regbank[rs2];
L12_rd <=  rd;                                   //stage 1
L12_func <=  func;
L12_addr <=  addr;

end

always @(negedge clk2)
begin
case(func)
0000: Z<=A+B;

0001: Z<=A-B;

0010: Z<=A;

0011: Z<=B;

0100: Z<=~A;

0101: Z<=~B;
default: Z<=16'd12;
endcase
L23_rd <= L12_rd;
L23_addr <= L12_addr;

end

always @(posedge clk1)
begin
regbank[L23_rd] <= Z;
L34_z <= Z;
L34_addr <= L23_addr;
end

always @(negedge clk2)
begin

mem[L34_addr] <= L34_z;

end

assign y=mem[L34_addr];

endmodule
