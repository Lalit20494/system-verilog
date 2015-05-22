//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :  Pure and Virtual classes 
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//                               virtClass
//-----------------------------------------------------------------------------

// You cannot create an object out of this class - for use only as a base class
virtual class virtClass;
   bit [3:0]   myVar;

   //This is a "pure virtual" function; should NOT have body. This must be 
   //overridden when you override the base class, else you get compilation error   
   pure virtual function void display ();
endclass

//-----------------------------------------------------------------------------
//                               overClass
//-----------------------------------------------------------------------------

class overClass extends virtClass;

// A non-abstract class cannot declare an unimplemented virtual method
`ifdef COMPILATION_ERROR
   pure virtual function show ();
`endif

// Since virtClass has a pure function, it must be defined here
`ifndef NO_PURE_FUNCTION_DEFN
   virtual function void display ();
      $display ("This is a pure function re-defined");
   endfunction
`endif

   function void random ();
      $display ("Random number : %0h", $random);
   endfunction
endclass

//-----------------------------------------------------------------------------
//                               tb_top
//-----------------------------------------------------------------------------

module tb_top;

   virtClass vClass;
   overClass oClass;

   initial begin

// Turn this On to get a run time error for trying to instantiate an abstract
// class
`ifdef ABSTRACT_CLASS 
      vClass = new ();
`endif

// oClass is NOT an abstract class
      oClass = new ();
      oClass.display ();
      oClass.random ();
   end

endmodule


// NOTE : $>irun -sv class-104.sv +define+<option>
//        ABSTRACT_CLASS
//        COMPILATION_ERROR
//        NO_PURE_FUNCTION_DEFN  

