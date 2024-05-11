module MemeroryDump (
	input CLK, Halt,
	output reg [4:0] addr);
	
	always @ (posedge CLK) begin
		if (Halt == 0)
			addr = addr + 1;
		else
			addr = 0;
	end
	
endmodule
