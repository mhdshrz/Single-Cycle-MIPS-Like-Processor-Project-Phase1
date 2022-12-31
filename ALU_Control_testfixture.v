`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:56:38 12/31/2022 
// Design Name: 
// Module Name:    ALU_Control 
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
module ALU_Control(funct, AlUopt, ALUctrlsignal
    );
	 input [4:0] funct;
	 input [1:0] ALUopt;
	 output reg [1:0] ALUctrlsignal;
	 
	 always @(*)
	 
	 begin
	 
	 if (ALUopt[1] == 0)
		ALUctrlsignal = ALUopt;
	 else
		ALUctrlsignal = funct[1:0];
	 
	 end

endmodule