`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2022 07:20:33 PM
// Design Name: 
// Module Name: MIPS_Processor
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


module MIPS_Processor(input wire clk);


    //Addresses
    wire[31:0] CurrentInstructionAddress;
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
    
    ALUControl aluc
        (.ALUOp(ALUOp),
        .Funct(CurrentInstruction[5:0])
        ,.OPCODE(ALUOPCODE));
        
    Control decoder
        (.Instruction(CurrentInstruction[31:26]),
        .RegisterDestination(RegisterDestination),
        .Jump(Jump),
        .Branch(Branch),
        .ReadFromMemory(ReadFromMemory),
        .MemoryToRegister(MemoryToRegister),
        .ALUOp(ALUOp),
        .WriteToMemory(WriteToMemory),
        .ALUOperand2Source(ALUOperand2Source),
        .WriteToReg(WriteToReg));        
    
    ProgramCounter PC
        (.NextInstruction(IncomingInstructionAddress),
        .clk(clk),
        .CurrentInstruction(CurrentInstructionAddress));
    
    InstructionMem IM
        (.Address(CurrentInstructionAddress-32'h00400000),
        .Instruction(CurrentInstruction));
        
    DataMem data
        (.Address(ALUOutput),
        .WriteData(ReadData2Reg),
        .ReadData(MemoryReadData));
        
    REGISTERFILE Registers
        (.clk(clk),
        .WE(WriteToReg),
        .S1(CurrentInstruction[25:21]),
        .S2(CurrentInstruction[20:16]),
        .S3(WriteRegisterTarget),
        .WD(WriteDataReg),
        .RD1(ReadData1),
        .RD2(ReadData2Reg));
    
    SignExtender se
        (.i(CurrentInstruction[15:0]),
        .o(ReadData2Imm));
            
    ALU pc_plus_4
        (.OPCODE(4'b0010),
        .Operand1(CurrentInstructionAddress),
        .Operand2(32'd4),
        .Cin(0),
        .Result(CurrentInstructionAddressPlus4),
        .Cout(),
        .Overflow(),
        .ZFlag());
    ALU branch
        (
        .OPCODE(4'b0010),
        .Operand1(CurrentInstructionAddressPlus4),
        .Operand2(ReadData2Imm<<2),
        .Cin(1'b0),
        .Result(BranchAddress),
        .Cout(),
        .Overflow(),
        .ZFlag());
    ALU MainALU
        (.OPCODE(ALUOPCODE),
        .Operand1(ReadData1),
        .Operand2(ReadData2),
        .Cin(1'b0),
        .Result(ALUOutput),
        .Cout(),
        .Overflow(),
        .ZFlag());
        
    assign JumpAddress = {CurrentInstructionAddress[31:28],{2'b00,CurrentInstruction[25:0]}<<2};
    assign WriteRegisterTarget = RegisterDestination?CurrentInstruction[15:11]:CurrentInstruction[20:16];
    assign WriteDataReg = MemoryToRegister?MemoryReadData:ALUOutput;
    assign ReadData2 = ALUOperand2Source?ReadData2Imm:ReadData2Reg;
    assign BranchConditionMet = 0;
    assign IncomingInstructionAddress = Jump? JumpAddress: (Branch&&BranchConditionMet)?BranchAddress:CurrentInstructionAddressPlus4;
    
    
    
endmodule
