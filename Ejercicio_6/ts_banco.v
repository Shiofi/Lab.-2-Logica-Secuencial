`timescale 1ns / 1ps

module ts_banco();
                reg clk;
                reg st;
                reg we;
                reg [8-1:0] data_in;
                reg [8-1:0] addr_rd;
                reg [8-1:0] addr_rs1;
                reg [8-1:0] addr_rs2;
                reg [8-1:0] rs1;
                reg [8-1:0] rs2;

banco_registro bn1(.clk(clk),  
                   .rst(rst),
                   .we(we),
                   .data_in(data_in),
                   .addr_rd(addr_rd),
                   .addr_rs1(addr_rs1),
                   .addr_rs2(addr_rs2),
                   .rs1(rs1),
                   .rs2(rs2));
                   
always 
    begin 
        clk = 1; #20; clk = 0; #20;
    end

initial begin 
    addr_rd = 1;
    data_in <= "hola";
    we = 1; 
    #50;
    we = 0;
    addr_rd = addr_rd + 1;
    data_in <= "soy";
    we = 1; 
    #50;
    we = 0;
    addr_rd = addr_rd + 1;
    data_in <= "william";
    we = 1; 
    #50;
    we = 0;
    addr_rd = addr_rd + 1;
    data_in <= "elcrack";
    we = 1; 
    #50;
    
end
endmodule
