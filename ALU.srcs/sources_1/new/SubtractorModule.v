`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2022 03:14:12 PM
// Design Name: 
// Module Name: AdditionModule
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


module AdditionModule#(N=32)(
    input [N-1:0] Operand1,
    input [N-1:0] Operand2,
    input Cin,
    output reg [N-1:0] Result,
    output reg Cout,
    output reg OverflowFlag
    );
    reg[31:0] op2;
    reg [32:0] resintermediate;
    always @ (*)
    begin 
        op2 =  ~Operand2 +1 - Cin;
        resintermediate = Operand1 + op2;
        Cout = resintermediate[32]^1;
        Result = resintermediate[31:0];
        OverflowFlag = (Operand1[31]==op2[31])&&(op2[31]!=(Result[31]));
    end
endmodule
