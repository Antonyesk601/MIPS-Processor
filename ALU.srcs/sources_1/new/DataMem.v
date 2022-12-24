`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2022 09:12:05 PM
// Design Name: 
// Module Name: DataMem
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


module DataMem(
  input [31:0] Address,
  input [31:0] WriteData,
  output [31:0] ReadData
  );
  reg [7:0] mem [0: 1024];
  assign ReadData = {mem[Address],mem[Address+1],mem[Address+2],mem[Address+3]};
endmodule
