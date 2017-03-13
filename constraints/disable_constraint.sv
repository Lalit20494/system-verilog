// Author   : Admin (www.chipverify.com)
// Purpose  : Example of how to turn on/off a constraint
//------------------------------------------------------


class Fruits;
  rand bit[3:0]  num;
  
  constraint c_num { num > 4; 
                    num < 9; };
endclass

module tb;
  initial begin
    Fruits f = new ();
    $display ("Before randomization num = %0d", f.num);
    
`ifdef C_OFF
    // Turn off constraint
    f.c_num.constraint_mode (0);
`endif
    
    if (f.c_num.constraint_mode ())
      $display ("Constraint c_num is active");
    else
      $display ("Constraint c_num is inactive");
    f.randomize ();
    $display ("After randomization num = %0d", f.num);    
  end
endmodule

/* Simulation Log:
------------------
ncsim> run
Before randomization num = 0
Constraint c_num is active
After randomization num = 8
ncsim: *W,RNQUIE: Simulation is complete.


Simulation Log:   +define+C_OFF
-------------------------------
ncsim> run
Before randomization num = 0
Constraint c_num is inactive
After randomization num = 15
ncsim: *W,RNQUIE: Simulation is complete.

*/
