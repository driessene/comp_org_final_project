module accumulator(
    input [4:0] ALUin,
    input CLK,
    input ACLoad,
    input ACInc,
    output reg [4:0] ACout
);

    always @(posedge CLK) begin
        if (ACLoad) begin
            ACout <= ALUin;
        end else if (ACInc) begin
            ACout <= ACout + 1;
        end
    end

endmodule