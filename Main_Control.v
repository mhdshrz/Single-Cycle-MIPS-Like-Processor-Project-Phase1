`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:11:21 12/31/2022 
// Design Name: 
// Module Name:    Main_Control 
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
module Control_Unit(opcode, RegWrite, ALUsrc, RegDst, MemtoReg, MemWrite, Branch, ExtOp, MemRead, ALUopt1, ALUopt2
    );
	 
	 input [1:0] opcode;
	 output reg RegWrite;
	 output reg ALUsrc;
	 output reg RegDst;
	 output reg MemtoReg;
	 output reg MemWrite;
	 output reg Branch;
	 output reg ExtOp;
	 output reg MemRead;
	 output reg ALUopt1;
	 output reg ALUopt2;
	 
	 always @ (*)
	 begin
	 
	 RegWrite = (!opcode[0] & !opcode[1]) | (opcode[0] & !opcdoe[1]);
	 ALUsrc = (opcode[0] & !opcode[1]) | (!opcode[0] & opcode[1]);
	 RegDst = !opcode[0] & !opcode[1];
	 MemtoReg = opcode[0] & !opcode[1];
	 MemWrite = !opcode[0] & opcode[1];
	 Branch = opcode[0] & opcode[1];
	 ExtOp = (opcode[0] & !opcode[1]) | (!opcode[0] & opcode[1]) | (opcode[0] & opcode[1]);
	 MemRead = opcode[0] & !opcode[1];
	 ALUopt1 = !opcode[0] & !opcode[1];
	 ALUopt2 = opcode[0] & opcode[1];
	 
	 end
	 
endmodule