`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:16:10 11/14/2018 
// Design Name: 
// Module Name:    atan_to_sincos 
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
module atan_to_sincos(y,x, clk, reset,sin, cos, ready_for_givens);

output reg [31:0] sin, cos;
output reg ready_for_givens;
input [31:0] y,x;
input clk, reset;

wire rdy_1, rdy_2;
reg [31:0] phase_in;

//input 

atan atan_1 (
  .x_in(x), // input [31 : 0] x_in
  .y_in(y), // input [31 : 0] y_in
  .phase_out(phase_out), // output [31 : 0] phase_out
  .rdy(rdy_1), // output rdy
  .clk(clk) // input clk
);

sincos sincos_1 (
  .phase_in(phase_in), // input [31 : 0] phase_in
  .x_out(x_out), // output [31 : 0] x_out
  .y_out(y_out), // output [31 : 0] y_out
  .rdy(rdy_2), // output rdy
  .clk(clk) // input clk
);

always@(posedge clk)
	begin
		if(rdy_1==1'b1)
		begin
			phase_in <= phase_out;
		end
		else if(rdy_2==1'b1)
		begin
			sin <= y_out;
			cos <= x_out;
			ready_for_givens <= 1'b1;
			//ready_for_givens <= 1'b0;
		end
		else
		begin
			ready_for_givens <= 1'b0;
		end
	end


endmodule

//000000000100000010000000000000000