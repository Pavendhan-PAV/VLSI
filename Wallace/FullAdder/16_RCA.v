`include "FullAdder/8_RCA.v"

module sixteenBA (a, b, cin, sum, ca);

input[15:0] a,b;
input [15:0]cin;

output[15:0] sum;
output [15:0]ca;

eightBA FB_0 (a[7:0], b[7:0], cin[7:0], sum[7:0], ca[7:0]);
eightBA FB_1 (a[15:8], b[15:8], cin[15:8], sum[15:8], ca[15:8]);

endmodule

