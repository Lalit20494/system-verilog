// Author   : Admin (www.chipverify.com)
// Purpose  : Example of a foreach loop. Use foreach only 
//            when array is not equal to zero, else the 
//            loop terminates early
//----------------------------------------

module tb_top;

   byte array1 [8];
   byte array2 [];

   initial begin
      foreach (array1 [index]) begin
         array1[index] = index;
      end
      foreach (array1 [index]) begin
         $display ("array1[%0d] = 0x%0d", index, array1[index]);
      end
      
      // Array2 is a dynamic array not allocated using new()
      // and hence size is 0 -> no elements to iterate over
      foreach (array2 [i])
         $display ("I am not executed ...");
   end
endmodule

/* Simulation Log:
------------------
run -all;
# KERNEL: array1[0] = 0x0
# KERNEL: array1[1] = 0x1
# KERNEL: array1[2] = 0x2
# KERNEL: array1[3] = 0x3
# KERNEL: array1[4] = 0x4
# KERNEL: array1[5] = 0x5
# KERNEL: array1[6] = 0x6
# KERNEL: array1[7] = 0x7
# KERNEL: Simulation has finished. There are no more test vectors to simulate.
*/
