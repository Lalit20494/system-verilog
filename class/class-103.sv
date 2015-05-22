//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :  Polymorphism 
//-----------------------------------------------------------------------------

class baseClass;

   bit [7:0]   addr;
   bit [7:0]   data;

   function new (bit [7:0] addr = 8'he0, bit [7:0] data = 8'h44);
      this.addr = addr;
      this.data = data;
   endfunction   

`ifdef VIRTUAL
   virtual function void display();
`else
   function void display ();
`endif
      $display ("------ Base --------");
      $display (" addr  : 0x%0h", addr);
      $display (" data  : 0x%0h", data);
   endfunction

endclass

//-----------------------------------------------------------------------------
//                               extClass
//-----------------------------------------------------------------------------


class extClass extends baseClass;

   bit [7:0]   header;
   bit         parity;

   function void display ();
      super.display ();
      $display ("------ EXT --------");
      $display (" header  : 0x%0h", header);
      $display (" parity  : 0x%0h", parity);
   endfunction

   function extFunction ();
      $display ("I reside in extClass");
   endfunction
endclass

//-----------------------------------------------------------------------------
//                               tb_top
//-----------------------------------------------------------------------------

module tb_top;
   baseClass base, base_h;
   extClass  ext, ext_h;

   initial begin
      base = new ();
      ext  = new ();

      //-----------------------------------------------------------------------
      // Call respective display () functions
      //-----------------------------------------------------------------------
      $display ("\nbassClass display() function called");
      base.display ();
      $display ("\nextended display() function called");
      ext.display ();

      //-----------------------------------------------------------------------
      // Assign ext to baseClass handle and call display() 
      // Based on whether display () is virtual or not, the function call will
      // differ.
      //-----------------------------------------------------------------------
      $display ("\nbaseClass handle gets ext object");
      base_h = ext;
      base_h.display (); 

      //-----------------------------------------------------------------------
      // Now, let's try to access a function in extClass using baseClass handle
      // This will be an error. base_h is a baseClass handle, and hence can
      // have only functions/variables in the baseClass. Even if you assign a
      // extClass to baseClass, 
      //-----------------------------------------------------------------------
`ifdef COMPILATION_ERROR
      base_h.extFunction ();
`endif

   end
endmodule


// NOTE : First run $>irun -sv class-103.sv
//        You'll see that the SV uses the function referenced by the variable 
//        type. Variable type = baseClass -> so it calls baseClass display()
//
//        Then  run $>irun -sv class-103.sv +define+VIRTUAL
//        You'll see that the second time, SV uses the function referenced by
//        the object stored in the variable. Object stored in baseClass is 
//        of type extClass and hence it calls display () function of extClass

