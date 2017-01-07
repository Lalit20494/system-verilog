// Author   :  Admin    (www.chipverify.com)
// Purpose  :  To illustrate that the constructor of a parent class
//             is always called even if not explicitly called by the 
//             child class.
//            In this example note the following:
//           - baseClass.data would have been zero if the parent class new()
//            was not called implicitly with default value 'hcafe
//           - Use +define+SUPER to call parent's new() explicitly using
//           "super" keyword from the child class


class baseClass;
  bit [15:0] data;

  function new (bit[15:0] data = 16'hcafe);
    this.data = data;
  endfunction
endclass
 
class subClass extends baseClass;
  bit [3:0] id;
  bit [2:0] mode = 3;
 
  function new (int val = 2);
`ifdef SUPER
    super.new (16'hface);
`endif
    id = val;
  endfunction
endclass
 
module tb;
  initial begin
    subClass  sc1, sc2;
    sc1 = new ();
    $display ("data=0x%0h id=%0d mode=%0d", sc1.data, sc1.id, sc1.mode);
    sc2 = new (4);
    $display ("data=0x%0h id=%0d mode=%0d", sc2.data, sc2.id, sc2.mode);
  end
endmodule

/*
Simulation Log:
---------------
ncsim> run
data=0xcafe id=2 mode=3
data=0xcafe id=4 mode=3
ncsim: *W,RNQUIE: Simulation is complete.


Simulation Log: +define+SUPER
-----------------------------
ncsim> run
data=0xface id=2 mode=3
data=0xface id=4 mode=3
ncsim: *W,RNQUIE: Simulation is complete.


*/
