//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :  Use of static variables inside a class 
//-----------------------------------------------------------------------------


class myClass;
   static bit [7:0]  totalCount;
          bit [7:0]  id;

   function new ();
      this.totalCount++;
      id = totalCount;
   endfunction

   function void showId ();
      $display (" Count : %0d ID : %0d", totalCount, id);
   endfunction   
endclass

//-----------------------------------------------------------------------------
//                               tb_top
//-----------------------------------------------------------------------------

module tb_top;

   // Create a dynamic array of class objects
   myClass  cls[];

   initial begin
      // Create 10 different class objects
      cls = new [10];

      // Construct each object by calling its new() method
      foreach (cls[i]) begin
         cls[i] = new ();
      end

      // Usually each class variable is unique to a particular object
      // Because totalCount is declared as static, there's only one variable
      // which is shared among all class objects. So, everytime a new class
      // object is created, totalCount is incremented, and access to the 
      // variable will give the latest value 
      //                      totalCount
      // /--------.---------.------'---------.-------.-------\
      // obj1    obj2      obj3           obj4   obj(n-1)     objn
      foreach (cls[i]) begin
         cls[i].showId();
      end
   end
endmodule

