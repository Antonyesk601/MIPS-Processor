`timescale 1ns / 1ps
module MIPS_Test();
    reg clk;
    wire [31:0] CurrentInstructionAddress;
    wire[31:0] IncomingInstructionAddress;
    wire[31:0] CurrentInstructionAddressPlus4;
    wire[31:0] JumpAddress;
    wire[31:0] BranchAddress;

    //Instruction
    wire[31:0] CurrentInstruction;
    
    //DataBuses
    wire[31:0] WriteDataReg;
    wire[31:0] ReadData1;
    wire[31:0] ReadData2;
    wire[31:0] ReadData2Reg;
    wire[31:0] ReadData2Imm;
    wire[31:0] ALUOutput;
    wire[31:0] MemoryReadData;
    
    wire[4:0] WriteRegisterTarget;
    
    //ControlSignals
    wire RegisterDestination;
    wire Jump;
    wire Branch;
    wire ReadFromMemory;
    wire MemoryToRegister;
    wire[1:0] ALUOp;
    wire WriteToMemory;
    wire ALUOperand2Source;
    wire WriteToReg;
    wire BranchConditionMet;
    wire[3:0] ALUOPCODE;
    
    MIPS_Processor processor(clk,
        CurrentInstructionAddress,
        IncomingInstructionAddress,
        CurrentInstructionAddressPlus4,
        JumpAddress,
        BranchAddress,
        CurrentInstruction,
        WriteDataReg,
        ReadData1,
        ReadData2,
        ReadData2Reg,
        ReadData2Imm, 
        ALUOutput,
        MemoryReadData, 
        WriteRegisterTarget,
        RegisterDestination,
        Jump,
        Branch,
        ReadFromMemory,
        MemoryToRegister,
        ALUOp,
        WriteToMemory,
        ALUOperand2Source,
        WriteToReg,
        BranchConditionMet,
        ALUOPCODE);
    initial
    begin
        clk = 0;
        forever #10 clk =~clk;
    end
endmodule