// Author   : Admin (www.chipverify.com)
// Purpose  : To demonstrate the use of a class constructor
//            If a constructor is not defined, then it will be implicitly called
//            For this example, use +define+EXPLICIT to define a constructor else
//            an implicit constructor will be called by the simulator.

`ifdef EXPLICIT
class Packet;
	bit [31:0] addr;
	
	function new ();
		addr = 32'hfade_cafe;
	endfunction
endclass

module tb;
	initial begin
		Packet pkt = new; 	// Calls the new() function which sets addr to 'hfade_cafe
		$display ("addr=0x%0h", pkt.addr);
	end
endmodule
`else

class Packet;
	bit [31:0] addr;
endclass

module tb;
	initial begin
		Packet pkt = new;   // An implicit new method will be invoked
		$display ("addr=0x%0h", pkt.addr);
	end
endmodule
`endif

/* 
Simulation Log
------------------
ncsim> run
addr=0x0
ncsim: *W,RNQUIE: Simulation is complete.


Simulation Log : +define+EXPLICIT
---------------------------------
ncsim> run
addr=0xfadecafe
ncsim: *W,RNQUIE: Simulation is complete.
*/
