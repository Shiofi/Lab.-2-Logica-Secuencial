`timescale 1ns / 1ps
module module_deco(
    input logic [3:0] num,
    output logic [6:0] LED
    );
    
    always @(num) begin
		case(num)
			4'b0000: LED[6:0] = 7'b1000000;
			4'h0001: LED[6:0] = 7'b1111001;
			4'b0010: LED[6:0] = 7'b0100100;
			4'b0011: LED[6:0] = 7'b0110000;
			4'b0100: LED[6:0] = 7'b0011001;
			4'b0101: LED[6:0] = 7'b0010010;
			4'b0110: LED[6:0] = 7'b0000010;
			4'b0111: LED[6:0] = 7'b1111000;
			4'b1000: LED[6:0] = 7'b0000000;
			4'b1001: LED[6:0] = 7'b0010000;
			4'b1010: LED[6:0] = 7'b0100000;
			4'b1011: LED[6:0] = 7'b0000011;
			4'b1100: LED[6:0] = 7'b1000110;
			4'b1101: LED[6:0] = 7'b0100001;
			4'b1110: LED[6:0] = 7'b0000110;
			4'b1111: LED[6:0] = 7'b0001110;
		endcase
	end
    
endmodule
