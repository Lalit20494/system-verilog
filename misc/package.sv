// Author   :   Admin (www.chipverify.com)
// Purpose  :   Example of how to define and use a package
//--------------------------------------------------------


package my_pkg;
  typedef enum bit [1:0] { RED, YELLOW, GREEN, RSVD } e_signal;
  
	typedef struct {   bit [3:0] signal_id;
                     bit       active;
                     bit [1:0] timeout;      } e_sig_param;
                     
                     
   function common ();
      $display ("Called from somewhere");
   endfunction
endpackage

import my_pkg::*;

class myClass;
  e_signal 	my_sig;
endclass

module tb;
	myClass cls;

	initial begin
	  cls = new ();
		cls.my_sig = GREEN;
		$display ("my_sig = %s", cls.my_sig.name());
    common();
	end
endmodule


/* Simulation Log:
------------------
ncsim> run
my_sig = GREEN
Called from somewhere
ncsim: *W,RNQUIE: Simulation is complete.


*/

