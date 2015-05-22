//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :  Encapuslation using local, protected, etc 
//-----------------------------------------------------------------------------

class myClass;

   // Only visible within this class; not visible to derived classes; cannot be
   // referenced from outside
   local int         myLocal;

   // Only visible within this class; visible to derived classes; cannot be 
   // referenced from outside
   protected int     myProtected;

   function new (int myLocal = 10, int myProtected = 20);
      this.myLocal = myLocal;
      this.myProtected = myProtected;
   endfunction

   virtual function void show ();
      $display ("[MY] myLocal : %0h", myLocal);
      $display ("[MY] myProtected : %0h", myProtected);
   endfunction
endclass

//-----------------------------------------------------------------------------
//                               extClass
//-----------------------------------------------------------------------------

class extClass extends myClass;
   
   function void display ();
// local cannot be derived from a sub-class
`ifdef LOCAL_EXT
      $display ("[EXT] myLocal : %0h", myLocal);
`endif
      $display ("[EXT] myProtected : %0h", myProtected);
   endfunction
endclass


//-----------------------------------------------------------------------------
//                               tb_top
//-----------------------------------------------------------------------------

module tb_top;
   myClass     cls;
   extClass    ext;

   initial begin
      cls = new ();
      ext = new ();
      
      cls.show ();
      ext.display ();

// local cannot be referenced from outside the class
`ifdef LOCAL_ERROR
      cls.myLocal = 4;
`endif

//protected cannot be referenced from outside the class
`ifdef PROTECTED_ERROR
      cls.myProtected = 6;
`endif
   end
endmodule

// NOTE : Use the following defines to see compilation errors
//        LOCAL_ERROR
//        PROTECTED_ERROR
//        LOCAL_EXT
