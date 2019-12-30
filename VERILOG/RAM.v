`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:08:21 11/14/2018 
// Design Name: 
// Module Name:    RAM 
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
module RAM(clk, reset, ena, read_write, address_1, address_2 , data_in_1,data_in_2, data_out_1, data_out_2,data_in_mux,data_out_mux, address_mux);

input clk, reset, ena, read_write, data_in_mux, data_out_mux, address_mux;
input [1023:0] data_in_1 , data_in_2;
input [4:0] address_1, address_2;

wire [1023:0] data_in, data_out;
wire [4:0] address;
reg [1023:0] data_out_reg;
reg [5:0] i;
output [1023:0] data_out_1,data_out_2; 

RAM_ip RAM_1 (
  .clka(clk), // input clka
  .ena(ena), // input ena
  .wea(read_write), // input [0 : 0] wea
  .addra(address), // input [4 : 0] addra
  .dina(data_in), // input [1023 : 0] dina
  .douta(data_out) // output [1023 : 0] douta
);


assign data_in = (data_in_mux == 1'b0) ? data_in_1 : data_in_2;
assign address = (address_mux == 1'b0) ? address_1 : address_2;
assign data_out_1 = (data_out_mux == 1'b0) ? data_out : 1024'bx;
assign data_out_2 = (data_out_mux == 1'b1) ? data_out : 1024'bx;

endmodule
