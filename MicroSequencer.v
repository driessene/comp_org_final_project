module MicroSequencer (
	input [2:0] IR,
	input [4:0] addrIn,
	input sel,
	output reg [4:0] addrOut);

	always @(*) begin
		if (sel == 1)
			addrOut = {1'b1, IR, 1'b0};
		else 
			addrOut = addrIn;
	end
endmodule
