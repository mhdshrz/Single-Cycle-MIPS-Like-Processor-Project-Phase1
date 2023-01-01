`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:57:26 01/01/2023 
// Design Name: 
// Module Name:    ALU_circuit 
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
module ALU_circuit(input1, input2, ALUctrl, answer, zerosignal
    );
	 
	input [15:0] input1;
	input [15:0] input2;
	input [1:0] ALUctrl;
	output reg [15:0] answer;
	output reg zerosignal;
	 
	always @ (*)
	begin
	 
	case(ALUctrl)
		
	2'b00: answer = input1 + input2; // ADD
	2'b01: answer = input1 - input2; // SUBTRACT
	2'b10: answer = input1 & input2; // AND
	2'b11: answer = input1 | input2; // OR
	
	default: answer = 0;
	endcase
	
	if(answer== 16'b0000000000000000)
		zerosignal = 1;
	else
		zerosignal = 0;
	 
	end

endmodule
