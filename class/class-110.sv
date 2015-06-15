//-----------------------------------------------------------------------------
// Copyright (c) 2015, ChipVerify
//-----------------------------------------------------------------------------
// Author         :  Admin
// Email          :  info@chipverify.com
// Description    :  Usage of external functions and tasks.
//-----------------------------------------------------------------------------

class myClass;

   // Define variables in this class
   bit [31:0]  addr;
   byte        pixel;


   // Use "extern" keyword to declare tasks/functions as external to the class
   extern function new ();
   extern function void display ();
   extern task          run ();
   extern virtual function changeAddr (bit [31:0] addr);
endclass

// Define tasks/functions declared as "extern", outside the class
// Use the class scope operator :: to refer to function/task name
function myClass::new ();
   addr = 32'hfc1a_0000;
   pixel = 8'h3d;
endfunction

function void myClass::display ();
   $display ("[%0t] ------ myClass ---------", $time);
   $display (" addr  : 0x%0h", addr);
   $display (" pixel : 0x%0h", pixel);
endfunction

task myClass::run ();
   $display ("[%0t] Run simulation for 100 time units", $time);
   #100;
   $display ("[%0t] Exit run task", $time);
endtask

function myClass::changeAddr (bit [31:0] addr);
   this.addr = addr;
   $display ("[%0t] Address changed to 0x%0h", $time, addr);
endfunction

   
//-----------------------------------------------------------------------------
//                               tb_top
//-----------------------------------------------------------------------------

module tb_top;
   myClass cls0;

   initial begin
      cls0 = new ();
      cls0.display ();
      cls0.run ();
      cls0.changeAddr (32'hdead_babe);
   end
endmodule

//-----------------------------------------------------------------------------
