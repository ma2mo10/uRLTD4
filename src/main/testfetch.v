`timescale 1ps/1ps
`include "fetch.v"

module test_fetch;

    reg rst, clk, isjump;
    reg[3:0] jumpadrs;
	wire[7:0]inst;
		       
	fetch i0 (.rst(rst), .clk(clk), .jumpadrs(jumpadrs), .isjump(isjump), .inst(inst));
					  
	initial begin
	/* #100は100psだけ時間経過させる、と解釈する */		
	    rst = 1'b0;  clk = 1'b0;    isjump = 1'b0;
	    #100    rst=1'b1;    clk = 1'b1;
	    #100    clk = 1'b0;
        #100    clk = 1'b1;
	    #100    clk = 1'b0;
        #100    clk = 1'b1;
	    #100    clk = 1'b0;
        #100    clk = 1'b1;
	    #100    clk = 1'b0;
        #100    clk = 1'b1;
	    #100    clk = 1'b0;
        #100    clk = 1'b1;
	    #100    clk = 1'b0;
        #100    clk = 1'b1;
	    #100    clk = 1'b0;
	    $finish(0);
    end


	initial begin
	   
	   /* 結果出力:%記号と後ろの配線名の並びは、C言語のprintfのような対応をしている */
	   /* 機械採点の都合上、ここは書き換えないように */
        $monitor($time, , "clk = %b  inst = %h  ", clk,inst);
        $dumpfile("output.vcd"); /*出力ファイル名,vcd形式で好きに付ける*/
        $dumpvars(0,test_fetch);
           /* GTKwaveで表示するための記述があればここに書くがまだしない */
           /* 知っている人は書いてもよいが、「提出時にはコメントアウトしておくこと」 */
           
        end
endmodule