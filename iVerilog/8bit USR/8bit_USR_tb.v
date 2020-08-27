`include "8bit_USR.v"

module top;

wire[7:0] out;
reg[7:0] pload;
reg lftin,rghtin;
reg[1:0] select;
reg clk;

eightbUSR usr0(out,pload,lftin,rghtin,select,clk);

always #5 clk = !clk;

initial
begin	

		clk =0;select = 2'b11; pload = 8'b0000_0000; lftin = 1'b0; rghtin = 1'b0; 

		#10 select = 2'b11; pload = 8'b100_0001;

		#10 select = 2'b11; pload = 8'b1000_1110;

		#10 select = 2'b11; pload = 8'b1010_0101; 

		#10 select = 2'b01; rghtin = 1'b1; 

		#10 select = 2'b01; rghtin = 1'b1; 

		#10 select = 2'b01; rghtin = 1'b0; 

		#10 select = 2'b01; rghtin = 1'b0; 

		#10 select = 2'b01; rghtin = 1'b0; 
		
		#10 select = 2'b00;

		#10 select = 2'b10; lftin = 1'b1;

		#10 select = 2'b10; lftin = 1'b1;

		#10 select = 2'b10; lftin = 1'b1;

		#10 select = 2'b10; lftin = 1'b0;

		#10 select = 2'b10; lftin = 1'b0;


end

initial
#150 $finish;

initial
begin

	$monitor($time,"	SelectInputs = %2b ---- Parallelload = %8b --- lftin = %b, rghtin = %b, -- out = %8b",select,pload,lftin,rghtin,out);	
	$dumpfile("USR.vcd");      
	$dumpvars;

end                        
    
endmodule
