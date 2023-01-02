`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:41:03 01/02/2023 
// Design Name: 
// Module Name:    ALU_Control_circuit 
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
module ALU_Control_circuit(funct, ALUopt, ALUctrlsignal
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
