module pgen(a, parity, ep, op);

input [7:0]a;
output parity;
output reg ep, op;
wire w0, w1, w2, w3, w4, w5;

/*xor xor_0(w0, a[0], a[1]);
xor xor_1(w1, w0, a[2]);
xor xor_2(w2, w1, a[3]);
xor xor_3(w3, w2, a[4]);
xor xor_4(w4, w3, a[5]);
xor xor_5(w5, w4, a[6]);
xor xor_6(parity, w5, a[7]);
*/
assign parity = ^a;
always@(*)
begin
  
if (parity == 0) begin
	ep = 1'b0;
	op = 1'b1;
end

else begin
  ep = 1'b1;
  op = 1'b0;
end

end
endmodule