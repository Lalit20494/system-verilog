// Author   : Admin (www.chipverify.com)
// Purpose  : Example of a do-while loop
//----------------------------------------

module tb_top;
  
  bit [3:0] counter;

	initial begin
  
    // Loop executes atleast once
		do 
	    	counter ++;
    while (counter < 0);
      
    $display ("After loop[1] counter = %0d", counter);
      
    do begin
      	counter++;
        $display ("[2] counter = %0d", counter);
    end while (counter < 5);
    
    $display ("After loop[2] counter = %0d", counter);
   
    // Value of counter after loop is 5
    // condition is checked only after atleast 1
    // iteration
	end
endmodule

/* Simulation Log:
------------------
run -all;
# KERNEL: After loop[1] counter = 1
# KERNEL: [2] counter = 2
# KERNEL: [2] counter = 3
# KERNEL: [2] counter = 4
# KERNEL: [2] counter = 5
# KERNEL: After loop[2] counter = 5
# KERNEL: Simulation has finished. There are no more test vectors to simulate.
*/
