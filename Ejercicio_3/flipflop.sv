`timescale 1ns / 1ps

module flipflop(
    input logic clk,
    input logic rst, 
    input logic ena,
    input logic ent,
    output logic sal
);

always_ff @(posedge clk, posedge rst) begin
    if(rst) begin
        sal = 0;
    end else if(ena) begin
        sal = ent;
    end
end
endmodule