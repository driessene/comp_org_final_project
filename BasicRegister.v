//Written By: Eliot
module BasicRegister #(
	parameter WIDTH = 5   // Width of Dbus and Abus
	)(
	input [WIDTH-1:0] Dbus,
	input update, CLK, Inc,
	output reg [WIDTH-1:0] Abus)


	always @(posedge CLK) begin
		//store data from bus to register when update is active
		if (update == 1) begin
			Abus <= Dbus;
		end
		//increment data in register
		if (Inc == 1)
			Abus <= Abus + 1;
	end
endmodule
