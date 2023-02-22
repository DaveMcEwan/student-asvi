// Assignment via `always_latch` to scalar members of an SVI instance.

interface I;
 logic y;
 logic x;

endinterface

module M
  ( input logic i_clk
  , input logic i_arst
  );

 I u_I();

always_latch
  if (!i_arst)
    u_I.y <= 1'b0;
  else if (i_clk)
    u_I.y <= u_I.x;

endmodule

