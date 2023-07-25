`timescale 1ns/1ps

module FSM_Moore_tb;

//
//Interface
//
reg clk;
reg rst_n;
reg a;
wire out;
//reg current_state;

FSM_Moore F1 (.bit_in(a), .clk(clk), .rst_n(rst_n), .out(out));

//initial current_state = IDLE;
// Tao xung a voi chu ki 20 don vi thoi gian
initial begin
rst_n =0;
a= 1;
#30 rst_n = 1;
#10 a = 1;
#10 a = 1;
#10 a = 0;
#10 a = 0;
#10 a = 1;
#10 a = 0;
#10 a = 1;
#10 a = 0;
#10 a = 1;
#10 a = 0;
#10 a = 0;


end
// tao xung clk
initial begin
 clk = 0;
 forever #5 clk = ~clk;
 end 

endmodule 
