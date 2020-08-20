`include "32_RCA.v"

module top;
reg [31:0] a, b;
reg cin;
wire [31:0] sum;
wire ca;

ThirtytwoBA FA_0 (a, b, cin, sum, ca);

initial
begin
	   a = 32'b00000000000000000000000000000000;
	#5 b = 32'b00000000000000000000000000000000;
	#5 cin = 1'b0;
	#5 a = 32'b11111111111111111111111111111111;
	#5 b = 32'b11111111111111111111111111111111;
	#5 cin = 1'b1;
	#5 a = 32'b10101010101010101010101010101010;
end

initial
begin
	$monitor ($time, "  a = %b; b = %b; cin = %b; sum = %b; ca = %b", a, b, cin, sum, ca);
	$dumpfile("32_RCA.vcd");
	$dumpvars;
end
endmodule

