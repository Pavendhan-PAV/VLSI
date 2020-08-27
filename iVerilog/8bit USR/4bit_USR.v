`include "DFF.v"
`include "MUX41.v"

module fourbUSR(out,pload,lftin,rghtin,select,clk);

output[3:0] out;

input[3:0] pload;
input lftin,rghtin;
input[1:0] select;
input clk;

wire w0,w1,w2,w3;

DFF df3(out[3],w3,clk);
DFF df2(out[2],w2,clk);
DFF df1(out[1],w1,clk);
DFF df0(out[0],w0,clk);

m41 mx3(w3,out[3],rghtin,out[2],pload[3],select);
m41 mx2(w2,out[2],out[3],out[1],pload[2],select);
m41 mx1(w1,out[1],out[2],out[0],pload[1],select);
m41 mx0(w0,out[0],out[1],lftin,pload[0],select);

endmodule
