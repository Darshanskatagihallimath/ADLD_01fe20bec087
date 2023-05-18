module pipe_2_test;
reg clk1,clk2;
reg [15:0]rs1,rs2,rd;
reg [3:0]func;
reg [7:0]addr;
wire [15:0]y;
integer i;

pipe2 p(rs1,rs2,rd,func,addr,clk1,clk2,y);

initial clk1=1'b0;
initial clk2=1'b0;

always #5 clk1=~clk1;
always #5 clk2=~clk2;

initial 
begin
 for(i=0;i<16;i=i+1)
 
   p.regbank[i]=i;

end

initial 
begin
#5
rs1=6;
rs2=5;
rd=7;
func=4'b0000;
addr=4'b1000;
#100

rs1=6;
rs2=5;
rd=7;
func=4'b0001;
addr=4'b1000;
#100

rs1=2;
rs2=5;
rd=7;
func=4'b0010;
addr=4'b1000;
$display("res %d",y);
end

endmodule

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

always @(posedge clk2)
begin
case(L12_func)
0000: Z<=A+B;

0001: Z<=A-B;

0010: Z<=A;

0011: Z<=B;

0100: Z<=~A;

0101: Z<=~B;
default: Z<=16'd15;
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

always @(posedge clk2)
begin

mem[L34_addr] <= L34_z;

end

assign y=L34_z;

endmodule

