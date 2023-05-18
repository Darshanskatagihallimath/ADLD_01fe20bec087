`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:40:20 05/11/2023 
// Design Name: 
// Module Name:    sequence_detec 
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
module sequence_detec(out,in,clk);
input in,clk;
output reg out;
reg [1:0]state;
parameter s0=2'd0,s1=2'd1,s2=2'd2,s3=2'd3;
always @(posedge clk)
case(state)
s0:if(in==0)
     begin out=0;state=s1;
     end
      else
     begin out=0;state=s0;
     end  
s1:if(in==0)
     begin out=0;state=s1;
     end
      else
     begin out=0;state=s2;
     end
s2:if(in==0)
     begin out=0;state=s1;
     end
      else
     begin out=0;state=s3;
     end
s3:if(in==0)
     begin out=1;state=s1;
     end
      else
     begin out=0;state=s0;
     end
	 default:state=s0;
	 endcase
	 end
	 endmodule
