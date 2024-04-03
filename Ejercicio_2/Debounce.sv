module Debounce
#(
    parameter max_count = 16
)
(
    input logic clock,
    input logic in,    // entrada de ruido y sincronización
    output logic out,   // salida de anti rebote y filtrado
    output logic edj,   // se activa durante 1 ciclo de reloj en cualquier flanco de salida.
    output logic rise,  // se pone a nivel alto durante 1 ciclo de reloj en el flanco ascendente de la salida
    output logic fall   // pasa a nivel alto durante 1 ciclo de reloj en el flanco descendente de la salida
);

    localparam counter_bits = $clog2(max_count);

    logic [counter_bits - 1 : 0] counter;
    logic w_edj;
    logic w_rise;
    logic w_fall;

    initial
    begin
        counter = 0;
        out = 0;
    end

    always @(posedge clock)
    begin
        counter <= 0;  // congela el contador por defecto para reducir las pérdidas de conmutación cuando la entrada y la salida son iguales
        edj <= 0;
        rise <= 0;
        fall <= 0;
        if (counter == max_count - 1)  // si se ha retirado con éxito, notifique lo sucedido
        begin
            out <= in;
            edj <= w_edj;    // pasa a nivel alto durante 1 ciclo de reloj en cualquiera de los flancos
            rise <= w_rise;  // sube durante 1 ciclo de reloj en el flanco ascendente
            fall <= w_fall;  // se pone a nivel alto durante 1 ciclo de reloj en el flanco descendente
        end
        else if (in != out)  // histéresis
        begin
            counter <= counter + 1;  // solo se incrementa cuando la entrada y la salida difieren
        end
    end

    // detección de flancos
    assign w_edj = in ^ out;
    assign w_rise = in & ~out;
    assign w_fall = ~in & out;

endmodule