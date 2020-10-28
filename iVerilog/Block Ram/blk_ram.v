`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:08:14 10/20/2020 
// Design Name: 
// Module Name:    image_add 
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
module mem(clk,data1,data2,rst,out1,out2,out3);

input clk,rst;
input [7:0] data1,data2;

output [7:0] out1,out2,out3;

//reg [7:0] out3;
reg [5:0] addr1;

reg [5:0] addr;
reg mode=1'b1;
	
	/*blk_mem b1(clk,1'b0,addr,data1,out1);
	blk_mem b2(clk,1'b0,addr,data2,out2);
	blk_mem out(clk,1'b1,addr1,out1+out2,out3);
	*/
	blk_mem2 b1(clk,1'b0,addr,data1,out1);
	blk_mem2 b2(clk,1'b0,addr,data2,out2);
	blk_mem2 out(clk,1'b1,addr1,out1+out2,out3);
	always@(posedge clk)
	begin 
		if (rst == 1)
			addr = 6'b0;
		else
			addr = addr + 1;
	end
	
	always @(posedge clk)
	begin
		if (mode==1'b1)
			addr1 = addr-1;
		else
			addr1 = addr;
	end

endmodule
