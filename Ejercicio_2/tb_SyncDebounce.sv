`timescale 1ns/1ps

module tb_SyncDebounce;

    logic clock;
    logic button;
    logic button_sync;
    logic button_sync_db;
    logic edj;
    logic rise;
    logic fall;

    Sync Sync_Inst
    (
        .clock(clock),
        .in(button),
        .out(button_sync)
    );

    Debounce
    #(
        .MAX_COUNT(4)
    )
    Debounce_Inst
    (
        .clock(clock),
        .in(button_sync),
        .out(button_sync_db),
        .edj(edj),
        .rise(rise),
        .fall(fall)
    );

    initial
    begin
        clock = 0;
    end

    always #5 clock = ~clock;

    always
    begin
        #2 button = 0; #20 button = 1; #20 button = 0;
        #22 button = 1; #20 button = 1; #20 button = 0; #20 button = 1;
        #22 button = 1; #20 button = 0; #20 button = 0; #20 button = 1;
        #22 button = 0; #20 button = 1; #20 button = 1; #20 button = 0;
        #80 $stop;
    end

endmodule