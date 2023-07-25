module LED7SEG (BCD, SEG);
input [3:0] BCD;


output reg [6:0] SEG;

always @(BCD)
		case (BCD)
				0: 		SEG <= 7'b0000001;
				1: 		SEG <= 7'b1001111;
				2: 		SEG <= 7'b0010010;
				3: 		SEG <= 7'b1001100;
				4: 		SEG <= 7'b0100100;
				5: 		SEG <= 7'b1100001;
				6: 		SEG <= 7'b1100000;
				7: 		SEG <= 7'b0001111;
				8: 		SEG <= 7'b0000000;
				9: 		SEG <= 7'b0001100;
		  default:  	SEG <= 7'b0000001;
		endcase
endmodule