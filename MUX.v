module MUX(
	input [7:0] memBus,
   input [7:0] DRBus,
   input [4:0] PCBus,
   input [7:0] ACBus,
   input [1:0] ctrl,
   output reg [7:0] out);

    always @(*) begin
        case (ctrl)
            2'b00: out = memBus; 
            2'b01: out = DRBus; 
            2'b10: out = {3'b0, PCBus};
            2'b11: out = ACBus;
            default: out = 8'b0;     // Default case
        endcase
    end

endmodule