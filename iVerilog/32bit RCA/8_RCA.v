`include "4_RCA.v"

module eightBA (a, b, cin, sum, ca);
input [7:0]a;
input [7:0]b;
input cin;

output [7:0] sum;
output ca;

wire w;

fourBA FB_0 (a[3:0], b[3:0], cin, sum[3:0], w);
fourBA FB_1 (a[7:4], b[7:4], w, sum[7:4], ca);

endmodule

