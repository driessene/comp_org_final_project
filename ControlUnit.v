module ControlUnit (
	input [2: 0] IR,
	input Z,CLK,
	output reg ARLoad, DRLoad, PCLoad, ACLoad, IRLoad,
	output reg ALUSel, PCInc, memRW,
	output reg [1:0] BusSel);
	
	reg [3:0] CurrentState, NextState;
	
	
	always @ (negedge CLK) begin
		CurrentState = NextState;
	end;
	
	always @ (*) begin
		//Load1
		if (CurrentState == 0) begin
			ARLoad = 0;
			DRLoad = 1;
			PCLoad = 0;
			ACLoad = 0;
			IRLoad = 0;
			ALUSel = 0;
			PCInc = 0; 
			memRW = 1;
			BusSel = 0;
			NextState = CurrentState + 1;
			
		//Load2
		end else if (CurrentState == 1) begin
			ARLoad = 0;
			DRLoad = 0;
			PCLoad = 0;
			ACLoad = 1;
			IRLoad = 0;
			ALUSel = 0;
			PCInc = 0; 
			memRW = 1;
			BusSel = 1;
			NextState = 12;
		
		//Store1
		end else if (CurrentState == 2) begin 
			ARLoad = 0;
			DRLoad = 1;
			PCLoad = 0;
			ACLoad = 0;
			IRLoad = 0;
			ALUSel = 0;
			PCInc = 0; 
			memRW = 1;
			BusSel = 3;
			NextState = CurrentState + 1;
		
		//Store2
		end else if (CurrentState == 3) begin 
			ARLoad = 0;
			DRLoad = 0;
			PCLoad = 0;
			ACLoad = 0;
			IRLoad = 0;
			ALUSel = 0;
			PCInc = 0; 
			memRW = 0;
			BusSel = 1;
			NextState = 12;
		
		//Add1
		end else if (CurrentState == 4) begin 
			ARLoad = 0;
			DRLoad = 1;
			PCLoad = 0;
			ACLoad = 0;
			IRLoad = 0;
			ALUSel = 0;
			PCInc = 0; 
			memRW = 1;
			BusSel = 0;
			NextState = CurrentState + 1;
		
		//Add2
		end else if (CurrentState == 5) begin 
			ARLoad = 0;
			DRLoad = 0;
			PCLoad = 0;
			ACLoad = 1;
			IRLoad = 0;
			ALUSel = 0;
			PCInc = 0; 
			memRW = 1;
			BusSel = 1;
			NextState = 12;
		
		//Sub1
		end else if (CurrentState == 6) begin 
			ARLoad = 0;
			DRLoad = 1;
			PCLoad = 0;
			ACLoad = 0;
			IRLoad = 0;
			ALUSel = 0;
			PCInc = 0; 
			memRW = 1;
			BusSel = 0;
			NextState = CurrentState + 1;
		
		//Sub2
		end else if (CurrentState == 7) begin 
			ARLoad = 0;
			DRLoad = 0;
			PCLoad = 0;
			ACLoad = 1;
			IRLoad = 0;
			ALUSel = 1;
			PCInc = 0; 
			memRW = 1;
			BusSel = 1;
			NextState = 12;
		
		//Jump
		end else if (CurrentState == 8) begin 
			ARLoad = 0;
			DRLoad = 0;
			PCLoad = 1;
			ACLoad = 0;
			IRLoad = 0;
			ALUSel = 0;
			PCInc = 0; 
			memRW = 1;
			BusSel = 1;
			NextState = 12;
		
		//JumpEQ
		end else if (CurrentState == 10) begin 
			if (Z == 1)
				PCLoad = 1;
			else
				PCLoad = 0;
			
			ARLoad = 0;
			DRLoad = 0;
			ACLoad = 0;
			IRLoad = 0;
			ALUSel = 0;
			PCInc = 0; 
			memRW = 1;
			BusSel = 1;
			NextState = 12;
		
		//Fetch 1
		end else if (CurrentState == 12) begin 
			ARLoad = 1;
			DRLoad = 0;
			PCLoad = 0;
			ACLoad = 0;
			IRLoad = 0;
			ALUSel = 0;
			PCInc = 0; 
			memRW = 1;
			BusSel = 2;
			NextState = CurrentState + 1;
			
		//Fetch 2
		end else if (CurrentState == 13) begin 
			ARLoad = 0;
			DRLoad = 1;
			PCLoad = 0;
			ACLoad = 0;
			IRLoad = 0;
			ALUSel = 0;
			PCInc = 1; 
			memRW = 1;
			BusSel = 0;
			NextState = CurrentState + 1;
		
		//Fetch 3
		end else if (CurrentState == 14) begin 
			ARLoad = 0;
			DRLoad = 1;
			PCLoad = 0;
			ACLoad = 0;
			IRLoad = 1;
			ALUSel = 0;
			PCInc = 1; 
			memRW = 1;
			BusSel = 0;
			case (IR)
				3'd0: NextState = 0;
				3'd1: NextState = 2;
				3'd2: NextState = 4;
				3'd3: NextState = 6;
				3'd4: NextState = 8;
				3'd5: NextState = 10;
			end
		end
		
	end;
	
endmodule
