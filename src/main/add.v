module add(
	input reg[3:0] inreg,
	input reg [3:0] lm,
	output reg[3:0] out;
);

out[3:0]=inreg[3:0]+lm[3:0];

endmodule