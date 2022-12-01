`timescale 1ns / 1ps


module crc4_calculator(
    input s_in,
    input clk,
	input en,
    input rst,
    output [3:0] checksum
    );
	 
	 wire [3:0] s;
	 wire feedback,x0;
	 
	 
	 delay_ff stage3 (feedback,en,clk,rst,s[3]);
	 assign x0=feedback ^ s[3];
	 delay_ff stage2 (x0,en,clk,rst,s[2]);
	 delay_ff stage1 (s[2],en,clk,rst,s[1]);
	 delay_ff stage0 (s[1],en,clk,rst,s[0]);
	 assign feedback=s_in ^ s[0];
	 assign checksum=s;


endmodule