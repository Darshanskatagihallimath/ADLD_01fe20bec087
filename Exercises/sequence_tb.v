`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:15:04 05/11/2023
// Design Name:   sequence_detec
// Module Name:   /tmp/structural_modelling/sequence_tb.v
// Project Name:  structural_modelling
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sequence_detec
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sequence_tb;

	// Inputs
	reg in;
	reg clk;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	sequence_detec uut (
		.out(out), 
		.in(in), 
		.clk(clk)
	);

	initial begin
	clk=1;
		in=1;
		#10 clk=~clk;
	end
      
endmodule

