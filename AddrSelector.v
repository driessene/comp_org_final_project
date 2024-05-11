module AddrSelector (
	input [4:0] ARIn, MemDumpIn,
	input BusEn,
	output reg [4:0] addrOut);
	
	always @ (*) begin
		if (BusEn == 1)
			addrOut = ARIn;
		else
			addrOut = MemDumpIn;
	end
endmodule
