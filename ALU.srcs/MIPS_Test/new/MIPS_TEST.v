`timescale 1ns / 1ps
module MIPS_Test();
    reg clk;
    MIPS_Processor processor(clk);
    initial
    begin
        clk = 0;
        forever #500 clk =~clk;
    end
endmodule