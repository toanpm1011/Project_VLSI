`timescale 1ns/1ps
module counter_tb;
//module counter(clk, rst_n, active, counter, overflow);
//Interface
// input
reg clk;
reg rst_n;
reg active;

//output

wire [7:0] counter;
wire overflow;

//reg current_state;

counter F3 (.clk(clk), .rst_n(rst_n), .active(active), .counter(counter), .overflow(overflow));

//initial current_state = IDLE;
// Tao xung a voi chu ki 20 don vi thoi gian
initial begin
rst_n =0;
active = 0;
#10 rst_n = 1;
forever #10 active = ~active;

end

// tao xung clk
initial begin
 clk = 0;
 forever #5 clk = ~clk;
 end 

endmodule 