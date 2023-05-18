`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:40:55 05/11/2023
// Design Name:   parity
// Module Name:   /tmp/structural_modelling/parity_test.v
// Project Name:  structural_modelling
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: parity
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module parity_test;

	// Inputs
	reg x;
	reg clk;

	// Outputs
	wire z;

	// Instantiate the Unit Under Test (UUT)
	parity uut (
		.x(x), 
		.clk(clk), 
		.z(z)
	);

	initial begin
		$monitor($time,"%d",z);
		clk=1'b0;

	end
      
endmodule

