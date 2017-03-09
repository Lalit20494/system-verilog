// Author   : Admin (www.chipverify.com)
// Purpose  : Example of different methods for associative
//            arrays
//----------------------------------------------------------

module tb;
    int      fruits_l0 [string];
    string   fruits_l1 [int];   
 
    initial begin
      fruits_l0 = '{ "apple" : 4, 
                     "orange" : 10,
                     "plum" : 9,
                     "guava" : 1 };
       
      fruits_l1 = '{ 34 : "Grapes",
                     22 : "Melon" };
      
      // size()
      $display ("[l0] size = %0d", fruits_l0.size());
      $display ("[l1] size = %0d", fruits_l1.size());
      
      // num()
      $display ("[l0] num = %0d", fruits_l0.num());
      $display ("[l1] num = %0d", fruits_l1.num());
      
      // exists()
      if (fruits_l0.exists ("orange"))
        $display ("Found %0d orange !", fruits_l0["orange"]);
      if (fruits_l1.exists (22))
        $display ("Found 22 %s !", fruits_l1[22]);
      if (!fruits_l0.exists ("apricots"))
        $display ("Sorry, season for apricots is over ...");
      
      // first()
      begin
      	string f;
        if (fruits_l0.first (f))
          $display ("fruits_l0.first [%s] = %0d", f, fruits_l0[f]);
      end
      
      // last() : string indices are taken in alphabetical order
      begin
        string f;
        if (fruits_l0.last (f))
          $display ("fruits_l0.last [%s] = %0d", f, fruits_l0[f]);
      end
      
      // prev()
      begin
        string f = "orange";
        if (fruits_l0.prev (f))
          $display ("fruits_l0.prev [%s] = %0d", f, fruits_l0[f]);
      end
      
      // next()
      begin
        string f = "orange";
        if (fruits_l0.next (f))
          $display ("fruits_l0.next [%s] = %0d", f, fruits_l0[f]);
      end
    end
endmodule

/* Simulation Log:
------------------
run -all;
# KERNEL: [l0] size = 4
# KERNEL: [l1] size = 2
# KERNEL: [l0] num = 4
# KERNEL: [l1] num = 2
# KERNEL: Found 10 orange !
# KERNEL: Found 22 Melon !
# KERNEL: Sorry, season for apricots is over ...
# KERNEL: fruits_l0.first [apple] = 4
# KERNEL: fruits_l0.last [plum] = 9
# KERNEL: fruits_l0.prev [guava] = 1
# KERNEL: fruits_l0.next [plum] = 9
# KERNEL: Simulation has finished. There are no more test vectors to simulate.

*/
