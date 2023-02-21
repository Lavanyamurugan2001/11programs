module synchroniser(clk,rstn,async_sig_i,sync_sig_o);
input clk,rstn,async_sig_i;
output wire sync_sig_o;
parameter STAGES =2;
reg [STAGES-1:0] flipflops;
always @ (posedge clk)
 if (!rstn)
  // flipflops<=[STAGES-1:0];
flipflops <=0;
else
 //flipflops <=flipflops (flipflops -1:0)& async_sig_i;
flipflops <= {flipflops[STAGES-2:0], async_sig_i};

//assign sync_sig_o= flipflops(flipflops{1'b1});
assign sync_sig_o = flipflops[STAGES-1];
endmodule
