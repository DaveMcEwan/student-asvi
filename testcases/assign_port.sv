//Assignment via `assign` to scalar members of an SVI port.

interface I;

  logic z;
  logic y;
  logic x;
  logic w;

  modport P
   ( output z
   , output w
   , input y
   , input x
   );

endinterface

module M
 ( I.P p
 );

 assign p.z = p.y & p.x;
 assign p.w = p.y ^ p.x;

endmodule

module top;

 I u_I ();
 M u_M (
  u_I);

endmodule

