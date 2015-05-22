//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :  Parameterized Classes
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//                               overClass
//-----------------------------------------------------------------------------

`ifdef ERROR
class dtClass #(type T);
`else
class dtClass #(type T = bit);
`endif
   T      life;
   T[1:0] myVar;

   function void show ();
      $display ("life : %0d myVar : %0d", $bits (life), $bits (myVar));
   endfunction
endclass

//-----------------------------------------------------------------------------
//                               tb_top
//-----------------------------------------------------------------------------

module tb_top;
   dtClass  #(bit) bClass;
   dtClass  #(int) iClass;
   dtClass  #(logic) loClass;
   dtClass  #(longint) lClass;

   initial begin
      bClass = new ();
      bClass.show();

      iClass = new ();
      iClass.show();

      loClass = new ();
      loClass.show();

      lClass = new ();
      lClass.show();
   end
endmodule

