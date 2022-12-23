`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2022 03:14:12 PM
// Design Name: 
// Module Name: DesicionModule
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


module  ALU #(N=32)(
    input [3:0] OPCODE,
    input [N-1:0] Operand1,
    input [N-1:0] Operand2,
    input Cin,
    output reg [N-1:0] Result,
    output reg Cout,
    output reg Overflow,
    output reg ZFlag
    );
    wire[N-1:0] andRes;
    wire[N-1:0] orRes;
    wire[N-1:0] addRes;
    wire cout;
    wire ovf;
    reg sub;
    AndModule a(Operand1,Operand2,andRes);
    OrModule o(Operand1,Operand2,orRes);
    AdditionModule add(Operand1,Operand2,Cin,sub,addRes,cout,ovf);
    always @(*)
    begin
        Cout = cout;
        case (OPCODE)
        4'b0000:
            begin
                Result = andRes;
                Cout = 0;
                Overflow = 0;
            end
        4'b0001:
            begin
                Result = orRes;
                Cout = 0;
                Overflow = 0;

            end
        4'b0010:
            begin
                sub = 0;
                Result = addRes;
                Overflow = ovf;
            end
        4'b0110:
            begin
                sub = 1;
                Result = addRes;
                Overflow = ovf; 
            end
        4'b0111:
              begin
              end
        endcase
        
        if (Result==0)
            ZFlag =1'b1;
        else
            ZFlag = 1'b0;
    end
    
endmodule
