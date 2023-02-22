// Assignment via `force` to scalar members of an SVI port.
interface I;
 logic z;
 logic y;
 logic x;
 logic w;

 modport P1
  ( input x
  , input y
  , output z
  );

 modport P2
  ( input z
  , input w
  );

endinterface


module M1
 ( I.P1 p1
 );

  assign p1.z =p1.x + p1.y;

endmodule

module M2
 ( I.P2 p2
 );
  var logic a;
  assign a = p2.z * p2.w;

endmodule

module top
  (I.P1 p1
  );

 I u_I();
 M1 u_M1
  (u_I);
 M2 u_M2
  (u_I);
  
  always_comb
  force p1.z = u_M2.a;

endmodule
