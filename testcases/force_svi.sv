// Assignment via `force` to scalar members within an SVI.
interface I;

 logic z;
 logic y;
 logic x;
 always_comb
 force z = x & y;

endinterface


module M;

  I u_I();
 assign u_I.z = u_I.x | u_I.y;
 always_comb
 release u_I.z;

endmodule
