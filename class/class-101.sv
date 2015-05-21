//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :  Introduction module to classes. A class can have variables,
//                   functions, tasks, randomization, coverage 
//-----------------------------------------------------------------------------

class myClass;

   // Define variables in this class
   bit [31:0]  addr;
   integer     integerA;
   int         intA;
   reg [7:0]   regA;
   logic [7:0] data;
   real        volt;
   byte        pixel;

   // This is the constructor - automatically called when an object of this 
   // class is created. Let's simply print out a message. This is a good
   // place to initialize variables of data-type reg, logic, etc. This is
   // not necessary to be defined
`ifndef NO_CONSTRUCTOR
   function new ();
      $display ("Class Object created and Class members are initialized...");
      regA = 0;
      addr = 32'hdead_cafe;
      intA = 45;
      volt = 1.23687;
      pixel = 8'ha3;
   endfunction
`endif

   // Create a display function to display class contents. It's declared void
   // because it does not return anything -  a good practice and to avoid
   // compilation warning (to use void'())
   function void display ();
      $display ("------------ myClass ---------------");
      $display (" addr                 : %0h", addr);
      $display (" integerA             : %0d", integerA);
      $display (" intA                 : %0d", intA);
      $display (" regA                 : %0h", regA);
      $display (" data                 : %0h", data);
      $display (" volt                 : %0.3f", volt);
      $display (" pixel                : %0h", pixel);
   endfunction

endclass

//-----------------------------------------------------------------------------
//                               tb_top
//-----------------------------------------------------------------------------

module tb_top;
   // Create a handle to future class object
   myClass cls0; 		

   initial begin
      // 1. Create an object of the class and store pointer in handle
      // Define this to get a run-time error :NULL pointer
`ifndef NO_NEW_FN
      cls0 = new ();
`endif

      // 2. Reference a class member/method using the dot operator '.' with 
      // the class object. 
      cls0.display ();

      // 3. Let's assign some values to the class variables
      cls0.integerA = 5671;
      cls0.regA = 8'hbb;
      cls0.data = $random();

      // Print again to see if values got assigned
      cls0.display ();
   end
endmodule

// NOTE: integerA, and data had x values - because they were not initialized
//       inside the constructor and hence they had default values. 

//-----------------------------------------------------------------------------
