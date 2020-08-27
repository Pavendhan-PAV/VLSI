module m41(out,i0,i1,i2,i3,select);

input i0,i1,i2,i3;
input[1:0] select;

output out;

wire s0_not, s1_not;

not n0(s0_not,select[0]);
not n1(s1_not,select[1]);

wire a0,a1,a2,a3;

and a0_0(a0,s1_not,s0_not,i0);
and a0_1(a1,s1_not,select[0],i1);
and a0_2(a2,select[1],s0_not,i2);
and a0_3(a3,select[1],select[0],i3);

or or_0(out,a0,a1,a2,a3);

endmodule
