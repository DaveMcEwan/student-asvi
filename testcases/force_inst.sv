// Assignment via `force` to scalar members of an SVI instance.

interface I;
  logic z;
endinterface


module M
  ( input bit a
  , input var logic b);

 I u_I ();
 assign u_I.z = b;
 
 always_comb
  if (a)
    force u_I.z = 1'bz;
  else
    release u_I.z;

endmodule
