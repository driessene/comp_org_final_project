module MUX(
	input [4:0] ione
        input [4:0] itwo
        input [4:0] ithree
        input [1:0] ctrl,
        output reg [4:0] output);

    always @(*) begin
        case (ctrl)
            2'b00: output = ione; 
            2'b01: output = itwo; 
            2'b10: output = ithree;
            default: output = 5'b0;     // Default case
        endcase
    end

endmodule