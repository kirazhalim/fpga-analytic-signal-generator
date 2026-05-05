module led_toggle #(
    parameter count_max = 50_000_000 - 1  // toggle every 0.5 seconds for 100mhz clock
)(
    clk,
    reset,
    led
);
    input wire clk;
    input wire reset;
    output reg led;
    
    reg [25:0] counter = 0;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            led <= 0;
        end else begin
            if (counter == count_max) begin
                counter <= 0;
                led <= ~led;
            end else begin
                counter <= counter + 1;
            end
        end
    
    end

endmodule