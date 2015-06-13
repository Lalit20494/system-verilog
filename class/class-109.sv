//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :  Casting in System Verilog
//-----------------------------------------------------------------------------

class baseClass;
   byte  pixel = 8'hf4;
   
   function new ();
      $display ("[BaseClass] pixel = 0x%0h", pixel);
   endfunction

   virtual function void display ();
      $display ("[BaseClass] display");
   endfunction
endclass

class extClass extends baseClass;
   byte  hue;
   
   function new ();
      hue = super.pixel;
      $display ("[ExtClass]  hue = 0x%0h", hue);
   endfunction

   virtual function void display ();
      $display ("[ExtClass] display");
   endfunction
endclass

class subClass extends baseClass;
   byte saturation;

   function new ();
      saturation = super.pixel + 5;
      $display ("[SubClass] saturation = 0x%0h", saturation);
   endfunction

   virtual function void display ();
      $display ("[SubClass] display ");
   endfunction
endclass


//-----------------------------------------------------------------------------
//                               tb_top
//-----------------------------------------------------------------------------

module tb_top;

   extClass    ext;
   baseClass   base;
   subClass    sub;

   initial begin

      // This works well - normal Inheritance
      ext = new ();
      base = new ();

// You cannot directly assign base to an extended class; you get compilation error
`ifdef TYPECHECK_COMPILE_ERR
      ext = base;
`endif

// You'll pass compilation, but will get run-time error
`ifdef TYPECHECK_RUNTIME_ERR
      $cast (ext, base);
`endif

// These two ways have the same result
`ifdef EXT_BASE_DIRECT
      $display ("------ Assign ext to base directly ------------");
      base.display ();
      base = ext;
      base.display ();
`elsif EXT_BASE_CAST
      $display ("------ Assign ext to base using $cast------------");
      base.display ();
      $cast (base, ext);
      base.display ();
`endif

// Try assign between subClass and extClass
`ifdef SUB_EXT_DIRECT_ERR
      $display ("------ Assign subClass to extClass directly --------");
      ext.display ();
      ext = sub;
      ext.display ();
`elsif SUB_EXT_CAST_ERR
      $display ("------ Assign subClass to extClass using $cast --------");
      ext.display ();
      $cast (ext, sub);
      ext.display ();
`endif 
   end
endmodule

//-----------------------------------------------------------------------------
