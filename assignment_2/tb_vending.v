module tb_vending;

reg [1:0]product;
reg [3:0]cost;
wire [3:0]change;
wire [1:0]P;


vending p(product,cost,change,P);

initial 
     begin 
             #10
             product=0;cost=5;
             #10
             $display("Product-- %3d  Change= %3d",P,change);
             product=1;cost=15;
             #10
             $display("Product-- %3d  Change= %3d",P,change);
             product=2;cost=25;
             #10
             $display("Product-- %3d  Change= %3d",P,change);
             product=3;cost=30;
             #10
             $display("Product-- %3d  Change= %3d",P,change);
             
         end

endmodule



module vending(product,cost,change,P);

input [1:0]product;
input [3:0]cost;

output reg [3:0]change;
output reg [1:0]P;
parameter s0=3'b000,s1=3'b001,s2=3'b010;
reg [2:0]state;


always@(*)
begin
     case(state)

     s0:begin
        if(product==0 || product==1 || product==2 || product==3)
        state<=s1;
        else
        state<=s0;
        end

     s1:begin
        
        if(product==0 && cost>=5)                                         //(cost==4'd5 || cost==4'd10))
        state<=s2;
        else if(product==1 && cost>=10)                                   //(cost==4'd10 || cost==2*4'd5))
        state<=s2;
        else if(product==2 && cost>=15)                                   //(cost==2*4'd5 || cost==(4'd10 + 4'd5)))
        state<=s2; 
        else if(product==3 && cost>=20)                                   //(cost==2*4'd10|| cost==4*4'd5 || cost==(2*4'd5 + 4'd10)))
        state<=s2;
        else
        begin
       // e<=1;
        state<=s1;
        end
        end
  
     s2:begin
        if(product==0)
        begin
        change=cost-5;
        P=0;
        end
        else if(product==1)
        begin
        change=cost-10;
        P=1;
        end
        else if(product==2)
        begin
        change=cost-15;
        P=2;
        end
        else if(product==3)
        begin
        change=cost-20;
        P=3;
        end
        else
        state<=s0;
        end

      default:state<=s0;
      endcase 
   
end
endmodule
