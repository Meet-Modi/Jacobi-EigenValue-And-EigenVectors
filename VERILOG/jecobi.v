`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:56 11/14/2018 
// Design Name: 
// Module Name:    jecobi 
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
module jecobi(clk,reset, AA_T_wire);
input clk, reset;
input [31:0] AA_T_wire;
reg [31:0] M [0:31][0:31]; 
reg [4:0] addressreg;
wire [4:0] address;
reg loaded_flag;
reg [4:0] i,j;
reg [31:0] M_ii, M_ij, M_jj;

division d1(clk, a,b,result);
multiplier(M_ij, 32'b01000000000000000000000000000000, out);
assign address = addressreg + 5'b00001;
always@(posedge clk)
	begin
		multiplier(M_ij, 32'b01000000000000000000000000000000, out);	
		if(reset == 1'b1)
			begin
				loaded_flag <= 1'b0;
				addressreg <= 5'b11111;
			end
		else if(loaded_flag == 1'b0)
				begin
					for(i = 0;i < 32; i = i + 1)
						begin
							M[address][i] <= AA_T_wire[1023 - 10'd32*i -: 10'd32];
						end
					addressreg <= address;
				end
				if(address == 5'b11111)
					begin
						/*find largest offdiag/cyclic flag 1*/
					end
		/*else if(largest offdiag/cyclic == 1'b1)
			begin
				i<=i_wire;
				j<=j_wire;
				M_ii <= M[i_wire][i_wire];
				M_jj <= M[j_wire][j_wire];
				M_ij <= M[i_wire][j_wire];
				Extract Aii, Ajj, Aij flag 1
				
			end
		*/
		/*else if(extract_elements == 1'b1)
			begin
				
			end*/
	end
	
endmodule
