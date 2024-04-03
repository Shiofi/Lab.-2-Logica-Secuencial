`timescale 1ns/1ps

module tb_SyncDebounce;

    logic clock;
    logic btn;
    logic btn_sync;
    logic btn_sync_db;
    logic edj;
    logic rise;
    logic fall;

    Sync Sync_Inst
    (
        .clock(clock),
        .in(btn),
        .out(btn_sync)
    );

    Debounce
    #(
        .max_count(4)
    )
    Debounce_Inst
    (
        .clock(clock),
        .in(btn_sync),
        .out(btn_sync_db),
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
        #2 btn = 0; #20 btn = 1; #20 btn = 0;
        #22 btn = 1; #20 btn = 1; #20 btn = 0; #20 btn = 1;
        #22 btn = 1; #20 btn = 0; #20 btn = 0; #20 btn = 1;
        #22 btn = 0; #20 btn = 1; #20 btn = 1; #20 btn = 0;
        #80 $stop;
    end

endmodule