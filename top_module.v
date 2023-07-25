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