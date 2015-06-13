//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :  Nested Class 
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//                               carSpecs
//-----------------------------------------------------------------------------

typedef enum bit[2:0] {RED, MAROON, COFFEE, YELLOW, OLIVE, NAVY, WHITE, PLATINUM} e_color;

class carSpecs;
   rand bit [3:0]    model;
   rand e_color      color;

   function void display ();
      $display ("model : %0d color : %s", model, color.name);
   endfunction
   
   function bit[3:0] get_model ();
      return model;
   endfunction
endclass

//-----------------------------------------------------------------------------
//                               myCar
//-----------------------------------------------------------------------------

class myCar;
   rand bit    licensed;
   carSpecs    spec;

   function new ();
      spec = new();
      spec.randomize ();
   endfunction
 
   function void show ();
      $display ("licensed : %d", licensed);    
   endfunction
endclass

//-----------------------------------------------------------------------------
//                               tb_top
//-----------------------------------------------------------------------------

module tb_top;
   myCar       car0;
   
   initial begin
      car0 = new ();
      car0.randomize();
      car0.show ();
      car0.spec.display();

      $display ("Car Model : 0x%0h", car0.spec.get_model());
   end
endmodule

