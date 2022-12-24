`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2022 09:28:48 PM
// Design Name: 
// Module Name: Control
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


module Control(
    input [5:0] Instruction,
    output RegisterDestination,
    output Jump,
    output Branch,
    output ReadFromMemory,
    output MemoryToRegister,
    output [1:0] ALUOp,
    output WriteToMemory,
    output ALUOperand2Source,
    output WriteToReg
    );
    assign RegisterDestination = Instruction ==6'd0; 
    assign Jump = (Instruction == 6'd2)
                    ||(Instruction == 6'd3);
    assign Branch = (Instruction == 6'd4)
                        ||(Instruction == 6'd5)
                        ||(Instruction == 6'd6)
                        ||(Instruction == 6'd7)
                        ||(Instruction == 6'd20)
                        ||(Instruction == 6'd21)
                        ||(Instruction == 6'd22)
                        ||(Instruction == 6'd23);
    assign ReadFromMemory = (Instruction == 6'd32)
                            ||(Instruction == 6'd33)
                            ||(Instruction == 6'd34)
                            ||(Instruction == 6'd35)
                            ||(Instruction == 6'd36)
                            ||(Instruction == 6'd37)
                            ||(Instruction == 6'd38)
                            ||(Instruction == 6'd39);
    assign MemoryToRegister  = (Instruction == 6'd32)
                                   ||(Instruction == 6'd33)
                                   ||(Instruction == 6'd34)
                                   ||(Instruction == 6'd35)
                                   ||(Instruction == 6'd36)
                                   ||(Instruction == 6'd37)
                                   ||(Instruction == 6'd38)
                                   ||(Instruction == 6'd39);
    assign ALUOp = {Instruction ==6'd0,(Instruction == 6'd4)
                            ||(Instruction == 6'd5)
                            ||(Instruction == 6'd6)
                            ||(Instruction == 6'd7)
                            ||(Instruction == 6'd20)
                            ||(Instruction == 6'd21)
                            ||(Instruction == 6'd22)
                            ||(Instruction == 6'd23)};
    assign WriteToMemory =  (Instruction == 6'd40)
                                || (Instruction == 6'd41)
                                || (Instruction == 6'd42)
                                || (Instruction == 6'd43)
                                || (Instruction == 6'd46);
    assign ALUOperand2Source = (!Instruction ==6'd0)
                                    && (Instruction != 6'd4) 
                                    && (Instruction != 6'd5);
    assign WriteToReg = (!( (Instruction == 6'd40)
                               || (Instruction == 6'd41)
                               || (Instruction == 6'd42)
                               || (Instruction == 6'd43)
                               || (Instruction == 6'd46)))
                            &&(!(Instruction == 6'd4)
                                   ||(Instruction == 6'd5)
                                   ||(Instruction == 6'd6)
                                   ||(Instruction == 6'd7)
                                   ||(Instruction == 6'd20)
                                   ||(Instruction == 6'd21)
                                   ||(Instruction == 6'd22)
                                   ||(Instruction == 6'd23))
                            &&(!((Instruction == 6'd2)
                                   ||(Instruction == 6'd3)));
endmodule
