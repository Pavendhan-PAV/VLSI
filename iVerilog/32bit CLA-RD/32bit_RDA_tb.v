`include "32bit_RDA.v"

module top;
reg signed [31:0]a,b;
reg[7:0] xin;
wire signed [31:0]s;
wire[7:0]xout;
adder adder_0(s,xout,a,b,xin);

initial
begin
   xin="k"; a=36865; b=33023;
#5 xin="k"; a=36865; b=-36864;
#5 xin="k"; a=1; b=-2;
end

initial
begin
 	$monitor($time,"	a = %b (%0d)  b = %b (%0d)  s = %b (%0d)  xout = %s	",a,a,b,b,s,s,xout);
	$dumpfile("32_RDA.vcd");
	$dumpvars;	
end
endmodule

