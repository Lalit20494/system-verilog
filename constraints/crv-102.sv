//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :  How to add simple constraints to limit values of variables
//                   to certain ranges. 3 ways to declare constraints and use
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Create a class to hold data variables 
//-----------------------------------------------------------------------------

class myPacket;
	rand   bit [3:0]    myVar;
    rand   bit [2:0]    stock;
    rand   bit [2:0]    cash;
    rand   bit [1:0]    power;

//--------------------------------------------------------
// Internal constraints 
//--------------------------------------------------------

// Turn this on to see errors : +define+MYVAR_LESS_THAN_ZERO
`ifdef MYVAR_LESS_THAN_ZERO
    constraint c_myVar { myVar < 0; }
`elsif MYVAR_GREATER_THAN_LIMIT
    constraint c_myVar { myVar > 15; }
`elsif CONSTRAINT_NAME_SAME_AS_VARIABLE
    constraint myVar { myVar == 1; }
`else
   constraint c_myVar { myVar > 10; }
`endif

//--------------------------------------------------------
// External constraints; Note that definition is not given 
//--------------------------------------------------------
   constraint c_stock;
   constraint c_cash;
	
    virtual function void display ();
       $display ("myVar : 0x%0h stock : 0x%0h cash : 0x%0h power : 0x%0h", 
                  myVar, stock, cash, power);
    endfunction
endclass

//--------------------------------------------------------
// Definition of external constraints [done outside class]
//--------------------------------------------------------
constraint myPacket::c_stock { stock inside {[4:13]}; }
constraint myPacket::c_cash  { !(cash inside {[4:13]}); } 

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
		
		for (int i = 0; i < 5; i++) begin
            //--------------------------------------------------------
            // Inline constraints : Note that constraint is given when
            // randomize () function is called.
            //--------------------------------------------------------

// Turn this ON to see error : myVar is previously constrained to > 10
// If you constrain here to < 3, there's no precedence, only conflict
// because constraint is not overridden
`ifdef MYVAR_CONSTRAINT_CONFLICT
            void'(pkt.randomize () with { power == 2; 
                                          myVar < 3; });
`else
			void'(pkt.randomize () with { power == 2;
                                          myVar < 13;});
`endif
			pkt.display ();
		end
	end
endmodule

//-----------------------------------------------------------------------------
