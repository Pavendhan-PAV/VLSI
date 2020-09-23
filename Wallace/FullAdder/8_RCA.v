`include "FullAdder/4_RCA.v"

module eightBA (a, b, cin, sum, ca);
input [7:0]a;
input [7:0]b;
input [7:0]cin;

output [7:0] sum;
output [7:0] ca;

wire w;

fourBA FB_0 (a[3:0],b[3:0],cin[3:0],sum[3:0],ca[3:0]);
fourBA FB_1 (a[7:4],b[7:4],cin[7:4],sum[7:4],ca[7:4]);

endmodule

