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
    ( output z // Assigned from constant.
    , output y // Assigned from literal.
    , output x // Assigned from signal.
    );

endinterface

module M
  ( input var logic i_clk
  , input var logic i_srst
  , input var logic i_arst

  , input var logic [4:0] i_dummy

  , I.P p_norst
  , I.P p_srst
  , I.P p_arst
  );

  localparam bit Z = 1'b0;
  logic a;

  assign a = ^i_dummy;

  // No reset
  always_ff @(posedge i_clk)
    p_norst.z <= Z;
  always_ff @(posedge i_clk)
    p_norst.y <= 1'b1;
  always_ff @(posedge i_clk)
    p_norst.x <= a;

  // Synchronous reset
  always_ff @(posedge i_clk)
    if (i_srst)
      p_srst.z <= 1'b0;
    else
      p_srst.z <= Z;
  always_ff @(posedge i_clk)
    if (i_srst)
      p_srst.y <= 1'b0;
    else
      p_srst.y <= 1'b1;
  always_ff @(posedge i_clk)
    if (i_srst)
      p_srst.x <= 1'b0;
    else
      p_srst.x <= a;

  // Asynchronous reset
  always_ff @(posedge i_clk, posedge i_arst)
    if (i_arst)
      p_arst.z <= 1'b0;
    else
      p_arst.z <= Z;
  always_ff @(posedge i_clk, posedge i_arst)
    if (i_arst)
      p_arst.y <= 1'b0;
    else
      p_arst.y <= 1'b1;
  always_ff @(posedge i_clk, posedge i_arst)
    if (i_arst)
      p_arst.x <= 1'b0;
    else
      p_arst.x <= a;

endmodule

module top
  ( input var logic i_clk
  , input var logic i_srst
  , input var logic i_arst
  , output var logic [8:0] o_dummy_d
  , output var logic [8:0] o_dummy_q
  );

  // Dummy/placeholder logic to prevent M's inputs from being tied.
  // Initial value is unknown, so sim will see only X's.
  logic [4:0] count_q;
  always_ff @(posedge i_clk)
    count_q <= count_q + 'd1;

  I u_norst ();
  I u_srst ();
  I u_arst ();

  M u_M
    ( .i_clk
    , .i_srst
    , .i_arst

    , .i_dummy  (count_q)

    , .p_norst  (u_norst)
    , .p_srst   (u_srst)
    , .p_arst   (u_arst)
    );

  // Top-level connections to prevent M's outputs from being removed.
  assign o_dummy_d =
    { u_norst.z
    , u_norst.y
    , u_norst.x
    , u_srst.z
    , u_srst.y
    , u_srst.x
    , u_arst.z
    , u_arst.y
    , u_arst.x
    };
  always_ff @(posedge i_clk)
    o_dummy_q <= o_dummy_d;

endmodule

