 /* a */

module selector (in1, in2, sel, out);
	input [3:0] in1, in2;
	input sel;
	output [3:0] out;

	reg [3:0] out;
		always @ (in1 or in2 or sel) begin
			if(sel == 0)begin
				out <= in1;
			end
			else begin
				out <= in2;
			end
		end
endmodule