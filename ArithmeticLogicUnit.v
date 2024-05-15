//Written By: Jayden
module ArithmeticLogicUnit(
	input [7:0] DBus, ACin,
	input [1:0] ALUSel, 
	input CLK,
	output reg [7:0] ACout
);

	always @(*) begin
		if (ALUSel == 0)				// addition mode
			ACout <= DBus + ACin;
		else if(ALUSel == 1)			// subtraction mode
			ACout <= ACin - DBus;
		else								// load mode
			ACout <= DBus;
	end
endmodule
