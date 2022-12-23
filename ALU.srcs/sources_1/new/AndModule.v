`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2022 03:14:12 PM
// Design Name: 
// Module Name: AndModule
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


module AndModule#(N=32)(
    input [N-1:0] Operand1,
    input [N-1:0] Operand2,
    output reg [N-1:0] Result
    );
    always @(*)
    begin
        Result = Operand1 & Operand2;
    end
endmodule
