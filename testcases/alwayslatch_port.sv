// Assignment via `always_latch` to scalar members of an SVI port.

interface I
  ( input logic i_clk
  , input logic i_arst
  );

 logic y;
 logic x;

 modport P
  ( output y
  , input x
  , input i_clk
  , input i_arst
  );

endinterface

module M
  ( I.P p
  );

  always_latch
   if (!p.i_arst)
     p.y <= 1'b0;
   else if (p.i_clk)
     p.y <= p.x;


endmodule


module top
   ( input var logic i_clk
   , input var logic i_arst
   );

  I u_I (.*);
  M u_M
    ( u_I
    );

endmodule
