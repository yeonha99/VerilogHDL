`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 19:28:52
// Design Name: 
// Module Name: inha_test
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


module inha_test;


    wire [7:0]LED;
    wire RD,GN,YL;
    reg L,R,U,D,SWO,SW1,SW2,SW3,clk;
    
        inha inha(LED, RD, GN, YL, L, R, U, D, SWO, SW1, SW2, SW3, clk);
    
    always
        #5 clk <= ~clk;
    initial 
    begin
        #0 clk <= 1; SWO <= 1; SW1 <= 1; SW2 <= 1; SW3 <= 1; L <= 1; R <= 1; D<=1;U<=1;
        #10 SWO<= 0;
        #10 SWO <= 1;
       
        #60 
        #10
        #10 U <= 0;
        #10 U <= 1;
          #60 
        #10 SW2<= 0;
        #10 SW2 <= 1;
              #60
           #10 U <= 0;
        #10 U <= 1;
              #60
        #10 L <= 0;
        #10 L <= 1;
        #10 
        #10 
           #10 U <= 0;
        #10 U <= 1;
        #10 L <= 0;
        #10 L <= 1;
        #10 
        #10 
        
           #10 U <= 0;
        #10 U <= 1;
        #10 L <= 0;
        #10 L <= 1;
        #10 
        #10 
           #10 U <= 0;
        #10 U <= 1;
        #10 L <= 0;
        #10 L <= 1;
        #10 
        #10 
           #10 U <= 0;
        #10 U <= 1;
        #10 L <= 0;
        #10 L <= 1;
        #10 
        #10 
           #10 U <= 0;
        #10 U <= 1;
        #10 L <= 0;
        #10 L <= 1;
        #10 
        #10 
        
           #10 U <= 0;
        #10 U <= 1;
        #10 L <= 0;
        #10 L <= 1;
        #10 
        #10 
           #10 U <= 0;
        #10 U <= 1;
        #10 L <= 0;   
           #10 L <= 1;
           #10 
        #10 
        #10 U <= 0;
        #10 U <= 1;
        #10 
        #10 

 
        #10 SW1<=0;
        #10 SW1<=1;
             #10 
        #10 
  #10 SW3<=0;
        #10 SW3<=1;
       
 
    end
    
endmodule
