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
