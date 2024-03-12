`timescale 1ns / 1ps


module reloj_10MHz(
    input logic clk_i,
    output logic LED_po
);

    logic [23:0] cuenta; // Declara un contador para mantener el seguimiento del tiempo

always @(posedge clk_i) 
    begin
        if (cuenta == 10000000) 
            begin
                LED_po <= ~LED_po;      // Fija el LED
                cuenta <= 0;            // Reset de la cuenta
            end
        else 
            begin
                cuenta <= cuenta + 1;   // Incrementa el contador
            end
    end
endmodule

