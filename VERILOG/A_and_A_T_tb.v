`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:47:49 11/10/2018
// Design Name:   A_and_A_T
// Module Name:   C:/MEET/PROJECTS/COLASS/Final_32/A_and_A_T_tb.v
// Project Name:  Final_32
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: A_and_A_T
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module A_and_A_T_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [4:0] addressreg;
	wire [1023:0] row_1;
	wire [1023:0] row_2;
	wire ready_for_AA_T;

	// Instantiate the Unit Under Test (UUT)
	A_and_A_T uut (
		.clk(clk), 
		.reset(reset), 
		.addressreg(addressreg), 
		.row_1(row_1), 
		.row_2(row_2), 
		.ready_for_AA_T(ready_for_AA_T)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		#3
		reset = 1'b1;
		
		#3
		reset = 1'b0;

	end
      
		always #5 clk = ~clk;
      
endmodule

