`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:09:54 11/15/2018 
// Design Name: 
// Module Name:    test_always 
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
module test_always(clk,reset,out,M_ij);

output reg [31:0] M_ij;
input reset, clk;
input [31:0] out;

//wire [31:0] out;
genvar i;

generate
		for(i=0;i<3'd5;i=i+1)
			begin
				multiplier m1(M_ij, 32'b01000000000000000000000000000000, out);
			end
endgenerate
endmodule
