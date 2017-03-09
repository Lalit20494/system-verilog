// Author   : Admin (www.chipverify.com)
// Purpose  : Example of an if-else-if construct
//----------------------------------------------

module tb_top;
  byte fruits  = 5;
  byte veggies = 0;
  
  initial begin
    // Single if 
    if (fruits)
      $display ("fruits is not zero ... ");
    
    // if-else
    if (veggies)
      $display ("veggies is not zero ...");
    else
      $display ("veggies is zero ... ");
      
    // if-else-if
    if (veggies)
      $display ("no veggies ... bad nutrition habit !");
    else if (fruits)
      $display ("only fruits ? detoxification diet ... ");
    else
      $display ("you have to see a nutritionist ASAP !");
      
    // Multiple statements require begin-end wrapper
    if (fruits) begin
      $display (" Statement 1");
      fruits = 0;
    end else begin
      veggies = 10;
      $display ("Statement 2");
    end
  end
endmodule

/* Simulation Log:
------------------
run -all;
# KERNEL: fruits is not zero ... 
# KERNEL: veggies is zero ... 
# KERNEL: only fruits ? detoxification diet ... 
# KERNEL:  Statement 1
# KERNEL: Simulation has finished. There are no more test vectors to simulate.
*/
