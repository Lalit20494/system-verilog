// Author   :   Admin (www.chipverify.com)
// Purpose  :   Example of namespace collision using package
//              with global namespace
//-----------------------------------------------------------

package my_pkg;
	typedef enum bit { READ, WRITE } e_rd_wr;
endpackage	

import my_pkg::*;

typedef enum bit { WRITE, READ } e_wr_rd;

module tb;
	initial begin
        e_wr_rd  	opc1 = READ;
        
`ifdef PKG
        e_rd_wr   opc2 = my_pkg::READ;
`else
        e_rd_wr  	opc2 = READ;
`endif

      $display ("READ1 = %0d READ2 = %0d ", opc1, opc2);
	end
endmodule

/* Simulation Log:
------------------
ncsim> run
READ1 = 1 READ2 = 1 
ncsim: *W,RNQUIE: Simulation is complete.


Simulation Log:   +define+PKG
-----------------------------
ncsim> run
READ1 = 1 READ2 = 0 
ncsim: *W,RNQUIE: Simulation is complete.

*/
