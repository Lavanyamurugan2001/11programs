module min_reset_widthtb;
reg clk;
reg rst_i;
wire rst_o;
min_reset_width uut (.clk(clk),.rst_i(rst_i),.rst_o(rst_o));
initial
begin
$dumpfile ("min_width.vcd");
$dumpvars(0,min_reset_widthtb);
end
initial
begin
clk=0;
#5 rst_i = 1'b0;
#10 rst_i =1'b1;
#5 rst_i =1'b0;
#55 rst_i=1'b1;
#5 rst_i=1'b0;
#150 $finish;
end
always #5 clk=~clk;
//always #10 rst_i = ~rst_i;
endmodule
