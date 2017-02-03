// Author   : Admin (www.chipverify.com)
// Purpose  : Example of queues and using queue methods
//-------------------------------------------------------

module tb;
   byte     data[$];
   string   friends[$];
   int      integers[$] = { 1, 2, 3 };
   bit      bits[$:127];   // Queue with maximum size of 128 bits

   initial begin
      string tmp;

      // Queue initialization
      friends = { "Ross", "Joey", "Chandler" };
      foreach (friends [i]) 
         $display ("%s", friends[i]);

      $display ("Size of friends : %0d", friends.size());

      $display ("--------------------------");
      // Insert someone to the queue
      friends.insert (2, "Rachel");
      foreach (friends [i]) 
         $display ("%s", friends[i]);
      $display ("Size of friends : %0d", friends.size());

      $display ("--------------------------");
      friends.delete (3);
      foreach (friends [i]) 
         $display ("%s", friends[i]);

      $display ("--------------------------");
      friends.push_back ("Phoebe");
      foreach (friends [i]) 
         $display ("%s", friends[i]);

      $display ("--------------------------");
      friends.push_front ("Monica");
      foreach (friends [i]) 
         $display ("%s", friends[i]);
     
      $display ("--------------------------");
      tmp = friends.pop_back ();
      $display ("Popped %s from the back", tmp);
      foreach (friends [i]) 
         $display ("%s", friends[i]);
      
      $display ("--------------------------");
      tmp = friends.pop_front ();
      $display ("Popped %s from the front", tmp);
      foreach (friends [i]) 
         $display ("%s", friends[i]);
   end
endmodule

/* Simulation Log:
------------------
run -all;
# KERNEL: Ross
# KERNEL: Joey
# KERNEL: Chandler
# KERNEL: Size of friends : 3
# KERNEL: --------------------------
# KERNEL: Ross
# KERNEL: Joey
# KERNEL: Rachel
# KERNEL: Chandler
# KERNEL: Size of friends : 4
# KERNEL: --------------------------
# KERNEL: Ross
# KERNEL: Joey
# KERNEL: Rachel
# KERNEL: --------------------------
# KERNEL: Ross
# KERNEL: Joey
# KERNEL: Rachel
# KERNEL: Phoebe
# KERNEL: --------------------------
# KERNEL: Monica
# KERNEL: Ross
# KERNEL: Joey
# KERNEL: Rachel
# KERNEL: Phoebe
# KERNEL: --------------------------
# KERNEL: Popped Phoebe from the back
# KERNEL: Monica
# KERNEL: Ross
# KERNEL: Joey
# KERNEL: Rachel
# KERNEL: --------------------------
# KERNEL: Popped Monica from the front
# KERNEL: Ross
# KERNEL: Joey
# KERNEL: Rachel
# KERNEL: Simulation has finished. There are no more test vectors to simulate.

*/
