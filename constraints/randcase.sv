// Author   : Admin (www.chipverify.com)
// Purpose  : Example of a randcase construct
//--------------------------------------------


module tb;
  initial begin
      for (int i = 0; i < 10; i++)
      	randcase
        	1 	: 	$display ("Wt 1");
      		3 	: 	$display ("Wt 5");
      		5 	: 	$display ("Wt 3");
      	endcase
    end
endmodule


/* Simulation Log:
------------------
ncsim> run
Wt 5
Wt 3
Wt 3
Wt 5
Wt 1
Wt 3
Wt 3
Wt 3
Wt 3
Wt 5
ncsim: *W,RNQUIE: Simulation is complete.

*/
