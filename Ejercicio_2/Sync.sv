module Sync
#(
    parameter SYNC_BITS = 3  // Number of bits in the synchronisation buffer (2 minimum).
)
(
    input logic clock,
    input logic in,     // Asynchronous input.
    output logic out    // Synchronous output.
);

    localparam SYNC_MSB = SYNC_BITS - 1;

    logic [SYNC_MSB : 0] sync_buffer;

    assign out = sync_buffer[SYNC_MSB];

    always @(posedge clock)
    begin
        sync_buffer[SYNC_MSB : 0] <= {sync_buffer[SYNC_MSB - 1 : 0], in};
    end

endmodule