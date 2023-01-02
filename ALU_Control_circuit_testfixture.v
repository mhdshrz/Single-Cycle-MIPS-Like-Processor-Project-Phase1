`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:47:49 01/02/2023
// Design Name:   ALU_Control_circuit
// Module Name:   D:/New folder/ALU_Control_circuit/ALU_Control_circuit_testfixture.v
// Project Name:  ALU_Control_circuit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_Control_circuit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_Control_circuit_testfixture;

	// Inputs
	reg [4:0] funct;
	reg [1:0] ALUopt;

	// Outputs
	wire [1:0] ALUctrlsignal;

	// Instantiate the Unit Under Test (UUT)
	ALU_Control_circuit uut (
		.funct(funct), 
		.ALUopt(ALUopt), 
		.ALUctrlsignal(ALUctrlsignal)
	);

	initial begin
	
		// Initialize Inputs
		funct = 2'b00000;
		ALUopt = 2'b10;

		// Wait 100 ns for global reset to finish
		#100;
		
		// Initialize Inputs
		funct = 2'b00001;
		ALUopt = 2'b10;

		// Wait 100 ns for global reset to finish
		#100;
		
		// Initialize Inputs
		funct = 2'b00010;
		ALUopt = 2'b10;

		// Wait 100 ns for global reset to finish
		#100;
		
		// Initialize Inputs
		funct = 2'b00011;
		ALUopt = 2'b10;

		// Wait 100 ns for global reset to finish
		#100;
		
		// Initialize Inputs
		funct = 2'b00001; // Does not matter
		ALUopt = 2'b00;

		// Wait 100 ns for global reset to finish
		#100;
		
		// Initialize Inputs
		funct = 2'b00001; // Does not matter
		ALUopt = 2'b00;

		// Wait 100 ns for global reset to finish
		#100;
		
		// Initialize Inputs
		funct = 2'b00001; // Does not matter
		ALUopt = 2'b01;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

