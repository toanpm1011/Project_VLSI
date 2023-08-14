/* top module */
module top_module(bit_in, clk, rst_n, SEG1, SEG2, SEG3);
input bit_in, clk, rst_n;

//output SEG1, SEG2, SEG3
//output overflow;
output wire [6:0] SEG1;
output wire [6:0] SEG2;
output wire [6:0] SEG3;

wire [3:0] BCD1;
wire [3:0] BCD2;
wire [3:0] BCD3;

wire active;

wire [7:0] count_5;
wire overflow;

//(num_in, hundred, tens, units);
//(BCD, SEG);
FSM_Moore U1 (.bit_in(bit_in), .clk(clk), .rst_n(rst_n), .out(active));
counter U2 (.clk(clk), .rst_n(rst_n), .active(active), .counter(count_5), .overflow(overflow));
Extract_bit U3 (.num_in(count_5), .hundred(BCD1), .tens(BCD2), .units(BCD3));
LED7SEG U5 (.BCD(BCD1), .SEG(SEG1));
LED7SEG U6 (.BCD(BCD2), .SEG(SEG2));
LED7SEG U7 (.BCD(BCD3), .SEG(SEG3));

endmodule

/* FSM  */
module FSM_Moore (bit_in, clk, rst_n, out);
input bit_in, clk, rst_n;
output reg out;

// Khai bao ma hoa trang thai
parameter IDLE= 2'b00;
parameter D1= 2'b01;
parameter D10= 2'b10;
parameter D101= 2'b11;
// Tin hieu noi bo

reg [1:0] current_state, next_state;


// Thu tuc tuan tu
always@(posedge clk or negedge rst_n)
	//current_state = IDLE;
	begin: STATE_REGISTER
		if(~rst_n)
			current_state <= IDLE;
		else
			current_state <= next_state;
	end

// Khoi mach giai ma trang thai ke

always@(bit_in or current_state)
	//out = 1'b0;
	begin: NEXT_STATE
	//next_state = current_state;
	case(current_state)
		IDLE: begin
				if (bit_in) next_state = D1;
				else next_state = IDLE;
			  end
		D1: begin
				if (~bit_in) next_state = D10;
				else next_state = D1;
			end
		D10: begin
				if (bit_in) next_state = D101;
				else next_state = IDLE;
			 end
		D101: begin
			//out = 1'b1;
				next_state = IDLE;
			  end
	default: next_state = IDLE;
	endcase
	end


always @(current_state)
begin 
 case(current_state) 
 IDLE:   out = 0;
 D1:  out = 0;
 D10:  out = 0;
 D101:  out = 1;
 default: out = 0;
 endcase
end 
endmodule

/*  counter */
module counter(clk, rst_n, active, counter, overflow);
input active, clk, rst_n;
output overflow;

output [7:0] counter;
reg overflow;

always@(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		begin
			counter <= 0;
			overflow <= 0;
		end
	else if (active == 1)
		begin
			counter <= counter +1;
			if (counter == 8'b11111111)
				overflow <= 1;
		end
end

endmodule

/* extract_bit */ 
module Extract_bit(num_in, hundred, tens, units);

input [7:0] num_in;

output reg [3:0] hundred;

output reg [3:0] tens;

output reg [3:0] units;

always@(num_in)
begin
	hundred <= num_in /100;
	tens 	<= num_in %100 / 10;
	units  	<= num_in %10;
end

endmodule

/*  LED7SEG  */

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


