
module Main #(parameter LOOP_LOG2 = 0, DIFFICULTY = 20,
	EXPECTED_NONCE = 32'h5386, EXPECTED_GOLDEN_NONCE = 32'h5302)(
	input wire clk
);



   wire [31:0] golden_nonce;
   wire [31:0] nonce;
   reg [31:0] counter = 0;

   reg [31:0] timeout;
   reg noCheck;

   initial begin
       if(!$value$plusargs("max-cycles=%d", timeout)) timeout = 100000000;
	   noCheck = $test$plusargs("nocheck");
   end
   fpgaminer_top
        #(.LOOP_LOG2(LOOP_LOG2), .DIFFICULTY(DIFFICULTY))
        miner(.clk(clk), .golden_nonce(golden_nonce), .nonce_out(nonce));

   always @ (posedge clk) begin
       counter <= counter + 1;
       if (golden_nonce) begin
	       $display("@ %d %h %h", counter, golden_nonce, nonce);
		   if (!noCheck && (golden_nonce != EXPECTED_GOLDEN_NONCE)) begin
			$display("Invalid golden nonce %h", golden_nonce);
			$stop;
		   end
		   if (!noCheck && (nonce != EXPECTED_NONCE)) begin
			$display("Invalid nonce %h", nonce);
			$stop;
		   end
		   $display("*-* All Finished *-*");
           $finish;
       end else if (timeout == counter) begin
		   $display("@ %d timed out!", counter);
		   $finish;
	   end
   end


endmodule
