module PCTesst();
    
    reg [31:0]PC_before;
    reg Enable,CLK;
    wire [31:0]PC_after;
    
    ProgramCounter c(PC_before,CLK,Enable,PC_after);
    
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
