`timescale 1ps/1ps
module counter (rst, clk, in, out);
   input rst,clk;
   input[3:0]in;
   output[3:0]out;
   reg[3:0]out;

   always @ (negedge rst or posedge clk) begin
      if(rst == 0) begin
         out <= 4'b0000;
      end
      else begin
         out <= in;
      end
   end

endmodule