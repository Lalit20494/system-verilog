// Author   : Admin (www.chipverify.com)
// Purpose  : To provide an example of a callback
//-----------------------------------------------

// Example of an in-built callback feature provided in SV
class myClass;
  rand bit [7:0] data1;
  rand bit [7:0] data2;
  
  function pre_randomize();
    data1.rand_mode(0);
  endfunction
  
  function post_randomize();
    $display ("After randomization data1=0x%0h data2=0x%0h", data1, data2);
  endfunction
endclass


// Example of how a testbench developer can include callback hooks in 
// the environment that end users can utilize to insert piece of code
// Base class is developed by the main developer
class baseClass;
  virtual function void pre_method ();
  endfunction
  
  function void method ();
    pre_method ();
    $display ("[Base] Executing main method ...");
    post_method ();
  endfunction
  
  virtual function void post_method ();
  endfunction
endclass


// Child class developed by end user
class childClass extends baseClass;
  function void pre_method ();
    $display ("[Child] Executing pre_method ()");
  endfunction
  
  function void post_method ();
    $display ("[Child] Executing pre_method ()");
  endfunction
endclass


module tb;
  myClass    cls = new ();
  baseClass  bcls = new ();
  childClass ccls = new ();
  
  initial begin
  
    cls.randomize();
    $display ();
    
    bcls.method ();
    $display ();
    
    ccls.method ();
  end
endmodule


/* Simulation Log :
-------------------
ncsim> run
After randomization data1=0x0 data2=0xef
 
[Base] Executing main method ...
 
[Child] Executing pre_method ()
[Base] Executing main method ...
[Child] Executing pre_method ()
ncsim: *W,RNQUIE: Simulation is complete.

*/
