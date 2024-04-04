`timescale 1ns / 1ps

module clk_divider(
    input logic clk,
    output logic divide_clk
    );
   
logic [24:0] count;
    
always_ff @(posedge clk) begin
    if (count == 5) begin
         count <= 0;
         divide_clk <= ~divide_clk;
    end else begin
         count <= count + 1;
    end
end   
endmodule