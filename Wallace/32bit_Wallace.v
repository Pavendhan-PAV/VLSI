`include "Cla/64bit_RDA.v"
`include "FullAdder/triple_FAM.v"
`include "ppg.v"

module wallace(c,a,b);
input[31:0] a,b;
output [63:0] c;

input [7:0]xin;
assign xin="k";
output [7:0]xout;

wire [31:0][64:0] pp;

ppg ppg_0(pp,a,b);

// -------------------------------------LEVEL-1-----------------------------------//

wire  [9:0][64:0] sum,ca;

triple_fa a_0(sum[2:0],ca[2:0],pp[8:0]);
triple_fa a_1(sum[5:3],ca[5:3],pp[17:9]);
triple_fa a_2(sum[8:6],ca[8:6],pp[26:18]);

SixtyfourBA a_3(pp[27],pp[28],pp[29],sum[9],ca[9]);


// -------------------------------------LEVEL-2-----------------------------------//

wire [6:0][64:0] sum2,ca2;

triple_fam a_4(sum2[2:0],ca2[2:0],sum[4:0],ca[3:0]);
triple_fam a_5(sum2[5:3],ca2[5:3],ca[8:4],sum[8:5]);

SixtyfourBA a_6(sum[9],ca[9],pp[30],sum2[6],ca2[6]);

// -------------------------------------LEVEL-3-----------------------------------//

wire [4:0][64:0] sum3,ca3;

triple_fam a_7(sum3[2:0],ca3[2:0],sum2[4:0],ca2[3:0]);

SixtyfourBA a_8(sum2[5],ca2[4],ca2[5],sum3[3],ca3[3]);
SixtyfourBA a_9(sum2[6],ca2[6],pp[31],sum3[4],ca3[4]);

// -------------------------------------LEVEL-4-----------------------------------//


wire [2:0][64:0] sum4,ca4;

triple_fam a_10(sum4[2:0],ca4[2:0],sum3[4:0],ca3[3:0]);

// -------------------------------------LEVEL-5-----------------------------------//

wire [1:0][64:0] sum5,ca5;

SixtyfourBA a_11(sum4[0],sum4[1],ca4[0],sum5[0],ca5[0]);
SixtyfourBA a_12(sum4[2],ca4[1],ca4[2],sum5[1],ca5[1]);

// -------------------------------------LEVEL-6-----------------------------------//

wire [64:0] sum6,ca6;

SixtyfourBA a_13(sum5[0],sum5[1],ca5[0],sum6,ca6);

// -------------------------------------LEVEL-7-----------------------------------//

wire [64:0] sum7,ca7;

SixtyfourBA a_14(sum6,ca5[1],ca6,sum7,ca7);

// -------------------------------------LEVEL-8-----------------------------------//

wire [64:0] sum8,ca8;

SixtyfourBA a_15(sum7,ca3[4],ca7,sum8,ca8);


// -------------------------------------LEVEL-9-----------------------------------//

adder a_16(c,xout,sum8[63:0],ca8[63:0],xin);

endmodule
