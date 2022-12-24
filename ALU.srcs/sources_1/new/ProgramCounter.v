`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2022 04:41:54 PM
// Design Name: 
// Module Name: ProgramCounter
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

module ProgramCounter(
    input [31:0] NextInstruction,
    input clk,
    output reg [31:0] CurrentInstruction
    );
    initial 
        begin
            CurrentInstruction =32'h00400000 ;
        end
    always @(posedge clk)
        CurrentInstruction =  NextInstruction;
    
endmodule

