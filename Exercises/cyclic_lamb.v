`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:22:39 05/11/2023 
// Design Name: 
// Module Name:    cyclic_lamb 
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
module cyclic_lamp(clk,light);
input clk;
output reg[2:0]light;
parameter s0=0,s1=1,s2=2;
parameter red=3'b100,green=3'b010,yellow=3'b001;
reg [1:0]state;
always @(posedge clk)
 case(state)
  s0:begin
       light<=green;state<=s1;
	  end
  s1:begin
      light<=yellow;state<=s2;
		end
  s2:begin
      light<=red;state<=s0;
		end
	default:begin
	       light<=red;state<=0;
			 end
			 endcase
endmodule
