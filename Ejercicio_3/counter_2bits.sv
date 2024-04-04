`timescale 1ns / 1ps

module counter_2bits(
        input clk,
        input rst, 
        input pause,
        output logic [1:0] count);

always_ff @ (posedge clk, rst) begin 
    if (rst)    
        count = 2'b00;
    else 
        count = count + 1; 
end  
endmodule