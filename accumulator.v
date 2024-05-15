//Written By: Jayden
module accumulator(
    input [7:0] ALUin,
    input CLK,
    input ACLoad,
    input ACInc,
    output reg [7:0] ACout,
	 output reg Z
); 

    //check if stored value is zero
	always @(*) begin
		if (ACout == 0)
			Z = 1;
		else
			Z = 0;
	end

    //load or increment on Clock
    always @(posedge CLK) begin
        if (ACLoad) begin
            ACout <= ALUin;
        end else if (ACInc) begin
            ACout <= ACout + 1;
        end
    end

endmodule