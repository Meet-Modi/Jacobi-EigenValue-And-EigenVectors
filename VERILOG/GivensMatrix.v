`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:31:39 11/14/2018 
// Design Name: 
// Module Name:    GivensMatrix 
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
module GivensMatrix();

reg [31:0] G[0:31][0:31];
reg [5:0] i,j;
//atan_to




always@(posedge clk)
	begin
		if(reset == 1'b1)
			begin
				for(i=0;i<32;i=i+1)
					begin
						for(j=0;j<32;j=j+1)
							begin
								if(i==j)
									begin
										G[i][i] = 32'd1;
									end
								else
									begin
										G[i][j] = 32'd0;
									end
							end
					end
			end
		else if (ready_flag == 1'b1)
			begin
				G[row][row] = cos;
				G[col][col] = cos;
				G[row][col] = sin;
				G[col][row] = ~sin + 32'b01000000000000000000000000000000;
			end
	end

endmodule
