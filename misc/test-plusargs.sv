// Author   :   Admin (www.chipverify.com)
// Purpose  :   Example of $test$plusargs system function
/--------------------------------------------------------

module tb;
  initial begin
    if ($test$plusargs ("STANDBY"))
      $display ("STANDBY argument is found ...");
    
    if ($test$plusargs ("Standby"))
      $display ("Standby argument is also found ...");
    
    if ($test$plusargs ("STAND"))
      $display ("STAND substring is found ...");
    
    if ($test$plusargs ("S"))
      $display ("Some string starting with S found ...");
    
    if ($test$plusargs ("T"))
      $display ("Some string containing T found ...");
    
    if ($test$plusargs ("STAND_AT_EASE"))
      $display ("Can't stand any longer ...");
    
    if ($test$plusargs ("SUNSHADE"))
      $display ("It's too hot today ...");
    
    if ($test$plusargs ("WINTER"))
      $display ("No match.. ");
  end
endmodule


/* Simulation Log:
------------------
ncsim> run
STANDBY argument is found ...
STAND substring is found ...
Some string starting with S found ...
ncsim: *W,RNQUIE: Simulation is complete.

*/
