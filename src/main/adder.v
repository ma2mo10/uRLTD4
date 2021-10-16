module adder (in1, in2, out);
   input[3:0]in1, in2;
   output[3:0]out;
   
   reg [3:0] out;

   always @ (in1 or in2) begin
	   out <= in1 + in2;
   end

endmodule