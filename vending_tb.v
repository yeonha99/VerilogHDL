`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/03 23:23:57
// Design Name: 
// Module Name: vending_v
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


module vending_tb;
    wire [7:0]LED;
    wire RD,GN,YL;
    reg L,R,U,D,SWO,SW1,SW2,SW3,clk;
    
        vending vending(LED, RD, GN, YL, L, R, U, D, SWO, SW1, SW2, SW3, clk);
    
    always
        #5 clk <= ~clk;
    initial 
    begin
        #0 clk <= 1; SWO <= 1; SW1 <= 1; SW2 <= 1; SW3 <= 1; L <= 1; R <= 1; U<=1;;
        #10 SW3 <= 0;
        #10 SW3 <= 1;
 #10 R <= 0;
        #10  R <= 1;
         #10  R <= 0;
        #10  R <= 1;
         #10  R <= 0;
        #10  R <= 1;
         #10  R <= 0;
        #10  R <= 1;
           #10  L <= 0;
        #10  L <= 1;
           #10 SW1 <= 0;
        #10 SW1 <= 1;
           #50;
        #10 SWO <= 0;
        #10 SWO <= 1;
 
        
 
        
       
 
    end
    
endmodule