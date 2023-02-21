module areset_sync(clk,async_rst_i,sync_rst_o);
input clk;
input async_rst_i;
output sync_rst_o;
parameter STAGES =2;
reg [STAGES-1:0] flipflops;
//assign sync_rst_o = flipflops(1'b1);
always @(posedge clk)
begin
 flipflops<= {flipflops [STAGES-2:0], async_rst_i};
end

	assign sync_rst_o = flipflops[STAGES-1];

endmodule
