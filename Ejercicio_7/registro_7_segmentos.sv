`timescale 1ns / 1ps

module registro_7_segmentos(
  input logic reset_i, we_i, clk_i,
  input logic [15:0] digits_i,
  output logic [15:0] data_out
);

logic [15:0] regs;

always_ff @(posedge clk_i or posedge reset_i) begin
  if (reset_i) begin
    regs <= 0;
  end 
  else if (we_i) begin
    regs <= digits_i;
  end
end

assign data_out = regs;

endmodule

