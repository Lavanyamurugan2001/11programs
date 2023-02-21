module synchronisertb;
reg clk,rstn,async_sig_i;
wire sync_sig_o;
synchroniser uut (.clk(clk),.rstn(rstn),.async_sig_i(async_sig_i),. sync_sig_o(sync_sig_o));
initial
begin
$dumpfile("synchroniser.vcd");
$dumpvars(0, synchronisertb);
end
initial
begin
 #5 rstn =1'b0;
# 5 rstn = 1'b1;
# 5 rstn = 1'b0;
# 5 rstn = 1'b1;
# 5 rstn = 1'b0;
# 10 async_sig_i = 1'b0;
# 20 async_sig_i = 1'b1;
# 30 async_sig_i = 1'b0;
# 100 $finish;
end
always # 5 clk=~clk;
endmodule
