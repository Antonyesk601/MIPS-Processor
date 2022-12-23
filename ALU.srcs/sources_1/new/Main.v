`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2022 03:01:22 PM
// Design Name: 
// Module Name: Main
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


module main();
    reg [31:0] op1;
    reg [31:0] op2;
    
    reg [3:0] opCode;
    reg Cin;
    
    wire [31:0] result;
    wire cflag,zflag,oflag;
    
    ALU my_alu(opCode,op1,op2,Cin,result,cflag,oflag,zflag);
    initial 
        begin
            $display("Hello, World");
            #20
            op1 =32'b00110011001100110011001100110011;
            op2 =32'b11001100110011001100110011001100;
            opCode = 4'b1111;
            Cin = 1'b1;
            #20
            op1 =32'b00110011001100110011001100110011;
            op2 =32'b11001100110011001100110011001100;
            opCode = 4'b0000;
            Cin = 1'b0;
            #20
            op1 =32'b00000000000000001111111111111111;
            op2 =32'b00000000000000000000000000000001;
            opCode = 4'b1001;
            Cin = 1'b1;
            #20
            op1 =32'b00000000000000000000000000001000;
            op2 =32'b00000000000000000000000000000001;
            opCode = 4'b0110;
            Cin = 1'b0;
            #20
            op1 =32'b11110000111100001111000011110001;
            op2 =32'b00001111000011110000111100001111;
            opCode = 4'b1001;
            Cin = 1'b0;
            #20
            op1 =32'b00110011001100110011001100110011;
            op2 =32'b01001100110011001100110011001100;
            opCode = 4'b0110;
            Cin = 1'b1;
            #20
            $finish();
        end
    
endmodule
