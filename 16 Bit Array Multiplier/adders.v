`include "famodule.v"
module adderset(m,qj,sum_in,carry_in,sum,carry);

input [15:0]m;
input [15:0]sum_in;
input qj,carry_in;


wire [15:0]ca_in;
output carry;
output [15:0]sum;

famodule f0(m[0],qj,sum_in[1],1'b0,sum[0],ca_in[0]);

famodule f1(m[1],qj,sum_in[2],ca_in[0],sum[1],ca_in[1]);
famodule f2(m[2],qj,sum_in[3],ca_in[1],sum[2],ca_in[2]);
famodule f3(m[3],qj,sum_in[4],ca_in[2],sum[3],ca_in[3]);

famodule f4(m[4],qj,sum_in[5],ca_in[3],sum[4],ca_in[4]);
famodule f5(m[5],qj,sum_in[6],ca_in[4],sum[5],ca_in[5]);
famodule f6(m[6],qj,sum_in[7],ca_in[5],sum[6],ca_in[6]);

famodule f7(m[7],qj,sum_in[8],ca_in[6],sum[7],ca_in[7]);
famodule f8(m[8],qj,sum_in[9],ca_in[7],sum[8],ca_in[8]);
famodule f9(m[9],qj,sum_in[10],ca_in[8],sum[9],ca_in[9]);

famodule f10(m[10],qj,sum_in[11],ca_in[9],sum[10],ca_in[10]);
famodule f11(m[11],qj,sum_in[12],ca_in[10],sum[11],ca_in[11]);
famodule f12(m[12],qj,sum_in[13],ca_in[11],sum[12],ca_in[12]);

famodule f13(m[13],qj,sum_in[14],ca_in[12],sum[13],ca_in[13]);
famodule f14(m[14],qj,sum_in[15],ca_in[13],sum[14],ca_in[14]);
famodule f15(m[15],qj,carry_in,ca_in[14],sum[15],carry);

endmodule
