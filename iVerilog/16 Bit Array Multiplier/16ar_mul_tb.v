`include "16ar_mul.v"

module top;
reg  [15:0]a,b;

wire [32:0] c;


multiplier m_0(c,a,b);

initial
begin
#0  a=221; b=332;
#10  a=16'hffff; b=16'hfff;
#5  a=2598; b=6419;
#5 a=10; b=1024;
end

initial
 begin
 	$monitor($time," Input: Multiplier=%0d ---- Multiplicand =%0d;\n\t\t\t\tOutput-----\n\t\t\t\tExponential form: %e\n\t\t\t\tDecimal form: %0d\n",a,b,c,c);
 	$dumpfile("16mult.vcd");
 	$dumpvars;  
 
end
endmodule
