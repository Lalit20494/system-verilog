//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :  Inheritance - A way to extend a class by adding more 
//                   members without changing the base class
//-----------------------------------------------------------------------------

class baseClass;

   bit [7:0]   addr;
   bit [7:0]   data;

   function new (bit [7:0] addr = 8'he0, bit [7:0] data = 8'h44);
      this.addr = addr;
      this.data = data;
   endfunction   

   function void display ();
      $display ("------ Base --------");
      $display (" addr  : 0x%0h", addr);
      $display (" data  : 0x%0h", data);
   endfunction

endclass

//-----------------------------------------------------------------------------
//                               extClass
//-----------------------------------------------------------------------------

// This class inherits "addr" and "data" from baseClass
class extClass extends baseClass;

   bit [7:0]   header;
   bit         parity;

   // This function allows us to call baseClass display
   function baseDisplay ();
      super.display ();
   endfunction

   function void display ();

// Turn this On to see that addr and data are accessible from this class
`ifdef PRINT_INHERIT
      $display ("[Ext] addr  : 0x%0h", addr);
      $display ("[Ext] data  : 0x%0h", data);
`endif
      $display ("------ EXT --------");
      $display (" header  : 0x%0h", header);
      $display (" parity  : 0x%0h", parity);
   endfunction

endclass

//-----------------------------------------------------------------------------
//                               tb_top
//-----------------------------------------------------------------------------

module tb_top;
   baseClass base;
   extClass  ext;

   initial begin
      // 1. Create object instances of baseClass and extClass
      base = new ();
      ext  = new ();

      // Call baseClass display() function
      base.display ();

      // Call the display task in extended class
      ext.display ();

      // Assign a new value to addr, data and print; Observe that this does 
      // not affect the addr and data in baseClass.
      ext.addr = 8'haa;
      ext.data = 8'hbb;
      $display ("\nAssign addr = %0h and data = %0h", ext.addr, ext.data);

      // You'll see that addr and data of extClass got changed 
      $display ("\nExtended Class display ()");
      ext.baseDisplay();
      ext.display ();

      // Note that baseClass remains same
      $display ("\nBase Class display ()");
      base.display ();
   end
endmodule

