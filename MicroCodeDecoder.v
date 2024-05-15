//Written By: Theo
module MicroCodeDecoder (
	input Z, 
	input [12:0] MicroCode,
	output reg ARLoad, DRLoad, PCLoad, ACLoad, IRLoad,
	output reg PCInc, memRW,
	output reg [1:0] BusSel, ALUSel);
	
	//Set microOperations based on MicroCode input
	always @ (*) begin
		//Load To Address Register
		if(MicroCode[12] || MicroCode[5])
			ARLoad = 1;
		else
			ARLoad = 0;
			
		//Load To Data Register
		if(MicroCode[6] || MicroCode[3])
			DRLoad = 1;
		else
			DRLoad = 0;
			
		//Load To Program Counter Register
		if(MicroCode[8] || (MicroCode[7] && Z))
			PCLoad = 1;
		else
			PCLoad = 0;
			
		//Load To Accumulator Register
		if(MicroCode[10] || MicroCode[2] || MicroCode[1])
			ACLoad = 1;
		else
			ACLoad = 0;
			
		//Load To Instruction Register
		if(MicroCode[11])
			IRLoad = 1;
		else
			IRLoad = 0;
			
		//Select ALU Mode
		if(MicroCode[2])
			ALUSel = 2'b00; //Add
		else if(MicroCode[1])
			ALUSel = 2'b01; //Sub
		else if(MicroCode[10])
			ALUSel = 2'b10; //Load
			
		//Increment Program Counter
		if(MicroCode[12])
			PCInc = 1;
		else
			PCInc = 0;
			
		//Set Memory Read/Write
		if(MicroCode[9])
			memRW = 1;
		else
			memRW = 0;
			
		//Select what has bus access
		if(MicroCode[6])
			BusSel = 2'b00;	//Memory
		else if(MicroCode[12] || MicroCode[11] || MicroCode[10] || MicroCode[9] || MicroCode[8] || MicroCode[7])
			BusSel = 2'b01;	//Data Register
		else if(MicroCode[5])
			BusSel = 2'b10;	//Program Counter
		else if(MicroCode[3])
			BusSel = 2'b11;	//Accumulator
		
	end
	
endmodule
