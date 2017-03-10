// Author   : Admin (www.chipverify.com)
// Purpose  : Example of how to use randomize function
//            Use +define+FAIL to create a randomization
//            failure scenario -> it fails because of
//            conflicting constraints
//-----------------------------------------------------

class Beverage;
  rand bit [7:0]  beer_id;
 
  constraint c_beer_id { beer_id >= 10;
                        beer_id <= 50; };
                        beer_id <= 50; };
`ifdef FAIL
  constraint c_fail { beer_id < 5; };
`endif       
 
endclass
 
module tb;
   Beverage b;
 
    initial begin
      b = new ();
      $display ("Initial beerId = %0d", b.beer_id);
      
      if (b.randomize ()) 
        $display ("Randomization successful !");
      else
        $display ("Randomization failed ... ");
        
      $display ("After randomization beerId = %0d", b.beer_id);
    end
endmodule

/* Simulation Log:
------------------
run -all;
# KERNEL: Initial beerId = 0
# KERNEL: Randomization successful !
# KERNEL: After randomization beerId = 25
# KERNEL: Simulation has finished. There are no more test vectors to simulate.


Simulation Log :    +define+FAIL
--------------------------------

run -all;
# KERNEL: Initial beerId = 0
# RCKERNEL: Warning: RC_0024 testbench.sv(21): Randomization failed. The condition of randomize call cannot be satisfied.
# RCKERNEL: Info: RC_0109 testbench.sv(21): ... after reduction b.beer_id to 3'(b.beer_id)
# RCKERNEL: Info: RC_0103 testbench.sv(21): ... the following condition cannot be met: (10<=b.beer_id)
# RCKERNEL: Info: RC_1007 testbench.sv(4): ... see class 'Beverage' declaration.
# KERNEL: Randomization failed ... 
# KERNEL: After randomization beerId = 0
# KERNEL: Simulation has finished. There are no more test vectors to simulate.

*/
