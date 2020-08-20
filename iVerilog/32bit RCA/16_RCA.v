`include "8_RCA.v"

module sixteenBA (a, b, cin, sum, ca);

input [15:0] a,b;
input cin;

output [15:0] sum;
output ca;

wire w;

eightBA FB_0 (a[7:0], b[7:0], cin, sum[7:0], w);
eightBA FB_1 (a[15:8], b[15:8], w, sum[15:8], ca);

endmodule

