//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author   :  Admin
// Email    :  info@chipverify.com
// Purpose  :  Basic randomization example using rand/randc and randomize()
//             rand  - Simply provide a random value within range of variable
//             randc - Exhaust all values before repeating a value
//             randomize () - Function used to randomize the object
//             std
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Create a class to hold variables with rand/randc 
//-----------------------------------------------------------------------------

class myPacket;
	rand   bit [3:0]    mode;
	randc  bit [3:0]    key;
	
    virtual function void display ();
       $display ("Mode : 0x%0h Key : 0x%0h", mode, key);
    endfunction
endclass

//-----------------------------------------------------------------------------
// In the top module, create an instance, and randomize the object in a loop 
// Display the values and see how rand/randc are different. Also learn how
// std::randomize () can be called on a variable outside a class
//-----------------------------------------------------------------------------
module tb_top;
	myPacket pkt;
    bit [3:0]    myVar;
	
	initial begin
		pkt = new ();
		
		for (int i = 0; i < 20; i++) begin
			void'(pkt.randomize ());
			pkt.display ();
            if (i == 15)
               $display ("... randc (Key) will now repeat values ...");
		end

        // SideNote : You can also randomize a variable using std::randomize 
        // function even if the variable does not have rand keyword 
        // in declaration.
        $display (".... Randomize myVar ....");
        for (int i = 0; i < 15; i++) begin
            void'(std::randomize (myVar));
            $display ("myVar = 0x%0h", myVar);
        end
	end
endmodule
