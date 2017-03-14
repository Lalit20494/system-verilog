// Author   :   Admin (www.chipverify.com)
// Purpose  :   Example of what effect a #0 delay has 
//              #0 simply puts the execution into the Re-Inactive region of 
//              the simulation. This impact is observed when two statements 
//              are being executed in the same delta cycle (or same time unit)
//              A #0 will make that statement to be executed later on in the 
//              Re-Inactive region of the event scheduler.
//-------------------------------------------------------------------------


module tb;
  initial begin
    	#5;

    	fork
          
`ifdef  DELAY0
          #0 $display ("[%0t] Stmt2 always executed after Stmt1", $time);
`else
          $display ("[%0t] Stmt2", $time);
`endif
          $display ("[%0t] Stmt1", $time);
        join
  end
endmodule


/* Simulation Log: 
------------------
ncsim> run
[5] Stmt2
[5] Stmt1
ncsim: *W,RNQUIE: Simulation is complete.



Simulation Log:  +define+DELAY0
-------------------------------
ncsim> run
[5] Stmt1
[5] Stmt2 always executed after Stmt1
ncsim: *W,RNQUIE: Simulation is complete.

*/
