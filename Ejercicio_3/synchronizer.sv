`timescale 1ns / 1ps

module synchronizer(
    input logic clk,
    input logic [3:0] input_b,
    output logic [3:0] output_b
);


    logic [3:0] prev_b; 

    always_ff @(posedge clk) begin
        prev_b <= input_b;
    end
    assign output_b = prev_b;
endmodule