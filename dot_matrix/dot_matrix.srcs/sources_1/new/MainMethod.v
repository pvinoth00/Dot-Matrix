`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2026 12:44:59 PM
// Design Name: 
// Module Name: MainMethod
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


module MainMethod(
    output reg clk,
    output reg din,
    output reg cs,
    input sysclk


    );
    reg [15:0] packet = 16'h0C01;
    reg [7:0] data = 8'b10000001;
    reg [4:0] bit_index =0;
    reg [24:0] counter = 0;
    reg tick = 0;
    reg start = 0;
    initial begin 
        cs = 0;
        clk = 1;
                
    end
    always @(posedge sysclk)begin
        case(start)
            0: begin
                if(bit_index == 0)begin
                    bit_index <= 15;
                    cs <= 1;
                end else begin
                    bit_index <= bit_index -1;
                    cs <= 0;
                    start <= 1;
                end
                    
                    din <= packet[bit_index];
                    
                end
            1: begin
            counter <= counter + 1;
            tick <= 0;
            
            
            if(counter == 5000000) begin
                counter <= 0;
                tick <= 1;
            end 
            
            if(tick)begin
                if(bit_index == 0)begin
                    bit_index <= 15;
                    cs <= 1;
                end else begin
                    bit_index <= bit_index -1;
                    start <= 2;
                end
                    
                    din <= data[bit_index];
                    start <= 1;
                end
            
            end
        2: begin
            cs <= 0;
            start <=1;
            end        
            
            
                
        endcase
        
    
    end
 
    
    
    
        
        
    end
    
    
    
    
    
    
        
    
endmodule
