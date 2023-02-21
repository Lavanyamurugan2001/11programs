/*module reset_stretcher(clk,rst_i,rst_o);
  input clk;
  input rst_i;
  output rst_o;
  parameter PERIOD =4;
  parameter  RST_POL= 1;
  reg flipflops;
  always@(posedge clk)
  begin
    if(rst_i=RST_POL) 
    flipflops <=  RST_POL; 
      //flipflops<= RST_POL;
    else
      begin
      //flipflops <= flipflops ? flipflops[1:0]&RST_POL;
      flipflops <=  ~RST_POL ;
      rst_o<= flipflops;
    end
    end
  endmodule */
module reset_stretcher (
  input wire clk,
  input wire rst_i,
  output wire rst_o
);

  parameter PERIOD = 4;
  parameter RST_POL = 1'b1;

  reg [PERIOD-1:0] flipflops;
  

  always @(posedge clk) begin
    if (rst_i == RST_POL) begin
      flipflops <= {PERIOD{RST_POL}};
    end else begin
      flipflops <= {flipflops[PERIOD-2:0], ~RST_POL};
    end
  end

  assign rst_o = flipflops[PERIOD-1];

endmodule

