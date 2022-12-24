module REGISTERFILE(clk,WE,S1,S2,S3,WD,RD1,RD2);
    input clk,WE;
    input [4:0] S1,S2,S3;
    input [31:0] WD;
    output [31:0] RD1,RD2;
    reg [31:0] register_memory [0:31];
    
    initial 
        begin
             register_memory[0]=32'b0;
        end

    assign RD1=register_memory[S1];    
    assign RD2=register_memory[S2];
    
always @(posedge clk) 
    begin
        if(WE)
            register_memory[S3]=WD;     
    end
endmodule
