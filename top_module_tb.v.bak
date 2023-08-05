`timescale 1ns/1ps
//(bit_in, clk, rst_n, count_5, overflow);
module top_module_tb;

//
integer i;
//Interface
// input
reg clk;
reg rst_n;
reg a;

//output

wire [7:0] SEG1;
wire [7:0] SEG2;
wire [7:0] SEG3;

//reg current_state;

top_module F2 (.bit_in(a), .clk(clk), .rst_n(rst_n), .SEG1(SEG1), .SEG2(SEG2), .SEG3(SEG3));

//initial current_state = IDLE;
// Tao xung a voi chu ki 20 don vi thoi gian
initial begin
rst_n =0;
a= 1;
#10 rst_n = 1;
for (i=0; i<255; i=i+1) 
begin
#10 a = 1;
#10 a = 0;
#10 a = 1;
end
end
// tao xung clk
initial begin
 clk = 0;
 forever #5 clk = ~clk;
 end 

endmodule 