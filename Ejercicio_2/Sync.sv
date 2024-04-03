module Sync
#(
    parameter SYNC_BITS = 3  // número de bits en el búfer de sincronización (2 mínimo)
)
(
    input logic clock,
    input logic in,     // entrada asíncrona
    output logic out    // salida síncrona
);

    localparam SYNC_MSB = SYNC_BITS - 1;

    logic [SYNC_MSB : 0] sync_buffer;

    assign out = sync_buffer[SYNC_MSB];

    always @(posedge clock)
    begin
        sync_buffer[SYNC_MSB : 0] <= {sync_buffer[SYNC_MSB - 1 : 0], in};
    end

endmodule