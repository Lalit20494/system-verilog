// System Verilog introduced the "unique" keyword for constraints in 2012, which helps us to 
// uniquely constrain a set of variables or even an array

class myClass;
   rand bit [3:0] array [10];
   rand bit [7:0] count;
   rand bit [1:0] mode;

   constraint c_unique1 { unique {array}; };
   constraint c_unique2 { unique {count[1:0], mode}; };

   function void display ();
      $display ("Count = 0x%0h \nMode = 0x%0h", count, mode);
      foreach (array[i])
         $display ("array[%0d] = %0d", i, array[i]);
   endfunction
endclass

module tb;
   myClass cls;
 
   initial begin
      cls = new ();
      cls.randomize();
      cls.display ();
   end
endmodule

/* Simulation Log
--------------------
ncsim> run
Count = 0xad
Mode = 0x3
array[0] = 15
array[1] = 13
array[2] = 12
array[3] = 4
array[4] = 7
array[5] = 5
array[6] = 0
array[7] = 6
array[8] = 1
array[9] = 11
ncsim: *W,RNQUIE: Simulation is complete.
*/
