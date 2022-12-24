// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps
module IMTest();
reg [31:0] add;
wire [31:0] instruction;
InstructionMem i(add,instruction);

initial begin
    #10
    add = 32'h0;
    #10
    add = 32'h4;
    #10
    add = 32'h8;
    #10
    add = 32'hc;
    #10
    add = 32'h10;
    #10
    add = 32'hc;
    #10
    add = 32'h14;
    #10
    add = 32'h0;
    #10
    add = 32'd56;
    #10
    $finish();
end
endmodule