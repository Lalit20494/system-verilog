// Author   : Admin   (www.chipverify.com)
// Purpose  : Example of creating a string based associative array
------------------------------------------------------------------

module tb;
   // Single Dimension associative array
   int      fruits_l0 [string];
   string   fruits_l1 [int];   

   initial begin
      // Assign values to the fruit list
      fruits_l0 ["apple"] = 4;
      fruits_l0 ["orange"] = 10;
      fruits_l0 ["pear"] = 1;
      foreach (fruits_l0[i]) 
         $display ("%0d %s", fruits_l0[i], i);

      $display ("------------------------------------");
      // Assign values to the fruit list
      fruits_l1 [0] = "Apple";
      fruits_l1 [1] = "Orange";
      fruits_l1 [2] = "Guava";
      foreach (fruits_l1[i]) 
         $display ("%s %0d", fruits_l1[i], i); 
   end
endmodule

/* Simulation Log:
------------------
run -all;
# KERNEL: 4 apple
# KERNEL: 10 orange
# KERNEL: 1 pear
# KERNEL: ------------------------------------
# KERNEL: Apple 0
# KERNEL: Orange 1
# KERNEL: Guava 2
# KERNEL: Simulation has finished. There are no more test vectors to simulate.

*/
