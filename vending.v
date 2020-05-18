`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

// Company:

// Engineer:

//

// Create Date: 2019/12/03 23:23:27

// Design Name:

// Module Name: vending

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
module vending(output reg [7:0] LED, output reg RD, output reg GN, output reg YL, input wire L, input wire R, input wire U, input wire D, input wire SW0, SW1, SW2, SW3, clk);
   reg [6:0] cS, nS;

   reg [2:0] count=0;

    // 6 5 4 3 2 1 0

    // ----- : 재고 여부

   //       ------- :  잔고

  

     // SW[0]==1 : 치짜버거 3000원 짜리 선택

   // SW[1]==1 : 더블버거팩 2500원 짜리 선택

   // SW[2]==1 : 치킨세트 1500원 짜리 선택
    reg [23:0] clk_cnt;

    reg clk_gen;

    reg count_S=0;

    reg [2:0]ham;

    reg [2:0]chicken;

    reg [2:0]drink;

   reg [2:0]make;

    always @ (posedge clk) begin

        clk_cnt <= clk_cnt + 1'b1;

        if(clk_cnt == 24'd6000000) begin

            clk_gen <= ~clk_gen;

            clk_cnt <= 24'd0;

        end

       

    end

always@(count,chicken,ham,drink)begin
if(count==0)begin

if(chicken!=0)begin

GN<=1;

end

else GN<=0;

if(ham!=0)begin

RD<=1;

end


else RD<=0;

if(drink!=0)begin

    if(drink==3) YL<=0;

    else YL<=1;

end

else YL<=0;
end

else if((chicken&&ham&&drink)==0)begin

     if(count%2==1)begin

     RD<=1;

     GN<=1;

     YL<=1;

end

     else if(count%2==0)

        begin

        RD<=0;

        GN<=0;

        YL<=0;

     
   end

    end
    end
 
    always @ (posedge clk_gen or negedge SW3 or negedge U) begin
        if(~SW3) begin

            cS[3:0] <= 4'b0000; // 잔액 0원으로 초기화

           cS[6:4] <= 3'b111;  // 음료수 재고 채우기
                chicken<=0;
            ham<=0;
            drink<=0;
            count<=0;
        end

        else if(~U) begin

         cS[3:0]<=3'b000;

        end

        else begin

            cS <= nS;
            if(chicken!=0) chicken<=chicken-1;
           
            if(ham!=0) ham<=ham-1;
           
            if(drink!=0)drink<=drink-1;
           
           
                        if(count_S==1) count<=3;
           
                        else if(count!=0) count<=count-1;
           
                        else if(make[0])begin
           
                         chicken<=5;
           
                         drink<=2;
           
            end
           
            else if(make[1])begin
           
            ham<=6;
            drink<=5;
           
            end
           
            else if(make[2])begin
            chicken<=5;
            ham<=3;
            drink<=2;
            end


    end   

  
end
    always @(cS,SW0,SW1,SW2,count,R,L)

    begin

    if(count!=0)count_S<=0;

    if((chicken||ham||drink)!=0)make<=0;

        nS[6:4] <= cS[6:4];

        if(~L)

            nS[3:0] <= cS[3:0]+1;

        else if(~R)

            nS[3:0] <= cS[3:0]+2;

        else

            nS[3:0] <= cS[3:0];

           

        if(cS[4]) begin //치킨세트 존재할때 그리고 카운트 눌렀

           if(~SW2 && cS[3:0] >= 3) begin

                nS[4] <= 0;

                nS[3:0] <= cS[3:0] - 3;           

                make[0]<=1;   

            end

            else if(~SW2 && cS[3:0] <3)begin //불 깜빡깜빡해야함

           nS[3:0]<=cS[3:0];

      

            count_S<=1;

            end

        end       

        if(cS[5]) begin // 더블버거 팩 을 선택했을때

           if(~SW1 && cS[3:0] >= 5) begin

                nS[5] <= 0;

                nS[3:0] <= cS[3:0] - 5;               

                make[1]<=1;

            end 

                        else if(~SW1 &&cS[3:0] <5)begin //불 깜빡깜빡해야함

           nS[3:0]<=cS[3:0];

         

        count_S<=1;

            end

        end       

        if(cS[6]) begin // ㅊ짜버거 을 선택했을때

           if(~SW0&& cS[3:0] >= 6) begin

                nS[6] <= 0;

                nS[3:0] <= cS[3:0] - 6;               

                make[2]<=1;

            end 

             else if(~SW0 && cS[3:0] <6)begin //불 깜빡깜빡해야함
           nS[3:0]<=cS[3:0];
           count_S<=1;
            end  

        end        

  

        LED[7] = (cS[6] == 0);

        LED[6] = (cS[5] == 0);

        LED[5] = (cS[4] == 0);

        LED[4:0] = cS[3:0]*5; 

    end

endmodule 