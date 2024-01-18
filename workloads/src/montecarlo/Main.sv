module Main(input wire clk);


    logic [31:0] counter = 0;
    logic [31:0] TIMEOUT;
    initial begin
        if (!$value$plusargs("max-cycles=%d", TIMEOUT)) begin TIMEOUT = 4_000_000; end

        // $display("TIMEOUT is %d", TIMEOUT);
    end
    always_ff @(posedge clk) counter <= counter + 1;

    wire resp_valid;
    wire [31:0] resp;
    MonteCarloAccelerator dut(
        .clock(clk),
        .reset(counter < 4),
        .io_request_ready(),
        .io_request_valid(1'b1),
        .io_request_bits_time_steps(32'd50000),
        .io_request_bits_coefficient1(32'd1049),
        .io_request_bits_coefficient2(32'd210),
        .io_request_bits_start_value({1'd1, 20'd0}),
        .io_response_ready(1'b1),
        .io_response_valid(resp_valid),
        .io_response_bits(resp)
    );

    always_ff @(posedge clk) begin
        if (resp_valid) begin
            $display("@%d Got %d", counter, resp);
        end
	if (counter >= TIMEOUT) begin 
            $display("@ %d: Timed out!", counter);
	    $finish;
	end
    end


endmodule
