// Author   : Admin (www.chipverify.com)
// Purpose  : To illustrate the pre_randomize function
//            Use this function to do tasks just before
//            randomization is performed
//-------------------------------------------------------

class Beverage;
  rand bit [7:0]  beer_id;
 
  constraint c_beer_id { beer_id >= 10;
                        beer_id <= 50; };
 
  function void pre_randomize ();
    $display ("This will be called just before randomization");
  endfunction
 
endclass

module tb;
   Beverage b;
 
    initial begin
      b = new ();
      $display ("Initial beerId = %0d", b.beer_id);
      if (b.randomize ()) 
        $display ("Randomization successful !");
      $display ("After randomization beerId = %0d", b.beer_id);
    end
endmodule

/* Simulation Log:
------------------
ncsim> run
Initial beerId = 0
This will be called just before randomization
Randomization successful !
After randomization beerId = 23
ncsim: *W,RNQUIE: Simulation is complete.

*/
