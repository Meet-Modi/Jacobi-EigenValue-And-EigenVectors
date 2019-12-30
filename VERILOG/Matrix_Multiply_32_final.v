`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:25:29 11/13/2018 
// Design Name: 
// Module Name:    Matrix_Multiply_32_final 
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
module Matrix_Multiply_32_final(Answer, A_wire,B_wire, clk, reset,index_A, index_B);
	input clk, reset;
	input [1023:0] A_wire , B_wire;
	input [4:0] index_A, index_B;
	output reg [1023:0] Answer;
	reg [31:0] A [5:0][5:0];
	reg [31:0] B [5:0][5:0];
	reg [:0] i, j, k;
	reg [31:0] sum = 32'b0;
	reg [31:0] C [5:0][5:0];
	reg loaded_flag;
	always@(posedge clk)
			begin
				if(reset == 1'b1)
					begin
						loaded_flag <= 1'b0;
						$display("RESET TRIGGERED");
					end
				else if(loaded_flag == 1'b0)
					begin
						for(i = 0; i < 32;i = i + 1)
							begin
								A[index_A][i] <= A_wire[10'd1023 - 10'd32*i -: 10'd32];
								B[index_B][i] <= B_wire[10'd1023 - 10'd32*i -: 10'd32];
								$display("in for");
							end
						if(index_A == 5'b11111)
							begin
								loaded_flag <= 1'b1;
								$display("LOADED");
							end
					end
				else
					begin
					sum = 32'b0;
						for(i=0;i<32;i=i+1)
						begin
							for(j=0;j<32;j=j+1)
							begin
								for(k=0;k<32;k=k+1)
								begin
									sum = sum + A[i][k]*B[k][j];
								end
								C[i][j] = sum;
								sum=0;
							end
						end
					end
			end
endmodule
