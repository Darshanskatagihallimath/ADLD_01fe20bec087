`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:36:24 05/11/2023 
// Design Name: 
// Module Name:    parity 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module parity(x,clk,z);
input x,clk;
output reg z;
reg even_odd;
parameter even=0,odd=0;

always @(posedge clk)
case(even_odd)
 even:begin
       <=x?1:0;
		 <=x? even:odd;
		 end
	 default: :even;
		 end
endmodule
