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

// Mach giai ma tin hieu dau ra

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
		


