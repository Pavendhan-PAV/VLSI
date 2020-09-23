`include "32bit_Wallace.v"

module top;
reg  [31:0]a,b;

wire[63:0] c;


wallace w_0(c,a,b);

initial
begin

#0 	a=28'h33a_ffff; b=24'h3a_ffff;
#5  a=19; b=15;
#5  a=9943000; b=3302367;
#5 a=32'hffff_ff3a; b=32'hff3a_ffff;
#5  a=25983; b=641987;
#5 a=32'habcd_ef3a; b=32'habca_ffff;

end

initial
 begin
 	$monitor($time," Input:	Multiplier=%e  |  Multiplicand =%e\n\t\t\t\tOUTPUT:\n\t\t\t\tExponential form: %e\n\t\t\t\tDecimal form: %0d\n\n",a,b,c,c);
 
 	$dumpfile("32bit_Wallace.vcd");
 	$dumpvars;  
 
end
endmodule
