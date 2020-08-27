`include "4bit_USR.v"

module eightbUSR(out,pload,lftin,rghtin,select,clk);

output[7:0] out;

input[7:0] pload;
input lftin,rghtin;
input[1:0] select;
input clk;

fourbUSR fb_usr1(out[7:4],pload[7:4],out[3],rghtin,select,clk);
fourbUSR fb_usr0(out[3:0],pload[3:0],lftin,out[4],select,clk);

endmodule
