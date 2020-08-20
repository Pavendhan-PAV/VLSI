`include "4_RCA.v"

module top;
reg [3:0] a, b;
reg cin;
wire [3:0] sum;
wire ca;

fourBA FA_0 (a, b, cin, sum, ca);

initial
begin
	a = 4'b0000;
	#5 b = 4'b0000;
	#5 cin = 1'b0;
	#5 a=4'b1111;
	#5 b=4'b1111;
	#5 cin=1'b1;
	#5 a=4'b1010;
end

initial
	$monitor ($time, "  a = %b; b = %b; cin = %b; sum = %b; ca = %b", a, b, cin, sum, ca);

endmodule

