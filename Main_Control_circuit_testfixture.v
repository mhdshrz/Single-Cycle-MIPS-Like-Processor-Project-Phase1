`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:36:34 01/01/2023
// Design Name:   Main_Control_circuit
// Module Name:   D:/New folder/Main_Control/Main_Control_circuit_testfixture.v
// Project Name:  Main_Control
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main_Control_circuit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Main_Control_circuit_testfixture;

	// Inputs
	reg [1:0] opcode;

	// Outputs
	wire RegWrite;
	wire ALUsrc;
	wire RegDst;
	wire MemtoReg;
	wire MemWrite;
	wire Branch;
	wire ExtOp;
	wire MemRead;
	wire ALUopt1;
	wire ALUopt2;

	// Instantiate the Unit Under Test (UUT)
	Main_Control_circuit uut (
		.opcode(opcode), 
		.RegWrite(RegWrite), 
		.ALUsrc(ALUsrc), 
		.RegDst(RegDst), 
		.MemtoReg(MemtoReg), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.ExtOp(ExtOp), 
		.MemRead(MemRead), 
		.ALUopt1(ALUopt1), 
		.ALUopt2(ALUopt2)
	);

	initial begin
	
		// Initialize Inputs
		opcode = 2'b00;

		// Wait 100 ns for global reset to finish
		#100;
		
		// Initialize Inputs
		opcode = 2'b01;

		// Wait 100 ns for global reset to finish
		#100;
		
		// Initialize Inputs
		opcode = 2'b10;

		// Wait 100 ns for global reset to finish
		#100;
		
		// Initialize Inputs
		opcode = 2'b11;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

