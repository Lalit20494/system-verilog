// Author   : Admin  (www.chipverify.com)
// Purpose  : An attempt to split a given string into substrings based on a delimiter
//            "Hello ! How are you ?" should give "Hello", "!", "How", "are", "you?"


function automatic split (input string org, string delim, output string array[$]);
   string tmp = "";
   
   foreach (org[i]) begin
      if (org[i] == delim) begin
         if (tmp != "")
            array.push_back (tmp);
         tmp = "";
      end else
         tmp = {tmp, org[i]};
   end
   if (tmp.len() > 0)
      array.push_back (tmp);
endfunction


module tb;
   string str1 = "Hello World !";
   string str2 = " What's goes around comes around ...";
   string str3 = "Humpty Dumpty sat on a wall ";
   string array[$];
   string result;

   initial begin
      split (str1, " ", array);
      foreach (array[i])
         $display ("array[%0d] = %s", i, array[i]);

      split (str2, " ", array);
      foreach (array[i])
         $display ("array[%0d] = %s", i, array[i]);

      split (str3, " ", array);
      foreach (array[i])
         $display ("array[%0d] = %s", i, array[i]);
   end
endmodule

/* Simulation Log
------------------
ncsim> run
array[0] = Hello
array[1] = World
array[2] = !
array[0] = What's
array[1] = goes
array[2] = around
array[3] = comes
array[4] = around
array[5] = ...
array[0] = Humpty
array[1] = Dumpty
array[2] = sat
array[3] = on
array[4] = a
array[5] = wall
ncsim: *W,RNQUIE: Simulation is complete.
*/
