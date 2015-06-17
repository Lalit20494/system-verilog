//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :  Example on how "null" is useful & how forward declaration
//                   can be used via "typedef"
//-----------------------------------------------------------------------------

`ifdef FWD_DECL
   typedef class Brand;
`endif

class myBagColor;

   Brand brandDetails;
   
   byte        strap;
   byte        hood;
   byte        body;
   byte        buckle;

   function new ();
      $display ("myBagColor constructor executed"); 
   endfunction

endclass

class Brand;
   string   name;
   byte     model;
   byte     warranty; 

   function new ();
      $display ("Brand constructor executed"); 
   endfunction
endclass

//-----------------------------------------------------------------------------
//                               tb_top
//-----------------------------------------------------------------------------

module tb_top;

   myBagColor bagColor;
   
   initial begin
      bagColor = new ();
      if (bagColor.brandDetails == null) begin
         $display ("Brand Details object not created ");
         bagColor.brandDetails = new ();
      end
   end
endmodule

// NOTE :
//-------
// You'll get a compilation error if you do not define FWD_DECL
// This is because the compiler does not see Brand declaration when compiling
// myBagColor because code for Brand declaration comes only after myBagColor.
// To let the compiler know that Brand declaration exists later in the file, 
// use "typedef" to declare the class beforehand so that the compiler knows 
// the actual definition for the class will come later on.
//
// $> irun class-111.sv +define+FWD_DECL
//-----------------------------------------------------------------------------
