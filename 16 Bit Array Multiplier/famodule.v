`include "fullAdder.v"
module famodule(mj,qj,sum_in,carry_in,sum,carry);

input mj,qj,sum_in,carry_in;
output sum,carry;
wire inter;

assign inter=mj&qj;

fullAdder fa_0(inter,sum_in,carry_in,sum,carry);

endmodule
