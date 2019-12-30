`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:18:48 11/14/2018 
// Design Name: 
// Module Name:    multiplication_normaliser 
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
module multiplication_normaliser(in_e, in_m, out_e, out_m);
  input [7:0] in_e;
  input [47:0] in_m;
  output [7:0] out_e;
  output [47:0] out_m;

  wire [7:0] in_e;
  wire [47:0] in_m;
  reg [7:0] out_e;
  reg [47:0] out_m;

  always @ ( * ) begin
	  if (in_m[46:41] == 6'b000001) begin
			out_e = in_e - 5;
			out_m = in_m << 5;
		end else if (in_m[46:42] == 5'b00001) begin
			out_e = in_e - 4;
			out_m = in_m << 4;
		end else if (in_m[46:43] == 4'b0001) begin
			out_e = in_e - 3;
			out_m = in_m << 3;
		end else if (in_m[46:44] == 3'b001) begin
			out_e = in_e - 2;
			out_m = in_m << 2;
		end else if (in_m[46:45] == 2'b01) begin
			out_e = in_e - 1;
			out_m = in_m << 1;
		end
  end

endmodule
