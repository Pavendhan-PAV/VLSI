`include "16_RCA.v"

module ThirtytwoBA (a, b, cin, sum, ca);

input [31:0] a,b;
input cin;

output [31:0] sum;
output ca;

wire w;

sixteenBA FB_0 (a[15:0], b[15:0], cin, sum[15:0], w);
sixteenBA FB_1 (a[31:16], b[31:16], w, sum[31:16], ca);

endmodule

