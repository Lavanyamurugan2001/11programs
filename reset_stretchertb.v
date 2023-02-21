module reset_stretchertb;
reg clk=0;
reg rst_i;
wire rst_o;
reset_stretcher uut (.clk(clk),.rst_i(rst_i),.rst_o(rst_o));
initial
begin
$dumpfile ("reset.vcd");
$dumpvars(0,reset_stretchertb);
end
initial
begin
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
