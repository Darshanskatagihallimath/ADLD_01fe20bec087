`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:07:16 05/11/2023
// Design Name:   memory
// Module Name:   /tmp/structural_modelling/memory_tb.v
// Project Name:  structural_modelling
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memory_tb;

	// Inputs
	reg [7:0] data_in;
	reg [9:0] addr;
	reg wr;
	reg cs;
integer k,myseed;
	// Outputs
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	memory uut (
		.data_out(data_out), 
		.data_in(data_in), 
		.addr(addr), 
		.wr(wr), 
		.cs(cs)
	);

	initial begin
for(k=0;k<=1023;k=k+1)
begin
data_in=(k+k)%256;wr=1;cs=1;
#2 addr=k;wr=0;cs=0;
end

repeat(20)
begin
#2 addr=$random(myseed)%1024;
wr=0;
cs=1;
$display("Address:%5d,Data:%4d",addr,data_in);
end
end
initial myseed=35;
endmodule

