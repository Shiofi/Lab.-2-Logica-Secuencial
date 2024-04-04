`timescale 1ns / 1ps

module mux_2_a_1 #(
        parameter N = 16
)(
        input logic [N-1:0] dato_teclado_i,
        input logic [N-1:0] dato_alu_i,
        input logic seleccion_i,
        output logic [N-1:0] salida_o
    );

    assign salida_o = seleccion_i  ? dato_alu_i : dato_teclado_i;
    
endmodule
