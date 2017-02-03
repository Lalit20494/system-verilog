// Author   : Admin (www.chipverify.com)
// Purpose  : Example of queues and using queue methods
//-------------------------------------------------------

module tb;
   string   friends[$];

   initial begin
      string tmp;

      // Queue initialization
      $display ("Before Queue Initialization, size=%0d", friends.size());
      friends = { "Ross", "Joey", "Chandler" };
      $display ("After Queue Initialization, size=%0d", friends.size());
      display();

      // Insert someone to the queue
      $display ("Insert Rachel to Idx:2 ...");
      friends.insert (2, "Rachel");
      display();

      $display ("Delete Idx:3 ...");
      friends.delete (3);
      display();

      $display ("Push Back Phoebe ...");
      friends.push_back ("Phoebe");
      display();

      $display ("Push Front Monica ...");
      friends.push_front ("Monica");
      display();
     
      $display ("Pop from the back using pop_back() ...");
      tmp = friends.pop_back ();
      $display ("Popped %s from the back", tmp);
      display();
      
      $display ("Pop from the front using pop_front() ...");
      tmp = friends.pop_front ();
      $display ("Popped %s from the front", tmp);
      display();
   end

   function automatic display ();
      string tmp = "";

      foreach (friends [i]) 
         tmp = $sformatf ("%s %s", tmp, friends[i]);

      $display ("%s\n", tmp);
   endfunction
endmodule

/* Simulation Log:
------------------
run -all;
# KERNEL: Before Queue Initialization, size=0
# KERNEL: After Queue Initialization, size=3
# KERNEL:  Ross Joey Chandler
# KERNEL: 
# KERNEL: Insert Rachel to Idx:2 ...
# KERNEL:  Ross Joey Rachel Chandler
# KERNEL: 
# KERNEL: Delete Idx:3 ...
# KERNEL:  Ross Joey Rachel
# KERNEL: 
# KERNEL: Push Back Phoebe ...
# KERNEL:  Ross Joey Rachel Phoebe
# KERNEL: 
# KERNEL: Push Front Monica ...
# KERNEL:  Monica Ross Joey Rachel Phoebe
# KERNEL: 
# KERNEL: Pop from the back using pop_back() ...
# KERNEL: Popped Phoebe from the back
# KERNEL:  Monica Ross Joey Rachel
# KERNEL: 
# KERNEL: Pop from the front using pop_front() ...
# KERNEL: Popped Monica from the front
# KERNEL:  Ross Joey Rachel
# KERNEL: 
# KERNEL: Simulation has finished. There are no more test vectors to simulate.

*/
