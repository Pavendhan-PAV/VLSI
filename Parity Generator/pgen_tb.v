`include "pgen.v"

module top;

reg [7:0]a;
output parity;
output ep, op;

pgen pgen_0(a, parity, ep, op);

initial
begin
  #5 a=5;
  #5 a=120;
  #5 a=121;
end

initial
begin
	$monitor($time,"	SelectInputs = %4b ---- Parity = %b ---- ep = %b ---- op = %b ",a,parity,ep,op);	
	$dumpfile("pgen.vcd");      
	$dumpvars;
end

endmodule