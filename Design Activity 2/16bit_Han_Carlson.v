module HanCarlson(a,b,sum);

input [15:0] a,b;
output[15:0] sum;
wire[15:0] carry;
wire[15:0] ppp,ppg;

preprocess_module pp(a,b,ppp,ppg);
generatecarry gc(ppp,ppg,carry);
findsum fs(ppp,carry,sum);

endmodule

//------------------------------------------------------------------------------------------------------------

module preprocess_module(a,b,p,g);

input [15:0] a,b;
output[15:0] p,g;
pre_process pp0(a[0],b[0],p[0],g[0]);
pre_process pp1(a[1],b[1],p[1],g[1]);
pre_process pp2(a[2],b[2],p[2],g[2]);
pre_process pp3(a[3],b[3],p[3],g[3]);
pre_process pp4(a[4],b[4],p[4],g[4]);
pre_process pp5(a[5],b[5],p[5],g[5]);
pre_process pp6(a[6],b[6],p[6],g[6]);
pre_process pp7(a[7],b[7],p[7],g[7]);
pre_process pp8(a[8],b[8],p[8],g[8]);
pre_process pp9(a[9],b[9],p[9],g[9]);
pre_process pp10(a[10],b[10],p[10],g[10]);
pre_process pp11(a[11],b[11],p[11],g[11]);
pre_process pp12(a[12],b[12],p[12],g[12]);
pre_process pp13(a[13],b[13],p[13],g[13]);
pre_process pp14(a[14],b[14],p[14],g[14]);
pre_process pp15(a[15],b[15],p[15],g[15]);

endmodule

//------------------------------------------------------------------------------------------------------------

module pre_process(a,b,p,g);

input a,b;
output p,g;
xor(p,a,b);
and(g,a,b);

endmodule

//------------------------------------------------------------------------------------------------------------

module generatecarry(p,g,c);
input [15:0] p,g;
output[15:0] c;

//step BRENT-KUNG begin
both_pg b11(p[15],g[15],p[14],g[14],p15_14,g15_14);
both_pg b12(p[13],g[13],p[12],g[12],p13_12,g13_12);
both_pg b13(p[11],g[11],p[10],g[10],p11_10,g11_10);
both_pg b14(p[9],g[9],p[8],g[8],p9_8,g9_8);
both_pg b15(p[7],g[7],p[6],g[6],p7_6,g7_6);
both_pg b16(p[5],g[5],p[4],g[4],p5_4,g5_4);
both_pg b17(p[3],g[3],p[2],g[2],p3_2,g3_2);
only_g g11(p[1],g[1],g[0],g1_0);

buf(c[1],g1_0);
buf(p0_0,p[0]);
buf(g0_0,g[0]);
buf(p2_2,p[2]);
buf(g2_2,g[2]);
buf(p4_4,p[4]);
buf(g4_4,g[4]);
buf(p6_6,p[6]);
buf(g6_6,g[6]);
buf(p8_8,p[8]);
buf(g8_8,g[8]);
buf(p10_10,p[10]);
buf(g10_10,g[10]);
buf(p12_12,p[12]);
buf(g12_12,g[12]);
buf(p14_14,p[14]);
buf(g14_14,g[14]);

//step2
both_pg b21(p15_14,g15_14,p13_12,g13_12,p15_12,g15_12);
both_pg b22(p13_12,g13_12,p11_10,g11_10,p13_10,g13_10);
both_pg b23(p11_10,g11_10,p9_8,g9_8,p11_8,g11_8);
both_pg b24(p9_8,g9_8,p7_6,g7_6,p9_6,g9_6);
both_pg b25(p7_6,g7_6,p5_4,g5_4,p7_4,g7_4);
both_pg b26(p5_4,g5_4,p3_2,g3_2,p5_2,g5_2);
only_g g21(p3_2,g3_2,g1_0,g3_0);

buf(c[3],g3_0);

//step3
both_pg b31(p15_12,g15_12,p11_8,g11_8,p15_8,g15_8);
both_pg b32(p13_10,g13_10,p9_6,g9_6,p13_6,g13_6);
both_pg b33(p11_8,g11_8,p7_4,g7_4,p11_4,g11_4);
both_pg b34(p9_6,g9_6,p5_2,g5_2,p9_2,g9_2);

only_g g31(p7_4,g7_4,g3_0,g7_0);
buf(c[7],g7_0);

only_g g32(p5_2,g5_2,g1_0,g5_0);
buf(c[5],g5_0);

//step4
only_g g41(p15_8,g15_8,g7_0,g15_0);
buf(c[15],g15_0);

only_g g42(p13_6,g13_6,g5_0,g13_0);
buf(c[13],g13_0);

only_g g43(p11_4,g11_4,g3_0,g11_0);
buf(c[11],g11_0);

only_g g44(p9_2,g9_2,g1_0,g9_0);
buf(c[9],g9_0);

//step5 for even

only_g g51(p2_2,g2_2,g1_0,c[2]);
only_g g52(p4_4,g4_4,g3_0,c[4]);
only_g g53(p6_6,g6_6,g5_0,c[6]);
only_g g54(p8_8,g8_8,g7_0,c[8]);
only_g g55(p10_10,g10_10,g9_0,c[10]);
only_g g56(p12_12,g12_12,g11_0,c[12]);
only_g g57(p14_14,g14_14,g13_0,c[14]);

buf(c[0],g0_0);

endmodule

//------------------------------------------------------------------------------------------------------------

module findsum(a,b,sum);

input [15:0] a,b;
output[15:0] sum;

xor(sum[0],a[0],1'b0);
xor(sum[1],a[1],b[0]);
xor(sum[2],a[2],b[1]);
xor(sum[3],a[3],b[2]);
xor(sum[4],a[4],b[3]);
xor(sum[5],a[5],b[4]);
xor(sum[6],a[6],b[5]);
xor(sum[7],a[7],b[6]);
xor(sum[8],a[8],b[7]);
xor(sum[9],a[9],b[8]);
xor(sum[10],a[10],b[9]);
xor(sum[11],a[11],b[10]);
xor(sum[12],a[12],b[11]);
xor(sum[13],a[13],b[12]);
xor(sum[14],a[14],b[13]);
xor(sum[15],a[15],b[14]);

endmodule

//------------------------------------------------------------------------------------------------------------

module only_g(p1,g1,g0,g);

input p1,g1,g0;
output g;
wire w;
and(w,p1,g0);
or(g,w,g1);

endmodule

//------------------------------------------------------------------------------------------------------------

module both_pg(p1,g1,p0,g0,p,g);

input p1,g1,p0,g0;
output p,g;
wire w;
and(p,p1,p0);
and(w,p1,g0);
or(g,w,g1);

endmodule