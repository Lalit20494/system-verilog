// Author   :  Admin (www.chipverify.com)
// Purpose  :  Basic randomization example using rand/randc and randomize()
//             rand  - Simply provide a random value within range of variable
//             randc - Exhaust all values before repeating a value
//             randomize () - Function used to randomize the object
//             std
//-----------------------------------------------------------------------------


// Create a class to hold variables with rand/randc 
class myPacket;
	rand   bit [3:0]    mode;
	randc  bit [3:0]    key;
	
    virtual function void display ();
       $display ("Mode : 0x%0h Key : 0x%0h", mode, key);
    endfunction
endclass

// In the top module, create an instance, and randomize the object in a loop 
// Display the values and see how rand/randc are different. Also learn how
// std::randomize () can be called on a variable outside a class
module tb_top;
	myPacket pkt;
    	bit [3:0]    myVar;
	
	initial begin
		pkt = new ();
		for (int i = 0; i < 20; i++) begin
			// Randomize returns true if successful, normally 
			// used like if(!pkt.randomize()) or $assert(pkt.randomize);
			void'(pkt.randomize ());
			pkt.display ();
            		if (i == 15)
				$display ("... randc (key) will now repeat values ...");
		end

	end
endmodule

/* Simulation Log:
------------------
run -all;
# KERNEL: Mode : 0xf Key : 0x2
# KERNEL: Mode : 0x4 Key : 0x0
# KERNEL: Mode : 0xc Key : 0xf
# KERNEL: Mode : 0x4 Key : 0xe
# KERNEL: Mode : 0x3 Key : 0xb
# KERNEL: Mode : 0xd Key : 0xa
# KERNEL: Mode : 0x5 Key : 0x1
# KERNEL: Mode : 0x1 Key : 0x7
# KERNEL: Mode : 0xa Key : 0x9
# KERNEL: Mode : 0x0 Key : 0x6
# KERNEL: Mode : 0x2 Key : 0x5
# KERNEL: Mode : 0x0 Key : 0x4
# KERNEL: Mode : 0x5 Key : 0x3
# KERNEL: Mode : 0x1 Key : 0x8
# KERNEL: Mode : 0x7 Key : 0xd
# KERNEL: Mode : 0xd Key : 0xc
# KERNEL: ... randc (Key) will now repeat values ...
# KERNEL: Mode : 0x1 Key : 0x7
# KERNEL: Mode : 0xc Key : 0x1
# KERNEL: Mode : 0x0 Key : 0x5
# KERNEL: Mode : 0x9 Key : 0x0
# KERNEL: Simulation has finished. There are no more test vectors to simulate.

*/
