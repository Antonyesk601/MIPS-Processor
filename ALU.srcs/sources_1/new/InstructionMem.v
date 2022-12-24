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
    reg [7:0] mem [0: 1024];
    initial 
       begin
            mem[ 32'd0] = 8'b00100000;//ADDI $s0, $zero, 4
            mem[32'd1] = 8'b00010000;
            mem[32'd2] = 8'b00000000;
            mem[32'd3] = 8'b00000100;
           
            mem[32'd4] = 8'b00100000;//ADDI $s1, $zero, 3
            mem[32'd5] = 8'b00010001;
            mem[32'd6] = 8'b00000000;
            mem[32'd7] = 8'b00000011;
       
            mem[32'd8] = 8'b00000010;//OR $s2, $s0, $s1
            mem[32'd9] = 8'b00010001;
            mem[32'd10] = 8'b10010000;
            mem[32'd11] = 8'b00100101;
           
            mem[32'd12] = 8'b00100000;//ADDI $s0, $zero, 1
            mem[32'd13] = 8'b00010000;
            mem[32'd14] = 8'b00000000;
            mem[32'd15] = 8'b00000001;
           
            mem[32'd16] = 8'b00100000;//ADDI $s1, $zero, 3
            mem[32'd17] = 8'b00010001;
            mem[32'd18] = 8'b00000000;
            mem[32'd19] = 8'b00000011;
           
            mem[32'd20] = 8'b00000010;//AND $s2, $s1, $s0
            mem[32'd21] = 8'b00110000;
            mem[32'd22] = 8'b10010000;
            mem[32'd23] = 8'b00100100;
           
            mem[32'd24] = 8'b00100000; //ADDI $s0, $zero, 65535
            mem[32'd25] = 8'b00010000;
            mem[32'd26] = 8'b11111111;
            mem[32'd27] = 8'b11111111;
           
            mem[32'd28] = 8'b00100000;//ADDI $s1, $zero, 1
            mem[32'd29] = 8'b00010001;
            mem[32'd30] = 8'b00000000;
            mem[32'd31] = 8'b00000001;
           
            mem[32'd32] = 8'b00000010;//ADD $s2, $s1, $s0
            mem[32'd33] = 8'b00110000;
            mem[32'd34] = 8'b10010000;
            mem[32'd35] = 8'b00100000;
           
            mem[32'd36] = 8'b00100000;//ADDI $s0, $zero, 8
            mem[32'd37] = 8'b00010000;
            mem[32'd38] = 8'b00000000;
            mem[32'd39] = 8'b00001000;
           
            mem[32'd40] = 8'b00100000; //ADDI $s1, $zero, 1;
            mem[32'd41] = 8'b00010001;
            mem[32'd42] = 8'b00000000;
            mem[32'd43] = 8'b00000001;
           
            mem[32'd44] = 8'b00000010; //SUB $s2, $s0, $s1
            mem[32'd45] = 8'b00010001;
            mem[32'd46] = 8'b10010000;
            mem[32'd47] = 8'b00100010;

            mem[32'd48] = 8'b00100000; //ADDI $s0, $zero, 5
            mem[32'd49] = 8'b00010000;
            mem[32'd50] = 8'b00000000;
            mem[32'd51] = 8'b00000101;

            mem[32'd52] = 8'b00100000; //ADDI $s1, $zero, 4
            mem[32'd53] = 8'b00010001;
            mem[32'd54] = 8'b00000000;
            mem[32'd55] = 8'b00000100;

            mem[32'd56] = 8'b00000010; //ADD $s2, $s1, $s0
            mem[32'd57] = 8'b00110000;
            mem[32'd58] = 8'b10010000;
            mem[32'd59] = 8'b00100000;
        
            mem[32'd60] = 8'b00100000; //ADDI $s0, $zero, 100
            mem[32'd61] = 8'b00010000;
            mem[32'd62] = 8'b00000000;
            mem[32'd63] = 8'b01100100;

            mem[32'd64] = 8'b00100000; //ADDI $s1, $zero, 500
            mem[32'd65] = 8'b00010001;
            mem[32'd67] = 8'b00000001;
            mem[32'd68] = 8'b11110100;

            mem[32'd69] = 8'b00000010; //SUB $s2, $s0, $s1
            mem[32'd70] = 8'b00010001;
            mem[32'd71] = 8'b10010000;
            mem[32'd72] = 8'b00100010;
        
//            mem[32'd73] = 8'b00000010; //SUB $s2, $s0, $s1
//            mem[32'd74] = 8'b00010001;
//            mem[32'd75] = 8'b10010000;
//            mem[32'd76] = 8'b00100010;
                    
        end
        
        assign Instruction  = {mem[Address],mem[Address+1],mem[Address+2],mem[Address+3]};
        
    endmodule
