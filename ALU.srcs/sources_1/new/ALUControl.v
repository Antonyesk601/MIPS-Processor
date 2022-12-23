`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2022 08:49:39 PM
// Design Name: 
// Module Name: ALUControl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALUControl(
    input [1:0] ALUOp,
    input [5:0] Funct,
    output [3:0] OPCODE
    );
    wire operation;
    assign operation = Funct[3:0]==4'd0 ? 4'b0010:
                       Funct[3:0]==4'd2 ? 4'b0110:
                       Funct[3:0]==4'd4 ? 4'b0000:
                       Funct[3:0]==4'd5 ? 4'b0001:
                       Funct[3:0]==4'd6 ? 4'b0111:
                       4'bxxxx;
    assign OPCODE = (ALUOp==2'b00) ? 4'b0010 : ((ALUOp==2'b01)?4'b0110:operation); 
endmodule
