module parking(f_sen,b_sen,psd,gate,e,car);


input f_sen,b_sen;
input [31:0]psd;
//sinput clk;
input car;
output reg gate,e=0;
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
reg [2:0]state;



always @(*)
begin

    if(car==1)
     begin
     case(state)
      
     s0:  begin
          if(f_sen==1)
          state<=s1;
          else
          begin
          gate<=0;
          state<=s0;
          end
          end
    s1:  begin
         //f_sen=0;
         if(psd==32'd1359)
         begin
         gate<=1;
         e<=1;
         state<=s2;
         end 
         else
         begin
         gate<=0;
         e<=0;
         state<=s1;
         end
         end
    s2:  begin
        // f_sen=0;psd=32'dx;
         if(b_sen==1)
         begin
        // gate=1;
         e<=1;
         state<=s0;
         end
         else
         begin
         //gate=0;
         e<=0;
         state<=s2;
         end
         end
 default:begin
         gate<=0;
         state<=s0;
         end
           
endcase
end
   else
    begin
      gate<=0;
      e<=0;
   end
end

endmodule
