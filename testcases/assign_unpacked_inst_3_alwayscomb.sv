// Assignment via `assign` to an unpacked array of an interface instance.
// Use `do-while` loop to iterate through array elements.

interface I;

  logic x [7:0]; // Unpacked array x with start and end address.
  
endinterface


module top
  ( input logic i_a
  , output logic o_a [7:0]
  );

  I u_I ();
  
  always_comb begin
  int i = 0;

  do begin 
    assign u_I.x[i] = i_a;
    i++; end
  while 
  ( i < 8);end
  
  assign o_a = u_I.x;

endmodule
