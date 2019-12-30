`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:55:30 11/14/2018 
// Design Name: 
// Module Name:    division 
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
module division(clk, a,b,result);
input clk;
input [31:0] a,b;
output [31:0] result;
wire underflow, overflow, invalid_op, divide_by_zero;

division div (
  .a(a), // input [31 : 0] a
  .b(b), // input [31 : 0] b
  .clk(clk), // input clk
  .result(result), // output [31 : 0] result
  .underflow(underflow), // output underflow
  .overflow(overflow), // output overflow
  .invalid_op(invalid_op), // output invalid_op
  .divide_by_zero(divide_by_zero) // output divide_by_zero
);

always@(posedge clk)
	begin
	
	end
endmodule
