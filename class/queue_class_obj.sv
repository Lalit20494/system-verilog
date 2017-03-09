// Author   : Admin (www.chipverify.com)
// Purpose  : To create a queue of class objects
//----------------------------------------------


class Fruit;
  string name;
  
  function new (string name="Unknown");
   	this.name = name;
  endfunction
  
endclass

module tb;
  Fruit list [$];
  initial begin
    Fruit f = new ("Apple");
    list.push_back (f);
    
    f = new ("Banana");
    list.push_back (f);
    
    foreach (list[i])
      $display ("list[%0d] = %s", i, list[i].name);
  end
endmodule

/* Simulation Log:
------------------
run -all;
# KERNEL: list[0] = Apple
# KERNEL: list[1] = Banana
# KERNEL: Simulation has finished. There are no more test vectors to simulate.
*/
