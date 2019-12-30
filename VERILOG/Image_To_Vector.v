`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:42 11/10/2018 
// Design Name: 
// Module Name:    Image_To_Vector 
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
module Image_To_Vector(clk, address, row, enable);

	input clk;
	input[4:0] address;
	input enable;
	output [1023:0] row;
	wire [1023:0] douta;
	
	image_ipcore Image_read (
	  .clka(clk), // input clka
	  .addra(address), // input [4 : 0] addra
	  .douta(douta) // output [1023 : 0] douta
	);
	
	assign row = douta;
	always@(posedge clk)
	begin
		//$display("add - %b" , address);
	end
	
endmodule
