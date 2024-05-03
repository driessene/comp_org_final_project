module BasicRegister #(
	parameter WIDTH = 5   // Width of Dbus and Abus
)(
	input [WIDTH-1:0] Dbus,
	input update, CLK,
	output reg [WIDTH-1:0] Abus
);

	always @(posedge CLK) begin
		if (update == 1) begin
			Abus <= Dbus;
		end
	end
endmodule
