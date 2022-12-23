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
    input en,
    output reg [31:0] CurrentInstruction
    );
    always @ (posedge clk)
        begin
            if(en)
                CurrentInstruction <=  NextInstruction + 4;
            else
                CurrentInstruction <= CurrentInstruction;
        end
endmodule
module PCtest();
    
    reg [31:0]PC_before;
    reg Enable,CLK;
    wire [31:0]PC_after;
    
    ProgramCounter counter(PC_before,CLK, Enable,PC_after);
    
    initial begin 
        
        CLK  = 1'b0;
        forever 
            
            #5 CLK = ~CLK;
    end
    
    initial begin 
            
        Enable = 1'b1;
        
        forever
            #10 Enable = ~Enable;
    end
    
    initial begin 
        
        PC_before = 32'b0000000000000000000000000000001;
        
        #10
        
        PC_before = 32'b0000000000000000000000000000010;
        
        #10
        
        PC_before = 32'b0000000000000000000000000000100;
        
        #10
        
        PC_before = 32'b0000000000000000000000000001000;

    end
    
    initial begin
            
        #40
        $finish;
    end
        
        
endmodule


