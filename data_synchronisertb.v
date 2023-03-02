module data_synctb;
reg clk;
reg rstn;
reg din;
reg dready_i;
wire dout;
wire dready_o;
data_sync uut (clk,rstn,din,dready_i,dout,dready_o);

initial
begin
 $dumpfile("datasync.vcd");
 $dumpvars;
end
initial
begin
 clk =0;
 rstn=1;
 #5rstn=0;
din = 8'd8;
#5 din = 8'd7;
 dready_i =1;
#5 din = 8'b10101011;
 dready_i =1;
#5 din = 8'b10101010;
dready_i=1;
#50 $finish;
end
always #5 clk= !clk;
endmodule

