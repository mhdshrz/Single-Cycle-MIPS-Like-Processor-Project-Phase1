`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:09:17 01/01/2023
// Design Name:   ALU_circuit
// Module Name:   C:/Users/ElMaximo/Desktop/verilog/ALU/ALU_circuit_testfixture.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_circuit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_circuit_testfixture;

	// Inputs
	reg [15:0] input1;
	reg [15:0] input2;
	reg [1:0] ALUctrl;

	// Outputs
	wire [15:0] answer;
	wire zerosignal;

	// Instantiate the Unit Under Test (UUT)
	ALU_circuit uut (
		.input1(input1), 
		.input2(input2), 
		.ALUctrl(ALUctrl), 
		.answer(answer), 
		.zerosignal(zerosignal)
	);

	initial begin
	
		// Initialize Inputs
		input1 = 9;
		input2 = 4;
		ALUctrl = 2'b00;	// ADD

		// Wait 100 ns for global reset to finish
		#100;
		
		// Initialize Inputs
		input1 = 9;
		input2 = 4;
		ALUctrl = 2'b01;	// SUB

		// Wait 100 ns for global reset to finish
		#100;
		
		// Initialize Inputs
		input1 = 9;
		input2 = 4;
		ALUctrl = 2'b10;	// AND

		// Wait 100 ns for global reset to finish
		#100;
		
		// Initialize Inputs
		input1 = 9;
		input2 = 4;
		ALUctrl = 2'b11;	// OR

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

