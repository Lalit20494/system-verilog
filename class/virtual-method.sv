// Author   : Admin (www.chipverify.com)
// Purpose  : Example of a virtual function
//            Functions/Tasks declared as virtual will enable a 
//            parent class object pointing to a child class object
// 	      to call the child version of the 
//            same function instead of the parent's version

class Packet;
   	int addr;

   	function new (int addr);
      		this.addr = addr;
   	endfunction

`ifdef VIRTUAL
	virtual function display ();
`else
 	function display ();
`endif
		$display ("[Base] addr=0x%0h", addr);
	endfunction
endclass

class ExtPacket extends Packet;
	int data;

   	function new (int addr, data);
      		super.new (addr);
      		this.data = data;
   	endfunction

	function display ();
		$display ("[Child] addr=0x%0h data=0x%0h", addr, data);
	endfunction
endclass

module tb;
   	Packet bc;
   	ExtPacket sc;

	initial begin
        	sc = new (32'hfeed_feed, 32'h1234_5678);	

        	bc = sc; 
		bc.display ();
	end
endmodule


/* Simulation Log
-----------------
run -all;
# KERNEL: [Base] addr=0xfeedfeed
# KERNEL: Simulation has finished. There are no more test vectors to simulate.

Simulation Log : +define+VIRTUAL
--------------------------------
run -all;
# KERNEL: [Child] addr=0xfeedfeed data=0x12345678
# KERNEL: Simulation has finished. There are no more test vectors to simulate.

*/
