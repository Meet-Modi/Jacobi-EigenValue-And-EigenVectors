`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:59:25 11/10/2018 
// Design Name: 
// Module Name:    A_and_A_T 
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
module A_and_A_T(clk, reset, addressreg, row_1, row_2, ready_for_AA_T);
	
	output reg [1023:0] row_1, row_2;
	output reg ready_for_AA_T;
	output reg [4:0] addressreg;
	input clk,reset;
	reg  [1023:0] A [0:31];
	reg  [1023:0] A_T [0:31];
	reg [9:0] diary;
	reg ready_to_load, counterreg, counter_for_load_reg;
	wire [1023:0] row;
	wire [9:0] diary_wire;
	wire [4:0] address;
	wire counter, enable, counter_for_load;
	
	
	Image_To_Vector v1(clk, address, row, enable);
	assign address = addressreg + 5'b00001;
	assign diary_wire = diary - 10'd32;
	assign counter = counterreg + 1'b1;
	assign counter_for_load = counter_for_load_reg + 1'b1;
	
	always@(posedge clk)
		begin
			$display("ready flag - %b", ready_for_AA_T);
			if(reset == 1'b1)
				begin
					counterreg <= 1'b1;
					addressreg <= 5'b00001;
					diary <= 10'd1023;
					ready_to_load <= 1'b0;
					ready_for_AA_T <= 1'b0;
					counter_for_load_reg <= 1'b0;
					$display("reset triggered");
				end
			else if(diary_wire == 10'd1023 && ready_to_load == 1'b1)
				begin
					row_1 <= A[addressreg];
					row_2 <= A_T[addressreg];
					//$display("ans_1 - %b" , row_1);
					$display("ans_2 - %b" , row_2[991:960]);
					$display("Address %d", addressreg);
					addressreg <= address;
					$display("ready to load");
					if(address == 5'd30 && counter_for_load == 1'b1)
					begin
						ready_for_AA_T <= 1'b1;
						$display("flag generated");
						//$stop;
					end
					else if(address == 5'd29)
					begin
						counter_for_load_reg <= counter_for_load;
					end
				end
			else
				begin
					addressreg <= address;
					A[addressreg][1023:0] <= row;
					row_1 <= A[addressreg];
					///$display("ans_! - %b" , A_T[addressreg][1023:992]);
					//$display("Address %d", addressreg);
					A_T[0][diary_wire -: 10'd32] <= row[1023:992];
					//$display("ans - %b" , A_T[0][diary_wire -: 10'd32]);
					A_T[1][diary_wire -: 10'd32] <= row[991:960];
					A_T[2][diary_wire -: 10'd32] <= row[959:928];
					A_T[3][diary_wire -: 10'd32] <= row[927:896];
					A_T[4][diary_wire -: 10'd32] <= row[895:864];
					A_T[5][diary_wire -: 10'd32] <= row[863:832];
					A_T[6][diary_wire -: 10'd32] <= row[831:800];
					A_T[7][diary_wire -: 10'd32] <= row[799:768];
					A_T[8][diary_wire -: 10'd32] <= row[767:736];
					A_T[9][diary_wire -: 10'd32] <= row[735:704];
					A_T[10][diary_wire -: 10'd32] <= row[703:672];
					A_T[11][diary_wire -: 10'd32] <= row[671:640];
					A_T[12][diary_wire -: 10'd32] <= row[639:608];
					A_T[13][diary_wire -: 10'd32] <= row[607:576];
					A_T[14][diary_wire -: 10'd32] <= row[575:544];
					A_T[15][diary_wire -: 10'd32] <= row[543:512];
					A_T[16][diary_wire -: 10'd32] <= row[511:480];
					A_T[17][diary_wire -: 10'd32] <= row[479:448];
					A_T[18][diary_wire -: 10'd32] <= row[447:416];
					A_T[19][diary_wire -: 10'd32] <= row[415:384];
					A_T[20][diary_wire -: 10'd32] <= row[383:352];
					A_T[21][diary_wire -: 10'd32] <= row[351:320];
					A_T[22][diary_wire -: 10'd32] <= row[319:288];
					A_T[23][diary_wire -: 10'd32] <= row[287:256];
					A_T[24][diary_wire -: 10'd32] <= row[255:224];
					A_T[25][diary_wire -: 10'd32] <= row[223:192];
					A_T[26][diary_wire -: 10'd32] <= row[191:160];
					A_T[27][diary_wire -: 10'd32] <= row[159:128];
					A_T[28][diary_wire -: 10'd32] <= row[127:96];
					A_T[29][diary_wire -: 10'd32] <= row[95:64];
					A_T[30][diary_wire -: 10'd32] <= row[63:32];
					A_T[31][diary_wire -: 10'd32] <= row[31:0];
					row_2 <= A_T[addressreg];
					//$display("diary - %d", diary_wire);
					if(diary_wire == 10'd31 && counter == 1'b1)
						begin
							ready_to_load <= 1'b1;
						end
					else if(diary_wire == 10'd31)
						begin
							counterreg <= counter;
						end
					diary <= diary_wire;
				end	
		end
		

endmodule
