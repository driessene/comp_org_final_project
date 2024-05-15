//Written By: Alex
module AddrSelector (
	input [4:0] ARIn, MemDumpIn,
	input BusEn,
	output reg [4:0] addrOut);
	
	//connect address bus to AR when bus is enabled
	always @ (*) begin
		if (BusEn == 1)
			addrOut = ARIn;
		else
			addrOut = MemDumpIn;
	end
endmodule
