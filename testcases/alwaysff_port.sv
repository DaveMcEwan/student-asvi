//Assignment via `always_ff` to scalar members of an SVI port.

interface I
 ( input var logic i_clk
 , input var logic i_srst
 , input var logic i_arst
 );

 logic z;
 logic y;
 logic x;

 modport P
 ( output z
 , output y
 , output x
 , input i_clk
 , input i_srst
 , input i_arst
 );

endinterface

module M //No reset
 ( I.P p
);

localparam bit Z = 1'b0;
logic a;

always_ff @(posedge p.i_clk) p.z <= Z;
always_ff @(posedge p.i_clk) p.y <= 1'b1;
always_ff @(posedge p.i_clk) p.x <= a;

//Synchronous reset
always_ff @(posedge p.i_clk)
  if (p.i_srst)
    p.z <= 1'b0;
  else
    p.z <= Z;
always_ff @(posedge p.i_clk)
 if (p.i_srst)
    p.y <= 1'b0;
 else
    p.y <= 1'b1;
always_ff @(posedge p.i_clk)
  if (p.i_srst)
    p.x <= 1'b0;
  else
    p.x <= a;

//Asynchronous reset
always_ff @(posedge p.i_clk , posedge p.i_arst)
  if (p.i_arst)
    p.z <= 1'b0;
  else
    p.z <= Z;
always_ff @(posedge p.i_clk, posedge p.i_arst)
  if (p.i_arst)
    p.y <= 1'b0;
  else
    p.y <= 1'b1;
always_ff @(posedge p.i_clk, posedge p.i_arst)
  if (p.i_arst)
    p.x <= 1'b0;
  else
    p.x <= a;

endmodule

module top
  ( input var logic i_clk
  , input var logic i_srst
  , input var logic i_arst
  );

I u_I (.*);
M u_M
  ( u_I
  );

endmodule


