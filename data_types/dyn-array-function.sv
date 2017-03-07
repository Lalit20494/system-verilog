// Author   : Admin (www.chipverify.com)
// Purpose  : To illustrate how to pass and return a dynamic array
//            in a function
//-----------------------------------------------------------------

typedef string str_da [];

module tb;
   initial begin
      int arr [] = '{1, 2, 3, 4};
      string friends [];
      display (arr);
      
      friends = ret ();
      foreach (friends[i]) 
         $display ("friends[%0d] = %s", i, friends[i]);
   end

   function void display (int list []);
      foreach (list[i])
         $display ("list[%0d] = %0d", i, list[i]);
   endfunction


`ifdef CMPERR
   function string[] ret ();
      string names [] = '{"Joey", "Chandler", "Phoebe"};
      return names;
   endfunction
`else
   function str_da ret ();
      str_da names = '{"Joey", "Chandler", "Phoebe"};
      return names;
   endfunction
`endif
endmodule
