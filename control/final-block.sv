// Author   : Admin (www.chipverify.com)
// Purpose  : Example of a final block
//---------------------------------------------

module tb_top;
   bit [3:0] counter;
   bit [3:0] pass;
   bit [3:0] fail;

   initial begin
      for (counter = 0; counter < 13; counter ++) begin
         #1;
         if (counter % 2) 
            pass++;
         else 
            fail++;
      end
   end

   // This block is executed just before simulation ends
   // Perfect place to display reports
   final begin
      $display ("----------------------------------------");
      $display ("          REPORT @ %0t ns            ", $time);
      $display ("----------------------------------------");
      $display ("       Pass  : %0d", pass);
      $display ("       Fail  : %0d", fail);
   end
endmodule

/* Simulation Log:
------------------
run -all;
# KERNEL: Simulation has finished. There are no more test vectors to simulate.
exit
# KERNEL: ----------------------------------------
# KERNEL:           REPORT @ 13 ns            
# KERNEL: ----------------------------------------
# KERNEL:        Pass  : 6
# KERNEL:        Fail  : 7
# VSIM: Simulation has finished.

*/
