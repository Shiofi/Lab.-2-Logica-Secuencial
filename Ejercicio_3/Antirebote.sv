`timescale 1ns / 1ps

module Antirebote(
    input logic clk,
    input logic [3:0] boton_pi,
    output logic [3:0] boton_debounce_o
    );

    parameter CUENTA_DB = 5;
    logic [CUENTA_DB-1:0] cuenta = 0;
    logic boton_pasado = 1;
    logic boton_debounceado = boton_pi;
    always_ff @(posedge clk) begin
        if (boton_pi != boton_pasado) begin
            cuenta <= cuenta + 1;
                if (cuenta == (2**CUENTA_DB)-1) begin
                    boton_pasado <= boton_pi;
                    boton_debounceado <= boton_pi;
                end
        end else begin
            cuenta <= 0;
            boton_debounceado <= boton_pasado;
        end
    end
    
    assign boton_debounce_o = boton_debounceado;
endmodule
