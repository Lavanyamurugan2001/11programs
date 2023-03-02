module data_sync (clk,rstn,din,dready_i,dout,dready_o);
input clk;
input rstn;
input [DWIDTH -1:0] din;
input dready_i;
output reg [DWIDTH-1:0] dout;
output reg dready_o;


parameter STAGES =2;
parameter DWIDTH =8;

reg [STAGES-1:0] flipflops;
reg dready_sync;

always @ (posedge clk )
begin
   if(!rstn)
         flipflops<=0;
   else
         flipflops<= {flipflops[STAGES -2:0] & dready_i};
end

always @ (posedge clk)
begin
 if(!rstn)
begin
       dout<=0;
       dready_o<=0;
end
else
   begin
   if (dready_sync)
   begin
	dout<=din;
   end
	dready_o<=dready_sync;
end
end
always @ (posedge clk)
begin
 dready_sync <= flipflops[STAGES -1];
end
endmodule
