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


module RAM1_test;

reg [9:0]addr=10'd0;
wire [7:0]data=8'd0;
reg cs,rd_en;

initial begin
rd_en=1;
cs=1;
$display("data= %4d",data);
end
endmodule










