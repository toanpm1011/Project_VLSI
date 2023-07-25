module counter(clk, rst_n, active, counter, overflow);
input active, clk, rst_n;
output counter, overflow;

reg [7:0] counter;
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
	