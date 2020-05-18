`timescale 1ns / 1ps

 

//////////////////////////////////////////////////////////////////////////////////

 

// Company: 

 

// Engineer: 

 

// 

 

// Create Date: 2019/12/14 17:37:49

 

// Design Name: 

 

// Module Name: inha

 

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

 

module inha(

 

output reg [7:0] LED, output reg RD, output reg GN, output reg YL, input wire L, input wire R, input wire U, input wire D, input wire SW0, SW1, SW2, SW3, clk

 

    );

 

        reg [23:0] clk_cnt;

reg[2:0]wark;

    reg [2:0] mode_state;

 

      reg [2:0] next_mode_state;

 

    reg clk_gen;

 

    reg [2:0]n_people;

     reg [2:0]people;

 

    reg [7:0] cS, nS;

 

    reg [2:0]cRGY,nRGY;

 

    reg [7:0]now_password;

 

    reg [7:0]a_password;

 

    reg [7:0]b_password;

 

    reg [7:0]c_password;

 

       reg [7:0]a_npassword;

 

    reg [7:0]b_npassword;

 

    reg [7:0]c_npassword;

 

    reg [2:0]i;

 

    reg [7:0]count_led;

 

    reg letnew;

    reg [2:0]hi;

    reg [2:0]count;

 

    reg count_led0;

 

    reg count_allled;

 

    reg no_one;

 

    reg offpassword;

 

    reg [7:0]chandge_led;

 

      always @ (posedge clk) begin

 

 

 

        clk_cnt <= clk_cnt + 1'b1;

 

 

 

        if(clk_cnt == 24'd6000000) begin

 

 

 

            clk_gen <= ~clk_gen;

 

 

 

            clk_cnt <= 24'd0;

 

 

 

        end

 

    end

 

    

 

      always @ (posedge clk or negedge SW0) begin

 

        if(~SW0) begin

 

        cRGY<=3'b011;

 

        cS<=8'b11111111;

 

a_password<=8'b11111111;

 

b_password<=8'b11111111;

 

c_password<=8'b11111111;

 

cRGY[0]<=0;

 

cRGY[1]<=1;

 

cRGY[2]<=1;

 

people[0]<=1;

mode_state<=3'b000;

no_one<=0;

count<=0;

        end

        else begin

 

       

        if(count_led[i]!=0&&count==0) begin count<=3;end

       

               else if(count_led0==1&&count==0)begin count<=3;end

       

               else if(count_allled==1&&count==0)begin count<=3;end

       

               else if(offpassword==1&&count==0)begin count<=4;end

               else if(hi==1)begin count<=4;end

               else if(hi==2)begin count<=4;end

               else if(hi==3)begin count<=4;end

             else if(count!=0)count<=count-1;

 

        

 

 

        a_password<=a_npassword;

 

        b_password<=b_npassword;

 

        c_password<=c_npassword;

 

       cS<=nS;

     people<=n_people;

mode_state<=next_mode_state;

           cRGY<=nRGY;

 

    end

 

    end

 

    

 

    always @(cS,SW0,SW1,SW2,R,L,U,D,SW3,count,cRGY)begin

 

 

       a_npassword<=a_password;

 

        b_npassword<= b_password;

 

        c_npassword<=c_password;

 

        nRGY<=cRGY;

 

     nS<=cS; 

        n_people<=people;

next_mode_state<=mode_state;

 

 

    

 

    if(mode_state==0)begin
        if(~U)begin
        nS[1:0]<=2'b00;
        end
        else if(~R)begin
         nS[1:0]<=2'b01;
        end
             else if(~D)begin
         nS[1:0]<=2'b10;
        end 
                    else if(~L)begin
 nS[1:0]<=2'b11;
        end
        else if(~SW3&&cS[1:0]==2'b01)begin

        if(people[0]&&wark[0])begin

        wark[0]<=0;

        end

        else  if(people[1]&&wark[1])begin

                wark[1]<=0;

               end

       else  if(people[2]&&wark[2])begin

                               wark[2]<=0;

                              end 

        end

        else if(~SW2)begin

 

        if(cS[1:0]==2'b00)begin

 

         next_mode_state<=1;

 

        

 

        end

 

        else if(cS[1:0]==2'b01) begin next_mode_state<=2;

end

        

 

        else if(cS[1:0]==2'b10) begin next_mode_state<=3;

end

        

 

        else if(cS[1:0]==2'b11)begin next_mode_state<=4;

end

        

 

        

 

        

 

        end

 

        else if(~SW1)begin

 

        if(people[0])begin

 

                n_people[0]<=0;

 

        n_people[1]<=1;

 

nRGY[0]<=1;

 

nRGY[1]<=0;

 

nRGY[2]<=1;

 

        

 

        end

 

     else if(people[1])begin

 

                n_people[1]<=0;

 

        n_people[2]<=1;

 

nRGY[0]<=1;

 

nRGY[1]<=1;

 

nRGY[2]<=0;

 

        

 

        end

 

             else if(people[2])begin

 

                n_people[2]<=0;

 

        n_people[0]<=1;

 

nRGY[0]<=0;

 

nRGY[1]<=1;

 

nRGY[2]<=1;

 

        

 

        end

 

        end

 

        end

 

    //U누르면 1 D누르면 0 L누르면 왼쪽 R누르먼 오른쪽 출발 점은 led 0

 

   else if(mode_state==1)begin

 

    if(~L)begin

 

    if(i<7)begin i<=i+1;

 count_led[i+1]<=1;
end

    else begin i<=i;

 

    count_led[i]<=1;

end

 

    end

 

    else if(~R) begin

 

    if(i>0)begin i<=i-1;

count_led[i-1]<=1;

end

    else begin

     i<=i;

   count_led[i]<=1;

end

 

    end

 

    else if(~D)begin

 

    now_password[i]<=0;

 

    end

 

    else if(~U)begin

 

     now_password[i]<=1;

 

    end

 

    else if(~SW1)begin

 

    if((now_password==a_password&&people[0])||(now_password==b_password&&people[1])||(now_password==c_password&&people[2]))begin

 

    count_led0<=1;

 

    letnew<=1;
    i<=0;
    end
    else begin

     count_allled<=1;

 

  i<=0;

    end

    end

 

    else if(~SW3)begin

 

    if(people[0]&&letnew==1) a_npassword<=now_password;

 

    else if(people[1]&&letnew==1) b_npassword<=now_password;

 

    else if(people[2]&&letnew==1) c_npassword<=now_password;

 

    offpassword<=1;

 

 

    nS[1:0]<=2'b11;

 

    letnew<=0;

 

    i<=0;

 

    end

 

    end

    else if(mode_state==2)begin

    

      if(~L)begin

  

      if(i<7)begin i<=i+1;

   count_led[i+1]<=1;

  

  end

      else begin i<=i;

  

      count_led[i]<=1;

  end

  

      end

  

      else if(~R) begin

  

      if(i>0)begin i<=i-1;

  count_led[i-1]<=1;

  end

      else begin

       i<=i;

     count_led[i]<=1;

  end

  

      end

  

      else if(~D)begin

  

      now_password[i]<=0;

  

      end

  

      else if(~U)begin

  

       now_password[i]<=1;

  

      end

  

      else if(~SW1)begin

  

      if(now_password==a_password&&people[0])begin

  wark[0]<=1;

  hi<=1;

      next_mode_state<=0;

  

      end

      else if(now_password==b_password&&people[1])begin

  wark[1]<=1;

   hi<=2;

  next_mode_state<=0;

  end

  else if(now_password==c_password&&people[2])begin

   hi<=3;

  next_mode_state<=0;

  wark[2]<=1;

  end

      else begin

       count_allled<=1;

    i<=0;

      end

      end

 

    

    end

 

 

    if(count_led[i]==1)begin

 

    LED[i]<=~LED[i];

  if(count==1) count_led[i]<=0;

    end

 

    else if(count_led0==1) begin

 

     LED[0]<=~LED[0];

       if(count==1)count_led0<=0;

 

    end

 

    else if(count_allled==1)begin

 

    LED[7:0]<=~LED[7:0];

    if(count==1)count_allled<=0;

 

    end

 

    else if(offpassword==1)begin

 

    if(count%2==1)LED[7:0]<=now_password;

    else LED[7:0]<=8'b11111111;

      if(count==1)offpassword<=0;

 

    

 

    end

 

    else LED[7:0]<=cS;
if(hi==1)begin

RD<=~RD;

if(count==1)hi<=0;

end

else if(hi==2)begin

GN<=~GN;

if(count==1)hi<=0;

end

else if(hi==3)begin

YL<=~YL;

if(count==1)hi<=0;

end

else begin

    RD<=cRGY[0];

 

    GN<=cRGY[1];

 

    YL<=cRGY[2];

end

    end
endmodule