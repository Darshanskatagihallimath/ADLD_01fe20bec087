module pipeline_test;

reg [9:0]A,B,C,D;
wire [9:0]F;
reg clk;

pipe_ex P(F,A,B,C,D,clk);

initial clk=1'b0;
initial begin

A=5;
B=6;
C=7;
D=8;
#20
$display("result=%d",F);

A=9;
B=10;
C=11;
D=12;
#20
$display("result=%d",F);

A=10;
B=6;
C=7;
D=8;
#20
$display("result=%d",F);
end


always #1 clk=~clk;
endmodule

module pipe_ex(F,A,B,C,D,clk);
parameter N=10;

input [N-1:0]A,B,C,D;
input clk;
output [N-1:0]F;
reg [N-1:0]L12_X1,L12_X2,L12_D,L23_X3,L23_D,L34_F;



 always @(posedge clk)
  begin
 L12_X1 <= #4 A+B;
 L12_X2 <= #4 C-D;
 L12_D <= D;

 L23_X3 <= #4 L12_X1 + L12_X2;
 L23_D <= L12_D;

 L34_F <= #6 L23_X3 * L23_D;

end
assign F=L34_F;

endmodule
