`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:19:59 11/15/2018
// Design Name:   test_always
// Module Name:   C:/MEET/PROJECTS/COLASS/Final_32/test_always_tb.v
// Project Name:  Final_32
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: test_always
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

 module test_always_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] out;

	// Outputs
	wire [31:0] M_ij;

	// Instantiate the Unit Under Test (UUT)
	test_always uut (
		.clk(clk), 
		.reset(reset), 
		.out(out), 
		.M_ij(M_ij)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		out = 32'd1;

		// Wait 100 ns for global reset to finish
		//#100;
        
		// Add stimulus here

	end
      
endmodule

