`include "16bit_Han_Carlson.v"

module top;

reg signed[15:0] a,b;
output signed[15:0] sum;

	HanCarlson HC_0(a,b,sum);

initial
begin
	
	#0 a=1000;b=500;
	#10 a=1000;b=-500;
	#10 a=20;b=1;
end

initial
begin
	$monitor($time, "	a = %0d\n\t\t\tb = %0d\n\t\t\tSUM = %0d\n",a,b,sum);
	$dumpfile("16HC.vcd");
	$dumpvars;
end

endmodule