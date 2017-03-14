// Author   : Admin (www.chipverify.com)
// Purpose  : Example of how to use rand_mode()
//----------------------------------------------

class Fruits;
  rand bit [3:0] var1;
  rand bit [1:0] var2;
endclass

module tb;
  initial begin
    Fruits f = new(); 
    
    $display ("Before randomization var1=%0d var2=%0d", f.var1, f.var2);
    
`ifdef ALL_ENABLED    
    if (f.var1.rand_mode())
    	if (f.var2.rand_mode())
      		$display ("Randomization of all variables enabled");
          
`else ifdef (VAR1_DISABLED)
    f.var1.rand_mode (0);
    if (! f.var1.rand_mode ())
      $display ("Randomization of var1 disabled");
    else
      $display ("Randomization of var1 enabled");
      
`else 
    f.rand_mode (0);
    if (! f.var1.rand_mode())
      if (! f.var2.rand_mode())
        $display ("Randomization of all variables disabled");
`endif 

    f.randomize();
    
    $display ("After randomization var1=%0d var2=%0d", f.var1, f.var2);
  end
endmodule



/* Simulation Log:   +define+ALL_ENABLED
----------------------------------------
ncsim> run
Before randomization var1=0 var2=0
Randomization of all variables enabled
After randomization var1=15 var2=3
ncsim: *W,RNQUIE: Simulation is complete.


Simulation Log:    +define+VAR1_DISABLED
----------------------------------------
ncsim> run
Before randomization var1=0 var2=0
Randomization of all variables enabled
After randomization var1=15 var2=3
ncsim: *W,RNQUIE: Simulation is complete.


Simulation Log:    
---------------
ncsim> run
Before randomization var1=0 var2=0
Randomization of all variables disabled
After randomization var1=0 var2=0
ncsim: *W,RNQUIE: Simulation is complete.

*/
