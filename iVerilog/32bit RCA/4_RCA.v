`include "FAgate.v"

module fourBA (a, b, cin, sum, ca);
input [3:0] a, b;
input cin;

output [3:0] sum;
output ca;

wire c1, c2, c3;

fullAdder FA_0 (a[0], b[0], cin, sum[0], c1);
fullAdder FA_1 (a[1], b[1], c1, sum[1], c2);
fullAdder FA_2 (a[2], b[2], c2, sum[2], c3);
fullAdder FA_3 (a[3], b[3], c3, sum[3], ca);

endmodule

