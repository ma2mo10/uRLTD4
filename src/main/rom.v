`timescale 1ps/1ps
//アドレスに対応した命令を出力する
module rom (ad, do);

	input [3:0] ad;
    output[7:0] do;

	reg [7:0] do;
        
	always @ (ad) begin
	    case(ad)
            //アドレス        ８ビットの１６進数命令
              4'b0000:  do <= #1 8'h0A; //ADD A, Im(1010)
              4'b0001:  do <= #1 8'h51; //ADD B, Im(0001)
              4'b0010:  do <= #1 8'h30; //MOV A, B
              4'b0011:  do <= #1 8'h70; //MOV B, A
              4'b0100:  do <= #1 8'h15; //MOV A, Im(0101)
              4'b0101:  do <= #1 8'h47; //MOV B, Im(0111)
              4'b0110:  do <= #1 8'hFF; //JMP Im(1111)
              4'b0111:  do <= #1 8'h00; //MOP
              4'b1111:  do <= #1 8'h0B; //ADD A, Im(1011)
              default:  do <= #1 8'h00; //NOP
        endcase
    end
endmodule
