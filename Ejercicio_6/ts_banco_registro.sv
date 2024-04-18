`timescale 1ns / 1ps

module ts_banco_registro();

parameter N = 6;
parameter W = 6;

logic [W-1:0] data_in;
logic [N-1:0] addr_rd;
logic [N-1:0] addr_rs1;
logic [N-1:0] addr_rs2;
logic         we;
logic         clk;
logic         rst;
logic [W-1:0] rs1;
logic [W-1:0] rs2;

banco_registro br1(
             .clk(clk),  
             .rst(rst),
             .we(we),
             .data_in(data_in),
             .addr_rd(addr_rd),
             .addr_rs1(addr_rs1),
             .addr_rs2(addr_rs2),
             .rs1(rs1),
             .rs2(rs2)
);

always begin
clk = 1; #50;
clk = 0; #50;
end

initial begin
addr_rd = 1;
rst = 0;
data_in = $random;
addr_rs1 = 1;
addr_rs2 = 1;
we = 1; #100;
we = 0;
#100;

addr_rd = addr_rd + 1;
data_in = $random;
addr_rs1 = 2;
addr_rs2 = 2;
we = 1; #100;
we = 0;
#100;

addr_rd = addr_rd + 1;
data_in = $random;
addr_rs1 = 3;
addr_rs2 = 3;
we = 1; #100;
we = 0;
#100;

addr_rd = addr_rd + 1;
data_in = $random;
addr_rs1 = 4;
addr_rs2 = 4;
we = 1; #100;
we = 0;
#100;

addr_rs1 = 0;
addr_rs2 = 0;
#50;

addr_rs1 = 1;
addr_rs2 = 2;
#50

addr_rs1 = 4;
addr_rs2 = 3;
#50;

addr_rs1 = 3;
addr_rs2 = 1;
#50;
end

endmodule