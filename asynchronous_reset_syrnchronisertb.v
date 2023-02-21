module areset_synctb;
reg clk;
reg async_rst_i;
wire async_rst_o;
areset_sync uut(clk,async_rst_i,async_rst_o);
initial
begin
$dumpfile("areset.vcd");
$dumpvars;
end
initial
begin
 clk=0;
#5 async_rst_i = 1'b1;
#5 async_rst_i = 1'b0;
#5 async_rst_i = 1'b1;
#5 async_rst_i = 1'b0;
#100 $finish;
end
always #5 clk=~clk;
endmodule
