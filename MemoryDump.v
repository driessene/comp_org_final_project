//Written By: Theo
module MemeroryDump (
	input CLK, Halt,
	output reg [4:0] addr);
	
	//Iterate through addresses when halt signal recieved
	always @ (posedge CLK) begin
		if (Halt == 0)
			addr = addr + 1;
		else
			addr = 0;
	end
	
endmodule
