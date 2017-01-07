// Author   : Admin   (www.chipverify.com)
// Purpose  : To illustrate the usage of "super" keyword
//            "super" keyword is used to access parent's function/task
//            from a child class. It can only be used within a class
//            definition. In this example, there are three things to be
//            noted:
//            1. super is used in ExtPacket's display() function to invoke
//            the display() function of it's parent class Packet
//            2. Since ExtPacket has inherited Packet, it already has 
//            access to Packet's member addr and can be used directly
//            as done in the display() function
//            3. When ExtPacket object is created with new(), the address
//            assignment is done by calling the parent's new() function 
//            using the "super" keyword. It can also be assigned using
//                    this.addr = addr;
//            But we don't want to change the characteristics of addr and
//            hence is better to call super.new()

class Packet;
	int addr;

   function new (int addr);
      this.addr = addr;
   endfunction

	function display ();
		$display ("[Base] addr=0x%0h", addr);
	endfunction
endclass

class ExtPacket extends Packet;
   int data;

   function new (int addr, int data);
      super.new (addr);
      this.data = data;
   endfunction

	function display ();
    super.display ();
		$display ("[Child] addr=0x%0h data=0x%0h", addr, data);
	endfunction
endclass

module tb;
   Packet    bc;
   ExtPacket sc;

   initial begin
      sc = new (32'hfeed_feed, 32'h1234_5678);
      sc.display ();
   end
endmodule

/*
Simulation Log:
---------------
ncsim> run
[Base] addr=0xfeedfeed
[Child] addr=0xfeedfeed data=0x12345678
ncsim: *W,RNQUIE: Simulation is complete.

*/
