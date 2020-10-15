`include "adders.v"


module multiplier(c,a,b);
input [15:0] a,b;
output [32:0]c;


// -------------------------------------LEVEL-1-----------------------------------//
wire [15:0]sum_in;
wire carry_in;

assign sum_in=16'h0000;
assign carry_in=1'b0;

wire[15:0]sum1;
wire carry1;

adderset a0(a,b[0],sum_in,carry_in,sum1,carry1);

assign c[0]=sum1[0];

// -------------------------------------LEVEL-2-----------------------------------//

wire [15:0]sum2;
wire carry2;

adderset a1(a,b[1],sum1,carry1,sum2,carry2);

assign c[1]=sum2[0];

// -------------------------------------LEVEL-3-----------------------------------//
wire [15:0]sum3;
wire carry3;

adderset a2(a,b[2],sum2,carry2,sum3,carry3);

assign c[2]=sum3[0];

// -------------------------------------LEVEL-4-----------------------------------//
wire [15:0]sum4;
wire carry4;

adderset a3(a,b[3],sum3,carry3,sum4,carry4);

assign c[3]=sum4[0];

// -------------------------------------LEVEL-5-----------------------------------//
wire [15:0]sum5;
wire carry5;

adderset a4(a,b[4],sum4,carry4,sum5,carry5);

assign c[4]=sum5[0];

// -------------------------------------LEVEL-6-----------------------------------//
wire [15:0]sum6;
wire carry6;

adderset a5(a,b[5],sum5,carry5,sum6,carry6);

assign c[5]=sum6[0];

// -------------------------------------LEVEL-7-----------------------------------//

wire [15:0]sum7;
wire carry7;

adderset a6(a,b[6],sum6,carry6,sum7,carry7);

assign c[6]=sum7[0];

// -------------------------------------LEVEL-8-----------------------------------//
wire [15:0]sum8;
wire carry8;

adderset a7(a,b[7],sum7,carry7,sum8,carry8);

assign c[7]=sum8[0];

// -------------------------------------LEVEL-9-----------------------------------//
wire [15:0]sum9;
wire carry9;

adderset a8(a,b[8],sum8,carry8,sum9,carry9);

assign c[8]=sum9[0];

// -------------------------------------LEVEL-10-----------------------------------//
wire [15:0]sum10;
wire carry10;

adderset a9(a,b[9],sum9,carry9,sum10,carry10);

assign c[9]=sum10[0];

// -------------------------------------LEVEL-11-----------------------------------//

wire [15:0]sum11;
wire carry11;

adderset a10(a,b[10],sum10,carry10,sum11,carry11);

assign c[10]=sum11[0];

// -------------------------------------LEVEL-12-----------------------------------//

wire [15:0]sum12;
wire carry12;

adderset a11(a,b[11],sum11,carry11,sum12,carry12);

assign c[11]=sum12[0];

// -------------------------------------LEVEL-13-----------------------------------//
wire [15:0]sum13;
wire carry13;

adderset a12(a,b[12],sum12,carry12,sum13,carry13);

assign c[12]=sum13[0];

// -------------------------------------LEVEL-14-----------------------------------//
wire [15:0]sum14;
wire carry14;

adderset a13(a,b[13],sum13,carry13,sum14,carry14);

assign c[13]=sum14[0];

// -------------------------------------LEVEL-15-----------------------------------//
wire [15:0]sum15;
wire carry15;

adderset a14(a,b[14],sum14,carry14,sum15,carry15);

assign c[14]=sum15[0];

// -------------------------------------LEVEL-16-----------------------------------//
wire [15:0]sum16;
wire carry16;

adderset a15(a,b[15],sum15,carry15,sum16,carry16);

assign c[30:15]=sum16;

assign c[31]=carry16;

assign c[32]=0;


endmodule
