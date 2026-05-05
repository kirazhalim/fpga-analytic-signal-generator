`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2025 08:23:04
// Design Name: 
// Module Name: sim_top_module
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


module sim_top_module();
    
    reg clk = 0;
    reg reset = 1;
    
    wire out_LED;
    
    always #5 clk = ~clk;
    
    top_module UUT(
        .clk(clk),
        .reset(reset),
        .out_LED(out_LED)
    );
    
    initial begin
        #100;
        reset = 0;
        
        #100_000_000;
        $finish;
    end
    
    
endmodule
