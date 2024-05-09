module ArithmeticLogicUnit(
	input [7:0] DBus, ACin,
	input ALUSel, CLK,
	output reg [7:0] ACout
);

	always @(*) begin
		if (ALUSel == 0) begin		// addition mode
			ACout <= DBus + ACin;
		end else begin				// subtraction mode
			ACout <= ACin - DBus;
		end
	end
endmodule
