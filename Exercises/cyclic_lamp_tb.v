`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:31:52 05/11/2023
// Design Name:   cyclic_lamp
// Module Name:   /tmp/structural_modelling/cyclic_lamp_tb.v
// Project Name:  structural_modelling
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cyclic_lamp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cyclic_lamp_tb;

	// Inputs
	reg clk;

	// Outputs
	wire [2:0] light;

	// Instantiate the Unit Under Test (UUT)
	cyclic_lamp uut (
		.clk(clk), 
		.light(light)
	);
always #5 clk=~clk;
	initial begin
		clk=1'b0;
		#100 $finish;
	end
	initial begin
	$monitor($time,"rgy:%b",light);
	end
	endmodule

