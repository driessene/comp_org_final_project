module AddressRegister(
	input [4:0] Dbus,
	input update, CLK,
	output reg [4:0] Abus
);

	always@(posedge CLK) begin
		if (update == 1) begin		// If update is high, move Dbus to Abus
			Abus <= Dbus;
		end
	end
endmodule
