module rom(addr,data,rd_en,cs);
input [2:0]addr;
input rd_en,cs;
output reg [7:0]data;

always @(addr or rd_en or cs)
  case(addr)
    0: data=22;
    1: data=24;
    2: data=26;
    3: data=28;
    4: data=30;
    5: data=32;
    6: data=34;
    7: data=36;
endcase
endmodule
    
