module DFF(Q,D,clk);
	
	output Q;
	input D, clk;

	wire w0, w1, w2, w3, Q_bar;
	
	nand nand00(w0, w1, w3);
	nand nand01(w1, w0, clk);
	nand nand10(w2, w1, w3, clk);
	nand nand11(w3, w2, D);
	nand nand1_0(Q, w1, Q_bar);
	nand nand1_1(Q_bar, w2, Q);

endmodule

