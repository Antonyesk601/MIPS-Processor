`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2022 04:41:54 PM
// Design Name: 
// Module Name: InstructionMem
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


module InstructionMem(
    input [31:0] Address,
    output [31:0] Instruction
    );
    reg [7:0] mem [0: 2147483647];
    initial 
       begin
            mem[0] = 8'h20;
            mem[1] = 8'h08;
            mem[2] = 8'h00;
            mem[3] = 8'h03;
           
            mem[4] = 8'h20;
            mem[5] = 8'h01;
            mem[6] = 8'h00;
            mem[7] = 8'h01;
       
            mem[8] = 8'h42;
            mem[9] = 8'h80;
            mem[10] = 8'h00;
            mem[11] = 8'h02;
           
            mem[12] = 8'h21;
            mem[13] = 8'h08;
            mem[14] = 8'h00;
            mem[15] = 8'h01;
           
            mem[16] = 8'h08;
            mem[17] = 8'h10;
            mem[18] = 8'h00;
            mem[19] = 8'h05;
           
            mem[20] = 8'h20;
            mem[21] = 8'h01;
            mem[22] = 8'h00;
            mem[23] = 8'h02;
           
            mem[24] = 8'h14;
            mem[25] = 8'h28;
            mem[26] = 8'h00;
            mem[27] = 8'h02;
           
            mem[28] = 8'h21;
            mem[29] = 8'h08;
            mem[30] = 8'h00;
            mem[31] = 8'h02;
           
            mem[32] = 8'h08;
            mem[33] = 8'h10;
            mem[34] = 8'h00;
            mem[35] = 8'h0d;
           
            mem[36] = 8'h20;
            mem[37] = 8'h01;
            mem[38] = 8'h00;
            mem[39] = 8'h03;
           
            mem[40] = 8'h14;
            mem[41] = 8'h28;
            mem[42] = 8'h00;
            mem[43] = 8'h02;
           
            mem[44] = 8'h21;
            mem[45] = 8'h08;
            mem[46] = 8'h00;
            mem[47] = 8'h03;

            mem[48] = 8'h08;
            mem[49] = 8'h10;
            mem[50] = 8'h00;
            mem[51] = 8'h03;

            mem[52] = 8'h24;
            mem[53] = 8'h02;
            mem[54] = 8'h00;
            mem[55] = 8'h0a;

            mem[56] = 8'h00;
            mem[57] = 8'h00;
            mem[58] = 8'h00;
            mem[59] = 8'h0c;
        end
        
        assign  Instruction  = {mem[Address],mem[Address+1],mem[Address+2],mem[Address+3]};
    endmodule
